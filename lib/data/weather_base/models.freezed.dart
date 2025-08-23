// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeatherUnits {

@JsonKey(name: 'temp') Temp get temp;@JsonKey(name: 'speed') Speed get speed;@JsonKey(name: 'pressure') Pressure get pressure;
/// Create a copy of WeatherUnits
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeatherUnitsCopyWith<WeatherUnits> get copyWith => _$WeatherUnitsCopyWithImpl<WeatherUnits>(this as WeatherUnits, _$identity);

  /// Serializes this WeatherUnits to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeatherUnits&&(identical(other.temp, temp) || other.temp == temp)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.pressure, pressure) || other.pressure == pressure));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,temp,speed,pressure);

@override
String toString() {
  return 'WeatherUnits(temp: $temp, speed: $speed, pressure: $pressure)';
}


}

/// @nodoc
abstract mixin class $WeatherUnitsCopyWith<$Res>  {
  factory $WeatherUnitsCopyWith(WeatherUnits value, $Res Function(WeatherUnits) _then) = _$WeatherUnitsCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'temp') Temp temp,@JsonKey(name: 'speed') Speed speed,@JsonKey(name: 'pressure') Pressure pressure
});




}
/// @nodoc
class _$WeatherUnitsCopyWithImpl<$Res>
    implements $WeatherUnitsCopyWith<$Res> {
  _$WeatherUnitsCopyWithImpl(this._self, this._then);

  final WeatherUnits _self;
  final $Res Function(WeatherUnits) _then;

/// Create a copy of WeatherUnits
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? temp = null,Object? speed = null,Object? pressure = null,}) {
  return _then(_self.copyWith(
temp: null == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as Temp,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as Speed,pressure: null == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as Pressure,
  ));
}

}


/// Adds pattern-matching-related methods to [WeatherUnits].
extension WeatherUnitsPatterns on WeatherUnits {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WeatherUnits value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WeatherUnits() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WeatherUnits value)  $default,){
final _that = this;
switch (_that) {
case _WeatherUnits():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WeatherUnits value)?  $default,){
final _that = this;
switch (_that) {
case _WeatherUnits() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'temp')  Temp temp, @JsonKey(name: 'speed')  Speed speed, @JsonKey(name: 'pressure')  Pressure pressure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WeatherUnits() when $default != null:
return $default(_that.temp,_that.speed,_that.pressure);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'temp')  Temp temp, @JsonKey(name: 'speed')  Speed speed, @JsonKey(name: 'pressure')  Pressure pressure)  $default,) {final _that = this;
switch (_that) {
case _WeatherUnits():
return $default(_that.temp,_that.speed,_that.pressure);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'temp')  Temp temp, @JsonKey(name: 'speed')  Speed speed, @JsonKey(name: 'pressure')  Pressure pressure)?  $default,) {final _that = this;
switch (_that) {
case _WeatherUnits() when $default != null:
return $default(_that.temp,_that.speed,_that.pressure);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _WeatherUnits implements WeatherUnits {
  const _WeatherUnits({@JsonKey(name: 'temp') this.temp = Temp.celsius, @JsonKey(name: 'speed') this.speed = Speed.ms, @JsonKey(name: 'pressure') this.pressure = Pressure.mmHg});
  factory _WeatherUnits.fromJson(Map<String, dynamic> json) => _$WeatherUnitsFromJson(json);

@override@JsonKey(name: 'temp') final  Temp temp;
@override@JsonKey(name: 'speed') final  Speed speed;
@override@JsonKey(name: 'pressure') final  Pressure pressure;

/// Create a copy of WeatherUnits
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WeatherUnitsCopyWith<_WeatherUnits> get copyWith => __$WeatherUnitsCopyWithImpl<_WeatherUnits>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeatherUnitsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WeatherUnits&&(identical(other.temp, temp) || other.temp == temp)&&(identical(other.speed, speed) || other.speed == speed)&&(identical(other.pressure, pressure) || other.pressure == pressure));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,temp,speed,pressure);

@override
String toString() {
  return 'WeatherUnits(temp: $temp, speed: $speed, pressure: $pressure)';
}


}

