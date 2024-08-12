// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeatherUnits _$WeatherUnitsFromJson(Map<String, dynamic> json) {
  return _WeatherUnits.fromJson(json);
}

/// @nodoc
mixin _$WeatherUnits {
  @JsonKey(name: 'temp')
  Temp get temp => throw _privateConstructorUsedError;
  @JsonKey(name: 'speed')
  Speed get speed => throw _privateConstructorUsedError;
  @JsonKey(name: 'pressure')
  Pressure get pressure => throw _privateConstructorUsedError;

  /// Serializes this WeatherUnits to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeatherUnits
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeatherUnitsCopyWith<WeatherUnits> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherUnitsCopyWith<$Res> {
  factory $WeatherUnitsCopyWith(
          WeatherUnits value, $Res Function(WeatherUnits) then) =
      _$WeatherUnitsCopyWithImpl<$Res, WeatherUnits>;
  @useResult
  $Res call(
      {@JsonKey(name: 'temp') Temp temp,
      @JsonKey(name: 'speed') Speed speed,
      @JsonKey(name: 'pressure') Pressure pressure});
}

/// @nodoc
class _$WeatherUnitsCopyWithImpl<$Res, $Val extends WeatherUnits>
    implements $WeatherUnitsCopyWith<$Res> {
  _$WeatherUnitsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeatherUnits
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
    Object? speed = null,
    Object? pressure = null,
  }) {
    return _then(_value.copyWith(
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as Temp,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as Speed,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as Pressure,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeatherUnitsImplCopyWith<$Res>
    implements $WeatherUnitsCopyWith<$Res> {
  factory _$$WeatherUnitsImplCopyWith(
          _$WeatherUnitsImpl value, $Res Function(_$WeatherUnitsImpl) then) =
      __$$WeatherUnitsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'temp') Temp temp,
      @JsonKey(name: 'speed') Speed speed,
      @JsonKey(name: 'pressure') Pressure pressure});
}

