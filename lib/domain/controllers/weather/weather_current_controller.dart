// ignore_for_file: avoid_public_notifier_properties
import 'dart:async';
import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/domain/controllers/owm_controller.dart';
import 'package:weather_today/domain/models/place/place_model.dart';
import 'package:weather_today/domain/services/cardoteka/weather_storage.dart';
import 'package:weather_today/domain/services/local_storage/key_store.dart';

import 'weather_controller.dart';

/// Notifier of the CURRENT weather service.
class WeatherCurrentNotifier extends WeatherNotifier<WeatherCurrent> {
  /// Instance of current class.
  static final instance =
      AsyncNotifierProvider<WeatherCurrentNotifier, WeatherCurrent?>(
    WeatherCurrentNotifier.new,
    name: '$WeatherCurrentNotifier',
  );

  @override
  late Duration allowedRequestRate;

  @override
  FutureOr<WeatherCurrent?> build() async {
    allowedRequestRate = ref.watch(OWMController.isUserApiKey)
        ? allowedRequestRateCurrentWithUserApi
        : allowedRequestRateCurrentWithDefaultApi;

    return super.build();
  }

  /// Allowed frequency of request to CURRENT weather retrieval service with
  /// default API key (developer key).
  static const Duration allowedRequestRateCurrentWithDefaultApi =
      Duration(seconds: 30);

  /// Allowed frequency of request to CURRENT weather retrieval service with
  /// by the API user key.
  static const Duration allowedRequestRateCurrentWithUserApi = Duration.zero;

  @override
  Future<WeatherCurrent?> getStoredWeather() async {
    final String jsonStr =
        await db.load(DbStore.weatherCurrent, DbStore.weatherCurrentDefault);

    if (jsonStr.isNotEmpty) {
      return WeatherCurrent.fromJson(
          jsonDecode(jsonStr) as Map<String, dynamic>);
    }
    return null;
  }

  @override
  Future<WeatherCurrent> getWeatherFromOWM(Place place) async =>
      super.weatherService.currentWeatherByLocation(
          latitude: place.latitude!, longitude: place.longitude!);

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

  @override
  Future<bool> isAbilityRequestOnDiffPlacesImpl() async {
    return weatherStorage.get<bool>(
        WeatherCards.isAllowCURRENTUpdateDueToDiffPrevAndCurrentPlaces);
  }

  @override
  Future<bool> resetAbilityRequestOnDiffPlaces() async =>
      weatherStorage.set<bool>(
        WeatherCards.isAllowCURRENTUpdateDueToDiffPrevAndCurrentPlaces,
        false,
      );
}
