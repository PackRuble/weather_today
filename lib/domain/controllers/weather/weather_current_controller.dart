import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/domain/controllers/owm_controller.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';
import 'package:weather_today/domain/models/place/place_model.dart';
import 'package:weather_today/domain/services/local_storage/key_store.dart';

import 'weather_controller.dart';

/// Разрешенная частота запроса к сервису получения CURRENT-погоды с
/// ключом API по умолчанию (ключ разработчика).
const Duration _allowedRequestRateCurrentWithDefaultApi = Duration(seconds: 30);

/// Разрешенная частота запроса к сервису получения CURRENT-погоды с
/// пользовательским ключом API.
const Duration _allowedRequestRateCurrentWithUserApi = Duration.zero;

/// Контроллер сервиса CURRENT-погоды.
final weatherCurrentController =
    StateNotifierProvider<WeatherCurrentNotifier, AsyncValue<WeatherCurrent?>>(
        (ref) {
  final Place currentPlace = ref.watch(WeatherServices.currentPlace);
  final Duration allowedRequestRate = ref.watch(OWMController.isUserApiKey)
      ? _allowedRequestRateCurrentWithUserApi
      : _allowedRequestRateCurrentWithDefaultApi;

  return WeatherCurrentNotifier(
    ref,
    currentPlace: currentPlace,
    allowedRequestRate: allowedRequestRate,
  );
}, name: '$WeatherCurrentNotifier');

class WeatherCurrentNotifier extends WeatherNotifier<WeatherCurrent> {
  WeatherCurrentNotifier(
    super._ref, {
    required super.currentPlace,
    required super.allowedRequestRate,
  });

  @override
  @protected
  Future<WeatherCurrent?> getStoredWeather() async {
    final String jsonStr = await super
        .db
        .load(DbStore.weatherCurrent, DbStore.weatherCurrentDefault);

    if (jsonStr.isNotEmpty) {
      return WeatherCurrent.fromJson(
          jsonDecode(jsonStr) as Map<String, dynamic>);
    }
    return null;
  }

  @override
  @protected
  Future<WeatherCurrent> getWeatherFromOWM(Place place) async =>
      super.weatherService.currentWeatherByLocation(
          latitude: place.latitude!, longitude: place.longitude!);

  @override
  @protected
  Future<void> saveWeatherInDb(WeatherCurrent weather) async =>
      db.save(DbStore.weatherCurrent, jsonEncode(weather.toJson()));

  @override
  @protected
  Future<void> saveLastRequestTimeInDb(DateTime dateTime) async =>
      db.save(DbStore.lastRequestTimeCurrent, dateTime.millisecondsSinceEpoch);

  @override
  @protected
  Future<DateTime> getLastRequestTime() async {
    final int timeInMilliseconds = await db.load(
        DbStore.lastRequestTimeCurrent, DbStore.lastRequestTimeCurrentDefault);

    return DateTime.fromMillisecondsSinceEpoch(timeInMilliseconds);
  }
}
