// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_today/data/converters.dart';

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
  }) = _ForecastOpenMeteoResponse;

  factory ForecastOpenMeteoResponse.fromJson(Map<String, Object?> json) =>
      _$ForecastOpenMeteoResponseFromJson(json);

  const ForecastOpenMeteoResponse._();
}

@freezed
class CurrentWeatherOpenMeteo with _$CurrentWeatherOpenMeteo {
  @JsonSerializable(explicitToJson: true)
  const factory CurrentWeatherOpenMeteo({
    /// iso8601
    @JsonKey(name: 'time') @DateTimeISO8601Converter() required DateTime time,
    @JsonKey(name: 'interval') required int interval,
    @JsonKey(name: 'temperature_2m') required double temperature2m,
    @JsonKey(name: 'relative_humidity_2m') required int relativeHumidity2m,
    @JsonKey(name: 'apparent_temperature') required double apparentTemperature,
    @JsonKey(name: 'is_day') required int isDay,
    @JsonKey(name: 'precipitation') required int precipitation,
    @JsonKey(name: 'rain') required int rain,
    @JsonKey(name: 'showers') required int showers,
    @JsonKey(name: 'snowfall') required int snowfall,
    @JsonKey(name: 'weather_code') required int weatherCode,
    @JsonKey(name: 'cloud_cover') required int cloudCover,
    @JsonKey(name: 'pressure_msl') required double pressureMsl,
    @JsonKey(name: 'surface_pressure') required double surfacePressure,
    @JsonKey(name: 'wind_speed_10m') required double windSpeed10m,
    @JsonKey(name: 'wind_direction_10m') required int windDirection10m,
    @JsonKey(name: 'wind_gusts_10m') required double windGusts10m,
  }) = _CurrentWeatherOpenMeteo;

  factory CurrentWeatherOpenMeteo.fromJson(Map<String, Object?> json) =>
      _$CurrentWeatherOpenMeteoFromJson(json);

  const CurrentWeatherOpenMeteo._();
}
