// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeatherUnitsImpl _$$WeatherUnitsImplFromJson(Map<String, dynamic> json) =>
    _$WeatherUnitsImpl(
      temp: $enumDecodeNullable(_$TempEnumMap, json['temp']) ?? Temp.celsius,
      speed: $enumDecodeNullable(_$SpeedEnumMap, json['speed']) ?? Speed.ms,
      pressure: $enumDecodeNullable(_$PressureEnumMap, json['pressure']) ??
          Pressure.mmHg,
    );

Map<String, dynamic> _$$WeatherUnitsImplToJson(_$WeatherUnitsImpl instance) =>
    <String, dynamic>{
      'temp': _$TempEnumMap[instance.temp]!,
      'speed': _$SpeedEnumMap[instance.speed]!,
      'pressure': _$PressureEnumMap[instance.pressure]!,
    };

const _$TempEnumMap = {
  Temp.kelvin: 'kelvin',
  Temp.celsius: 'celsius',
  Temp.fahrenheit: 'fahrenheit',
};

const _$SpeedEnumMap = {
  Speed.ms: 'ms',
  Speed.mph: 'mph',
  Speed.kph: 'kph',
};

const _$PressureEnumMap = {
  Pressure.hectoPa: 'hectoPa',
  Pressure.mbar: 'mbar',
  Pressure.mmHg: 'mmHg',
  Pressure.kPa: 'kPa',
  Pressure.atm: 'atm',
  Pressure.inHg: 'inHg',
};

_$CurrentWeatherBaseImpl _$$CurrentWeatherBaseImplFromJson(
        Map<String, dynamic> json) =>
    _$CurrentWeatherBaseImpl(
      units: json['units'] == null
          ? const WeatherUnits()
          : WeatherUnits.fromJson(json['units'] as Map<String, dynamic>),
      provider: $enumDecode(_$WeatherProviderEnumMap, json['provider']),
      datetime:
          const DateTimeISO8601Converter().fromJson(json['time'] as String),
      temp: (json['temp'] as num).toDouble(),
      tempFeelsLike: (json['temp_feels_like'] as num).toDouble(),
      relativeHumidity: (json['relative_humidity'] as num).toInt(),
      cloudiness: (json['cloudiness'] as num).toInt(),
      pressureSeaLevel: (json['pressure_sea_level'] as num).toDouble(),
      pressureSurface: (json['pressure_surface'] as num).toDouble(),
      windSpeed: (json['wind_speed'] as num).toDouble(),
      windDirection: (json['wind_direction'] as num).toInt(),
      windGusts: (json['wind_gusts'] as num).toDouble(),
      weatherCode: (json['weather_code'] as num).toInt(),
    );

Map<String, dynamic> _$$CurrentWeatherBaseImplToJson(
        _$CurrentWeatherBaseImpl instance) =>
    <String, dynamic>{
      'units': instance.units.toJson(),
      'provider': _$WeatherProviderEnumMap[instance.provider]!,
      'time': const DateTimeISO8601Converter().toJson(instance.datetime),
      'temp': instance.temp,
      'temp_feels_like': instance.tempFeelsLike,
      'relative_humidity': instance.relativeHumidity,
      'cloudiness': instance.cloudiness,
      'pressure_sea_level': instance.pressureSeaLevel,
      'pressure_surface': instance.pressureSurface,
      'wind_speed': instance.windSpeed,
      'wind_direction': instance.windDirection,
      'wind_gusts': instance.windGusts,
      'weather_code': instance.weatherCode,
    };

const _$WeatherProviderEnumMap = {
  WeatherProvider.openWeatherMap: 'openWeatherMap',
  WeatherProvider.openMeteo: 'openMeteo',
};
