import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/data/open_meteo/models/models.dart';
import 'package:weather_today/domain/weather/models.dart';

import 'weather/open_meteo/weather_open_meteo_nr.dart';
import 'weather/open_weather_map/weather_onecall_controller.dart';
import 'weather_provider_nr.dart';

class WeatherOnecallDelegacyNR extends AsyncNotifier<WeatherOneCall?> {
  static final i =
      AsyncNotifierProvider<WeatherOnecallDelegacyNR, WeatherOneCall?>(
    WeatherOnecallDelegacyNR.new,
    name: '$WeatherOnecallDelegacyNR',
  );

  @override
  Future<WeatherOneCall?> build() async {
    final weatherProvider = ref.watch(WeatherProviderNR.i);

    final WeatherOneCall? oneCall = await switch (weatherProvider) {
      WeatherProvider.openMeteo => _convertForecastOpenMeteoToWeatherOneCall(
          await ref.watch(WeatherOpenMeteoNR.i.future)),
      WeatherProvider.openWeatherMap =>
        ref.watch(WeatherOnecallNotifier.instance.future),
    };

    return oneCall;
  }

  WeatherOneCall _convertForecastOpenMeteoToWeatherOneCall(
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

    final oneCall = WeatherOneCall(
      {}, // todo(02.08.2024):
      latitude: forecast.latitude,
      longitude: forecast.longitude,
      timezone: forecast.timezone,
      timezoneOffset: null, // todo(02.08.2024):
      current: currentWeather,
      minutely: null, // todo(02.08.2024):
      hourly: null, // todo(02.08.2024):
      daily: null, // todo(02.08.2024):
      alerts: null, // todo(02.08.2024):
    );

    return oneCall;
  }
}
