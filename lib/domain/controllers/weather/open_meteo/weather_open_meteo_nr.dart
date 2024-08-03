// ignore_for_file: avoid_public_notifier_properties
import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/data/open_meteo/models/models.dart';
import 'package:weather_today/data/open_meteo/open_meteo_repo.dart';
import 'package:weather_today/domain/controllers/weather/open_meteo/open_meteo_repo_nr.dart';
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
  OpenMeteoRepo get _openMeteoRepo => ref.read(OpenMeteoRepoPR.i);

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
  Future<ForecastOpenMeteoResponse> getWeatherFromOWM(Place place) async =>
      await _openMeteoRepo.fetchForecast(place);

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
  Future<void> resetAbilityRequestOnDiffPlaces() async => false;
}
