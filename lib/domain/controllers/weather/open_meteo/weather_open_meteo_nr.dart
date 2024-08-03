// ignore_for_file: avoid_public_notifier_properties
import 'dart:async';
import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/data/open_meteo/models/enums.dart';
import 'package:weather_today/data/open_meteo/models/models.dart';
import 'package:weather_today/domain/models/place/place_model.dart';
import 'package:weather_today/domain/services/cardoteka/open_meteo_storage.dart';

import '../weather_nr.dart';

/// Notifier of the [ForecastOpenMeteoResponse] weather service for https://open-meteo.com/.
class WeatherOpenMeteoNR extends WeatherNR<ForecastOpenMeteoResponse> {
  /// Instance of current class.
  static final i =
      AsyncNotifierProvider<WeatherOpenMeteoNR, ForecastOpenMeteoResponse?>(
    WeatherOpenMeteoNR.new,
    name: '$WeatherOpenMeteoNR',
  );

  late OpenMeteoStorage _openMeteoStorage;

  @override
  Duration get allowedRequestRate => Duration.zero;

  @override
  FutureOr<ForecastOpenMeteoResponse?> build() async {
    _openMeteoStorage = ref.watch(OpenMeteoStorage.i);
    return super.build();
  }

  @override
  Future<ForecastOpenMeteoResponse?> getStoredWeather() async =>
      _openMeteoStorage.getOrNull(OpenMeteoCards.latestWeatherForecast);

  @override
  Future<ForecastOpenMeteoResponse> getWeatherFromOWM(Place place) async {
    Map<String, dynamic>? result;

    try {
      final uri = Uri.https(
        'api.open-meteo.com',
        '/v1/forecast',
        {
          'latitude': '${place.latitude}',
          'longitude': '${place.longitude}',
          'current': OpenMeteoCurrentParam.values.map((e) => e.name).join(','),
          'hourly': OpenMeteoHourlyParam.values.map((e) => e.name).join(','),
          'daily': OpenMeteoDailyParam.values.map((e) => e.name).join(','),
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

      print(uri);
    } catch (error, stackTrace) {
      throw OwmApiException.error(error, stackTrace);
    }

    final forecast = ForecastOpenMeteoResponse.fromJson(result);

    return forecast;
  }

  @override
  Future<void> saveWeatherInDb(ForecastOpenMeteoResponse weather) async =>
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
