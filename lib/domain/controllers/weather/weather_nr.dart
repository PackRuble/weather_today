// ignore_for_file: avoid_public_notifier_properties, join_return_with_assignment
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart' as fl_service;
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';
import 'package:weather_today/utils/logger/all_observers.dart';

import '../../models/place/place_model.dart';
import '../message_controller.dart';

const bool _kDebugMode = fl_service.kDebugMode;

/// Waiting time for a call from the weather update service.
const Duration _timeoutServiceOWM = Duration(seconds: 10);

/// General weather notifier.
abstract class WeatherNR<T> extends AsyncNotifier<T?> with NotifierLogger {
  /// Get an instance of the message controller.
  MessageController get _messagesNR => ref.read(MessageController.instance);

  /// Allowed frequency of request to the OWM weather retrieval service.
  Duration get allowedRequestRate;

  /// The currently selected place for which a weather query is being performed.
  late Place _currentPlace;

  /// Implementations of this method should end with a call to the inherited
  /// method, as in `super.build()`.
  @override
  @mustCallSuper
  FutureOr<T?> build() async {
    _currentPlace = ref.watch(WeatherServices.currentPlace);

    ref.listenSelf(
      (_, __) {},
      onError: (error, _) => l.info(error),
    );

    return _init();
  }

  Future<T?> _init() async {
    l.info('initialization with <$T>');

    if (_isPlaceCorrect(_currentPlace)) {
      const error = 'The location is not correct. Choose a different location.';
      state = AsyncValue.error(error, StackTrace.current);
      return null;
    }

    if (_kDebugMode) {
      l.debug('init in debug mode');
      final stored = await getStoredWeather();
      if (stored != null) return stored;
    }

    T? weather;

    // if you are allowed to update now
    if (await _isAllowedMakeRequest() ||
        await _isAbilityRequestOnDiffPlaces()) {
      l.info('$T: Permission granted. Trying to get the weather.');

      weather = await _getWeather(_currentPlace);
    }
    // making a request to the db. If it's empty return null
    else {
      l.info('$T: Permission NOT granted. Trying to get the weather in db.');
    }

    weather ??= await getStoredWeather();

    return weather;
  }

  /// The time of the last request to weather service.
  @protected
  Future<DateTime> getLastRequestTime();

  /// Permission to query the weather service.
  Future<bool> _isAllowedMakeRequest() async {
    final isGranted = await _timeWhenWillBeAllowedMakeRequest() < Duration.zero;
    l.info('$T: Resolution according to time elapsed. Granted: <$isGranted>');
    return isGranted;
  }

  /// Defines the time after which a request to the weather service can be made.
  Future<Duration> _timeWhenWillBeAllowedMakeRequest() async {
    final nowTime = DateTime.now();
    final lastRequestTime = await getLastRequestTime();
    final diffTime = allowedRequestRate - nowTime.difference(lastRequestTime);

    l.info(
      '$T: now: $nowTime, lastRequest: $lastRequestTime, diff: $diffTime, '
      'Allowed once per:  ${allowedRequestRate.inMinutes != 0 ? '${allowedRequestRate.inMinutes} minutes' : '${allowedRequestRate.inSeconds} seconds'}',
    );

    return diffTime;
  }

  Future<bool> isAbilityRequestOnDiffPlacesImpl();

  Future<void> resetAbilityRequestOnDiffPlaces();

  /// Request the ability to get weather due to the difference of previous and current places.
  Future<bool> _isAbilityRequestOnDiffPlaces() async {
    final isGranted = await isAbilityRequestOnDiffPlacesImpl();
    l.info(
        '$T: Request the ability to get weather due to the difference of previous and current places. Granted: <$isGranted>');

    if (isGranted) await resetAbilityRequestOnDiffPlaces();

    return isGranted;
  }

  /// Weather update.
  Future<void> updateWeather() async {
    l.info('$T: Trying to update weather. DebugMode: $_kDebugMode');

    if (_isPlaceCorrect(_currentPlace)) {
      const error = 'The location is not correct. Choose a different location.';
      state = AsyncValue.error(error, StackTrace.current);
    }

    // is the update available now?
    if (await _isAllowedMakeRequest() ||
        await _isAbilityRequestOnDiffPlaces() ||
        _kDebugMode) {
      l.info('$T: Permission granted. Trying to get the weather.');

      state = const AsyncValue.loading();

      // get the weather from the server
      T? weather = await _getWeather(_currentPlace);

      // if data is null, try to get data from the database
      weather ??= await getStoredWeather();

      state = AsyncData(weather);
    } else {
      _messagesNR.sUpdateWeatherFail();
    }
  }

  /// An internal method for retrieving weather from the OWM service [weatherService].
  ///
  /// Includes:
  /// * error handling.
  /// * time of possible update.
  Future<T?> _getWeather(Place place) async {
    l.info('We start making a query to retrieve $T by place: $place');

    T? weather;

    try {
      // weather service request
      weather = await getWeatherFromOWM(place).timeout(_timeoutServiceOWM);

      // if we have received data, record the time of receipt
      await saveLastRequestTimeInDb(DateTime.now());

      // save the obtained data to the database
      await saveWeatherInDb(weather as T);
    } on SocketException catch (e, s) {
      l.info('No connection to the Internet or weather server.', e, s);
      _messagesNR.tSocketException();
    } on TimeoutException catch (e, s) {
      l.info('The service waiting time has expired', e, s);
      _messagesNR.tTimeoutException();
    } catch (e, s) {
      l.error('Another mistake', e, s);
      _messagesNR.showErrorSnack(e.toString());
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
