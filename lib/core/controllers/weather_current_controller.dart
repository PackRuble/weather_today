import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/const/key_store.dart';
import 'package:weather_today/core/controllers/weather_service_controllers.dart';
import 'package:weather_today/core/services/api/api_OWM.dart';

import '../models/place/place_model.dart';
import 'interface/i_weather_controller.dart';

// todo переместить куда-то в константы?
/// Разрешенная частота запроса к сервису получения CURRENT-погоды с
/// ключом API по умолчанию (ключ разработчика).
const Duration _allowedRequestRateCurrentWithDefaultApi = Duration(seconds: 30);

/// Разрешенная частота запроса к сервису получения CURRENT-погоды с
/// пользовательским ключом API.
const Duration _allowedRequestRateCurrentWithUserApi = Duration.zero;

/// Контроллер сервиса CURRENT-погоды.
final weatherCurrentController =
    StateNotifierProvider<WeatherCurrentController, AsyncValue<WeatherCurrent>>(
        (ref) {
  final Place currentPlace = ref.watch(WeatherServices.currentPlace);
  final Duration allowedRequestRate = ref.watch(ApiServiceOwm.isUserApiKey)
      ? _allowedRequestRateCurrentWithUserApi
      : _allowedRequestRateCurrentWithDefaultApi;

  return WeatherCurrentController(
    ref,
    currentPlace: currentPlace,
    allowedRequestRate: allowedRequestRate,
  );
}, name: 'WeatherCurrent');

class WeatherCurrentController extends IWeatherOwmController<WeatherCurrent> {
  WeatherCurrentController(
    super._ref, {
    required super.currentPlace,
    required super.allowedRequestRate,
  });

  @override
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
  Future<WeatherCurrent> getTestedWeather() async =>
      TestWeatherJson.getCurrentWeatherToTest();

  @override
  Future<WeatherCurrent?> getWeather(Place place) async {
    if (super.isPlaceCorrect(place)) return null;

    return super.weatherDomain.currentWeatherByLocation(
        latitude: place.latitude!, longitude: place.longitude!);
  }

  @override
  Future<void> saveWeatherInDb(WeatherCurrent weather) async =>
      db.save(DbStore.weatherCurrent, jsonEncode(weather.toJson()));

  @override
  Future<void> saveLastRequestTimeInDb(DateTime dateTime) async =>
      db.save(DbStore.lastRequestTimeCurrent, dateTime.millisecondsSinceEpoch);

  @override
  Future<DateTime> getLastRequestTime() async {
    final int timeInMilliseconds = await db.load(
        DbStore.lastRequestTimeCurrent, DbStore.lastRequestTimeCurrentDefault);

    return DateTime.fromMillisecondsSinceEpoch(timeInMilliseconds);
  }
}
