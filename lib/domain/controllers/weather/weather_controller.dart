// ignore_for_file: avoid_public_notifier_properties, join_return_with_assignment
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart' as fl_service;
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';
import 'package:weather_today/domain/services/cardoteka/weather_storage.dart';
import 'package:weather_today/utils/logger/all_observers.dart';

import '../../models/place/place_model.dart';
import '../../services/local_storage/data_base_controller.dart';
import '../../services/local_storage/interface/data_base.dart';
import '../message_controller.dart';

const bool _kDebugMode = fl_service.kDebugMode;

/// Waiting time for a call from the weather update service.
const Duration _timeoutServiceOWM = Duration(seconds: 10);

/// Allowed for OneCall API, пакет - Free:
/// * 1,000 calls/day
/// * 30,000 calls/month
///
/// Allowed for Weather API, пакет - Free:
/// * 60 calls/minute
/// * 1,000,000 calls/month
///
abstract class WeatherNotifier<T> extends AsyncNotifier<T?> with GlobalLogger {
  @protected
  DataBase get db => ref.read(dbService);

  /// Get an instance of the message controller.
  MessageController get messageNotifier => ref.read(MessageController.instance);

  /// Weather request service.
  @protected
  WeatherService get weatherService => _weatherService;

  late WeatherService _weatherService;

  /// Access to local weather storage.
  @protected
  WeatherStorage get weatherStorage => _weatherStorage;

  late WeatherStorage _weatherStorage;

  /// Allowed frequency of request to the OWM weather retrieval service.
  Duration get allowedRequestRate;

  /// The currently selected place for which a weather query is being performed.
  late Place _currentPlace;

  /// Implementations of this method should end with a call to the inherited
  /// method, as in `super.build()`.
  @override
  @mustCallSuper
  FutureOr<T?> build() async {
    _weatherStorage = ref.watch(WeatherStorage.instance);
    _currentPlace = ref.watch(WeatherServices.currentPlace);
    ref.listen(
      WeatherServices.weatherService,
      (_, next) => _weatherService = next,
      fireImmediately: true,
    );

    return _init();
  }

  Future<T?> _init() async {
    logInfo('$T: initialization');

    // Make AsyncValue<T> assignable to AsyncValue<void>
    // coldfix: https://github.com/rrousselGit/riverpod/issues/2120
    state = AsyncValue<T?>.loading();

    if (_isPlaceCorrect(_currentPlace)) {
      const contentError =
          'The location is not correct. Choose a different location.';
      logInfo(contentError);
      state = AsyncValue.error(contentError, StackTrace.current);
      return null;
    }

    // todo(02.08.2024):
    // if (_kDebugMode) {
    //   logDebug('init in the debug mode');
    //   state = AsyncValue.data(await getStoredWeather());
    //   return state.valueOrNull;
    // }

    T? weather;

    // if you are allowed to update now
    if (await _isAllowedMakeRequest() ||
        await _isAbilityRequestOnDiffPlaces()) {
      logInfo('$T: Permission granted. Trying to get the weather.');

      weather = await _getWeather(_currentPlace);
    }
    // making a request to the db. If it's empty return null
    else {
      logInfo('$T: Permission NOT granted. Trying to get the weather in db.');
    }

    weather ??= await getStoredWeather();

    state = AsyncValue.data(weather);

    return state.valueOrNull;
  }

  /// The time of the last request to the OWM service for weather.
  ///
  /// See more [one-call-api](https://openweathermap.org/api/one-call-api)
  @protected
  Future<DateTime> getLastRequestTime();

  /// Permission to query the weather service.
  Future<bool> _isAllowedMakeRequest() async {
    final isGranted = await _timeWhenWillBeAllowedMakeRequest() < Duration.zero;
    logInfo('$T: Resolution according to time elapsed. Granted: <$isGranted>');
    return isGranted;
  }

  /// Defines the time after which a request to the OWM service can be made.
  Future<Duration> _timeWhenWillBeAllowedMakeRequest() async {
    final DateTime nowTime = DateTime.now();
    final DateTime lastRequestTime = await getLastRequestTime();
    final Duration diffTime =
        allowedRequestRate - nowTime.difference(lastRequestTime);

    logInfo(
      '$T: now: $nowTime, lastRequest: $lastRequestTime, diff: $diffTime, '
      'Allowed once per:  ${allowedRequestRate.inMinutes != 0 ? '${allowedRequestRate.inMinutes} minutes' : '${allowedRequestRate.inSeconds} seconds'}',
    );

    return diffTime;
  }

  Future<bool> isAbilityRequestOnDiffPlacesImpl();

  // todo(01.08.2024): return void
  Future<bool> resetAbilityRequestOnDiffPlaces();

  /// Request the ability to get weather due to the difference of previous and current places.
  Future<bool> _isAbilityRequestOnDiffPlaces() async {
    final bool isGranted = await isAbilityRequestOnDiffPlacesImpl();
    logInfo(
        '$T: Request the ability to get weather due to the difference of previous and current places. Granted: <$isGranted>');

    if (isGranted) await resetAbilityRequestOnDiffPlaces();

    return isGranted;
  }

  /// Weather update.
  Future<void> updateWeather() async {
    logInfo('$T: Trying to update weather. DebugMode: $_kDebugMode');

    if (_isPlaceCorrect(_currentPlace)) {
      const contentError =
          'The location is not correct. Choose a different location.';
      logInfo(contentError);
      state = AsyncValue.error(contentError, StackTrace.current);
    }

    // is the update available now?
    if (await _isAllowedMakeRequest() ||
        await _isAbilityRequestOnDiffPlaces() ||
        _kDebugMode) {
      logInfo('$T: Permission granted. Trying to get the weather.');

      // coldfix: at this point the refresh indicator is running and that's enough
      state = AsyncValue<T?>.loading();

      // get the weather from the server
      T? weather = await _getWeather(_currentPlace);

      // if data is null, try to get data from the database
      weather ??= await getStoredWeather();

      state = AsyncData(weather);
    } else {
      messageNotifier.sUpdateWeatherFail();
    }
  }

  /// An internal method for retrieving weather from the OWM service [weatherService].
  ///
  /// Includes:
  /// * error handling.
  /// * time of possible update.
  Future<T?> _getWeather(Place place) async {
    logInfo('We start making a query to retrieve $T by place: $place');

    T? weather;

    try {
      // weather service request
      weather = await getWeatherFromOWM(place).timeout(_timeoutServiceOWM);

      // if we have received data, record the time of receipt
      await saveLastRequestTimeInDb(DateTime.now());

      // save the obtained data to the database
      await saveWeatherInDb(weather as T);
    } on SocketException catch (e, s) {
      logInfo('No connection to the Internet or weather server.', e, s);
      messageNotifier.tSocketException();
    } on TimeoutException catch (e, s) {
      logInfo('The service waiting time has expired', e, s);
      messageNotifier.tTimeoutException();
    } catch (e, s) {
      logError('Another mistake', e, s);
    }

    return weather;
  }

  /// Take the weather value from local storage.
  @protected
  FutureOr<T?> getStoredWeather();

  /// Get weather by location from a weather service.
  @protected
  Future<T> getWeatherFromOWM(Place place);

  /// Save the received weather to local storage.
  @protected
  Future<void> saveWeatherInDb(T weather);

  /// Save the time when the weather data was last received.
  @protected
  Future<void> saveLastRequestTimeInDb(DateTime dateTime);

  /// Is the location correct for getting weather from it?
  bool _isPlaceCorrect(Place place) =>
      place.latitude == null || place.longitude == null;
}
