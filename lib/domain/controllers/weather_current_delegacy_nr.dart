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
      WeatherProvider.openMeteo =>
        _convertToWeatherCurrent(await ref.watch(WeatherOpenMeteoNR.i.future)),
      WeatherProvider.openWeatherMap =>
        ref.watch(WeatherCurrentNotifier.instance.future),
    };

    return current;
  }

  WeatherCurrent _convertToWeatherCurrent(ForecastOpenMeteoResponse? forecast) {
    final currentOM = forecast!.currentWeather;
    final currentWeather = WeatherCurrent(
      {}, // корректно, упоминание выше
      date: currentOM.time,
      sunrise: null,
      sunset: null,
      temp: currentOM.temp2m,
      tempFeelsLike: currentOM.apparentTemp,
      visibility: null,
      pressure: currentOM.pressureMsl,
      humidity: currentOM.relativeHumidity2m.toDouble(),
      dewPoint: null,
      windSpeed: currentOM.windSpeed10m,
      windDegree: currentOM.windDirection10m.toDouble(),
      windGust: currentOM.windGusts10m,
      cloudiness: currentOM.cloudCover.toDouble(),
      uvi: null,
      weatherDescription: null, // todo(02.08.2024):
      weatherMain: currentOM.weatherCode.desc, // todo(02.08.2024):
      weatherIcon: null, // todo(02.08.2024):
      weatherConditionCode: null, // todo(02.08.2024):
    );

    return currentWeather;
  }
}
