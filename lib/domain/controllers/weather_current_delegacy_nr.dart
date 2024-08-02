import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/data/open_meteo/models/models.dart';
import 'package:weather_today/domain/weather/models.dart';

import 'weather/open_meteo/weather_open_meteo_nr.dart';
import 'weather/open_weather_map/weather_current_controller.dart';
import 'weather_provider_nr.dart';

class WeatherCurrentDelegacyNR extends AsyncNotifier<WeatherCurrent?> {
  static final i =
      AsyncNotifierProvider<WeatherCurrentDelegacyNR, WeatherCurrent?>(
    WeatherCurrentDelegacyNR.new,
    name: '$WeatherCurrentDelegacyNR',
  );

  @override
  Future<WeatherCurrent?> build() async {
    final weatherProvider = ref.watch(WeatherProviderNR.i);

    final WeatherCurrent? current = await switch (weatherProvider) {
      WeatherProvider.openMeteo => _convertForecastOpenMeteoToWeatherOneCall(
          await ref.watch(WeatherOpenMeteoNR.i.future)),
      WeatherProvider.openWeatherMap =>
        ref.watch(WeatherCurrentNotifier.instance.future),
    };

    return current;
  }

  WeatherCurrent _convertForecastOpenMeteoToWeatherOneCall(
      ForecastOpenMeteoResponse? forecast) {
    // todo(02.08.2024): в конечном итоге взять из моковых данных гитхаба
    forecast = forecast!;

    final currentOpenMeteo = forecast.currentWeather;
    final currentWeather = WeatherCurrent(
      {},
      date: currentOpenMeteo.time,
      sunrise: null,
      sunset: null,
      temp: currentOpenMeteo.temperature2m,
      tempFeelsLike: currentOpenMeteo.apparentTemperature,
      visibility: null,
      pressure: currentOpenMeteo.surfacePressure,
      humidity: currentOpenMeteo.relativeHumidity2m.toDouble(),
      dewPoint: null,
      windSpeed: currentOpenMeteo.windSpeed10m,
      windDegree: currentOpenMeteo.windDirection10m.toDouble(),
      windGust: currentOpenMeteo.windGusts10m,
      cloudiness: currentOpenMeteo.cloudCover.toDouble(),
      uvi: null,
      weatherDescription: null, // todo(02.08.2024):
      weatherMain: null, // todo(02.08.2024):
      weatherIcon: null, // todo(02.08.2024):
      weatherConditionCode: null, // todo(02.08.2024):
    );

    return currentWeather;
  }
}