/// @nodoc
abstract mixin class _$WeatherUnitsCopyWith<$Res> implements $WeatherUnitsCopyWith<$Res> {
  factory _$WeatherUnitsCopyWith(_WeatherUnits value, $Res Function(_WeatherUnits) _then) = __$WeatherUnitsCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'temp') Temp temp,@JsonKey(name: 'speed') Speed speed,@JsonKey(name: 'pressure') Pressure pressure
});




}
/// @nodoc
class __$WeatherUnitsCopyWithImpl<$Res>
    implements _$WeatherUnitsCopyWith<$Res> {
  __$WeatherUnitsCopyWithImpl(this._self, this._then);

  final _WeatherUnits _self;
  final $Res Function(_WeatherUnits) _then;

/// Create a copy of WeatherUnits
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? temp = null,Object? speed = null,Object? pressure = null,}) {
  return _then(_WeatherUnits(
temp: null == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as Temp,speed: null == speed ? _self.speed : speed // ignore: cast_nullable_to_non_nullable
as Speed,pressure: null == pressure ? _self.pressure : pressure // ignore: cast_nullable_to_non_nullable
as Pressure,
  ));
}


}


/// @nodoc
mixin _$CurrentWeatherBase {

/// Units of measurement for the parameters of this weather object.
@JsonKey(name: 'units') WeatherUnits get units;/// Weather provider.
@JsonKey(name: 'provider') WeatherProvider get provider;//
// /// Additional data specific to the provider.
// @JsonKey(name: 'weather_extra') required WeatherExtra extra,
///
@JsonKey(name: 'time')@DateTimeISO8601Converter() DateTime get datetime;/// Temperature now.
@JsonKey(name: 'temp') double get temp;/// This Temperature parameter accounts for the human perception of weather.
@JsonKey(name: 'temp_feels_like') double get tempFeelsLike;/// Relative humidity, %
@JsonKey(name: 'relative_humidity') int get relativeHumidity;/// Is Day or Night
// @JsonKey(name: 'is_day') required int isDay,
// @JsonKey(name: 'precipitation') required int precipitation,
// @JsonKey(name: 'rain') required int rain,
// @JsonKey(name: 'showers') required int showers,
// @JsonKey(name: 'snowfall') required int snowfall,
/// Cloud cover, %
@JsonKey(name: 'cloudiness') int get cloudiness;/// Sea level pressure, %
@JsonKey(name: 'pressure_sea_level') double get pressureSeaLevel;/// Surface pressure, %
@JsonKey(name: 'pressure_surface') double get pressureSurface;@JsonKey(name: 'wind_speed') double get windSpeed;@JsonKey(name: 'wind_direction') int get windDirection;@JsonKey(name: 'wind_gusts') double get windGusts;@JsonKey(name: 'weather_code') int get weatherCode;
/// Create a copy of CurrentWeatherBase
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentWeatherBaseCopyWith<CurrentWeatherBase> get copyWith => _$CurrentWeatherBaseCopyWithImpl<CurrentWeatherBase>(this as CurrentWeatherBase, _$identity);

  /// Serializes this CurrentWeatherBase to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentWeatherBase&&(identical(other.units, units) || other.units == units)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.datetime, datetime) || other.datetime == datetime)&&(identical(other.temp, temp) || other.temp == temp)&&(identical(other.tempFeelsLike, tempFeelsLike) || other.tempFeelsLike == tempFeelsLike)&&(identical(other.relativeHumidity, relativeHumidity) || other.relativeHumidity == relativeHumidity)&&(identical(other.cloudiness, cloudiness) || other.cloudiness == cloudiness)&&(identical(other.pressureSeaLevel, pressureSeaLevel) || other.pressureSeaLevel == pressureSeaLevel)&&(identical(other.pressureSurface, pressureSurface) || other.pressureSurface == pressureSurface)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.windDirection, windDirection) || other.windDirection == windDirection)&&(identical(other.windGusts, windGusts) || other.windGusts == windGusts)&&(identical(other.weatherCode, weatherCode) || other.weatherCode == weatherCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,units,provider,datetime,temp,tempFeelsLike,relativeHumidity,cloudiness,pressureSeaLevel,pressureSurface,windSpeed,windDirection,windGusts,weatherCode);

@override
String toString() {
  return 'CurrentWeatherBase(units: $units, provider: $provider, datetime: $datetime, temp: $temp, tempFeelsLike: $tempFeelsLike, relativeHumidity: $relativeHumidity, cloudiness: $cloudiness, pressureSeaLevel: $pressureSeaLevel, pressureSurface: $pressureSurface, windSpeed: $windSpeed, windDirection: $windDirection, windGusts: $windGusts, weatherCode: $weatherCode)';
}


}

