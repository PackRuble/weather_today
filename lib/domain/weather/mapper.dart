import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/data/open_meteo/models/models.dart';

extension ForecastOpenMeteoResponseX on ForecastOpenMeteoResponse {
  WeatherOneCall convertToOneCall({
    bool current = true,
    bool hourly = true,
    bool daily = true,
    Duration limitHourly = const Duration(days: 3),
  }) {
    final ForecastOpenMeteoResponse(
      currentWeather: currentOM,
      hourlyWeather: hourlyOM,
      dailyWeather: dailyOM,
    ) = this;

    final oneCall = WeatherOneCall(
      {}, // корректно, поскольку мы только преобразуем в WeatherOneCall, но не сохраняем
      latitude: latitude,
      longitude: longitude,
      timezone: timezone,
      // fixdep(03.08.2024): [Fix `WeatherOneCall.timezoneOffset` should has type `Duration` · Issue #19 · PackRuble/weather_pack](https://github.com/PackRuble/weather_pack/issues/19)
      timezoneOffset: null,
      current: current
          ? WeatherCurrent(
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
            )
          : null,
      minutely: null, // не используем в интерфейсе
      hourly: hourly
          ? [
              for (final hourly in hourlyOM.sublist(0, limitHourly.inHours + 1))
                WeatherHourly(
                  {}, // корректно, упоминание выше
                  date: hourly.time,
                  temp: hourly.temp2m,
                  tempFeelsLike: hourly.apparentTemp,
                  pressure: hourly.pressureMsl,
                  humidity: hourly.relativeHumidity2m.toDouble(),
                  dewPoint: hourly.dewPoint2m,
                  uvi: hourly.uvi,
                  cloudiness: hourly.cloudCover.toDouble(),
                  visibility: hourly.visibility,
                  windSpeed: hourly.windSpeed10m,
                  windDegree: hourly.windDirection10m.toDouble(),
                  windGust: hourly.windGusts10m,
                  pop: hourly.pop * 0.01,
                  rain: hourly.rain,
                  snow: hourly
                      .snowfall, // todo: скорее всего, в той модели тоже см
                  weatherDescription: null, // todo(02.08.2024):
                  weatherMain: hourly.weatherCode.desc, // todo(02.08.2024):
                  weatherIcon: null, // todo(02.08.2024):
                  weatherConditionCode: null, // todo(02.08.2024):
                ),
            ]
          : null,
      daily: daily
          ? [
              for (final daily in dailyOM)
                WeatherDaily(
                  {}, // корректно, упоминание выше
                  date: daily.time,
                  moonPhase: null,
                  moonrise: null,
                  moonset: null,
                  summary: null,
                  tempDay: null,
                  tempEvening: null,
                  tempFeelsLikeEvening: null,
                  tempFeelsLikeMorning: null,
                  tempFeelsLikeNight: null,
                  tempMorning: null,
                  tempNight: null,
                  tempMin: daily.temp2mMin,
                  tempMax: daily.temp2mMax,
                  tempFeelsLikeDay: null,
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
                  snow: daily
                      .snowfallSum, // todo: скорее всего, в той модели тоже см
                  weatherDescription: null, // todo(02.08.2024):
                  weatherMain: daily.weatherCode.desc, // todo(02.08.2024):
                  weatherIcon: null, // todo(02.08.2024):
                  weatherConditionCode: null, // todo(02.08.2024):
                ),
            ]
          : null,
      alerts: null, // open-meteo не имеет событий-оповещений
    );

    return oneCall;
  }
}
