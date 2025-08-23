// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ForecastOpenMeteoResponse _$ForecastOpenMeteoResponseFromJson(Map<String, dynamic> json) =>
    _ForecastOpenMeteoResponse(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      genTimeMs: (json['generationtime_ms'] as num).toDouble(),
      utcOffsetSeconds: (json['utc_offset_seconds'] as num).toInt(),
      timezone: json['timezone'] as String,
      timezoneAbbr: json['timezone_abbreviation'] as String,
      elevation: (json['elevation'] as num).toDouble(),
      currentWeather: CurrentWeatherOpenMeteo.fromJson(json['current'] as Map<String, dynamic>),
      hourlyWeatherMap: (json['hourly'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as List<dynamic>).map((e) => e as Object)),
      ),
      dailyWeatherMap: (json['daily'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, (e as List<dynamic>).map((e) => e as Object)),
      ),
    );

Map<String, dynamic> _$ForecastOpenMeteoResponseToJson(_ForecastOpenMeteoResponse instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'generationtime_ms': instance.genTimeMs,
      'utc_offset_seconds': instance.utcOffsetSeconds,
      'timezone': instance.timezone,
      'timezone_abbreviation': instance.timezoneAbbr,
      'elevation': instance.elevation,
      'current': instance.currentWeather.toJson(),
      'hourly': instance.hourlyWeatherMap?.map((k, e) => MapEntry(k, e.toList())),
      'daily': instance.dailyWeatherMap?.map((k, e) => MapEntry(k, e.toList())),
    };

_CurrentWeatherOpenMeteo _$CurrentWeatherOpenMeteoFromJson(Map<String, dynamic> json) =>
    _CurrentWeatherOpenMeteo(
      time: const DateTimeISO8601Converter().fromJson(json['time'] as String),
      interval: (json['interval'] as num).toInt(),
      temp2m: (json['temperature_2m'] as num).toDouble(),
      relativeHumidity2m: (json['relative_humidity_2m'] as num).toInt(),
      apparentTemp: (json['apparent_temperature'] as num).toDouble(),
      isDayInt: (json['is_day'] as num).toInt(),
      precipitation: (json['precipitation'] as num).toDouble(),
      rain: (json['rain'] as num).toDouble(),
      showers: (json['showers'] as num).toDouble(),
      snowfall: (json['snowfall'] as num).toDouble(),
      cloudCover: (json['cloud_cover'] as num).toInt(),
      pressureMsl: (json['pressure_msl'] as num).toDouble(),
      windSpeed10m: (json['wind_speed_10m'] as num).toDouble(),
      windDirection10m: (json['wind_direction_10m'] as num).toInt(),
      windGusts10m: (json['wind_gusts_10m'] as num).toDouble(),
      weatherCode: const OpenMeteoWeatherCodeConverter().fromJson(
        (json['weather_code'] as num).toInt(),
      ),
    );

Map<String, dynamic> _$CurrentWeatherOpenMeteoToJson(_CurrentWeatherOpenMeteo instance) =>
    <String, dynamic>{
      'time': const DateTimeISO8601Converter().toJson(instance.time),
      'interval': instance.interval,
      'temperature_2m': instance.temp2m,
      'relative_humidity_2m': instance.relativeHumidity2m,
      'apparent_temperature': instance.apparentTemp,
      'is_day': instance.isDayInt,
      'precipitation': instance.precipitation,
      'rain': instance.rain,
      'showers': instance.showers,
      'snowfall': instance.snowfall,
      'cloud_cover': instance.cloudCover,
      'pressure_msl': instance.pressureMsl,
      'wind_speed_10m': instance.windSpeed10m,
      'wind_direction_10m': instance.windDirection10m,
      'wind_gusts_10m': instance.windGusts10m,
      'weather_code': const OpenMeteoWeatherCodeConverter().toJson(instance.weatherCode),
    };

_HourlyWeatherOpenMeteo _$HourlyWeatherOpenMeteoFromJson(Map<String, dynamic> json) =>
    _HourlyWeatherOpenMeteo(
      time: const DateTimeISO8601Converter().fromJson(json['time'] as String),
      temp2m: (json['temperature_2m'] as num).toDouble(),
      relativeHumidity2m: (json['relative_humidity_2m'] as num).toInt(),
      dewPoint2m: (json['dew_point_2m'] as num).toDouble(),
      apparentTemp: (json['apparent_temperature'] as num).toDouble(),
      isDayInt: (json['is_day'] as num).toInt(),
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
      weatherCode: const OpenMeteoWeatherCodeConverter().fromJson(
        (json['weather_code'] as num).toInt(),
      ),
    );

Map<String, dynamic> _$HourlyWeatherOpenMeteoToJson(_HourlyWeatherOpenMeteo instance) =>
    <String, dynamic>{
      'time': const DateTimeISO8601Converter().toJson(instance.time),
      'temperature_2m': instance.temp2m,
      'relative_humidity_2m': instance.relativeHumidity2m,
      'dew_point_2m': instance.dewPoint2m,
      'apparent_temperature': instance.apparentTemp,
      'is_day': instance.isDayInt,
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
      'weather_code': const OpenMeteoWeatherCodeConverter().toJson(instance.weatherCode),
    };

