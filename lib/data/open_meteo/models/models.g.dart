// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ForecastOpenMeteoResponseImpl _$$ForecastOpenMeteoResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ForecastOpenMeteoResponseImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      genTimeMs: (json['generationtime_ms'] as num).toDouble(),
      utcOffsetSeconds: (json['utc_offset_seconds'] as num).toInt(),
      timezone: json['timezone'] as String,
      timezoneAbbr: json['timezone_abbreviation'] as String,
      elevation: (json['elevation'] as num).toDouble(),
      currentWeather: CurrentWeatherOpenMeteo.fromJson(
          json['current'] as Map<String, dynamic>),
      hourlyWeather: HourlyWeatherOpenMeteo.fromJson(
          json['hourly'] as Map<String, dynamic>),
      dailyWeather:
          DailyWeatherOpenMeteo.fromJson(json['daily'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ForecastOpenMeteoResponseImplToJson(
        _$ForecastOpenMeteoResponseImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'generationtime_ms': instance.genTimeMs,
      'utc_offset_seconds': instance.utcOffsetSeconds,
      'timezone': instance.timezone,
      'timezone_abbreviation': instance.timezoneAbbr,
      'elevation': instance.elevation,
      'current': instance.currentWeather.toJson(),
      'hourly': instance.hourlyWeather.toJson(),
      'daily': instance.dailyWeather.toJson(),
    };

_$CurrentWeatherOpenMeteoImpl _$$CurrentWeatherOpenMeteoImplFromJson(
        Map<String, dynamic> json) =>
    _$CurrentWeatherOpenMeteoImpl(
      time: const DateTimeISO8601Converter().fromJson(json['time'] as String),
      interval: (json['interval'] as num).toInt(),
      temp2m: (json['temperature_2m'] as num).toDouble(),
      relativeHumidity2m: (json['relative_humidity_2m'] as num).toInt(),
      apparentTemp: (json['apparent_temperature'] as num).toDouble(),
      precipitation: (json['precipitation'] as num).toDouble(),
      rain: (json['rain'] as num).toDouble(),
      showers: (json['showers'] as num).toDouble(),
      snowfall: (json['snowfall'] as num).toDouble(),
      cloudCover: (json['cloud_cover'] as num).toInt(),
      pressureMsl: (json['pressure_msl'] as num).toDouble(),
      windSpeed10m: (json['wind_speed_10m'] as num).toDouble(),
      windDirection10m: (json['wind_direction_10m'] as num).toInt(),
      windGusts10m: (json['wind_gusts_10m'] as num).toDouble(),
      weatherCode:
          $enumDecode(_$OpenMeteoWeatherCodeEnumMap, json['weather_code']),
    );

Map<String, dynamic> _$$CurrentWeatherOpenMeteoImplToJson(
        _$CurrentWeatherOpenMeteoImpl instance) =>
    <String, dynamic>{
      'time': const DateTimeISO8601Converter().toJson(instance.time),
      'interval': instance.interval,
      'temperature_2m': instance.temp2m,
      'relative_humidity_2m': instance.relativeHumidity2m,
      'apparent_temperature': instance.apparentTemp,
      'precipitation': instance.precipitation,
      'rain': instance.rain,
      'showers': instance.showers,
      'snowfall': instance.snowfall,
      'cloud_cover': instance.cloudCover,
      'pressure_msl': instance.pressureMsl,
      'wind_speed_10m': instance.windSpeed10m,
      'wind_direction_10m': instance.windDirection10m,
      'wind_gusts_10m': instance.windGusts10m,
      'weather_code': _$OpenMeteoWeatherCodeEnumMap[instance.weatherCode]!,
    };

const _$OpenMeteoWeatherCodeEnumMap = {
  OpenMeteoWeatherCode.code0: 'code0',
  OpenMeteoWeatherCode.code1: 'code1',
  OpenMeteoWeatherCode.code2: 'code2',
  OpenMeteoWeatherCode.code3: 'code3',
  OpenMeteoWeatherCode.code45: 'code45',
  OpenMeteoWeatherCode.code48: 'code48',
  OpenMeteoWeatherCode.code51: 'code51',
  OpenMeteoWeatherCode.code53: 'code53',
  OpenMeteoWeatherCode.code55: 'code55',
  OpenMeteoWeatherCode.code56: 'code56',
  OpenMeteoWeatherCode.code57: 'code57',
  OpenMeteoWeatherCode.code61: 'code61',
  OpenMeteoWeatherCode.code63: 'code63',
  OpenMeteoWeatherCode.code65: 'code65',
  OpenMeteoWeatherCode.code66: 'code66',
  OpenMeteoWeatherCode.code67: 'code67',
  OpenMeteoWeatherCode.code71: 'code71',
  OpenMeteoWeatherCode.code73: 'code73',
  OpenMeteoWeatherCode.code75: 'code75',
  OpenMeteoWeatherCode.code77: 'code77',
  OpenMeteoWeatherCode.code80: 'code80',
  OpenMeteoWeatherCode.code81: 'code81',
  OpenMeteoWeatherCode.code82: 'code82',
  OpenMeteoWeatherCode.code85: 'code85',
  OpenMeteoWeatherCode.code86: 'code86',
  OpenMeteoWeatherCode.code95: 'code95',
  OpenMeteoWeatherCode.code96: 'code96',
  OpenMeteoWeatherCode.code99: 'code99',
};

_$HourlyWeatherOpenMeteoImpl _$$HourlyWeatherOpenMeteoImplFromJson(
        Map<String, dynamic> json) =>
    _$HourlyWeatherOpenMeteoImpl(
      time: const DateTimeISO8601Converter().fromJson(json['time'] as String),
      temp2m: (json['temperature_2m'] as num).toDouble(),
      relativeHumidity2m: (json['relative_humidity_2m'] as num).toInt(),
      dewPoint2m: (json['dew_point_2m'] as num).toDouble(),
      apparentTemp: (json['apparent_temperature'] as num).toDouble(),
      pop: (json['precipitation_probability'] as num).toInt(),
      precipitation: (json['precipitation'] as num).toDouble(),
      rain: (json['rain'] as num).toDouble(),
      showers: (json['showers'] as num).toDouble(),
      snowfall: (json['snowfall'] as num).toDouble(),
      cloudCover: (json['cloud_cover'] as num).toInt(),
      pressureMsl: (json['pressure_msl'] as num).toDouble(),
      visibility: (json['visibility'] as num).toDouble(),
      uvi: (json['uv_index'] as num).toDouble(),
      windSpeed10m: (json['wind_speed_10m'] as num).toDouble(),
      windDirection10m: (json['wind_direction_10m'] as num).toInt(),
      windGusts10m: (json['wind_gusts_10m'] as num).toDouble(),
      weatherCode:
          $enumDecode(_$OpenMeteoWeatherCodeEnumMap, json['weather_code']),
    );

Map<String, dynamic> _$$HourlyWeatherOpenMeteoImplToJson(
        _$HourlyWeatherOpenMeteoImpl instance) =>
    <String, dynamic>{
      'time': const DateTimeISO8601Converter().toJson(instance.time),
      'temperature_2m': instance.temp2m,
      'relative_humidity_2m': instance.relativeHumidity2m,
      'dew_point_2m': instance.dewPoint2m,
      'apparent_temperature': instance.apparentTemp,
      'precipitation_probability': instance.pop,
      'precipitation': instance.precipitation,
      'rain': instance.rain,
      'showers': instance.showers,
      'snowfall': instance.snowfall,
      'cloud_cover': instance.cloudCover,
      'pressure_msl': instance.pressureMsl,
      'visibility': instance.visibility,
      'uv_index': instance.uvi,
      'wind_speed_10m': instance.windSpeed10m,
      'wind_direction_10m': instance.windDirection10m,
      'wind_gusts_10m': instance.windGusts10m,
      'weather_code': _$OpenMeteoWeatherCodeEnumMap[instance.weatherCode]!,
    };

_$DailyWeatherOpenMeteoImpl _$$DailyWeatherOpenMeteoImplFromJson(
        Map<String, dynamic> json) =>
    _$DailyWeatherOpenMeteoImpl(
      time: const DateTimeISO8601Converter().fromJson(json['time'] as String),
      temp2mMax: (json['temperature_2m_max'] as num).toDouble(),
      temp2mMin: (json['temperature_2m_min'] as num).toDouble(),
      apparentTempMax: (json['apparent_temperature_max'] as num).toDouble(),
      apparentTempMin: (json['apparent_temperature_min'] as num).toDouble(),
      sunrise:
          const DateTimeISO8601Converter().fromJson(json['sunrise'] as String),
      sunset:
          const DateTimeISO8601Converter().fromJson(json['sunset'] as String),
      daylightDur: const DurationSecConverter()
          .fromJson((json['daylight_duration'] as num).toInt()),
      uviMax: (json['uv_index_max'] as num).toDouble(),
      precipitationSum: (json['precipitation_sum'] as num).toDouble(),
      popMax: (json['precipitation_probability_max'] as num).toDouble(),
      rainSum: (json['rain_sum'] as num).toDouble(),
      snowfallSum: (json['snowfall_sum'] as num).toDouble(),
      windSpeed10mMax: (json['wind_speed_10m_max'] as num).toDouble(),
      windGusts10mMax: (json['wind_gusts_10m_max'] as num).toDouble(),
      windDirection10mDominant:
          (json['wind_direction_10m_dominant'] as num).toInt(),
      weatherCode:
          $enumDecode(_$OpenMeteoWeatherCodeEnumMap, json['weather_code']),
    );

Map<String, dynamic> _$$DailyWeatherOpenMeteoImplToJson(
        _$DailyWeatherOpenMeteoImpl instance) =>
    <String, dynamic>{
      'time': const DateTimeISO8601Converter().toJson(instance.time),
      'temperature_2m_max': instance.temp2mMax,
      'temperature_2m_min': instance.temp2mMin,
      'apparent_temperature_max': instance.apparentTempMax,
      'apparent_temperature_min': instance.apparentTempMin,
      'sunrise': const DateTimeISO8601Converter().toJson(instance.sunrise),
      'sunset': const DateTimeISO8601Converter().toJson(instance.sunset),
      'daylight_duration':
          const DurationSecConverter().toJson(instance.daylightDur),
      'uv_index_max': instance.uviMax,
      'precipitation_sum': instance.precipitationSum,
      'precipitation_probability_max': instance.popMax,
      'rain_sum': instance.rainSum,
      'snowfall_sum': instance.snowfallSum,
      'wind_speed_10m_max': instance.windSpeed10mMax,
      'wind_gusts_10m_max': instance.windGusts10mMax,
      'wind_direction_10m_dominant': instance.windDirection10mDominant,
      'weather_code': _$OpenMeteoWeatherCodeEnumMap[instance.weatherCode]!,
    };
