// ignore_for_file: avoid_public_notifier_properties
import 'dart:async';
import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/domain/controllers/owm_controller.dart';
import 'package:weather_today/domain/models/place/place_model.dart';
import 'package:weather_today/domain/services/cardoteka/weather_storage.dart';
import 'package:weather_today/domain/services/local_storage/key_store.dart';

import 'base_weather_owm_nr.dart';

/// Notifier of the ONECALL weather service.
class WeatherOnecallOwmNR extends BaseWeatherOwmNR<WeatherOneCall> {
  /// Instance of current class.
  static final i = AsyncNotifierProvider<WeatherOnecallOwmNR, WeatherOneCall?>(
    WeatherOnecallOwmNR.new,
    name: '$WeatherOnecallOwmNR',
  );

  @override
  late Duration allowedRequestRate;

  @override
  FutureOr<WeatherOneCall?> build() async {
    allowedRequestRate = ref.watch(OWMController.isUserApiKey)
        ? allowedRequestRateOnecallWithUserApi
        : allowedRequestRateOnecallWithDefaultApi;

    return super.build();
  }

  /// Allowed frequency of request to ONECALL weather retrieval service with
  /// default API key (developer key).
  static const Duration allowedRequestRateOnecallWithDefaultApi =
      Duration(days: 1);

  /// Allowed frequency of request to ONECALL weather retrieval service with
  /// by the API user key.
  static const Duration allowedRequestRateOnecallWithUserApi = Duration.zero;

  @override
  Future<WeatherOneCall?> getStoredWeather() async {
    final String jsonStr =
        await db.load(DbStore.weatherOneCall, DbStore.weatherOneCallDefault);

    if (jsonStr.isNotEmpty) {
      return WeatherOneCall.fromJson(
          jsonDecode(jsonStr) as Map<String, dynamic>);
    }
    return null;
  }

  @override
  Future<WeatherOneCall> getWeatherFromOWM(Place place) async =>
      weatherService.oneCallWeatherByLocation(
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

  @override
  Future<bool> isAbilityRequestOnDiffPlacesImpl() async {
    return weatherStorage.get<bool>(
        WeatherCards.isAllowONECALLUpdateDueToDiffPrevAndCurrentPlaces);
  }

  @override
  Future<void> resetAbilityRequestOnDiffPlaces() async =>
      weatherStorage.set<bool>(
        WeatherCards.isAllowONECALLUpdateDueToDiffPrevAndCurrentPlaces,
        false,
      );
}
