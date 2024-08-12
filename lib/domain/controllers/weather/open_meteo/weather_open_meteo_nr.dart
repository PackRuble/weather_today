// ignore_for_file: avoid_public_notifier_properties
import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/data/open_meteo/models/models.dart';
import 'package:weather_today/data/open_meteo/open_meteo_repo.dart';
import 'package:weather_today/domain/controllers/weather/open_meteo/open_meteo_repo_nr.dart';
import 'package:weather_today/domain/models/place/place_model.dart';
import 'package:weather_today/domain/services/cardoteka/open_meteo_storage.dart';

import '../../localization_controller.dart';
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
  Duration get allowedRequestRate => const Duration(minutes: 15);

  @override
  FutureOr<ForecastOpenMeteoResponse?> build() async {
    _openMeteoStorage = ref.watch(OpenMeteoStorage.i);
    return super.build();
  }

  @override
  ForecastOpenMeteoResponse? getStoredWeather() =>
      _openMeteoStorage.getOrNull(OpenMeteoCards.latestWeatherForecast);

  @override
  Future<ForecastOpenMeteoResponse?> optimizedFetchWeather(Place place) async {
    final last = getLastRequestTime();
    final now = DateTime.now();

    final storedWeather = getStoredWeather();

    // it was today?
    if (storedWeather != null &&
        last != null &&
        last.year == now.year &&
        last.month == now.month &&
        last.day == now.day) {
      // hourly and daily are updated once a day for open-meteo, so it doesn't
      // make sense to make more requests
      final res = await _openMeteoRepo.fetchForecast(
        place,
        hourlyParams: null,
        dailyParams: null,
      );

      return storedWeather.copyWith(currentWeather: res.currentWeather);
    } else {
      return null;
    }
  }

  @override
  Future<ForecastOpenMeteoResponse> fetchWeather(Place place) async =>
      await _openMeteoRepo.fetchForecast(place);

  @override
  Future<void> saveWeatherInDb(ForecastOpenMeteoResponse weather) async =>
      _openMeteoStorage.set(OpenMeteoCards.latestWeatherForecast, weather);

  @override
  Future<void> saveLastRequestTimeInDb(DateTime dateTime) async =>
      _openMeteoStorage.set(OpenMeteoCards.latestRequestTimeForecast, dateTime);

  @override
  DateTime? getLastRequestTime() =>
      _openMeteoStorage.getOrNull(OpenMeteoCards.latestRequestTimeForecast);

  @override
  bool isAbilityRequestOnDiffPlacesImpl() =>
      _openMeteoStorage.get<bool>(OpenMeteoCards.isAllowUpdateDueToDiffPlaces);

  @override
  Future<void> resetAbilityRequestOnDiffPlaces() async =>
      _openMeteoStorage.set<bool>(
        OpenMeteoCards.isAllowUpdateDueToDiffPlaces,
        false,
      );

  @override
  void whenUpdateNotAllowed() {
    // allowedRequestRate=15min => data on the server is not updated more often
    messagesNR.showSnack(ref.tr.messages.weatherDataIsActual);
  }
}
