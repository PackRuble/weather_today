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
      WeatherProvider.openMeteo =>
        _convertToOnecall(await ref.watch(WeatherOpenMeteoNR.i.future)),
      WeatherProvider.openWeatherMap =>
        ref.watch(WeatherOnecallNotifier.instance.future),
    };

    return oneCall;
  }

  WeatherOneCall _convertToOnecall(ForecastOpenMeteoResponse? forecast) {
    final ForecastOpenMeteoResponse(
      currentWeather: currentOM,
      hourlyWeather: hourlyOM,
      dailyWeather: dailyOM,
    ) = forecast!;

    final oneCall = WeatherOneCall(
      {}, // корректно, поскольку мы только преобразуем в WeatherOneCall, но не сохраняем
      latitude: forecast.latitude,
      longitude: forecast.longitude,
      timezone: forecast.timezone,
      timezoneOffset: null, // todo(02.08.2024):
      current: WeatherCurrent(
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
      ),
      minutely: null, // не используем в интерфейсе
      hourly: [
        for (final hourly in hourlyOM)
          WeatherHourly(
            {}, // корректно, упоминание выше
            date: hourly.time,
            temp: hourly.temp2m,
            tempFeelsLike: hourly.apparentTemp,
            pressure: hourly.pressureMsl,
            humidity: null,
            dewPoint: hourly.dewPoint2m,
            uvi: hourly.uvi,
            cloudiness: hourly.cloudCover.toDouble(),
            visibility: hourly.visibility,
            windSpeed: hourly.windSpeed10m,
            windDegree: hourly.windDirection10m.toDouble(),
            windGust: hourly.windGusts10m,
            pop: hourly.pop * 0.01,
            rain: hourly.rain,
            snow: hourly.snowfall, // todo: скорее всего, в той модели тоже см
            weatherDescription: null, // todo(02.08.2024):
            weatherMain: hourly.weatherCode.desc, // todo(02.08.2024):
            weatherIcon: null, // todo(02.08.2024):
            weatherConditionCode: null, // todo(02.08.2024):
          ),
      ],

      daily: [
        for (final daily in dailyOM)
          WeatherDaily(
            {}, // корректно, упоминание выше
            date: daily.time,
            tempMin: daily.temp2mMin,
            tempMax: daily.temp2mMax,
            tempFeelsLikeDay: daily.apparentTempMin +
                ((daily.apparentTempMax - daily.apparentTempMin) / 2),
            pressure: null,
            humidity: null,
            dewPoint: null,
            uvi: daily.uviMax,
            cloudiness: null,
            sunrise: daily.sunrise,
            sunset: daily.sunset,
            windSpeed: daily.windSpeed10mMax,
            windDegree: daily.windDirection10mDominant.toDouble(),
            windGust: daily.windGusts10mMax,
            pop: daily.popMax * 0.01,
            rain: daily.rainSum,
            snow: daily.snowfallSum, // todo: скорее всего, в той модели тоже см
            weatherDescription: null, // todo(02.08.2024):
            weatherMain: daily.weatherCode.desc, // todo(02.08.2024):
            weatherIcon: null, // todo(02.08.2024):
            weatherConditionCode: null, // todo(02.08.2024):
          ),
      ],
      alerts: null, // open-meteo не имеет событий-оповещений
    );

    return oneCall;
  }
}