/// @nodoc
class __$$WeatherUnitsImplCopyWithImpl<$Res>
    extends _$WeatherUnitsCopyWithImpl<$Res, _$WeatherUnitsImpl>
    implements _$$WeatherUnitsImplCopyWith<$Res> {
  __$$WeatherUnitsImplCopyWithImpl(
      _$WeatherUnitsImpl _value, $Res Function(_$WeatherUnitsImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeatherUnits
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? temp = null,
    Object? speed = null,
    Object? pressure = null,
  }) {
    return _then(_$WeatherUnitsImpl(
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as Temp,
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as Speed,
      pressure: null == pressure
          ? _value.pressure
          : pressure // ignore: cast_nullable_to_non_nullable
              as Pressure,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$WeatherUnitsImpl implements _WeatherUnits {
  const _$WeatherUnitsImpl(
      {@JsonKey(name: 'temp') this.temp = Temp.celsius,
      @JsonKey(name: 'speed') this.speed = Speed.ms,
      @JsonKey(name: 'pressure') this.pressure = Pressure.mmHg});

  factory _$WeatherUnitsImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeatherUnitsImplFromJson(json);

  @override
  @JsonKey(name: 'temp')
  final Temp temp;
  @override
  @JsonKey(name: 'speed')
  final Speed speed;
  @override
  @JsonKey(name: 'pressure')
  final Pressure pressure;

  @override
  String toString() {
    return 'WeatherUnits(temp: $temp, speed: $speed, pressure: $pressure)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeatherUnitsImpl &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.pressure, pressure) ||
                other.pressure == pressure));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, temp, speed, pressure);

  /// Create a copy of WeatherUnits
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeatherUnitsImplCopyWith<_$WeatherUnitsImpl> get copyWith =>
      __$$WeatherUnitsImplCopyWithImpl<_$WeatherUnitsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeatherUnitsImplToJson(
      this,
    );
  }
}

abstract class _WeatherUnits implements WeatherUnits {
  const factory _WeatherUnits(
      {@JsonKey(name: 'temp') final Temp temp,
      @JsonKey(name: 'speed') final Speed speed,
      @JsonKey(name: 'pressure') final Pressure pressure}) = _$WeatherUnitsImpl;

  factory _WeatherUnits.fromJson(Map<String, dynamic> json) =
      _$WeatherUnitsImpl.fromJson;

  @override
  @JsonKey(name: 'temp')
  Temp get temp;
  @override
  @JsonKey(name: 'speed')
  Speed get speed;
  @override
  @JsonKey(name: 'pressure')
  Pressure get pressure;

  /// Create a copy of WeatherUnits
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeatherUnitsImplCopyWith<_$WeatherUnitsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CurrentWeatherBase _$CurrentWeatherBaseFromJson(Map<String, dynamic> json) {
  return _CurrentWeatherBase.fromJson(json);
}

/// @nodoc
mixin _$CurrentWeatherBase {
  /// Units of measurement for the parameters of this weather object.
  @JsonKey(name: 'units')
  WeatherUnits get units => throw _privateConstructorUsedError;

  /// Weather provider.
  @JsonKey(name: 'provider')
  WeatherProvider get provider => throw _privateConstructorUsedError; //
// /// Additional data specific to the provider.
// @JsonKey(name: 'weather_extra') required WeatherExtra extra,
  ///
  @JsonKey(name: 'time')
  @DateTimeISO8601Converter()
  DateTime get datetime => throw _privateConstructorUsedError;

  /// Temperature now.
  @JsonKey(name: 'temp')
  double get temp => throw _privateConstructorUsedError;

  /// This Temperature parameter accounts for the human perception of weather.
  @JsonKey(name: 'temp_feels_like')
  double get tempFeelsLike => throw _privateConstructorUsedError;

  /// Relative humidity, %
  @JsonKey(name: 'relative_humidity')
  int get relativeHumidity => throw _privateConstructorUsedError;

  /// Is Day or Night
// @JsonKey(name: 'is_day') required int isDay,
// @JsonKey(name: 'precipitation') required int precipitation,
// @JsonKey(name: 'rain') required int rain,
// @JsonKey(name: 'showers') required int showers,
// @JsonKey(name: 'snowfall') required int snowfall,
  /// Cloud cover, %
  @JsonKey(name: 'cloudiness')
  int get cloudiness => throw _privateConstructorUsedError;

  /// Sea level pressure, %
  @JsonKey(name: 'pressure_sea_level')
  double get pressureSeaLevel => throw _privateConstructorUsedError;

  /// Surface pressure, %
  @JsonKey(name: 'pressure_surface')
  double get pressureSurface => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_speed')
  double get windSpeed => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_direction')
  int get windDirection => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_gusts')
  double get windGusts => throw _privateConstructorUsedError;
  @JsonKey(name: 'weather_code')
  int get weatherCode => throw _privateConstructorUsedError;

  /// Serializes this CurrentWeatherBase to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurrentWeatherBase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrentWeatherBaseCopyWith<CurrentWeatherBase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentWeatherBaseCopyWith<$Res> {
  factory $CurrentWeatherBaseCopyWith(
          CurrentWeatherBase value, $Res Function(CurrentWeatherBase) then) =
      _$CurrentWeatherBaseCopyWithImpl<$Res, CurrentWeatherBase>;
  @useResult
  $Res call(
      {@JsonKey(name: 'units') WeatherUnits units,
      @JsonKey(name: 'provider') WeatherProvider provider,
      @JsonKey(name: 'time') @DateTimeISO8601Converter() DateTime datetime,
      @JsonKey(name: 'temp') double temp,
      @JsonKey(name: 'temp_feels_like') double tempFeelsLike,
      @JsonKey(name: 'relative_humidity') int relativeHumidity,
      @JsonKey(name: 'cloudiness') int cloudiness,
      @JsonKey(name: 'pressure_sea_level') double pressureSeaLevel,
      @JsonKey(name: 'pressure_surface') double pressureSurface,
      @JsonKey(name: 'wind_speed') double windSpeed,
      @JsonKey(name: 'wind_direction') int windDirection,
      @JsonKey(name: 'wind_gusts') double windGusts,
      @JsonKey(name: 'weather_code') int weatherCode});

  $WeatherUnitsCopyWith<$Res> get units;
}

/// @nodoc
class _$CurrentWeatherBaseCopyWithImpl<$Res, $Val extends CurrentWeatherBase>
    implements $CurrentWeatherBaseCopyWith<$Res> {
  _$CurrentWeatherBaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrentWeatherBase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? units = null,
    Object? provider = null,
    Object? datetime = null,
    Object? temp = null,
    Object? tempFeelsLike = null,
    Object? relativeHumidity = null,
    Object? cloudiness = null,
    Object? pressureSeaLevel = null,
    Object? pressureSurface = null,
    Object? windSpeed = null,
    Object? windDirection = null,
    Object? windGusts = null,
    Object? weatherCode = null,
  }) {
    return _then(_value.copyWith(
      units: null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as WeatherUnits,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as WeatherProvider,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double,
      tempFeelsLike: null == tempFeelsLike
          ? _value.tempFeelsLike
          : tempFeelsLike // ignore: cast_nullable_to_non_nullable
              as double,
      relativeHumidity: null == relativeHumidity
          ? _value.relativeHumidity
          : relativeHumidity // ignore: cast_nullable_to_non_nullable
              as int,
      cloudiness: null == cloudiness
          ? _value.cloudiness
          : cloudiness // ignore: cast_nullable_to_non_nullable
              as int,
      pressureSeaLevel: null == pressureSeaLevel
          ? _value.pressureSeaLevel
          : pressureSeaLevel // ignore: cast_nullable_to_non_nullable
              as double,
      pressureSurface: null == pressureSurface
          ? _value.pressureSurface
          : pressureSurface // ignore: cast_nullable_to_non_nullable
              as double,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      windDirection: null == windDirection
          ? _value.windDirection
          : windDirection // ignore: cast_nullable_to_non_nullable
              as int,
      windGusts: null == windGusts
          ? _value.windGusts
          : windGusts // ignore: cast_nullable_to_non_nullable
              as double,
      weatherCode: null == weatherCode
          ? _value.weatherCode
          : weatherCode // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of CurrentWeatherBase
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WeatherUnitsCopyWith<$Res> get units {
    return $WeatherUnitsCopyWith<$Res>(_value.units, (value) {
      return _then(_value.copyWith(units: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$CurrentWeatherBaseImplCopyWith<$Res>
    implements $CurrentWeatherBaseCopyWith<$Res> {
  factory _$$CurrentWeatherBaseImplCopyWith(_$CurrentWeatherBaseImpl value,
          $Res Function(_$CurrentWeatherBaseImpl) then) =
      __$$CurrentWeatherBaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'units') WeatherUnits units,
      @JsonKey(name: 'provider') WeatherProvider provider,
      @JsonKey(name: 'time') @DateTimeISO8601Converter() DateTime datetime,
      @JsonKey(name: 'temp') double temp,
      @JsonKey(name: 'temp_feels_like') double tempFeelsLike,
      @JsonKey(name: 'relative_humidity') int relativeHumidity,
      @JsonKey(name: 'cloudiness') int cloudiness,
      @JsonKey(name: 'pressure_sea_level') double pressureSeaLevel,
      @JsonKey(name: 'pressure_surface') double pressureSurface,
      @JsonKey(name: 'wind_speed') double windSpeed,
      @JsonKey(name: 'wind_direction') int windDirection,
      @JsonKey(name: 'wind_gusts') double windGusts,
      @JsonKey(name: 'weather_code') int weatherCode});

  @override
  $WeatherUnitsCopyWith<$Res> get units;
}

/// @nodoc
class __$$CurrentWeatherBaseImplCopyWithImpl<$Res>
    extends _$CurrentWeatherBaseCopyWithImpl<$Res, _$CurrentWeatherBaseImpl>
    implements _$$CurrentWeatherBaseImplCopyWith<$Res> {
  __$$CurrentWeatherBaseImplCopyWithImpl(_$CurrentWeatherBaseImpl _value,
      $Res Function(_$CurrentWeatherBaseImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrentWeatherBase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? units = null,
    Object? provider = null,
    Object? datetime = null,
    Object? temp = null,
    Object? tempFeelsLike = null,
    Object? relativeHumidity = null,
    Object? cloudiness = null,
    Object? pressureSeaLevel = null,
    Object? pressureSurface = null,
    Object? windSpeed = null,
    Object? windDirection = null,
    Object? windGusts = null,
    Object? weatherCode = null,
  }) {
    return _then(_$CurrentWeatherBaseImpl(
      units: null == units
          ? _value.units
          : units // ignore: cast_nullable_to_non_nullable
              as WeatherUnits,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as WeatherProvider,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temp: null == temp
          ? _value.temp
          : temp // ignore: cast_nullable_to_non_nullable
              as double,
      tempFeelsLike: null == tempFeelsLike
          ? _value.tempFeelsLike
          : tempFeelsLike // ignore: cast_nullable_to_non_nullable
              as double,
      relativeHumidity: null == relativeHumidity
          ? _value.relativeHumidity
          : relativeHumidity // ignore: cast_nullable_to_non_nullable
              as int,
      cloudiness: null == cloudiness
          ? _value.cloudiness
          : cloudiness // ignore: cast_nullable_to_non_nullable
              as int,
      pressureSeaLevel: null == pressureSeaLevel
          ? _value.pressureSeaLevel
          : pressureSeaLevel // ignore: cast_nullable_to_non_nullable
              as double,
      pressureSurface: null == pressureSurface
          ? _value.pressureSurface
          : pressureSurface // ignore: cast_nullable_to_non_nullable
              as double,
      windSpeed: null == windSpeed
          ? _value.windSpeed
          : windSpeed // ignore: cast_nullable_to_non_nullable
              as double,
      windDirection: null == windDirection
          ? _value.windDirection
          : windDirection // ignore: cast_nullable_to_non_nullable
              as int,
      windGusts: null == windGusts
          ? _value.windGusts
          : windGusts // ignore: cast_nullable_to_non_nullable
              as double,
      weatherCode: null == weatherCode
          ? _value.weatherCode
          : weatherCode // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CurrentWeatherBaseImpl extends _CurrentWeatherBase {
  const _$CurrentWeatherBaseImpl(
      {@JsonKey(name: 'units') this.units = const WeatherUnits(),
      @JsonKey(name: 'provider') required this.provider,
      @JsonKey(name: 'time') @DateTimeISO8601Converter() required this.datetime,
      @JsonKey(name: 'temp') required this.temp,
      @JsonKey(name: 'temp_feels_like') required this.tempFeelsLike,
      @JsonKey(name: 'relative_humidity') required this.relativeHumidity,
      @JsonKey(name: 'cloudiness') required this.cloudiness,
      @JsonKey(name: 'pressure_sea_level') required this.pressureSeaLevel,
      @JsonKey(name: 'pressure_surface') required this.pressureSurface,
      @JsonKey(name: 'wind_speed') required this.windSpeed,
      @JsonKey(name: 'wind_direction') required this.windDirection,
      @JsonKey(name: 'wind_gusts') required this.windGusts,
      @JsonKey(name: 'weather_code') required this.weatherCode})
      : super._();

  factory _$CurrentWeatherBaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrentWeatherBaseImplFromJson(json);

  /// Units of measurement for the parameters of this weather object.
  @override
  @JsonKey(name: 'units')
  final WeatherUnits units;

  /// Weather provider.
  @override
  @JsonKey(name: 'provider')
  final WeatherProvider provider;
//
// /// Additional data specific to the provider.
// @JsonKey(name: 'weather_extra') required WeatherExtra extra,
  ///
  @override
  @JsonKey(name: 'time')
  @DateTimeISO8601Converter()
  final DateTime datetime;

  /// Temperature now.
  @override
  @JsonKey(name: 'temp')
  final double temp;

  /// This Temperature parameter accounts for the human perception of weather.
  @override
  @JsonKey(name: 'temp_feels_like')
  final double tempFeelsLike;

  /// Relative humidity, %
  @override
  @JsonKey(name: 'relative_humidity')
  final int relativeHumidity;

  /// Is Day or Night
// @JsonKey(name: 'is_day') required int isDay,
// @JsonKey(name: 'precipitation') required int precipitation,
// @JsonKey(name: 'rain') required int rain,
// @JsonKey(name: 'showers') required int showers,
// @JsonKey(name: 'snowfall') required int snowfall,
  /// Cloud cover, %
  @override
  @JsonKey(name: 'cloudiness')
  final int cloudiness;

  /// Sea level pressure, %
  @override
  @JsonKey(name: 'pressure_sea_level')
  final double pressureSeaLevel;

  /// Surface pressure, %
  @override
  @JsonKey(name: 'pressure_surface')
  final double pressureSurface;
  @override
  @JsonKey(name: 'wind_speed')
  final double windSpeed;
  @override
  @JsonKey(name: 'wind_direction')
  final int windDirection;
  @override
  @JsonKey(name: 'wind_gusts')
  final double windGusts;
  @override
  @JsonKey(name: 'weather_code')
  final int weatherCode;

  @override
  String toString() {
    return 'CurrentWeatherBase(units: $units, provider: $provider, datetime: $datetime, temp: $temp, tempFeelsLike: $tempFeelsLike, relativeHumidity: $relativeHumidity, cloudiness: $cloudiness, pressureSeaLevel: $pressureSeaLevel, pressureSurface: $pressureSurface, windSpeed: $windSpeed, windDirection: $windDirection, windGusts: $windGusts, weatherCode: $weatherCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentWeatherBaseImpl &&
            (identical(other.units, units) || other.units == units) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.temp, temp) || other.temp == temp) &&
            (identical(other.tempFeelsLike, tempFeelsLike) ||
                other.tempFeelsLike == tempFeelsLike) &&
            (identical(other.relativeHumidity, relativeHumidity) ||
                other.relativeHumidity == relativeHumidity) &&
            (identical(other.cloudiness, cloudiness) ||
                other.cloudiness == cloudiness) &&
            (identical(other.pressureSeaLevel, pressureSeaLevel) ||
                other.pressureSeaLevel == pressureSeaLevel) &&
            (identical(other.pressureSurface, pressureSurface) ||
                other.pressureSurface == pressureSurface) &&
            (identical(other.windSpeed, windSpeed) ||
                other.windSpeed == windSpeed) &&
            (identical(other.windDirection, windDirection) ||
                other.windDirection == windDirection) &&
            (identical(other.windGusts, windGusts) ||
                other.windGusts == windGusts) &&
            (identical(other.weatherCode, weatherCode) ||
                other.weatherCode == weatherCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      units,
      provider,
      datetime,
      temp,
      tempFeelsLike,
      relativeHumidity,
      cloudiness,
      pressureSeaLevel,
      pressureSurface,
      windSpeed,
      windDirection,
      windGusts,
      weatherCode);

  /// Create a copy of CurrentWeatherBase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentWeatherBaseImplCopyWith<_$CurrentWeatherBaseImpl> get copyWith =>
      __$$CurrentWeatherBaseImplCopyWithImpl<_$CurrentWeatherBaseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentWeatherBaseImplToJson(
      this,
    );
  }
}

abstract class _CurrentWeatherBase extends CurrentWeatherBase {
  const factory _CurrentWeatherBase(
      {@JsonKey(name: 'units') final WeatherUnits units,
      @JsonKey(name: 'provider') required final WeatherProvider provider,
      @JsonKey(name: 'time')
      @DateTimeISO8601Converter()
      required final DateTime datetime,
      @JsonKey(name: 'temp') required final double temp,
      @JsonKey(name: 'temp_feels_like') required final double tempFeelsLike,
      @JsonKey(name: 'relative_humidity') required final int relativeHumidity,
      @JsonKey(name: 'cloudiness') required final int cloudiness,
      @JsonKey(name: 'pressure_sea_level')
      required final double pressureSeaLevel,
      @JsonKey(name: 'pressure_surface') required final double pressureSurface,
      @JsonKey(name: 'wind_speed') required final double windSpeed,
      @JsonKey(name: 'wind_direction') required final int windDirection,
      @JsonKey(name: 'wind_gusts') required final double windGusts,
      @JsonKey(name: 'weather_code')
      required final int weatherCode}) = _$CurrentWeatherBaseImpl;
  const _CurrentWeatherBase._() : super._();

  factory _CurrentWeatherBase.fromJson(Map<String, dynamic> json) =
      _$CurrentWeatherBaseImpl.fromJson;

  /// Units of measurement for the parameters of this weather object.
  @override
  @JsonKey(name: 'units')
  WeatherUnits get units;

  /// Weather provider.
  @override
  @JsonKey(name: 'provider')
  WeatherProvider get provider; //
// /// Additional data specific to the provider.
// @JsonKey(name: 'weather_extra') required WeatherExtra extra,
  ///
  @override
  @JsonKey(name: 'time')
  @DateTimeISO8601Converter()
  DateTime get datetime;

  /// Temperature now.
  @override
  @JsonKey(name: 'temp')
  double get temp;

  /// This Temperature parameter accounts for the human perception of weather.
  @override
  @JsonKey(name: 'temp_feels_like')
  double get tempFeelsLike;

  /// Relative humidity, %
  @override
  @JsonKey(name: 'relative_humidity')
  int get relativeHumidity;

  /// Is Day or Night
// @JsonKey(name: 'is_day') required int isDay,
// @JsonKey(name: 'precipitation') required int precipitation,
// @JsonKey(name: 'rain') required int rain,
// @JsonKey(name: 'showers') required int showers,
// @JsonKey(name: 'snowfall') required int snowfall,
  /// Cloud cover, %
  @override
  @JsonKey(name: 'cloudiness')
  int get cloudiness;

  /// Sea level pressure, %
  @override
  @JsonKey(name: 'pressure_sea_level')
  double get pressureSeaLevel;

  /// Surface pressure, %
  @override
  @JsonKey(name: 'pressure_surface')
  double get pressureSurface;
  @override
  @JsonKey(name: 'wind_speed')
  double get windSpeed;
  @override
  @JsonKey(name: 'wind_direction')
  int get windDirection;
  @override
  @JsonKey(name: 'wind_gusts')
  double get windGusts;
  @override
  @JsonKey(name: 'weather_code')
  int get weatherCode;

  /// Create a copy of CurrentWeatherBase
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrentWeatherBaseImplCopyWith<_$CurrentWeatherBaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