_DailyWeatherOpenMeteo _$DailyWeatherOpenMeteoFromJson(Map<String, dynamic> json) =>
    _DailyWeatherOpenMeteo(
      time: const DateTimeISO8601Converter().fromJson(json['time'] as String),
      temp2mMax: (json['temperature_2m_max'] as num).toDouble(),
      temp2mMin: (json['temperature_2m_min'] as num).toDouble(),
      apparentTempMax: (json['apparent_temperature_max'] as num).toDouble(),
      apparentTempMin: (json['apparent_temperature_min'] as num).toDouble(),
      sunrise: const DateTimeISO8601Converter().fromJson(json['sunrise'] as String),
      sunset: const DateTimeISO8601Converter().fromJson(json['sunset'] as String),
      daylightDur: const DurationSecConverter().fromJson(
        (json['daylight_duration'] as num).toInt(),
      ),
      uviMax: (json['uv_index_max'] as num).toDouble(),
      precipitationSum: (json['precipitation_sum'] as num).toDouble(),
      popMax: (json['precipitation_probability_max'] as num).toDouble(),
      rainSum: (json['rain_sum'] as num).toDouble(),
      showersSum: (json['showers_sum'] as num).toDouble(),
      snowfallSum: (json['snowfall_sum'] as num).toDouble(),
      windSpeed10mMax: (json['wind_speed_10m_max'] as num).toDouble(),
      windGusts10mMax: (json['wind_gusts_10m_max'] as num).toDouble(),
      windDirection10mDominant: (json['wind_direction_10m_dominant'] as num).toInt(),
      weatherCode: const OpenMeteoWeatherCodeConverter().fromJson(
        (json['weather_code'] as num).toInt(),
      ),
    );

Map<String, dynamic> _$DailyWeatherOpenMeteoToJson(_DailyWeatherOpenMeteo instance) =>
    <String, dynamic>{
      'time': const DateTimeISO8601Converter().toJson(instance.time),
      'temperature_2m_max': instance.temp2mMax,
      'temperature_2m_min': instance.temp2mMin,
      'apparent_temperature_max': instance.apparentTempMax,
      'apparent_temperature_min': instance.apparentTempMin,
      'sunrise': const DateTimeISO8601Converter().toJson(instance.sunrise),
      'sunset': const DateTimeISO8601Converter().toJson(instance.sunset),
      'daylight_duration': const DurationSecConverter().toJson(instance.daylightDur),
      'uv_index_max': instance.uviMax,
      'precipitation_sum': instance.precipitationSum,
      'precipitation_probability_max': instance.popMax,
      'rain_sum': instance.rainSum,
      'showers_sum': instance.showersSum,
      'snowfall_sum': instance.snowfallSum,
      'wind_speed_10m_max': instance.windSpeed10mMax,
      'wind_gusts_10m_max': instance.windGusts10mMax,
      'wind_direction_10m_dominant': instance.windDirection10mDominant,
      'weather_code': const OpenMeteoWeatherCodeConverter().toJson(instance.weatherCode),
    };

_OpenMeteoPlace _$OpenMeteoPlaceFromJson(Map<String, dynamic> json) => _OpenMeteoPlace(
  id: (json['id'] as num).toInt(),
  name: json['name'] as String,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
  elevation: (json['elevation'] as num).toDouble(),
  featureCode: json['feature_code'] as String,
  countryCode: json['country_code'] as String,
  admin1Id: (json['admin1_id'] as num?)?.toInt(),
  admin2Id: (json['admin2_id'] as num?)?.toInt(),
  admin3Id: (json['admin3_id'] as num?)?.toInt(),
  admin4Id: (json['admin4_id'] as num?)?.toInt(),
  timezone: json['timezone'] as String,
  population: (json['population'] as num?)?.toInt(),
  postcodes: (json['postcodes'] as List<dynamic>?)?.map((e) => e as String).toList() ?? const [],
  countryID: (json['country_id'] as num).toInt(),
  country: json['country'] as String,
  admin1: json['admin1'] as String?,
  admin2: json['admin2'] as String?,
  admin3: json['admin3'] as String?,
  admin4: json['admin4'] as String?,
);

Map<String, dynamic> _$OpenMeteoPlaceToJson(_OpenMeteoPlace instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
  'elevation': instance.elevation,
  'feature_code': instance.featureCode,
  'country_code': instance.countryCode,
  'admin1_id': instance.admin1Id,
  'admin2_id': instance.admin2Id,
  'admin3_id': instance.admin3Id,
  'admin4_id': instance.admin4Id,
  'timezone': instance.timezone,
  'population': instance.population,
  'postcodes': instance.postcodes,
  'country_id': instance.countryID,
  'country': instance.country,
  'admin1': instance.admin1,
  'admin2': instance.admin2,
  'admin3': instance.admin3,
  'admin4': instance.admin4,
};
