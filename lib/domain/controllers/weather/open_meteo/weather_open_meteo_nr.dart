// ignore_for_file: avoid_public_notifier_properties
import 'dart:async';
import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/domain/models/place/place_model.dart';
import 'package:weather_today/domain/services/cardoteka/open_meteo_storage.dart';

import '../weather_controller.dart';

/// Notifier of the [WeatherOneCall] weather service for https://open-meteo.com/.
class WeatherOpenMeteoNR extends WeatherNotifier<WeatherOneCall> {
  /// Instance of current class.
  static final i = AsyncNotifierProvider<WeatherOpenMeteoNR, WeatherOneCall?>(
    WeatherOpenMeteoNR.new,
    name: '$WeatherOpenMeteoNR',
  );

  late OpenMeteoStorage _openMeteoStorage;

  @override
  Duration get allowedRequestRate => Duration.zero;

  @override
  FutureOr<WeatherOneCall?> build() async {
    _openMeteoStorage = ref.watch(OpenMeteoStorage.i);
    return super.build();
  }

  @override
  Future<WeatherOneCall?> getStoredWeather() async =>
      _openMeteoStorage.getOrNull(OpenMeteoCards.latestWeatherForecast);

  @override
  Future<WeatherOneCall> getWeatherFromOWM(Place place) async {
    Map<String, dynamic>? result;

    try {
      final uri = Uri.https(
        'api.open-meteo.com',
        '/v1/forecast',
        {
          'latitude': place.latitude,
          'longitude': place.longitude,
        },
      );

      final http.Response response = await http.get(uri);

      switch (response.statusCode) {
        case 200:
          break;
        default:
          throw OwmApiException(response.statusCode, response.body);
      }

      result = json.decode(response.body) as Map<String, dynamic>;
    } catch (error, stackTrace) {
      throw OwmApiException.error(error, stackTrace);
    }

    print(result);

    // todo(01.08.2024): правильно заготовить данные
    return WeatherOneCall.fromJson(result);
  }

  @override
  Future<void> saveWeatherInDb(WeatherOneCall weather) async =>
      _openMeteoStorage.set(OpenMeteoCards.latestWeatherForecast, weather);

  @override
  Future<void> saveLastRequestTimeInDb(DateTime dateTime) async =>
      _openMeteoStorage.set(OpenMeteoCards.latestRequestTimeForecast, dateTime);

  @override
  Future<DateTime> getLastRequestTime() async =>
      _openMeteoStorage.getOrNull(OpenMeteoCards.latestRequestTimeForecast) ??
      DateTime.fromMillisecondsSinceEpoch(0);

  @override
  Future<bool> isAbilityRequestOnDiffPlacesImpl() async => true;

  @override
  Future<bool> resetAbilityRequestOnDiffPlaces() async =>
      false; // todo(01.08.2024): return void
}