/// @nodoc
abstract mixin class $CurrentWeatherBaseCopyWith<$Res>  {
  factory $CurrentWeatherBaseCopyWith(CurrentWeatherBase value, $Res Function(CurrentWeatherBase) _then) = _$CurrentWeatherBaseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'units') WeatherUnits units,@JsonKey(name: 'provider') WeatherProvider provider,@JsonKey(name: 'time')@DateTimeISO8601Converter() DateTime datetime,@JsonKey(name: 'temp') double temp,@JsonKey(name: 'temp_feels_like') double tempFeelsLike,@JsonKey(name: 'relative_humidity') int relativeHumidity,@JsonKey(name: 'cloudiness') int cloudiness,@JsonKey(name: 'pressure_sea_level') double pressureSeaLevel,@JsonKey(name: 'pressure_surface') double pressureSurface,@JsonKey(name: 'wind_speed') double windSpeed,@JsonKey(name: 'wind_direction') int windDirection,@JsonKey(name: 'wind_gusts') double windGusts,@JsonKey(name: 'weather_code') int weatherCode
});


$WeatherUnitsCopyWith<$Res> get units;

}
/// @nodoc
class _$CurrentWeatherBaseCopyWithImpl<$Res>
    implements $CurrentWeatherBaseCopyWith<$Res> {
  _$CurrentWeatherBaseCopyWithImpl(this._self, this._then);

  final CurrentWeatherBase _self;
  final $Res Function(CurrentWeatherBase) _then;

/// Create a copy of CurrentWeatherBase
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? units = null,Object? provider = null,Object? datetime = null,Object? temp = null,Object? tempFeelsLike = null,Object? relativeHumidity = null,Object? cloudiness = null,Object? pressureSeaLevel = null,Object? pressureSurface = null,Object? windSpeed = null,Object? windDirection = null,Object? windGusts = null,Object? weatherCode = null,}) {
  return _then(_self.copyWith(
units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as WeatherUnits,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as WeatherProvider,datetime: null == datetime ? _self.datetime : datetime // ignore: cast_nullable_to_non_nullable
as DateTime,temp: null == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as double,tempFeelsLike: null == tempFeelsLike ? _self.tempFeelsLike : tempFeelsLike // ignore: cast_nullable_to_non_nullable
as double,relativeHumidity: null == relativeHumidity ? _self.relativeHumidity : relativeHumidity // ignore: cast_nullable_to_non_nullable
as int,cloudiness: null == cloudiness ? _self.cloudiness : cloudiness // ignore: cast_nullable_to_non_nullable
as int,pressureSeaLevel: null == pressureSeaLevel ? _self.pressureSeaLevel : pressureSeaLevel // ignore: cast_nullable_to_non_nullable
as double,pressureSurface: null == pressureSurface ? _self.pressureSurface : pressureSurface // ignore: cast_nullable_to_non_nullable
as double,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double,windDirection: null == windDirection ? _self.windDirection : windDirection // ignore: cast_nullable_to_non_nullable
as int,windGusts: null == windGusts ? _self.windGusts : windGusts // ignore: cast_nullable_to_non_nullable
as double,weatherCode: null == weatherCode ? _self.weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of CurrentWeatherBase
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherUnitsCopyWith<$Res> get units {
  
  return $WeatherUnitsCopyWith<$Res>(_self.units, (value) {
    return _then(_self.copyWith(units: value));
  });
}
}


/// Adds pattern-matching-related methods to [CurrentWeatherBase].
extension CurrentWeatherBasePatterns on CurrentWeatherBase {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentWeatherBase value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentWeatherBase() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentWeatherBase value)  $default,){
final _that = this;
switch (_that) {
case _CurrentWeatherBase():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentWeatherBase value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentWeatherBase() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'units')  WeatherUnits units, @JsonKey(name: 'provider')  WeatherProvider provider, @JsonKey(name: 'time')@DateTimeISO8601Converter()  DateTime datetime, @JsonKey(name: 'temp')  double temp, @JsonKey(name: 'temp_feels_like')  double tempFeelsLike, @JsonKey(name: 'relative_humidity')  int relativeHumidity, @JsonKey(name: 'cloudiness')  int cloudiness, @JsonKey(name: 'pressure_sea_level')  double pressureSeaLevel, @JsonKey(name: 'pressure_surface')  double pressureSurface, @JsonKey(name: 'wind_speed')  double windSpeed, @JsonKey(name: 'wind_direction')  int windDirection, @JsonKey(name: 'wind_gusts')  double windGusts, @JsonKey(name: 'weather_code')  int weatherCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentWeatherBase() when $default != null:
return $default(_that.units,_that.provider,_that.datetime,_that.temp,_that.tempFeelsLike,_that.relativeHumidity,_that.cloudiness,_that.pressureSeaLevel,_that.pressureSurface,_that.windSpeed,_that.windDirection,_that.windGusts,_that.weatherCode);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'units')  WeatherUnits units, @JsonKey(name: 'provider')  WeatherProvider provider, @JsonKey(name: 'time')@DateTimeISO8601Converter()  DateTime datetime, @JsonKey(name: 'temp')  double temp, @JsonKey(name: 'temp_feels_like')  double tempFeelsLike, @JsonKey(name: 'relative_humidity')  int relativeHumidity, @JsonKey(name: 'cloudiness')  int cloudiness, @JsonKey(name: 'pressure_sea_level')  double pressureSeaLevel, @JsonKey(name: 'pressure_surface')  double pressureSurface, @JsonKey(name: 'wind_speed')  double windSpeed, @JsonKey(name: 'wind_direction')  int windDirection, @JsonKey(name: 'wind_gusts')  double windGusts, @JsonKey(name: 'weather_code')  int weatherCode)  $default,) {final _that = this;
switch (_that) {
case _CurrentWeatherBase():
return $default(_that.units,_that.provider,_that.datetime,_that.temp,_that.tempFeelsLike,_that.relativeHumidity,_that.cloudiness,_that.pressureSeaLevel,_that.pressureSurface,_that.windSpeed,_that.windDirection,_that.windGusts,_that.weatherCode);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'units')  WeatherUnits units, @JsonKey(name: 'provider')  WeatherProvider provider, @JsonKey(name: 'time')@DateTimeISO8601Converter()  DateTime datetime, @JsonKey(name: 'temp')  double temp, @JsonKey(name: 'temp_feels_like')  double tempFeelsLike, @JsonKey(name: 'relative_humidity')  int relativeHumidity, @JsonKey(name: 'cloudiness')  int cloudiness, @JsonKey(name: 'pressure_sea_level')  double pressureSeaLevel, @JsonKey(name: 'pressure_surface')  double pressureSurface, @JsonKey(name: 'wind_speed')  double windSpeed, @JsonKey(name: 'wind_direction')  int windDirection, @JsonKey(name: 'wind_gusts')  double windGusts, @JsonKey(name: 'weather_code')  int weatherCode)?  $default,) {final _that = this;
switch (_that) {
case _CurrentWeatherBase() when $default != null:
return $default(_that.units,_that.provider,_that.datetime,_that.temp,_that.tempFeelsLike,_that.relativeHumidity,_that.cloudiness,_that.pressureSeaLevel,_that.pressureSurface,_that.windSpeed,_that.windDirection,_that.windGusts,_that.weatherCode);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _CurrentWeatherBase extends CurrentWeatherBase {
  const _CurrentWeatherBase({@JsonKey(name: 'units') this.units = const WeatherUnits(), @JsonKey(name: 'provider') required this.provider, @JsonKey(name: 'time')@DateTimeISO8601Converter() required this.datetime, @JsonKey(name: 'temp') required this.temp, @JsonKey(name: 'temp_feels_like') required this.tempFeelsLike, @JsonKey(name: 'relative_humidity') required this.relativeHumidity, @JsonKey(name: 'cloudiness') required this.cloudiness, @JsonKey(name: 'pressure_sea_level') required this.pressureSeaLevel, @JsonKey(name: 'pressure_surface') required this.pressureSurface, @JsonKey(name: 'wind_speed') required this.windSpeed, @JsonKey(name: 'wind_direction') required this.windDirection, @JsonKey(name: 'wind_gusts') required this.windGusts, @JsonKey(name: 'weather_code') required this.weatherCode}): super._();
  factory _CurrentWeatherBase.fromJson(Map<String, dynamic> json) => _$CurrentWeatherBaseFromJson(json);

/// Units of measurement for the parameters of this weather object.
@override@JsonKey(name: 'units') final  WeatherUnits units;
/// Weather provider.
@override@JsonKey(name: 'provider') final  WeatherProvider provider;
//
// /// Additional data specific to the provider.
// @JsonKey(name: 'weather_extra') required WeatherExtra extra,
///
@override@JsonKey(name: 'time')@DateTimeISO8601Converter() final  DateTime datetime;
/// Temperature now.
@override@JsonKey(name: 'temp') final  double temp;
/// This Temperature parameter accounts for the human perception of weather.
@override@JsonKey(name: 'temp_feels_like') final  double tempFeelsLike;
/// Relative humidity, %
@override@JsonKey(name: 'relative_humidity') final  int relativeHumidity;
/// Is Day or Night
// @JsonKey(name: 'is_day') required int isDay,
// @JsonKey(name: 'precipitation') required int precipitation,
// @JsonKey(name: 'rain') required int rain,
// @JsonKey(name: 'showers') required int showers,
// @JsonKey(name: 'snowfall') required int snowfall,
/// Cloud cover, %
@override@JsonKey(name: 'cloudiness') final  int cloudiness;
/// Sea level pressure, %
@override@JsonKey(name: 'pressure_sea_level') final  double pressureSeaLevel;
/// Surface pressure, %
@override@JsonKey(name: 'pressure_surface') final  double pressureSurface;
@override@JsonKey(name: 'wind_speed') final  double windSpeed;
@override@JsonKey(name: 'wind_direction') final  int windDirection;
@override@JsonKey(name: 'wind_gusts') final  double windGusts;
@override@JsonKey(name: 'weather_code') final  int weatherCode;

/// Create a copy of CurrentWeatherBase
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentWeatherBaseCopyWith<_CurrentWeatherBase> get copyWith => __$CurrentWeatherBaseCopyWithImpl<_CurrentWeatherBase>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentWeatherBaseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentWeatherBase&&(identical(other.units, units) || other.units == units)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.datetime, datetime) || other.datetime == datetime)&&(identical(other.temp, temp) || other.temp == temp)&&(identical(other.tempFeelsLike, tempFeelsLike) || other.tempFeelsLike == tempFeelsLike)&&(identical(other.relativeHumidity, relativeHumidity) || other.relativeHumidity == relativeHumidity)&&(identical(other.cloudiness, cloudiness) || other.cloudiness == cloudiness)&&(identical(other.pressureSeaLevel, pressureSeaLevel) || other.pressureSeaLevel == pressureSeaLevel)&&(identical(other.pressureSurface, pressureSurface) || other.pressureSurface == pressureSurface)&&(identical(other.windSpeed, windSpeed) || other.windSpeed == windSpeed)&&(identical(other.windDirection, windDirection) || other.windDirection == windDirection)&&(identical(other.windGusts, windGusts) || other.windGusts == windGusts)&&(identical(other.weatherCode, weatherCode) || other.weatherCode == weatherCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,units,provider,datetime,temp,tempFeelsLike,relativeHumidity,cloudiness,pressureSeaLevel,pressureSurface,windSpeed,windDirection,windGusts,weatherCode);

@override
String toString() {
  return 'CurrentWeatherBase(units: $units, provider: $provider, datetime: $datetime, temp: $temp, tempFeelsLike: $tempFeelsLike, relativeHumidity: $relativeHumidity, cloudiness: $cloudiness, pressureSeaLevel: $pressureSeaLevel, pressureSurface: $pressureSurface, windSpeed: $windSpeed, windDirection: $windDirection, windGusts: $windGusts, weatherCode: $weatherCode)';
}


}

