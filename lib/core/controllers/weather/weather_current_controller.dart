import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:meta/meta.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/const/key_store.dart';
import 'package:weather_today/core/controllers/weather_service_controllers.dart';
import 'package:weather_today/core/models/place/place_model.dart';
import 'package:weather_today/core/services/api/api_OWM.dart';

import 'i_weather_controller.dart';

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
  final Duration allowedRequestRate = ref.watch(ApiServiceOwm.isUserApiKey)
      ? _allowedRequestRateCurrentWithUserApi
      : _allowedRequestRateCurrentWithDefaultApi;

  return WeatherCurrentNotifier(
    ref,
    currentPlace: currentPlace,
    allowedRequestRate: allowedRequestRate,
  );
}, name: '$WeatherCurrentNotifier');

class WeatherCurrentNotifier extends IWeatherNotifier<WeatherCurrent> {
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
