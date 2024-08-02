// ignore_for_file: constant_identifier_names

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_today/data/converters.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class CurrentWeatherOpenMeteo with _$CurrentWeatherOpenMeteo {
  const factory CurrentWeatherOpenMeteo({
    /// iso8601
    @JsonKey(name: 'time') @DateTimeISO8601Converter() required String time,
    @JsonKey(name: 'interval') required int? interval,
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
}
