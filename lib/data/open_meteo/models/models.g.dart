// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CurrentWeatherOpenMeteoImpl _$$CurrentWeatherOpenMeteoImplFromJson(
        Map<String, dynamic> json) =>
    _$CurrentWeatherOpenMeteoImpl(
      time: json['time'] as String,
      interval: (json['interval'] as num?)?.toInt(),
      temperature2m: (json['temperature_2m'] as num).toDouble(),
      relativeHumidity2m: (json['relative_humidity_2m'] as num).toInt(),
      apparentTemperature: (json['apparent_temperature'] as num).toDouble(),
      isDay: (json['is_day'] as num).toInt(),
      precipitation: (json['precipitation'] as num).toInt(),
      rain: (json['rain'] as num).toInt(),
      showers: (json['showers'] as num).toInt(),
      snowfall: (json['snowfall'] as num).toInt(),
      weatherCode: (json['weather_code'] as num).toInt(),
      cloudCover: (json['cloud_cover'] as num).toInt(),
      pressureMsl: (json['pressure_msl'] as num).toDouble(),
      surfacePressure: (json['surface_pressure'] as num).toDouble(),
      windSpeed10m: (json['wind_speed_10m'] as num).toDouble(),
      windDirection10m: (json['wind_direction_10m'] as num).toInt(),
      windGusts10m: (json['wind_gusts_10m'] as num).toDouble(),
    );

Map<String, dynamic> _$$CurrentWeatherOpenMeteoImplToJson(
        _$CurrentWeatherOpenMeteoImpl instance) =>
    <String, dynamic>{
      'time': instance.time,
      'interval': instance.interval,
      'temperature_2m': instance.temperature2m,
      'relative_humidity_2m': instance.relativeHumidity2m,
      'apparent_temperature': instance.apparentTemperature,
      'is_day': instance.isDay,
      'precipitation': instance.precipitation,
      'rain': instance.rain,
      'showers': instance.showers,
      'snowfall': instance.snowfall,
      'weather_code': instance.weatherCode,
      'cloud_cover': instance.cloudCover,
      'pressure_msl': instance.pressureMsl,
      'surface_pressure': instance.surfacePressure,
      'wind_speed_10m': instance.windSpeed10m,
      'wind_direction_10m': instance.windDirection10m,
      'wind_gusts_10m': instance.windGusts10m,
    };
