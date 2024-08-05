// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_today/data/json_converters.dart';

import 'enums.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class ForecastOpenMeteoResponse with _$ForecastOpenMeteoResponse {
  @JsonSerializable(explicitToJson: true)
  const factory ForecastOpenMeteoResponse({
    /// Geographical WGS84 coordinates of the location. Multiple coordinates can
    /// be comma separated. E.g. &latitude=52.52,48.85&longitude=13.41,2.35.
    /// To return data for multiple locations the JSON output changes to a list
    /// of structures.
    @JsonKey(name: 'latitude') required double latitude,

    /// Geographical WGS84 coordinates of the location. Multiple coordinates can
    /// be comma separated. E.g. &latitude=52.52,48.85&longitude=13.41,2.35.
    /// To return data for multiple locations the JSON output changes to a list
    /// of structures.
    @JsonKey(name: 'longitude') required double longitude,

    /// Data generation time, ms
    @JsonKey(name: 'generationtime_ms') required double genTimeMs,
    @JsonKey(name: 'utc_offset_seconds') required int utcOffsetSeconds,

    /// If timezone is set, all timestamps are returned as local-time and data
    /// is returned starting at 00:00 local-time. Any time zone name from the
    /// time zone database is supported. If auto is set as a time zone, the
    /// coordinates will be automatically resolved to the local time zone.
    /// For multiple coordinates, a comma separated list of timezones can be
    /// specified.
    @JsonKey(name: 'timezone') required String timezone,
    @JsonKey(name: 'timezone_abbreviation') required String timezoneAbbr,

    /// The elevation used for statistical downscaling. Per default, a 90 meter
    /// digital elevation model is used. You can manually set the elevation to
    /// correctly match mountain peaks. If &elevation=nan is specified,
    /// downscaling will be disabled and the API uses the average grid-cell height.
    /// For multiple locations, elevation can also be comma separated.
    @JsonKey(name: 'elevation') required double elevation,

    /// A list of weather variables to get current conditions.
    @JsonKey(name: 'current') required CurrentWeatherOpenMeteo currentWeather,

    /// A list of weather variables which should be returned. Values can be comma
    /// separated, or multiple &hourly= parameter in the URL can be used.
    @protected
    @JsonKey(name: 'hourly')
    Map<String, Iterable<Object>>? hourlyWeatherMap,

    /// A list of daily weather variable aggregations which should be returned.
    /// Values can be comma separated, or multiple &daily= parameter in the URL
    /// can be used. If daily weather variables are specified, parameter timezone
    /// is required.
    @protected
    @JsonKey(name: 'daily')
    Map<String, Iterable<Object>>? dailyWeatherMap,
  }) = _ForecastOpenMeteoResponse;

  factory ForecastOpenMeteoResponse.fromJson(Map<String, Object?> json) =>
      _$ForecastOpenMeteoResponseFromJson(json);

  const ForecastOpenMeteoResponse._();

  List<HourlyWeatherOpenMeteo> get hourlyWeather => [
        for (final (index, _)
            in hourlyWeatherMap?.values.firstOrNull?.indexed ?? [].indexed)
          HourlyWeatherOpenMeteo.fromJson(
            hourlyWeatherMap!.map(
              (key, values) => MapEntry(key, values.elementAt(index)),
            ),
          ),
      ];

  List<DailyWeatherOpenMeteo> get dailyWeather => [
        for (final (index, _)
            in dailyWeatherMap?.values.firstOrNull?.indexed ?? [].indexed)
          DailyWeatherOpenMeteo.fromJson(
            dailyWeatherMap!.map(
              (key, values) => MapEntry(key, values.elementAt(index)),
            ),
          ),
      ];
}

