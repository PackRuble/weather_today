import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/core/controllers/weather_service_controllers.dart';

import '../../../utils/logger/riverpod_logger.dart';
import '../../models/place/place_model.dart';
import '../../services/local_db_service/data_base_controller.dart';
import '../../services/local_db_service/interface/i_data_base.dart';
import '../message_controller.dart';

//coldfix: needs to be redesigned
//  * correct try-catch
//  * fix logging
//  * fix dead code
//  *

/// Разрешено для OneCall API, пакет - Free:
/// * 1,000 calls/day
/// * 30,000 calls/month
///
/// Разрешено для Weather APIs, пакет - Free:
/// * 60 calls/minute
/// * 1,000,000 calls/month
///
abstract class IWeatherOwmController<T> extends StateNotifier<AsyncValue<T>> {
  IWeatherOwmController(
    this._ref, {
    required this.currentPlace,
    required Duration allowedRequestRate,
  }) : super(AsyncValue<T>.loading()) {
    _allowedRequestRate = allowedRequestRate;

    _init();
  }

  final Ref _ref;

  IDataBase get db => _ref.read(dbService);

  /// сервис запроса погоды
  WeatherService get weatherService =>
      _ref.read(WeatherServices.weatherService);

  /// Разрешенная частота запроса к сервису получения погоды OWM.
  late final Duration _allowedRequestRate;

  /// Текущее выбранное место, по которому выполняется запрос на погоду.
  final Place currentPlace;

  /// Запустить при создании класса.
  Future<void> _init() async {
    if (kDebugMode) {
      rlogDebug('initial');
      state = AsyncValue<T>.data(await getTestedWeather());
      return;
    }

    T? weather;

    // доступно обновление сейчас?
    if (await _isAllowedMakeRequest()) {
      rlogDebug(
          'Получено разрешение на запрос к сервису OWM'); //todo переименовать

      weather = await _getWeather(currentPlace);
    }

    // обращаемся к бд или, если там пусто, к тестовому json.
    state = AsyncValue<T>.data(weather ?? await _getAnywayWeather());
  }

  /// Время последнего запроса к сервису OWM для получения погоды.
  ///
  /// See more [one-call-api](https://openweathermap.org/api/one-call-api)
  Future<DateTime> getLastRequestTime();

  /// Разрешение на запрос к сервису погоды.
  Future<bool> _isAllowedMakeRequest() async =>
      await _timeWhenWillBeAllowedMakeRequest() < Duration.zero;

  /// Метод определяет время, через которое можно совершить запрос к сервису OWM.
  Future<Duration> _timeWhenWillBeAllowedMakeRequest() async {
    final DateTime nowTime = DateTime.now();
    final DateTime lastRequestTime = await getLastRequestTime();
    final Duration diffTime =
        _allowedRequestRate - nowTime.difference(lastRequestTime);

    rlogDebug(
        'Сейчас: $nowTime, Последний раз в: $lastRequestTime, Разрешено раз в: ${_allowedRequestRate.inMinutes} минут');

    return diffTime;
  }

  // /// Через какое время можно будет сделать запрос сервису OWM.
  // Future<Duration> _whenWillBeAllowedMakeRequest() async =>
  //     _timeWhenWillBeAllowedMakeRequest();

  /// Обновить погоду.
  Future<void> updateWeather() async {
    /*if (kDebugMode) {
      state = AsyncLoading<T>();
      state =
          AsyncData<T>(await getStoredWeather() ?? await getTestedWeather());
      return;
    }*/

    T weather;

    // доступно обновление сейчас?
    if (await _isAllowedMakeRequest()) {
      state = AsyncLoading<T>();

      weather = await _getWeather(currentPlace);

      state = AsyncData<T>(weather);
    } else {
      _ref.read(MessageController.instance).sUpdateWeatherFail();
    }
  }

  /// Внутренний метод получения погоды. Включает обработку ошибок.
  Future<T> _getWeather(Place place) async {
    rlogDebug(
        'Начинаем делать запрос для получения ${T.toString()} по place: $place');

    T? weather;

    try {
      // запрос к сервису погоды
      weather = await getWeather(place);

      // если мы получили данные, фиксируем время получения
      await saveLastRequestTimeInDb(DateTime.now());
    } on SocketException catch (e, s) {
      rlogDebug('Нет соединения с интернетом или с сервером погоды.', e, s);

      _ref.read(MessageController.instance).tSocketException();
    } catch (e, s) {
      rlogError('Другая ошибка', e, s);
    } finally {
      // сохраняем погоду в бд если она не равна null
      if (weather != null) {
        await saveWeatherInDb(weather);
      }

      weather ??= await _getAnywayWeather();
    }

    return weather!;
  }

  /// Взять значение погоды из json-файла.
  Future<T> getTestedWeather();

  /// Взять значение погоды из бд.
  Future<T?> getStoredWeather();

  /// Получить модельку погоды несмотря ни на что ! :) .
  Future<T> _getAnywayWeather() async =>
      (await getStoredWeather()) ?? (await getTestedWeather());

  /// Получить погоду по местоположению из сервиса OWM.
  Future<T?> getWeather(Place place);

  /// Сохранить полученную погоду в дб.
  Future<void> saveWeatherInDb(T weather);

  /// Сохраняем время последнего получения данных погоды.
  Future<void> saveLastRequestTimeInDb(DateTime dateTime);

  bool isPlaceCorrect(Place place) =>
      place.latitude == null || place.longitude == null;
}
