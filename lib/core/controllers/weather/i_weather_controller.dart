import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart' as fl_service;
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/core/controllers/weather_service_controllers.dart';

import '../../../utils/logger/riverpod_logger.dart';
import '../../models/place/place_model.dart';
import '../../services/local_db_service/data_base_controller.dart';
import '../../services/local_db_service/interface/i_data_base.dart';
import '../message_controller.dart';

const bool _kDebugMode = fl_service.kDebugMode;

/// Время ожидания вызова обновления погоды?
const Duration _timeoutServiceOWM = Duration(seconds: 10);

/// Разрешено для OneCall API, пакет - Free:
/// * 1,000 calls/day
/// * 30,000 calls/month
///
/// Разрешено для Weather APIs, пакет - Free:
/// * 60 calls/minute
/// * 1,000,000 calls/month
///
abstract class IWeatherNotifier<T> extends StateNotifier<AsyncValue<T?>> {
  IWeatherNotifier(
    this._ref, {
    required Place currentPlace,
    required Duration allowedRequestRate,
  })  : _currentPlace = currentPlace,
        _allowedRequestRate = allowedRequestRate,
        super(const AsyncValue.loading()) {
    _init();
  }

  final Ref _ref;

  @protected
  IDataBase get db => _ref.read(dbService);

  /// сервис запроса погоды
  @protected
  WeatherService get weatherService =>
      _ref.read(WeatherServices.weatherService);

  /// Разрешенная частота запроса к сервису получения погоды OWM.
  final Duration _allowedRequestRate;

  /// Текущее выбранное место, по которому выполняется запрос на погоду.
  final Place _currentPlace;

  /// Запустить при создании класса.
  Future<void> _init() async {
    logInfo('$T: initialization');

    if (_isPlaceCorrect(_currentPlace)) {
      const contentError =
          'The location is not correct. Choose a different location.';
      logInfo(contentError);
      state = const AsyncValue.error(contentError, StackTrace.empty);
    }

    if (_kDebugMode) {
      logInfo('init in the debug mode');
      state = AsyncValue.data(await getStoredWeather());
      return;
    }

    T? weather;

    // если разрешено обновить сейчас
    if (await _isAllowedMakeRequest()) {
      logInfo('$T: Permission granted. Trying to get the weather.');

      weather = await _getWeather(_currentPlace);
    }
    // making a request to the db. If it's empty return null
    else {
      logInfo('$T: Permission NOT granted. Trying to get the weather in db.');
    }

    weather ??= await getStoredWeather();

    state = AsyncValue.data(weather);
  }

  /// Время последнего запроса к сервису OWM для получения погоды.
  ///
  /// See more [one-call-api](https://openweathermap.org/api/one-call-api)
  @protected
  Future<DateTime> getLastRequestTime();

  /// Permission to query the weather service.
  Future<bool> _isAllowedMakeRequest() async {
    final isGranted = await _timeWhenWillBeAllowedMakeRequest() < Duration.zero;
    logInfo('$T: Getting permission to receive weather. Granted: <$isGranted>');
    return isGranted;
  }

  /// Метод определяет время, через которое можно совершить запрос к сервису OWM.
  Future<Duration> _timeWhenWillBeAllowedMakeRequest() async {
    final DateTime nowTime = DateTime.now();
    final DateTime lastRequestTime = await getLastRequestTime();
    final Duration diffTime =
        _allowedRequestRate - nowTime.difference(lastRequestTime);

    logInfo(
        '$T: now: $nowTime, lastRequest: $lastRequestTime, diff: $diffTime, '
        'Allowed once per:  ${_allowedRequestRate.inMinutes} minutes');

    return diffTime;
  }

  /// Обновить погоду.
  Future<void> updateWeather() async {
    logInfo('$T: Trying to update weather. DebugMode: $_kDebugMode');

    if (_isPlaceCorrect(_currentPlace)) {
      const contentError =
          'The location is not correct. Choose a different location.';
      logInfo(contentError);
      state = const AsyncValue.error(contentError, StackTrace.empty);
    }

    // доступно обновление сейчас?
    if (await _isAllowedMakeRequest() || _kDebugMode) {
      logInfo('$T: Permission granted. Trying to get the weather.');

      // coldfix: at this point the refresh indicator is running and that's enough
      // state = const AsyncLoading();

      // получаем погоду с сервера
      T? weather = await _getWeather(_currentPlace);

      // если данные равны null, пытаемся получить данные из бд
      weather ??= await getStoredWeather();

      state = AsyncData(weather);
    } else {
      _ref.read(MessageController.instance).sUpdateWeatherFail();
    }
  }

  /// Внутренний метод получения погоды из сервиса OWM [weatherService].
  ///
  /// Включает:
  /// * обработку ошибок.
  /// * время возможного обновления.
  Future<T?> _getWeather(Place place) async {
    rlogDebug('Начинаем делать запрос для получения $T по place: $place');

    T? weather;

    try {
      // запрос к сервису погоды
      weather = await getWeatherFromOWM(place).timeout(_timeoutServiceOWM);

      // если мы получили данные, фиксируем время получения
      await saveLastRequestTimeInDb(DateTime.now());

      // сохраняем полученные данные в бд
      await saveWeatherInDb(weather as T);
    } on SocketException catch (e, s) {
      rlogDebug('Нет соединения с интернетом или с сервером погоды.', e, s);
      _ref.read(MessageController.instance).tSocketException();
    } on TimeoutException catch (e, s) {
      rlogDebug('Время ожидания сервиса истекло', e, s);
      _ref.read(MessageController.instance).tTimeoutException();
    } catch (e, s) {
      rlogError('Другая ошибка', e, s);
    }

    return weather;
  }

  /// Взять значение погоды из бд.
  Future<T?> getStoredWeather();

  /// Получить погоду по местоположению из сервиса OWM.
  Future<T> getWeatherFromOWM(Place place);

  /// Сохранить полученную погоду в дб.
  Future<void> saveWeatherInDb(T weather);

  /// Сохраняем время последнего получения данных погоды.
  Future<void> saveLastRequestTimeInDb(DateTime dateTime);

  /// Корректно ли местоположение для получения по нему погоды?
  bool _isPlaceCorrect(Place place) =>
      place.latitude == null || place.longitude == null;
}
