import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/data/open_meteo/models/enums.dart';
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
              weatherMain: currentOM.weatherCode.desc,
              weatherDescription: null,
              weatherIcon: convertOwmWeatherCode(currentOM.weatherCode)
                  .iconPath(currentOM.isDay),
              weatherConditionCode:
                  convertOwmWeatherCode(currentOM.weatherCode).code,
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
                  // todo: скорее всего, в той модели тоже см
                  snow: hourly.snowfall,
                  weatherDescription: null,
                  weatherMain: hourly.weatherCode.desc,
                  weatherIcon: convertOwmWeatherCode(hourly.weatherCode)
                      .iconPath(hourly.isDay),
                  weatherConditionCode:
                      convertOwmWeatherCode(hourly.weatherCode).code,
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
                  // todo: скорее всего, в той модели тоже см
                  snow: daily.snowfallSum,
                  weatherDescription: null,
                  weatherMain: daily.weatherCode.desc,
                  weatherIcon:
                      convertOwmWeatherCode(daily.weatherCode).iconPath(true),
                  weatherConditionCode:
                      convertOwmWeatherCode(daily.weatherCode).code,
                ),
            ]
          : null,
      alerts: null, // open-meteo не имеет событий-оповещений
    );

    return oneCall;
  }

  OWMWeatherCode convertOwmWeatherCode(OpenMeteoWeatherCode openMeteoCode) {
    return switch (openMeteoCode) {
      OpenMeteoWeatherCode.code0 => OWMWeatherCode.code800,
      OpenMeteoWeatherCode.code1 => OWMWeatherCode.code801,
      OpenMeteoWeatherCode.code2 => OWMWeatherCode.code802,
      OpenMeteoWeatherCode.code3 => OWMWeatherCode.code804,
      OpenMeteoWeatherCode.code45 => OWMWeatherCode.code741,
      OpenMeteoWeatherCode.code48 => OWMWeatherCode.code701,
      OpenMeteoWeatherCode.code51 => OWMWeatherCode.code300,
      OpenMeteoWeatherCode.code53 => OWMWeatherCode.code301,
      OpenMeteoWeatherCode.code55 => OWMWeatherCode.code302,
      OpenMeteoWeatherCode.code56 => OWMWeatherCode.code310,
      OpenMeteoWeatherCode.code57 => OWMWeatherCode.code312,
      OpenMeteoWeatherCode.code61 => OWMWeatherCode.code500,
      OpenMeteoWeatherCode.code63 => OWMWeatherCode.code501,
      OpenMeteoWeatherCode.code65 => OWMWeatherCode.code502,
      OpenMeteoWeatherCode.code66 => OWMWeatherCode.code511,
      OpenMeteoWeatherCode.code67 => OWMWeatherCode.code504,
      OpenMeteoWeatherCode.code71 => OWMWeatherCode.code600,
      OpenMeteoWeatherCode.code73 => OWMWeatherCode.code601,
      OpenMeteoWeatherCode.code75 => OWMWeatherCode.code602,
      OpenMeteoWeatherCode.code77 => OWMWeatherCode.code621,
      OpenMeteoWeatherCode.code80 => OWMWeatherCode.code520,
      OpenMeteoWeatherCode.code81 => OWMWeatherCode.code521,
      OpenMeteoWeatherCode.code82 => OWMWeatherCode.code522,
      OpenMeteoWeatherCode.code85 => OWMWeatherCode.code620,
      OpenMeteoWeatherCode.code86 => OWMWeatherCode.code622,
      OpenMeteoWeatherCode.code95 => OWMWeatherCode.code211,
      OpenMeteoWeatherCode.code96 => OWMWeatherCode.code200,
      OpenMeteoWeatherCode.code99 => OWMWeatherCode.code202,
    };
  }
}