@freezed
class CurrentWeatherOpenMeteo with _$CurrentWeatherOpenMeteo {
  @JsonSerializable(explicitToJson: true)
  const factory CurrentWeatherOpenMeteo({
    /// iso8601
    @JsonKey(name: 'time') @DateTimeISO8601Converter() required DateTime time,
    @JsonKey(name: 'interval') required int interval,
    @JsonKey(name: 'temperature_2m') required double temp2m,
    @JsonKey(name: 'relative_humidity_2m') required int relativeHumidity2m,
    @JsonKey(name: 'apparent_temperature') required double apparentTemp,

    /// 1 if the current time step has daylight, 0 at night.
    @protected @JsonKey(name: 'is_day') required int isDayInt,
    @JsonKey(name: 'precipitation') required double precipitation,
    @JsonKey(name: 'rain') required double rain,

    /// Showers from convective precipitation in millimeters from the preceding hour, mm
    ///
    /// Preceding hour sum.
    @JsonKey(name: 'showers') required double showers,
    @JsonKey(name: 'snowfall') required double snowfall,
    @JsonKey(name: 'cloud_cover') required int cloudCover,
    @JsonKey(name: 'pressure_msl') required double pressureMsl,
    @JsonKey(name: 'wind_speed_10m') required double windSpeed10m,
    @JsonKey(name: 'wind_direction_10m') required int windDirection10m,
    @JsonKey(name: 'wind_gusts_10m') required double windGusts10m,
    @JsonKey(name: 'weather_code')
    @OpenMeteoWeatherCodeConverter()
    required OpenMeteoWeatherCode weatherCode,
  }) = _CurrentWeatherOpenMeteo;

  factory CurrentWeatherOpenMeteo.fromJson(Map<String, Object?> json) =>
      _$CurrentWeatherOpenMeteoFromJson(json);

  const CurrentWeatherOpenMeteo._();

  bool get isDay => isDayInt == 1;
}

@freezed
abstract class HourlyWeatherOpenMeteo with _$HourlyWeatherOpenMeteo {
  @JsonSerializable(explicitToJson: true)
  const factory HourlyWeatherOpenMeteo({
    /// iso8601
    @JsonKey(name: 'time') @DateTimeISO8601Converter() required DateTime time,

    /// Air temperature at 2 meters above ground, °C
    @JsonKey(name: 'temperature_2m') required double temp2m,

    /// Relative humidity at 2 meters above ground, 0-100 %
    @JsonKey(name: 'relative_humidity_2m') required int relativeHumidity2m,

    /// Dew point temperature at 2 meters above ground, °C
    @JsonKey(name: 'dew_point_2m') required double dewPoint2m,

    /// Apparent temperature is the perceived feels-like temperature combining
    /// wind chill factor, relative humidity and solar radiation, °C
    @JsonKey(name: 'apparent_temperature') required double apparentTemp,

    /// 1 if the current time step has daylight, 0 at night.
    @protected @JsonKey(name: 'is_day') required int isDayInt,

    /// Probability of precipitation with more than 0.1 mm of the preceding hour.
    ///
    /// Probability is based on ensemble weather models with 0.25° (~27 km) resolution.
    /// 30 different simulations are computed to better represent future weather
    /// conditions, 0-100 %
    @JsonKey(name: 'precipitation_probability') required int pop,

    /// Total precipitation (rain, showers, snow) sum of the preceding hour, mm
    @JsonKey(name: 'precipitation') required double precipitation,

    /// Rain from large scale weather systems of the preceding hour in millimeter, mm
    @JsonKey(name: 'rain') required double rain,

    /// Showers from convective precipitation in millimeters from the preceding hour, mm
    @JsonKey(name: 'showers') required double showers,

    /// Snowfall amount of the preceding hour in centimeters (cm). For the water
    /// equivalent in millimeter, divide by 7.
    /// E.g. 7 cm snow = 10 mm precipitation water equivalent.
    @JsonKey(name: 'snowfall') required double snowfall,

    /// Cloudiness, 0-100 %
    @JsonKey(name: 'cloud_cover') required int cloudCover,

    /// Atmospheric air pressure reduced to mean sea level (msl) or pressure
    /// at surface, hPa
    ///
    /// Typically pressure on mean sea level is used in meteorology.
    @JsonKey(name: 'pressure_msl') required double pressureMsl,

    /// Viewing distance in meters (m). Influenced by low clouds, humidity and aerosols.
    /// Maximum visibility is approximately 24 km.
    @JsonKey(name: 'visibility') required double visibility,

    ///	Daily maximum in UV Index starting from 0.
    @JsonKey(name: 'uv_index') required double uvi,

    /// Wind speed at 10 meters above ground, m/s
    ///
    /// Wind speed on 10 meters is the standard level.
    @JsonKey(name: 'wind_speed_10m') required double windSpeed10m,

    /// Wind direction at 10 meters above ground, 0-360°
    @JsonKey(name: 'wind_direction_10m') required int windDirection10m,

    /// Gusts at 10 meters above ground as a maximum of the preceding hour, m/s
    @JsonKey(name: 'wind_gusts_10m') required double windGusts10m,

    /// WMO Weather interpretation codes, 0-99
    @JsonKey(name: 'weather_code')
    @OpenMeteoWeatherCodeConverter()
    required OpenMeteoWeatherCode weatherCode,
  }) = _HourlyWeatherOpenMeteo;