/// @nodoc
abstract mixin class _$CurrentWeatherBaseCopyWith<$Res> implements $CurrentWeatherBaseCopyWith<$Res> {
  factory _$CurrentWeatherBaseCopyWith(_CurrentWeatherBase value, $Res Function(_CurrentWeatherBase) _then) = __$CurrentWeatherBaseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'units') WeatherUnits units,@JsonKey(name: 'provider') WeatherProvider provider,@JsonKey(name: 'time')@DateTimeISO8601Converter() DateTime datetime,@JsonKey(name: 'temp') double temp,@JsonKey(name: 'temp_feels_like') double tempFeelsLike,@JsonKey(name: 'relative_humidity') int relativeHumidity,@JsonKey(name: 'cloudiness') int cloudiness,@JsonKey(name: 'pressure_sea_level') double pressureSeaLevel,@JsonKey(name: 'pressure_surface') double pressureSurface,@JsonKey(name: 'wind_speed') double windSpeed,@JsonKey(name: 'wind_direction') int windDirection,@JsonKey(name: 'wind_gusts') double windGusts,@JsonKey(name: 'weather_code') int weatherCode
});


@override $WeatherUnitsCopyWith<$Res> get units;

}
/// @nodoc
class __$CurrentWeatherBaseCopyWithImpl<$Res>
    implements _$CurrentWeatherBaseCopyWith<$Res> {
  __$CurrentWeatherBaseCopyWithImpl(this._self, this._then);

  final _CurrentWeatherBase _self;
  final $Res Function(_CurrentWeatherBase) _then;

/// Create a copy of CurrentWeatherBase
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? units = null,Object? provider = null,Object? datetime = null,Object? temp = null,Object? tempFeelsLike = null,Object? relativeHumidity = null,Object? cloudiness = null,Object? pressureSeaLevel = null,Object? pressureSurface = null,Object? windSpeed = null,Object? windDirection = null,Object? windGusts = null,Object? weatherCode = null,}) {
  return _then(_CurrentWeatherBase(
units: null == units ? _self.units : units // ignore: cast_nullable_to_non_nullable
as WeatherUnits,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as WeatherProvider,datetime: null == datetime ? _self.datetime : datetime // ignore: cast_nullable_to_non_nullable
as DateTime,temp: null == temp ? _self.temp : temp // ignore: cast_nullable_to_non_nullable
as double,tempFeelsLike: null == tempFeelsLike ? _self.tempFeelsLike : tempFeelsLike // ignore: cast_nullable_to_non_nullable
as double,relativeHumidity: null == relativeHumidity ? _self.relativeHumidity : relativeHumidity // ignore: cast_nullable_to_non_nullable
as int,cloudiness: null == cloudiness ? _self.cloudiness : cloudiness // ignore: cast_nullable_to_non_nullable
as int,pressureSeaLevel: null == pressureSeaLevel ? _self.pressureSeaLevel : pressureSeaLevel // ignore: cast_nullable_to_non_nullable
as double,pressureSurface: null == pressureSurface ? _self.pressureSurface : pressureSurface // ignore: cast_nullable_to_non_nullable
as double,windSpeed: null == windSpeed ? _self.windSpeed : windSpeed // ignore: cast_nullable_to_non_nullable
as double,windDirection: null == windDirection ? _self.windDirection : windDirection // ignore: cast_nullable_to_non_nullable
as int,windGusts: null == windGusts ? _self.windGusts : windGusts // ignore: cast_nullable_to_non_nullable
as double,weatherCode: null == weatherCode ? _self.weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of CurrentWeatherBase
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$WeatherUnitsCopyWith<$Res> get units {
  
  return $WeatherUnitsCopyWith<$Res>(_self.units, (value) {
    return _then(_self.copyWith(units: value));
  });
}
}

// dart format on
