import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/const/key_store.dart';
import 'package:weather_today/core/controllers/weather_service_controllers.dart';
import 'package:weather_today/core/models/place/place_model.dart';
import 'package:weather_today/core/services/api/api_OWM.dart';

import 'i_weather_controller.dart';

/// Разрешенная частота запроса к сервису получения погоды Onecall с
/// ключом API по умолчанию (ключ разработчика).
const Duration _allowedRequestRateOnecallWithDefaultApi = Duration(days: 1);

/// Разрешенная частота запроса к сервису получения погоды Onecall с
/// пользовательским ключом API.
const Duration _allowedRequestRateOnecallWithUserApi = Duration.zero;

/// Контроллер сервиса ONECALL-погоды.
final weatherOneCallController =
    StateNotifierProvider<WeatherOnecallNotifier, AsyncValue<WeatherOneCall?>>(
        (ref) {
  final Place currentPlace = ref.watch(WeatherServices.currentPlace);
  final Duration _allowedRequestRate = ref.watch(ApiServiceOwm.isUserApiKey)
      ? _allowedRequestRateOnecallWithUserApi
      : _allowedRequestRateOnecallWithDefaultApi;

  return WeatherOnecallNotifier(
    ref,
    currentPlace: currentPlace,
    allowedRequestRate: _allowedRequestRate,
  );
}, name: '$WeatherOnecallNotifier');

class WeatherOnecallNotifier extends IWeatherNotifier<WeatherOneCall> {
  WeatherOnecallNotifier(
    super._ref, {
    required super.currentPlace,
    required super.allowedRequestRate,
  });

  @override
  Future<WeatherOneCall?> getStoredWeather() async {
    final String jsonStr = await super
        .db
        .load(DbStore.weatherOneCall, DbStore.weatherOneCallDefault);

    if (jsonStr.isNotEmpty) {
      return WeatherOneCall.fromJson(
          jsonDecode(jsonStr) as Map<String, dynamic>);
    }
    return null;
  }

  @override
  Future<WeatherOneCall> getWeatherFromOWM(Place place) async =>
      super.weatherService.oneCallWeatherByLocation(
          latitude: place.latitude!, longitude: place.longitude!);

  @override
  Future<void> saveWeatherInDb(WeatherOneCall weather) async =>
      db.save(DbStore.weatherOneCall, jsonEncode(weather.toJson()));

  @override
  Future<void> saveLastRequestTimeInDb(DateTime dateTime) async =>
      db.save(DbStore.lastRequestTimeOneCall, dateTime.millisecondsSinceEpoch);

  @override
  Future<DateTime> getLastRequestTime() async {
    final int timeInMilliseconds = await db.load(
        DbStore.lastRequestTimeOneCall, DbStore.lastRequestTimeOneCallDefault);

    return DateTime.fromMillisecondsSinceEpoch(timeInMilliseconds);
  }
}