// fixdep(03.08.2024): [Create an enumeration of weather icons · Issue #20 · PackRuble/weather_pack](https://github.com/PackRuble/weather_pack/issues/20)
//
/// OWM weather conditions.
enum OWMWeatherCode {
  code200(200, 'Thunderstorm with light rain'),
  code201(201, 'Thunderstorm with rain'),
  code202(202, 'Thunderstorm with heavy rain'),
  code210(210, 'Light thunderstorm'),
  code211(211, 'Thunderstorm'),
  code212(212, 'Heavy thunderstorm'),
  code221(221, 'Ragged thunderstorm'),
  code230(230, 'Thunderstorm with light drizzle'),
  code231(231, 'Thunderstorm with drizzle'),
  code232(232, 'Thunderstorm with heavy drizzle'),
  code300(300, 'Light intensity drizzle'),
  code301(301, 'Drizzle'),
  code302(302, 'Heavy intensity drizzle'),
  code310(310, 'Light intensity drizzle rain'),
  code311(311, 'Drizzle rain'),
  code312(312, 'Heavy intensity drizzle rain'),
  code313(313, 'Shower rain and drizzle'),
  code314(314, 'Heavy shower rain and drizzle'),
  code321(321, 'Shower drizzle'),
  code500(500, 'Light rain'),
  code501(501, 'Moderate rain'),
  code502(502, 'Heavy intensity rain'),
  code503(503, 'Very heavy rain'),
  code504(504, 'Extreme rain'),
  code511(511, 'Freezing rain'),
  code520(520, 'Light intensity shower rain'),
  code521(521, 'Shower rain'),
  code522(522, 'Heavy intensity shower rain'),
  code531(531, 'Ragged shower rain'),
  code600(600, 'Light snow'),
  code601(601, 'Snow'),
  code602(602, 'Heavy snow'),
  code611(611, 'Sleet'),
  code612(612, 'Light shower sleet'),
  code613(613, 'Shower sleet'),
  code615(615, 'Light rain and snow'),
  code616(616, 'Rain and snow'),
  code620(620, 'Light shower snow'),
  code621(621, 'Shower snow'),
  code622(622, 'Heavy shower snow'),
  code701(701, 'Mist'),
  code711(711, 'Smoke'),
  code721(721, 'Haze'),
  code731(731, 'Sand/dust whirls'),
  code741(741, 'Fog'),
  code751(751, 'Sand'),
  code761(761, 'Dust'),
  code762(762, 'Volcanic ash'),
  code771(771, 'Squalls'),
  code781(781, 'Tornado'),
  code800(800, 'Clear sky'),
  code801(801, 'Few clouds: 11-25%'),
  code802(802, 'Scattered clouds: 25-50%'),
  code803(803, 'Broken clouds: 51-84%'),
  code804(804, 'Overcast clouds: 85-100%'),
  ;

  const OWMWeatherCode(this.code, this.desc);

  /// 200-804.
  final int code;

  /// Main description.
  final String desc;

  String iconPath(bool isDay) =>
      switch (this) {
        code200 ||
        code201 ||
        code202 ||
        code210 ||
        code211 ||
        code212 ||
        code221 ||
        code230 ||
        code231 ||
        code232 =>
          '11',
        code300 ||
        code301 ||
        code302 ||
        code310 ||
        code311 ||
        code312 ||
        code313 ||
        code314 ||
        code321 =>
          '09',
        code500 || code501 || code502 || code503 || code504 => '10',
        code511 => '13',
        code520 || code521 || code522 || code531 => '09',
        code600 ||
        code601 ||
        code602 ||
        code611 ||
        code612 ||
        code613 ||
        code615 ||
        code616 ||
        code620 ||
        code621 ||
        code622 =>
          '13',
        code701 ||
        code711 ||
        code721 ||
        code731 ||
        code761 ||
        code741 ||
        code751 ||
        code762 ||
        code771 ||
        code781 =>
          '50',
        code800 => '01',
        code801 => '02',
        code802 => '03',
        code803 || code804 => '04',
      } +
      (isDay ? 'd' : 'n');

  /// Short description.
  String get shortDesc => switch (this) {
        code200 ||
        code201 ||
        code202 ||
        code210 ||
        code211 ||
        code212 ||
        code221 ||
        code230 ||
        code231 ||
        code232 =>
          'Thunderstorm',
        code300 ||
        code301 ||
        code302 ||
        code310 ||
        code311 ||
        code312 ||
        code313 ||
        code314 ||
        code321 =>
          'Drizzle',
        code500 ||
        code501 ||
        code502 ||
        code503 ||
        code504 ||
        code511 ||
        code520 ||
        code521 ||
        code522 ||
        code531 =>
          'Rain',
        code600 ||
        code601 ||
        code602 ||
        code611 ||
        code612 ||
        code613 ||
        code615 ||
        code616 ||
        code620 ||
        code621 ||
        code622 =>
          'Snow',
        code701 => 'Mist',
        code711 => 'Smoke',
        code721 => 'Haze',
        code731 || code761 => 'Dust',
        code741 => 'Fog',
        code751 => 'Sand',
        code762 => 'Ash',
        code771 => 'Squall',
        code781 => 'Tornado',
        code800 => 'Clear',
        code801 || code802 || code803 || code804 => 'Clouds',
      };

  static OWMWeatherCode byCode(int code) =>
      values.firstWhere((e) => e.code == code);
}