  factory HourlyWeatherOpenMeteo.fromJson(Map<String, dynamic> json) =>
      _$HourlyWeatherOpenMeteoFromJson(json);

  const HourlyWeatherOpenMeteo._();

  bool get isDay => isDayInt == 1;
}

@freezed
class DailyWeatherOpenMeteo with _$DailyWeatherOpenMeteo {
  const factory DailyWeatherOpenMeteo({
    /// iso8601
    @JsonKey(name: 'time') @DateTimeISO8601Converter() required DateTime time,

    /// Maximum daily air temperature at 2 meters above ground, °C
    @JsonKey(name: 'temperature_2m_max') required double temp2mMax,

    /// Minimum daily air temperature at 2 meters above ground, °C
    @JsonKey(name: 'temperature_2m_min') required double temp2mMin,

    /// Maximum daily apparent temperature, °C
    @JsonKey(name: 'apparent_temperature_max') required double apparentTempMax,

    /// Minimum daily apparent temperature, °C
    @JsonKey(name: 'apparent_temperature_min') required double apparentTempMin,

    /// Sunset time, iso8601
    @JsonKey(name: 'sunrise')
    @DateTimeISO8601Converter()
    required DateTime sunrise,

    /// Sunset time, iso8601
    @JsonKey(name: 'sunset')
    @DateTimeISO8601Converter()
    required DateTime sunset,

    /// Number of seconds of daylight per day, seconds
    @JsonKey(name: 'daylight_duration')
    @DurationSecConverter()
    required Duration daylightDur,

    ///	Daily maximum in UV Index starting from 0.
    @JsonKey(name: 'uv_index_max') required double uviMax,

    /// Sum of daily precipitation (including rain, showers and snowfall), mm
    @JsonKey(name: 'precipitation_sum') required double precipitationSum,

    /// Probability of precipitation, 0-100 %
    @JsonKey(name: 'precipitation_probability_max') required double popMax,

    /// Sum of daily rain, mm
    @JsonKey(name: 'rain_sum') required double rainSum,

    /// Sum of daily showers, mm
    @JsonKey(name: 'showers_sum') required double showersSum,

    /// Sum of daily snowfall, cm
    @JsonKey(name: 'snowfall_sum') required double snowfallSum,

    /// Maximum wind speed on a day, m/s
    @JsonKey(name: 'wind_speed_10m_max') required double windSpeed10mMax,

    /// Maximum wind gusts on a day, m/s
    @JsonKey(name: 'wind_gusts_10m_max') required double windGusts10mMax,

    /// Dominant wind direction, 0-360°
    @JsonKey(name: 'wind_direction_10m_dominant')
    required int windDirection10mDominant,

    /// WMO Weather interpretation codes, 0-99
    @JsonKey(name: 'weather_code')
    @OpenMeteoWeatherCodeConverter()
    required OpenMeteoWeatherCode weatherCode,
  }) = _DailyWeatherOpenMeteo;

  factory DailyWeatherOpenMeteo.fromJson(Map<String, dynamic> json) =>
      _$DailyWeatherOpenMeteoFromJson(json);
}
