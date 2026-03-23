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
mixin _$ForecastOpenMeteoResponse {

/// Geographical WGS84 coordinates of the location. Multiple coordinates can
/// be comma separated. E.g. &latitude=52.52,48.85&longitude=13.41,2.35.
/// To return data for multiple locations the JSON output changes to a list
/// of structures.
@JsonKey(name: 'latitude') double get latitude;/// Geographical WGS84 coordinates of the location. Multiple coordinates can
/// be comma separated. E.g. &latitude=52.52,48.85&longitude=13.41,2.35.
/// To return data for multiple locations the JSON output changes to a list
/// of structures.
@JsonKey(name: 'longitude') double get longitude;/// Data generation time, ms
@JsonKey(name: 'generationtime_ms') double get genTimeMs;/// Applied timezone offset from the &timezone= parameter, seconds
@JsonKey(name: 'utc_offset_seconds') int get utcOffsetSeconds;/// If timezone is set, all timestamps are returned as local-time and data
/// is returned starting at 00:00 local-time. Any time zone name from the
/// time zone database is supported. If auto is set as a time zone, the
/// coordinates will be automatically resolved to the local time zone.
/// For multiple coordinates, a comma separated list of timezones can be
/// specified.
@JsonKey(name: 'timezone') String get timezone;@JsonKey(name: 'timezone_abbreviation') String get timezoneAbbr;/// The elevation used for statistical downscaling. Per default, a 90 meter
/// digital elevation model is used. You can manually set the elevation to
/// correctly match mountain peaks. If &elevation=nan is specified,
/// downscaling will be disabled and the API uses the average grid-cell height.
/// For multiple locations, elevation can also be comma separated.
@JsonKey(name: 'elevation') double get elevation;/// A list of weather variables to get current conditions.
@JsonKey(name: 'current') CurrentWeatherOpenMeteo get currentWeather;/// A list of weather variables which should be returned. Values can be comma
/// separated, or multiple &hourly= parameter in the URL can be used.
@protected@JsonKey(name: 'hourly') Map<String, Iterable<Object>>? get hourlyWeatherMap;/// A list of daily weather variable aggregations which should be returned.
/// Values can be comma separated, or multiple &daily= parameter in the URL
/// can be used. If daily weather variables are specified, parameter timezone
/// is required.
@protected@JsonKey(name: 'daily') Map<String, Iterable<Object>>? get dailyWeatherMap;
/// Create a copy of ForecastOpenMeteoResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ForecastOpenMeteoResponseCopyWith<ForecastOpenMeteoResponse> get copyWith => _$ForecastOpenMeteoResponseCopyWithImpl<ForecastOpenMeteoResponse>(this as ForecastOpenMeteoResponse, _$identity);

  /// Serializes this ForecastOpenMeteoResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ForecastOpenMeteoResponse&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.genTimeMs, genTimeMs) || other.genTimeMs == genTimeMs)&&(identical(other.utcOffsetSeconds, utcOffsetSeconds) || other.utcOffsetSeconds == utcOffsetSeconds)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.timezoneAbbr, timezoneAbbr) || other.timezoneAbbr == timezoneAbbr)&&(identical(other.elevation, elevation) || other.elevation == elevation)&&(identical(other.currentWeather, currentWeather) || other.currentWeather == currentWeather)&&const DeepCollectionEquality().equals(other.hourlyWeatherMap, hourlyWeatherMap)&&const DeepCollectionEquality().equals(other.dailyWeatherMap, dailyWeatherMap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,genTimeMs,utcOffsetSeconds,timezone,timezoneAbbr,elevation,currentWeather,const DeepCollectionEquality().hash(hourlyWeatherMap),const DeepCollectionEquality().hash(dailyWeatherMap));

@override
String toString() {
  return 'ForecastOpenMeteoResponse(latitude: $latitude, longitude: $longitude, genTimeMs: $genTimeMs, utcOffsetSeconds: $utcOffsetSeconds, timezone: $timezone, timezoneAbbr: $timezoneAbbr, elevation: $elevation, currentWeather: $currentWeather, hourlyWeatherMap: $hourlyWeatherMap, dailyWeatherMap: $dailyWeatherMap)';
}


}

/// @nodoc
abstract mixin class $ForecastOpenMeteoResponseCopyWith<$Res>  {
  factory $ForecastOpenMeteoResponseCopyWith(ForecastOpenMeteoResponse value, $Res Function(ForecastOpenMeteoResponse) _then) = _$ForecastOpenMeteoResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'latitude') double latitude,@JsonKey(name: 'longitude') double longitude,@JsonKey(name: 'generationtime_ms') double genTimeMs,@JsonKey(name: 'utc_offset_seconds') int utcOffsetSeconds,@JsonKey(name: 'timezone') String timezone,@JsonKey(name: 'timezone_abbreviation') String timezoneAbbr,@JsonKey(name: 'elevation') double elevation,@JsonKey(name: 'current') CurrentWeatherOpenMeteo currentWeather,@protected@JsonKey(name: 'hourly') Map<String, Iterable<Object>>? hourlyWeatherMap,@protected@JsonKey(name: 'daily') Map<String, Iterable<Object>>? dailyWeatherMap
});


$CurrentWeatherOpenMeteoCopyWith<$Res> get currentWeather;

}
/// @nodoc
class _$ForecastOpenMeteoResponseCopyWithImpl<$Res>
    implements $ForecastOpenMeteoResponseCopyWith<$Res> {
  _$ForecastOpenMeteoResponseCopyWithImpl(this._self, this._then);

  final ForecastOpenMeteoResponse _self;
  final $Res Function(ForecastOpenMeteoResponse) _then;

/// Create a copy of ForecastOpenMeteoResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? latitude = null,Object? longitude = null,Object? genTimeMs = null,Object? utcOffsetSeconds = null,Object? timezone = null,Object? timezoneAbbr = null,Object? elevation = null,Object? currentWeather = null,Object? hourlyWeatherMap = freezed,Object? dailyWeatherMap = freezed,}) {
  return _then(_self.copyWith(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,genTimeMs: null == genTimeMs ? _self.genTimeMs : genTimeMs // ignore: cast_nullable_to_non_nullable
as double,utcOffsetSeconds: null == utcOffsetSeconds ? _self.utcOffsetSeconds : utcOffsetSeconds // ignore: cast_nullable_to_non_nullable
as int,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,timezoneAbbr: null == timezoneAbbr ? _self.timezoneAbbr : timezoneAbbr // ignore: cast_nullable_to_non_nullable
as String,elevation: null == elevation ? _self.elevation : elevation // ignore: cast_nullable_to_non_nullable
as double,currentWeather: null == currentWeather ? _self.currentWeather : currentWeather // ignore: cast_nullable_to_non_nullable
as CurrentWeatherOpenMeteo,hourlyWeatherMap: freezed == hourlyWeatherMap ? _self.hourlyWeatherMap : hourlyWeatherMap // ignore: cast_nullable_to_non_nullable
as Map<String, Iterable<Object>>?,dailyWeatherMap: freezed == dailyWeatherMap ? _self.dailyWeatherMap : dailyWeatherMap // ignore: cast_nullable_to_non_nullable
as Map<String, Iterable<Object>>?,
  ));
}
/// Create a copy of ForecastOpenMeteoResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentWeatherOpenMeteoCopyWith<$Res> get currentWeather {
  
  return $CurrentWeatherOpenMeteoCopyWith<$Res>(_self.currentWeather, (value) {
    return _then(_self.copyWith(currentWeather: value));
  });
}
}


/// Adds pattern-matching-related methods to [ForecastOpenMeteoResponse].
extension ForecastOpenMeteoResponsePatterns on ForecastOpenMeteoResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ForecastOpenMeteoResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ForecastOpenMeteoResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ForecastOpenMeteoResponse value)  $default,){
final _that = this;
switch (_that) {
case _ForecastOpenMeteoResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ForecastOpenMeteoResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ForecastOpenMeteoResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'latitude')  double latitude, @JsonKey(name: 'longitude')  double longitude, @JsonKey(name: 'generationtime_ms')  double genTimeMs, @JsonKey(name: 'utc_offset_seconds')  int utcOffsetSeconds, @JsonKey(name: 'timezone')  String timezone, @JsonKey(name: 'timezone_abbreviation')  String timezoneAbbr, @JsonKey(name: 'elevation')  double elevation, @JsonKey(name: 'current')  CurrentWeatherOpenMeteo currentWeather, @protected@JsonKey(name: 'hourly')  Map<String, Iterable<Object>>? hourlyWeatherMap, @protected@JsonKey(name: 'daily')  Map<String, Iterable<Object>>? dailyWeatherMap)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ForecastOpenMeteoResponse() when $default != null:
return $default(_that.latitude,_that.longitude,_that.genTimeMs,_that.utcOffsetSeconds,_that.timezone,_that.timezoneAbbr,_that.elevation,_that.currentWeather,_that.hourlyWeatherMap,_that.dailyWeatherMap);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'latitude')  double latitude, @JsonKey(name: 'longitude')  double longitude, @JsonKey(name: 'generationtime_ms')  double genTimeMs, @JsonKey(name: 'utc_offset_seconds')  int utcOffsetSeconds, @JsonKey(name: 'timezone')  String timezone, @JsonKey(name: 'timezone_abbreviation')  String timezoneAbbr, @JsonKey(name: 'elevation')  double elevation, @JsonKey(name: 'current')  CurrentWeatherOpenMeteo currentWeather, @protected@JsonKey(name: 'hourly')  Map<String, Iterable<Object>>? hourlyWeatherMap, @protected@JsonKey(name: 'daily')  Map<String, Iterable<Object>>? dailyWeatherMap)  $default,) {final _that = this;
switch (_that) {
case _ForecastOpenMeteoResponse():
return $default(_that.latitude,_that.longitude,_that.genTimeMs,_that.utcOffsetSeconds,_that.timezone,_that.timezoneAbbr,_that.elevation,_that.currentWeather,_that.hourlyWeatherMap,_that.dailyWeatherMap);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'latitude')  double latitude, @JsonKey(name: 'longitude')  double longitude, @JsonKey(name: 'generationtime_ms')  double genTimeMs, @JsonKey(name: 'utc_offset_seconds')  int utcOffsetSeconds, @JsonKey(name: 'timezone')  String timezone, @JsonKey(name: 'timezone_abbreviation')  String timezoneAbbr, @JsonKey(name: 'elevation')  double elevation, @JsonKey(name: 'current')  CurrentWeatherOpenMeteo currentWeather, @protected@JsonKey(name: 'hourly')  Map<String, Iterable<Object>>? hourlyWeatherMap, @protected@JsonKey(name: 'daily')  Map<String, Iterable<Object>>? dailyWeatherMap)?  $default,) {final _that = this;
switch (_that) {
case _ForecastOpenMeteoResponse() when $default != null:
return $default(_that.latitude,_that.longitude,_that.genTimeMs,_that.utcOffsetSeconds,_that.timezone,_that.timezoneAbbr,_that.elevation,_that.currentWeather,_that.hourlyWeatherMap,_that.dailyWeatherMap);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _ForecastOpenMeteoResponse extends ForecastOpenMeteoResponse {
  const _ForecastOpenMeteoResponse({@JsonKey(name: 'latitude') required this.latitude, @JsonKey(name: 'longitude') required this.longitude, @JsonKey(name: 'generationtime_ms') required this.genTimeMs, @JsonKey(name: 'utc_offset_seconds') required this.utcOffsetSeconds, @JsonKey(name: 'timezone') required this.timezone, @JsonKey(name: 'timezone_abbreviation') required this.timezoneAbbr, @JsonKey(name: 'elevation') required this.elevation, @JsonKey(name: 'current') required this.currentWeather, @protected@JsonKey(name: 'hourly') final  Map<String, Iterable<Object>>? hourlyWeatherMap, @protected@JsonKey(name: 'daily') final  Map<String, Iterable<Object>>? dailyWeatherMap}): _hourlyWeatherMap = hourlyWeatherMap,_dailyWeatherMap = dailyWeatherMap,super._();
  factory _ForecastOpenMeteoResponse.fromJson(Map<String, dynamic> json) => _$ForecastOpenMeteoResponseFromJson(json);

/// Geographical WGS84 coordinates of the location. Multiple coordinates can
/// be comma separated. E.g. &latitude=52.52,48.85&longitude=13.41,2.35.
/// To return data for multiple locations the JSON output changes to a list
/// of structures.
@override@JsonKey(name: 'latitude') final  double latitude;
/// Geographical WGS84 coordinates of the location. Multiple coordinates can
/// be comma separated. E.g. &latitude=52.52,48.85&longitude=13.41,2.35.
/// To return data for multiple locations the JSON output changes to a list
/// of structures.
@override@JsonKey(name: 'longitude') final  double longitude;
/// Data generation time, ms
@override@JsonKey(name: 'generationtime_ms') final  double genTimeMs;
/// Applied timezone offset from the &timezone= parameter, seconds
@override@JsonKey(name: 'utc_offset_seconds') final  int utcOffsetSeconds;
/// If timezone is set, all timestamps are returned as local-time and data
/// is returned starting at 00:00 local-time. Any time zone name from the
/// time zone database is supported. If auto is set as a time zone, the
/// coordinates will be automatically resolved to the local time zone.
/// For multiple coordinates, a comma separated list of timezones can be
/// specified.
@override@JsonKey(name: 'timezone') final  String timezone;
@override@JsonKey(name: 'timezone_abbreviation') final  String timezoneAbbr;
/// The elevation used for statistical downscaling. Per default, a 90 meter
/// digital elevation model is used. You can manually set the elevation to
/// correctly match mountain peaks. If &elevation=nan is specified,
/// downscaling will be disabled and the API uses the average grid-cell height.
/// For multiple locations, elevation can also be comma separated.
@override@JsonKey(name: 'elevation') final  double elevation;
/// A list of weather variables to get current conditions.
@override@JsonKey(name: 'current') final  CurrentWeatherOpenMeteo currentWeather;
/// A list of weather variables which should be returned. Values can be comma
/// separated, or multiple &hourly= parameter in the URL can be used.
 final  Map<String, Iterable<Object>>? _hourlyWeatherMap;
/// A list of weather variables which should be returned. Values can be comma
/// separated, or multiple &hourly= parameter in the URL can be used.
@override@protected@JsonKey(name: 'hourly') Map<String, Iterable<Object>>? get hourlyWeatherMap {
  final value = _hourlyWeatherMap;
  if (value == null) return null;
  if (_hourlyWeatherMap is EqualUnmodifiableMapView) return _hourlyWeatherMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// A list of daily weather variable aggregations which should be returned.
/// Values can be comma separated, or multiple &daily= parameter in the URL
/// can be used. If daily weather variables are specified, parameter timezone
/// is required.
 final  Map<String, Iterable<Object>>? _dailyWeatherMap;
/// A list of daily weather variable aggregations which should be returned.
/// Values can be comma separated, or multiple &daily= parameter in the URL
/// can be used. If daily weather variables are specified, parameter timezone
/// is required.
@override@protected@JsonKey(name: 'daily') Map<String, Iterable<Object>>? get dailyWeatherMap {
  final value = _dailyWeatherMap;
  if (value == null) return null;
  if (_dailyWeatherMap is EqualUnmodifiableMapView) return _dailyWeatherMap;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of ForecastOpenMeteoResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ForecastOpenMeteoResponseCopyWith<_ForecastOpenMeteoResponse> get copyWith => __$ForecastOpenMeteoResponseCopyWithImpl<_ForecastOpenMeteoResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ForecastOpenMeteoResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ForecastOpenMeteoResponse&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.genTimeMs, genTimeMs) || other.genTimeMs == genTimeMs)&&(identical(other.utcOffsetSeconds, utcOffsetSeconds) || other.utcOffsetSeconds == utcOffsetSeconds)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.timezoneAbbr, timezoneAbbr) || other.timezoneAbbr == timezoneAbbr)&&(identical(other.elevation, elevation) || other.elevation == elevation)&&(identical(other.currentWeather, currentWeather) || other.currentWeather == currentWeather)&&const DeepCollectionEquality().equals(other._hourlyWeatherMap, _hourlyWeatherMap)&&const DeepCollectionEquality().equals(other._dailyWeatherMap, _dailyWeatherMap));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,latitude,longitude,genTimeMs,utcOffsetSeconds,timezone,timezoneAbbr,elevation,currentWeather,const DeepCollectionEquality().hash(_hourlyWeatherMap),const DeepCollectionEquality().hash(_dailyWeatherMap));

@override
String toString() {
  return 'ForecastOpenMeteoResponse(latitude: $latitude, longitude: $longitude, genTimeMs: $genTimeMs, utcOffsetSeconds: $utcOffsetSeconds, timezone: $timezone, timezoneAbbr: $timezoneAbbr, elevation: $elevation, currentWeather: $currentWeather, hourlyWeatherMap: $hourlyWeatherMap, dailyWeatherMap: $dailyWeatherMap)';
}


}

/// @nodoc
abstract mixin class _$ForecastOpenMeteoResponseCopyWith<$Res> implements $ForecastOpenMeteoResponseCopyWith<$Res> {
  factory _$ForecastOpenMeteoResponseCopyWith(_ForecastOpenMeteoResponse value, $Res Function(_ForecastOpenMeteoResponse) _then) = __$ForecastOpenMeteoResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'latitude') double latitude,@JsonKey(name: 'longitude') double longitude,@JsonKey(name: 'generationtime_ms') double genTimeMs,@JsonKey(name: 'utc_offset_seconds') int utcOffsetSeconds,@JsonKey(name: 'timezone') String timezone,@JsonKey(name: 'timezone_abbreviation') String timezoneAbbr,@JsonKey(name: 'elevation') double elevation,@JsonKey(name: 'current') CurrentWeatherOpenMeteo currentWeather,@protected@JsonKey(name: 'hourly') Map<String, Iterable<Object>>? hourlyWeatherMap,@protected@JsonKey(name: 'daily') Map<String, Iterable<Object>>? dailyWeatherMap
});


@override $CurrentWeatherOpenMeteoCopyWith<$Res> get currentWeather;

}
/// @nodoc
class __$ForecastOpenMeteoResponseCopyWithImpl<$Res>
    implements _$ForecastOpenMeteoResponseCopyWith<$Res> {
  __$ForecastOpenMeteoResponseCopyWithImpl(this._self, this._then);

  final _ForecastOpenMeteoResponse _self;
  final $Res Function(_ForecastOpenMeteoResponse) _then;

/// Create a copy of ForecastOpenMeteoResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? latitude = null,Object? longitude = null,Object? genTimeMs = null,Object? utcOffsetSeconds = null,Object? timezone = null,Object? timezoneAbbr = null,Object? elevation = null,Object? currentWeather = null,Object? hourlyWeatherMap = freezed,Object? dailyWeatherMap = freezed,}) {
  return _then(_ForecastOpenMeteoResponse(
latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,genTimeMs: null == genTimeMs ? _self.genTimeMs : genTimeMs // ignore: cast_nullable_to_non_nullable
as double,utcOffsetSeconds: null == utcOffsetSeconds ? _self.utcOffsetSeconds : utcOffsetSeconds // ignore: cast_nullable_to_non_nullable
as int,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,timezoneAbbr: null == timezoneAbbr ? _self.timezoneAbbr : timezoneAbbr // ignore: cast_nullable_to_non_nullable
as String,elevation: null == elevation ? _self.elevation : elevation // ignore: cast_nullable_to_non_nullable
as double,currentWeather: null == currentWeather ? _self.currentWeather : currentWeather // ignore: cast_nullable_to_non_nullable
as CurrentWeatherOpenMeteo,hourlyWeatherMap: freezed == hourlyWeatherMap ? _self._hourlyWeatherMap : hourlyWeatherMap // ignore: cast_nullable_to_non_nullable
as Map<String, Iterable<Object>>?,dailyWeatherMap: freezed == dailyWeatherMap ? _self._dailyWeatherMap : dailyWeatherMap // ignore: cast_nullable_to_non_nullable
as Map<String, Iterable<Object>>?,
  ));
}

/// Create a copy of ForecastOpenMeteoResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CurrentWeatherOpenMeteoCopyWith<$Res> get currentWeather {
  
  return $CurrentWeatherOpenMeteoCopyWith<$Res>(_self.currentWeather, (value) {
    return _then(_self.copyWith(currentWeather: value));
  });
}
}


/// @nodoc
mixin _$CurrentWeatherOpenMeteo {

/// iso8601
@JsonKey(name: 'time')@DateTimeISO8601Converter() DateTime get time;@JsonKey(name: 'interval') int get interval;@JsonKey(name: 'temperature_2m') double get temp2m;@JsonKey(name: 'relative_humidity_2m') int get relativeHumidity2m;@JsonKey(name: 'apparent_temperature') double get apparentTemp;/// 1 if the current time step has daylight, 0 at night.
@protected@JsonKey(name: 'is_day') int get isDayInt;@JsonKey(name: 'precipitation') double get precipitation;@JsonKey(name: 'rain') double get rain;/// Showers from convective precipitation in millimeters from the preceding hour, mm
///
/// Preceding hour sum.
@JsonKey(name: 'showers') double get showers;@JsonKey(name: 'snowfall') double get snowfall;@JsonKey(name: 'cloud_cover') int get cloudCover;@JsonKey(name: 'pressure_msl') double get pressureMsl;@JsonKey(name: 'wind_speed_10m') double get windSpeed10m;@JsonKey(name: 'wind_direction_10m') int get windDirection10m;@JsonKey(name: 'wind_gusts_10m') double get windGusts10m;@JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter() OpenMeteoWeatherCode get weatherCode;
/// Create a copy of CurrentWeatherOpenMeteo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentWeatherOpenMeteoCopyWith<CurrentWeatherOpenMeteo> get copyWith => _$CurrentWeatherOpenMeteoCopyWithImpl<CurrentWeatherOpenMeteo>(this as CurrentWeatherOpenMeteo, _$identity);

  /// Serializes this CurrentWeatherOpenMeteo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentWeatherOpenMeteo&&(identical(other.time, time) || other.time == time)&&(identical(other.interval, interval) || other.interval == interval)&&(identical(other.temp2m, temp2m) || other.temp2m == temp2m)&&(identical(other.relativeHumidity2m, relativeHumidity2m) || other.relativeHumidity2m == relativeHumidity2m)&&(identical(other.apparentTemp, apparentTemp) || other.apparentTemp == apparentTemp)&&(identical(other.isDayInt, isDayInt) || other.isDayInt == isDayInt)&&(identical(other.precipitation, precipitation) || other.precipitation == precipitation)&&(identical(other.rain, rain) || other.rain == rain)&&(identical(other.showers, showers) || other.showers == showers)&&(identical(other.snowfall, snowfall) || other.snowfall == snowfall)&&(identical(other.cloudCover, cloudCover) || other.cloudCover == cloudCover)&&(identical(other.pressureMsl, pressureMsl) || other.pressureMsl == pressureMsl)&&(identical(other.windSpeed10m, windSpeed10m) || other.windSpeed10m == windSpeed10m)&&(identical(other.windDirection10m, windDirection10m) || other.windDirection10m == windDirection10m)&&(identical(other.windGusts10m, windGusts10m) || other.windGusts10m == windGusts10m)&&(identical(other.weatherCode, weatherCode) || other.weatherCode == weatherCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,interval,temp2m,relativeHumidity2m,apparentTemp,isDayInt,precipitation,rain,showers,snowfall,cloudCover,pressureMsl,windSpeed10m,windDirection10m,windGusts10m,weatherCode);

@override
String toString() {
  return 'CurrentWeatherOpenMeteo(time: $time, interval: $interval, temp2m: $temp2m, relativeHumidity2m: $relativeHumidity2m, apparentTemp: $apparentTemp, isDayInt: $isDayInt, precipitation: $precipitation, rain: $rain, showers: $showers, snowfall: $snowfall, cloudCover: $cloudCover, pressureMsl: $pressureMsl, windSpeed10m: $windSpeed10m, windDirection10m: $windDirection10m, windGusts10m: $windGusts10m, weatherCode: $weatherCode)';
}


}

/// @nodoc
abstract mixin class $CurrentWeatherOpenMeteoCopyWith<$Res>  {
  factory $CurrentWeatherOpenMeteoCopyWith(CurrentWeatherOpenMeteo value, $Res Function(CurrentWeatherOpenMeteo) _then) = _$CurrentWeatherOpenMeteoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'time')@DateTimeISO8601Converter() DateTime time,@JsonKey(name: 'interval') int interval,@JsonKey(name: 'temperature_2m') double temp2m,@JsonKey(name: 'relative_humidity_2m') int relativeHumidity2m,@JsonKey(name: 'apparent_temperature') double apparentTemp,@protected@JsonKey(name: 'is_day') int isDayInt,@JsonKey(name: 'precipitation') double precipitation,@JsonKey(name: 'rain') double rain,@JsonKey(name: 'showers') double showers,@JsonKey(name: 'snowfall') double snowfall,@JsonKey(name: 'cloud_cover') int cloudCover,@JsonKey(name: 'pressure_msl') double pressureMsl,@JsonKey(name: 'wind_speed_10m') double windSpeed10m,@JsonKey(name: 'wind_direction_10m') int windDirection10m,@JsonKey(name: 'wind_gusts_10m') double windGusts10m,@JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter() OpenMeteoWeatherCode weatherCode
});




}
/// @nodoc
class _$CurrentWeatherOpenMeteoCopyWithImpl<$Res>
    implements $CurrentWeatherOpenMeteoCopyWith<$Res> {
  _$CurrentWeatherOpenMeteoCopyWithImpl(this._self, this._then);

  final CurrentWeatherOpenMeteo _self;
  final $Res Function(CurrentWeatherOpenMeteo) _then;

/// Create a copy of CurrentWeatherOpenMeteo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? interval = null,Object? temp2m = null,Object? relativeHumidity2m = null,Object? apparentTemp = null,Object? isDayInt = null,Object? precipitation = null,Object? rain = null,Object? showers = null,Object? snowfall = null,Object? cloudCover = null,Object? pressureMsl = null,Object? windSpeed10m = null,Object? windDirection10m = null,Object? windGusts10m = null,Object? weatherCode = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as int,temp2m: null == temp2m ? _self.temp2m : temp2m // ignore: cast_nullable_to_non_nullable
as double,relativeHumidity2m: null == relativeHumidity2m ? _self.relativeHumidity2m : relativeHumidity2m // ignore: cast_nullable_to_non_nullable
as int,apparentTemp: null == apparentTemp ? _self.apparentTemp : apparentTemp // ignore: cast_nullable_to_non_nullable
as double,isDayInt: null == isDayInt ? _self.isDayInt : isDayInt // ignore: cast_nullable_to_non_nullable
as int,precipitation: null == precipitation ? _self.precipitation : precipitation // ignore: cast_nullable_to_non_nullable
as double,rain: null == rain ? _self.rain : rain // ignore: cast_nullable_to_non_nullable
as double,showers: null == showers ? _self.showers : showers // ignore: cast_nullable_to_non_nullable
as double,snowfall: null == snowfall ? _self.snowfall : snowfall // ignore: cast_nullable_to_non_nullable
as double,cloudCover: null == cloudCover ? _self.cloudCover : cloudCover // ignore: cast_nullable_to_non_nullable
as int,pressureMsl: null == pressureMsl ? _self.pressureMsl : pressureMsl // ignore: cast_nullable_to_non_nullable
as double,windSpeed10m: null == windSpeed10m ? _self.windSpeed10m : windSpeed10m // ignore: cast_nullable_to_non_nullable
as double,windDirection10m: null == windDirection10m ? _self.windDirection10m : windDirection10m // ignore: cast_nullable_to_non_nullable
as int,windGusts10m: null == windGusts10m ? _self.windGusts10m : windGusts10m // ignore: cast_nullable_to_non_nullable
as double,weatherCode: null == weatherCode ? _self.weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as OpenMeteoWeatherCode,
  ));
}

}


/// Adds pattern-matching-related methods to [CurrentWeatherOpenMeteo].
extension CurrentWeatherOpenMeteoPatterns on CurrentWeatherOpenMeteo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentWeatherOpenMeteo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentWeatherOpenMeteo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentWeatherOpenMeteo value)  $default,){
final _that = this;
switch (_that) {
case _CurrentWeatherOpenMeteo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentWeatherOpenMeteo value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentWeatherOpenMeteo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'time')@DateTimeISO8601Converter()  DateTime time, @JsonKey(name: 'interval')  int interval, @JsonKey(name: 'temperature_2m')  double temp2m, @JsonKey(name: 'relative_humidity_2m')  int relativeHumidity2m, @JsonKey(name: 'apparent_temperature')  double apparentTemp, @protected@JsonKey(name: 'is_day')  int isDayInt, @JsonKey(name: 'precipitation')  double precipitation, @JsonKey(name: 'rain')  double rain, @JsonKey(name: 'showers')  double showers, @JsonKey(name: 'snowfall')  double snowfall, @JsonKey(name: 'cloud_cover')  int cloudCover, @JsonKey(name: 'pressure_msl')  double pressureMsl, @JsonKey(name: 'wind_speed_10m')  double windSpeed10m, @JsonKey(name: 'wind_direction_10m')  int windDirection10m, @JsonKey(name: 'wind_gusts_10m')  double windGusts10m, @JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter()  OpenMeteoWeatherCode weatherCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentWeatherOpenMeteo() when $default != null:
return $default(_that.time,_that.interval,_that.temp2m,_that.relativeHumidity2m,_that.apparentTemp,_that.isDayInt,_that.precipitation,_that.rain,_that.showers,_that.snowfall,_that.cloudCover,_that.pressureMsl,_that.windSpeed10m,_that.windDirection10m,_that.windGusts10m,_that.weatherCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'time')@DateTimeISO8601Converter()  DateTime time, @JsonKey(name: 'interval')  int interval, @JsonKey(name: 'temperature_2m')  double temp2m, @JsonKey(name: 'relative_humidity_2m')  int relativeHumidity2m, @JsonKey(name: 'apparent_temperature')  double apparentTemp, @protected@JsonKey(name: 'is_day')  int isDayInt, @JsonKey(name: 'precipitation')  double precipitation, @JsonKey(name: 'rain')  double rain, @JsonKey(name: 'showers')  double showers, @JsonKey(name: 'snowfall')  double snowfall, @JsonKey(name: 'cloud_cover')  int cloudCover, @JsonKey(name: 'pressure_msl')  double pressureMsl, @JsonKey(name: 'wind_speed_10m')  double windSpeed10m, @JsonKey(name: 'wind_direction_10m')  int windDirection10m, @JsonKey(name: 'wind_gusts_10m')  double windGusts10m, @JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter()  OpenMeteoWeatherCode weatherCode)  $default,) {final _that = this;
switch (_that) {
case _CurrentWeatherOpenMeteo():
return $default(_that.time,_that.interval,_that.temp2m,_that.relativeHumidity2m,_that.apparentTemp,_that.isDayInt,_that.precipitation,_that.rain,_that.showers,_that.snowfall,_that.cloudCover,_that.pressureMsl,_that.windSpeed10m,_that.windDirection10m,_that.windGusts10m,_that.weatherCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'time')@DateTimeISO8601Converter()  DateTime time, @JsonKey(name: 'interval')  int interval, @JsonKey(name: 'temperature_2m')  double temp2m, @JsonKey(name: 'relative_humidity_2m')  int relativeHumidity2m, @JsonKey(name: 'apparent_temperature')  double apparentTemp, @protected@JsonKey(name: 'is_day')  int isDayInt, @JsonKey(name: 'precipitation')  double precipitation, @JsonKey(name: 'rain')  double rain, @JsonKey(name: 'showers')  double showers, @JsonKey(name: 'snowfall')  double snowfall, @JsonKey(name: 'cloud_cover')  int cloudCover, @JsonKey(name: 'pressure_msl')  double pressureMsl, @JsonKey(name: 'wind_speed_10m')  double windSpeed10m, @JsonKey(name: 'wind_direction_10m')  int windDirection10m, @JsonKey(name: 'wind_gusts_10m')  double windGusts10m, @JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter()  OpenMeteoWeatherCode weatherCode)?  $default,) {final _that = this;
switch (_that) {
case _CurrentWeatherOpenMeteo() when $default != null:
return $default(_that.time,_that.interval,_that.temp2m,_that.relativeHumidity2m,_that.apparentTemp,_that.isDayInt,_that.precipitation,_that.rain,_that.showers,_that.snowfall,_that.cloudCover,_that.pressureMsl,_that.windSpeed10m,_that.windDirection10m,_that.windGusts10m,_that.weatherCode);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _CurrentWeatherOpenMeteo extends CurrentWeatherOpenMeteo {
  const _CurrentWeatherOpenMeteo({@JsonKey(name: 'time')@DateTimeISO8601Converter() required this.time, @JsonKey(name: 'interval') required this.interval, @JsonKey(name: 'temperature_2m') required this.temp2m, @JsonKey(name: 'relative_humidity_2m') required this.relativeHumidity2m, @JsonKey(name: 'apparent_temperature') required this.apparentTemp, @protected@JsonKey(name: 'is_day') required this.isDayInt, @JsonKey(name: 'precipitation') required this.precipitation, @JsonKey(name: 'rain') required this.rain, @JsonKey(name: 'showers') required this.showers, @JsonKey(name: 'snowfall') required this.snowfall, @JsonKey(name: 'cloud_cover') required this.cloudCover, @JsonKey(name: 'pressure_msl') required this.pressureMsl, @JsonKey(name: 'wind_speed_10m') required this.windSpeed10m, @JsonKey(name: 'wind_direction_10m') required this.windDirection10m, @JsonKey(name: 'wind_gusts_10m') required this.windGusts10m, @JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter() required this.weatherCode}): super._();
  factory _CurrentWeatherOpenMeteo.fromJson(Map<String, dynamic> json) => _$CurrentWeatherOpenMeteoFromJson(json);

/// iso8601
@override@JsonKey(name: 'time')@DateTimeISO8601Converter() final  DateTime time;
@override@JsonKey(name: 'interval') final  int interval;
@override@JsonKey(name: 'temperature_2m') final  double temp2m;
@override@JsonKey(name: 'relative_humidity_2m') final  int relativeHumidity2m;
@override@JsonKey(name: 'apparent_temperature') final  double apparentTemp;
/// 1 if the current time step has daylight, 0 at night.
@override@protected@JsonKey(name: 'is_day') final  int isDayInt;
@override@JsonKey(name: 'precipitation') final  double precipitation;
@override@JsonKey(name: 'rain') final  double rain;
/// Showers from convective precipitation in millimeters from the preceding hour, mm
///
/// Preceding hour sum.
@override@JsonKey(name: 'showers') final  double showers;
@override@JsonKey(name: 'snowfall') final  double snowfall;
@override@JsonKey(name: 'cloud_cover') final  int cloudCover;
@override@JsonKey(name: 'pressure_msl') final  double pressureMsl;
@override@JsonKey(name: 'wind_speed_10m') final  double windSpeed10m;
@override@JsonKey(name: 'wind_direction_10m') final  int windDirection10m;
@override@JsonKey(name: 'wind_gusts_10m') final  double windGusts10m;
@override@JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter() final  OpenMeteoWeatherCode weatherCode;

/// Create a copy of CurrentWeatherOpenMeteo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentWeatherOpenMeteoCopyWith<_CurrentWeatherOpenMeteo> get copyWith => __$CurrentWeatherOpenMeteoCopyWithImpl<_CurrentWeatherOpenMeteo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentWeatherOpenMeteoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentWeatherOpenMeteo&&(identical(other.time, time) || other.time == time)&&(identical(other.interval, interval) || other.interval == interval)&&(identical(other.temp2m, temp2m) || other.temp2m == temp2m)&&(identical(other.relativeHumidity2m, relativeHumidity2m) || other.relativeHumidity2m == relativeHumidity2m)&&(identical(other.apparentTemp, apparentTemp) || other.apparentTemp == apparentTemp)&&(identical(other.isDayInt, isDayInt) || other.isDayInt == isDayInt)&&(identical(other.precipitation, precipitation) || other.precipitation == precipitation)&&(identical(other.rain, rain) || other.rain == rain)&&(identical(other.showers, showers) || other.showers == showers)&&(identical(other.snowfall, snowfall) || other.snowfall == snowfall)&&(identical(other.cloudCover, cloudCover) || other.cloudCover == cloudCover)&&(identical(other.pressureMsl, pressureMsl) || other.pressureMsl == pressureMsl)&&(identical(other.windSpeed10m, windSpeed10m) || other.windSpeed10m == windSpeed10m)&&(identical(other.windDirection10m, windDirection10m) || other.windDirection10m == windDirection10m)&&(identical(other.windGusts10m, windGusts10m) || other.windGusts10m == windGusts10m)&&(identical(other.weatherCode, weatherCode) || other.weatherCode == weatherCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,interval,temp2m,relativeHumidity2m,apparentTemp,isDayInt,precipitation,rain,showers,snowfall,cloudCover,pressureMsl,windSpeed10m,windDirection10m,windGusts10m,weatherCode);

@override
String toString() {
  return 'CurrentWeatherOpenMeteo(time: $time, interval: $interval, temp2m: $temp2m, relativeHumidity2m: $relativeHumidity2m, apparentTemp: $apparentTemp, isDayInt: $isDayInt, precipitation: $precipitation, rain: $rain, showers: $showers, snowfall: $snowfall, cloudCover: $cloudCover, pressureMsl: $pressureMsl, windSpeed10m: $windSpeed10m, windDirection10m: $windDirection10m, windGusts10m: $windGusts10m, weatherCode: $weatherCode)';
}


}

/// @nodoc
abstract mixin class _$CurrentWeatherOpenMeteoCopyWith<$Res> implements $CurrentWeatherOpenMeteoCopyWith<$Res> {
  factory _$CurrentWeatherOpenMeteoCopyWith(_CurrentWeatherOpenMeteo value, $Res Function(_CurrentWeatherOpenMeteo) _then) = __$CurrentWeatherOpenMeteoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'time')@DateTimeISO8601Converter() DateTime time,@JsonKey(name: 'interval') int interval,@JsonKey(name: 'temperature_2m') double temp2m,@JsonKey(name: 'relative_humidity_2m') int relativeHumidity2m,@JsonKey(name: 'apparent_temperature') double apparentTemp,@protected@JsonKey(name: 'is_day') int isDayInt,@JsonKey(name: 'precipitation') double precipitation,@JsonKey(name: 'rain') double rain,@JsonKey(name: 'showers') double showers,@JsonKey(name: 'snowfall') double snowfall,@JsonKey(name: 'cloud_cover') int cloudCover,@JsonKey(name: 'pressure_msl') double pressureMsl,@JsonKey(name: 'wind_speed_10m') double windSpeed10m,@JsonKey(name: 'wind_direction_10m') int windDirection10m,@JsonKey(name: 'wind_gusts_10m') double windGusts10m,@JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter() OpenMeteoWeatherCode weatherCode
});




}
/// @nodoc
class __$CurrentWeatherOpenMeteoCopyWithImpl<$Res>
    implements _$CurrentWeatherOpenMeteoCopyWith<$Res> {
  __$CurrentWeatherOpenMeteoCopyWithImpl(this._self, this._then);

  final _CurrentWeatherOpenMeteo _self;
  final $Res Function(_CurrentWeatherOpenMeteo) _then;

/// Create a copy of CurrentWeatherOpenMeteo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? interval = null,Object? temp2m = null,Object? relativeHumidity2m = null,Object? apparentTemp = null,Object? isDayInt = null,Object? precipitation = null,Object? rain = null,Object? showers = null,Object? snowfall = null,Object? cloudCover = null,Object? pressureMsl = null,Object? windSpeed10m = null,Object? windDirection10m = null,Object? windGusts10m = null,Object? weatherCode = null,}) {
  return _then(_CurrentWeatherOpenMeteo(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,interval: null == interval ? _self.interval : interval // ignore: cast_nullable_to_non_nullable
as int,temp2m: null == temp2m ? _self.temp2m : temp2m // ignore: cast_nullable_to_non_nullable
as double,relativeHumidity2m: null == relativeHumidity2m ? _self.relativeHumidity2m : relativeHumidity2m // ignore: cast_nullable_to_non_nullable
as int,apparentTemp: null == apparentTemp ? _self.apparentTemp : apparentTemp // ignore: cast_nullable_to_non_nullable
as double,isDayInt: null == isDayInt ? _self.isDayInt : isDayInt // ignore: cast_nullable_to_non_nullable
as int,precipitation: null == precipitation ? _self.precipitation : precipitation // ignore: cast_nullable_to_non_nullable
as double,rain: null == rain ? _self.rain : rain // ignore: cast_nullable_to_non_nullable
as double,showers: null == showers ? _self.showers : showers // ignore: cast_nullable_to_non_nullable
as double,snowfall: null == snowfall ? _self.snowfall : snowfall // ignore: cast_nullable_to_non_nullable
as double,cloudCover: null == cloudCover ? _self.cloudCover : cloudCover // ignore: cast_nullable_to_non_nullable
as int,pressureMsl: null == pressureMsl ? _self.pressureMsl : pressureMsl // ignore: cast_nullable_to_non_nullable
as double,windSpeed10m: null == windSpeed10m ? _self.windSpeed10m : windSpeed10m // ignore: cast_nullable_to_non_nullable
as double,windDirection10m: null == windDirection10m ? _self.windDirection10m : windDirection10m // ignore: cast_nullable_to_non_nullable
as int,windGusts10m: null == windGusts10m ? _self.windGusts10m : windGusts10m // ignore: cast_nullable_to_non_nullable
as double,weatherCode: null == weatherCode ? _self.weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as OpenMeteoWeatherCode,
  ));
}


}


/// @nodoc
mixin _$HourlyWeatherOpenMeteo {

/// iso8601
@JsonKey(name: 'time')@DateTimeISO8601Converter() DateTime get time;/// Air temperature at 2 meters above ground, °C
@JsonKey(name: 'temperature_2m') double get temp2m;/// Relative humidity at 2 meters above ground, 0-100 %
@JsonKey(name: 'relative_humidity_2m') int get relativeHumidity2m;/// Dew point temperature at 2 meters above ground, °C
@JsonKey(name: 'dew_point_2m') double get dewPoint2m;/// Apparent temperature is the perceived feels-like temperature combining
/// wind chill factor, relative humidity and solar radiation, °C
@JsonKey(name: 'apparent_temperature') double get apparentTemp;/// 1 if the current time step has daylight, 0 at night.
@protected@JsonKey(name: 'is_day') int get isDayInt;/// Probability of precipitation with more than 0.1 mm of the preceding hour.
///
/// Probability is based on ensemble weather models with 0.25° (~27 km) resolution.
/// 30 different simulations are computed to better represent future weather
/// conditions, 0-100 %
@JsonKey(name: 'precipitation_probability') int get pop;/// Total precipitation (rain, showers, snow) sum of the preceding hour, mm
@JsonKey(name: 'precipitation') double get precipitation;/// Rain from large scale weather systems of the preceding hour in millimeter, mm
@JsonKey(name: 'rain') double get rain;/// Showers from convective precipitation in millimeters from the preceding hour, mm
@JsonKey(name: 'showers') double get showers;/// Snowfall amount of the preceding hour in centimeters (cm). For the water
/// equivalent in millimeter, divide by 7.
/// E.g. 7 cm snow = 10 mm precipitation water equivalent.
@JsonKey(name: 'snowfall') double get snowfall;/// Cloudiness, 0-100 %
@JsonKey(name: 'cloud_cover') int get cloudCover;/// Atmospheric air pressure reduced to mean sea level (msl) or pressure
/// at surface, hPa
///
/// Typically pressure on mean sea level is used in meteorology.
@JsonKey(name: 'pressure_msl') double get pressureMsl;/// Viewing distance in meters (m). Influenced by low clouds, humidity and aerosols.
/// Maximum visibility is approximately 24 km.
@JsonKey(name: 'visibility') double get visibility;///	Daily maximum in UV Index starting from 0.
@JsonKey(name: 'uv_index') double get uvi;/// Wind speed at 10 meters above ground, m/s
///
/// Wind speed on 10 meters is the standard level.
@JsonKey(name: 'wind_speed_10m') double get windSpeed10m;/// Wind direction at 10 meters above ground, 0-360°
@JsonKey(name: 'wind_direction_10m') int get windDirection10m;/// Gusts at 10 meters above ground as a maximum of the preceding hour, m/s
@JsonKey(name: 'wind_gusts_10m') double get windGusts10m;/// WMO Weather interpretation codes, 0-99
@JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter() OpenMeteoWeatherCode get weatherCode;
/// Create a copy of HourlyWeatherOpenMeteo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HourlyWeatherOpenMeteoCopyWith<HourlyWeatherOpenMeteo> get copyWith => _$HourlyWeatherOpenMeteoCopyWithImpl<HourlyWeatherOpenMeteo>(this as HourlyWeatherOpenMeteo, _$identity);

  /// Serializes this HourlyWeatherOpenMeteo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HourlyWeatherOpenMeteo&&(identical(other.time, time) || other.time == time)&&(identical(other.temp2m, temp2m) || other.temp2m == temp2m)&&(identical(other.relativeHumidity2m, relativeHumidity2m) || other.relativeHumidity2m == relativeHumidity2m)&&(identical(other.dewPoint2m, dewPoint2m) || other.dewPoint2m == dewPoint2m)&&(identical(other.apparentTemp, apparentTemp) || other.apparentTemp == apparentTemp)&&(identical(other.isDayInt, isDayInt) || other.isDayInt == isDayInt)&&(identical(other.pop, pop) || other.pop == pop)&&(identical(other.precipitation, precipitation) || other.precipitation == precipitation)&&(identical(other.rain, rain) || other.rain == rain)&&(identical(other.showers, showers) || other.showers == showers)&&(identical(other.snowfall, snowfall) || other.snowfall == snowfall)&&(identical(other.cloudCover, cloudCover) || other.cloudCover == cloudCover)&&(identical(other.pressureMsl, pressureMsl) || other.pressureMsl == pressureMsl)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.uvi, uvi) || other.uvi == uvi)&&(identical(other.windSpeed10m, windSpeed10m) || other.windSpeed10m == windSpeed10m)&&(identical(other.windDirection10m, windDirection10m) || other.windDirection10m == windDirection10m)&&(identical(other.windGusts10m, windGusts10m) || other.windGusts10m == windGusts10m)&&(identical(other.weatherCode, weatherCode) || other.weatherCode == weatherCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,time,temp2m,relativeHumidity2m,dewPoint2m,apparentTemp,isDayInt,pop,precipitation,rain,showers,snowfall,cloudCover,pressureMsl,visibility,uvi,windSpeed10m,windDirection10m,windGusts10m,weatherCode]);

@override
String toString() {
  return 'HourlyWeatherOpenMeteo(time: $time, temp2m: $temp2m, relativeHumidity2m: $relativeHumidity2m, dewPoint2m: $dewPoint2m, apparentTemp: $apparentTemp, isDayInt: $isDayInt, pop: $pop, precipitation: $precipitation, rain: $rain, showers: $showers, snowfall: $snowfall, cloudCover: $cloudCover, pressureMsl: $pressureMsl, visibility: $visibility, uvi: $uvi, windSpeed10m: $windSpeed10m, windDirection10m: $windDirection10m, windGusts10m: $windGusts10m, weatherCode: $weatherCode)';
}


}

/// @nodoc
abstract mixin class $HourlyWeatherOpenMeteoCopyWith<$Res>  {
  factory $HourlyWeatherOpenMeteoCopyWith(HourlyWeatherOpenMeteo value, $Res Function(HourlyWeatherOpenMeteo) _then) = _$HourlyWeatherOpenMeteoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'time')@DateTimeISO8601Converter() DateTime time,@JsonKey(name: 'temperature_2m') double temp2m,@JsonKey(name: 'relative_humidity_2m') int relativeHumidity2m,@JsonKey(name: 'dew_point_2m') double dewPoint2m,@JsonKey(name: 'apparent_temperature') double apparentTemp,@protected@JsonKey(name: 'is_day') int isDayInt,@JsonKey(name: 'precipitation_probability') int pop,@JsonKey(name: 'precipitation') double precipitation,@JsonKey(name: 'rain') double rain,@JsonKey(name: 'showers') double showers,@JsonKey(name: 'snowfall') double snowfall,@JsonKey(name: 'cloud_cover') int cloudCover,@JsonKey(name: 'pressure_msl') double pressureMsl,@JsonKey(name: 'visibility') double visibility,@JsonKey(name: 'uv_index') double uvi,@JsonKey(name: 'wind_speed_10m') double windSpeed10m,@JsonKey(name: 'wind_direction_10m') int windDirection10m,@JsonKey(name: 'wind_gusts_10m') double windGusts10m,@JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter() OpenMeteoWeatherCode weatherCode
});




}
/// @nodoc
class _$HourlyWeatherOpenMeteoCopyWithImpl<$Res>
    implements $HourlyWeatherOpenMeteoCopyWith<$Res> {
  _$HourlyWeatherOpenMeteoCopyWithImpl(this._self, this._then);

  final HourlyWeatherOpenMeteo _self;
  final $Res Function(HourlyWeatherOpenMeteo) _then;

/// Create a copy of HourlyWeatherOpenMeteo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? temp2m = null,Object? relativeHumidity2m = null,Object? dewPoint2m = null,Object? apparentTemp = null,Object? isDayInt = null,Object? pop = null,Object? precipitation = null,Object? rain = null,Object? showers = null,Object? snowfall = null,Object? cloudCover = null,Object? pressureMsl = null,Object? visibility = null,Object? uvi = null,Object? windSpeed10m = null,Object? windDirection10m = null,Object? windGusts10m = null,Object? weatherCode = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,temp2m: null == temp2m ? _self.temp2m : temp2m // ignore: cast_nullable_to_non_nullable
as double,relativeHumidity2m: null == relativeHumidity2m ? _self.relativeHumidity2m : relativeHumidity2m // ignore: cast_nullable_to_non_nullable
as int,dewPoint2m: null == dewPoint2m ? _self.dewPoint2m : dewPoint2m // ignore: cast_nullable_to_non_nullable
as double,apparentTemp: null == apparentTemp ? _self.apparentTemp : apparentTemp // ignore: cast_nullable_to_non_nullable
as double,isDayInt: null == isDayInt ? _self.isDayInt : isDayInt // ignore: cast_nullable_to_non_nullable
as int,pop: null == pop ? _self.pop : pop // ignore: cast_nullable_to_non_nullable
as int,precipitation: null == precipitation ? _self.precipitation : precipitation // ignore: cast_nullable_to_non_nullable
as double,rain: null == rain ? _self.rain : rain // ignore: cast_nullable_to_non_nullable
as double,showers: null == showers ? _self.showers : showers // ignore: cast_nullable_to_non_nullable
as double,snowfall: null == snowfall ? _self.snowfall : snowfall // ignore: cast_nullable_to_non_nullable
as double,cloudCover: null == cloudCover ? _self.cloudCover : cloudCover // ignore: cast_nullable_to_non_nullable
as int,pressureMsl: null == pressureMsl ? _self.pressureMsl : pressureMsl // ignore: cast_nullable_to_non_nullable
as double,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as double,uvi: null == uvi ? _self.uvi : uvi // ignore: cast_nullable_to_non_nullable
as double,windSpeed10m: null == windSpeed10m ? _self.windSpeed10m : windSpeed10m // ignore: cast_nullable_to_non_nullable
as double,windDirection10m: null == windDirection10m ? _self.windDirection10m : windDirection10m // ignore: cast_nullable_to_non_nullable
as int,windGusts10m: null == windGusts10m ? _self.windGusts10m : windGusts10m // ignore: cast_nullable_to_non_nullable
as double,weatherCode: null == weatherCode ? _self.weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as OpenMeteoWeatherCode,
  ));
}

}


/// Adds pattern-matching-related methods to [HourlyWeatherOpenMeteo].
extension HourlyWeatherOpenMeteoPatterns on HourlyWeatherOpenMeteo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HourlyWeatherOpenMeteo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HourlyWeatherOpenMeteo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HourlyWeatherOpenMeteo value)  $default,){
final _that = this;
switch (_that) {
case _HourlyWeatherOpenMeteo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HourlyWeatherOpenMeteo value)?  $default,){
final _that = this;
switch (_that) {
case _HourlyWeatherOpenMeteo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'time')@DateTimeISO8601Converter()  DateTime time, @JsonKey(name: 'temperature_2m')  double temp2m, @JsonKey(name: 'relative_humidity_2m')  int relativeHumidity2m, @JsonKey(name: 'dew_point_2m')  double dewPoint2m, @JsonKey(name: 'apparent_temperature')  double apparentTemp, @protected@JsonKey(name: 'is_day')  int isDayInt, @JsonKey(name: 'precipitation_probability')  int pop, @JsonKey(name: 'precipitation')  double precipitation, @JsonKey(name: 'rain')  double rain, @JsonKey(name: 'showers')  double showers, @JsonKey(name: 'snowfall')  double snowfall, @JsonKey(name: 'cloud_cover')  int cloudCover, @JsonKey(name: 'pressure_msl')  double pressureMsl, @JsonKey(name: 'visibility')  double visibility, @JsonKey(name: 'uv_index')  double uvi, @JsonKey(name: 'wind_speed_10m')  double windSpeed10m, @JsonKey(name: 'wind_direction_10m')  int windDirection10m, @JsonKey(name: 'wind_gusts_10m')  double windGusts10m, @JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter()  OpenMeteoWeatherCode weatherCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HourlyWeatherOpenMeteo() when $default != null:
return $default(_that.time,_that.temp2m,_that.relativeHumidity2m,_that.dewPoint2m,_that.apparentTemp,_that.isDayInt,_that.pop,_that.precipitation,_that.rain,_that.showers,_that.snowfall,_that.cloudCover,_that.pressureMsl,_that.visibility,_that.uvi,_that.windSpeed10m,_that.windDirection10m,_that.windGusts10m,_that.weatherCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'time')@DateTimeISO8601Converter()  DateTime time, @JsonKey(name: 'temperature_2m')  double temp2m, @JsonKey(name: 'relative_humidity_2m')  int relativeHumidity2m, @JsonKey(name: 'dew_point_2m')  double dewPoint2m, @JsonKey(name: 'apparent_temperature')  double apparentTemp, @protected@JsonKey(name: 'is_day')  int isDayInt, @JsonKey(name: 'precipitation_probability')  int pop, @JsonKey(name: 'precipitation')  double precipitation, @JsonKey(name: 'rain')  double rain, @JsonKey(name: 'showers')  double showers, @JsonKey(name: 'snowfall')  double snowfall, @JsonKey(name: 'cloud_cover')  int cloudCover, @JsonKey(name: 'pressure_msl')  double pressureMsl, @JsonKey(name: 'visibility')  double visibility, @JsonKey(name: 'uv_index')  double uvi, @JsonKey(name: 'wind_speed_10m')  double windSpeed10m, @JsonKey(name: 'wind_direction_10m')  int windDirection10m, @JsonKey(name: 'wind_gusts_10m')  double windGusts10m, @JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter()  OpenMeteoWeatherCode weatherCode)  $default,) {final _that = this;
switch (_that) {
case _HourlyWeatherOpenMeteo():
return $default(_that.time,_that.temp2m,_that.relativeHumidity2m,_that.dewPoint2m,_that.apparentTemp,_that.isDayInt,_that.pop,_that.precipitation,_that.rain,_that.showers,_that.snowfall,_that.cloudCover,_that.pressureMsl,_that.visibility,_that.uvi,_that.windSpeed10m,_that.windDirection10m,_that.windGusts10m,_that.weatherCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'time')@DateTimeISO8601Converter()  DateTime time, @JsonKey(name: 'temperature_2m')  double temp2m, @JsonKey(name: 'relative_humidity_2m')  int relativeHumidity2m, @JsonKey(name: 'dew_point_2m')  double dewPoint2m, @JsonKey(name: 'apparent_temperature')  double apparentTemp, @protected@JsonKey(name: 'is_day')  int isDayInt, @JsonKey(name: 'precipitation_probability')  int pop, @JsonKey(name: 'precipitation')  double precipitation, @JsonKey(name: 'rain')  double rain, @JsonKey(name: 'showers')  double showers, @JsonKey(name: 'snowfall')  double snowfall, @JsonKey(name: 'cloud_cover')  int cloudCover, @JsonKey(name: 'pressure_msl')  double pressureMsl, @JsonKey(name: 'visibility')  double visibility, @JsonKey(name: 'uv_index')  double uvi, @JsonKey(name: 'wind_speed_10m')  double windSpeed10m, @JsonKey(name: 'wind_direction_10m')  int windDirection10m, @JsonKey(name: 'wind_gusts_10m')  double windGusts10m, @JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter()  OpenMeteoWeatherCode weatherCode)?  $default,) {final _that = this;
switch (_that) {
case _HourlyWeatherOpenMeteo() when $default != null:
return $default(_that.time,_that.temp2m,_that.relativeHumidity2m,_that.dewPoint2m,_that.apparentTemp,_that.isDayInt,_that.pop,_that.precipitation,_that.rain,_that.showers,_that.snowfall,_that.cloudCover,_that.pressureMsl,_that.visibility,_that.uvi,_that.windSpeed10m,_that.windDirection10m,_that.windGusts10m,_that.weatherCode);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _HourlyWeatherOpenMeteo extends HourlyWeatherOpenMeteo {
  const _HourlyWeatherOpenMeteo({@JsonKey(name: 'time')@DateTimeISO8601Converter() required this.time, @JsonKey(name: 'temperature_2m') required this.temp2m, @JsonKey(name: 'relative_humidity_2m') required this.relativeHumidity2m, @JsonKey(name: 'dew_point_2m') required this.dewPoint2m, @JsonKey(name: 'apparent_temperature') required this.apparentTemp, @protected@JsonKey(name: 'is_day') required this.isDayInt, @JsonKey(name: 'precipitation_probability') required this.pop, @JsonKey(name: 'precipitation') required this.precipitation, @JsonKey(name: 'rain') required this.rain, @JsonKey(name: 'showers') required this.showers, @JsonKey(name: 'snowfall') required this.snowfall, @JsonKey(name: 'cloud_cover') required this.cloudCover, @JsonKey(name: 'pressure_msl') required this.pressureMsl, @JsonKey(name: 'visibility') required this.visibility, @JsonKey(name: 'uv_index') required this.uvi, @JsonKey(name: 'wind_speed_10m') required this.windSpeed10m, @JsonKey(name: 'wind_direction_10m') required this.windDirection10m, @JsonKey(name: 'wind_gusts_10m') required this.windGusts10m, @JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter() required this.weatherCode}): super._();
  factory _HourlyWeatherOpenMeteo.fromJson(Map<String, dynamic> json) => _$HourlyWeatherOpenMeteoFromJson(json);

/// iso8601
@override@JsonKey(name: 'time')@DateTimeISO8601Converter() final  DateTime time;
/// Air temperature at 2 meters above ground, °C
@override@JsonKey(name: 'temperature_2m') final  double temp2m;
/// Relative humidity at 2 meters above ground, 0-100 %
@override@JsonKey(name: 'relative_humidity_2m') final  int relativeHumidity2m;
/// Dew point temperature at 2 meters above ground, °C
@override@JsonKey(name: 'dew_point_2m') final  double dewPoint2m;
/// Apparent temperature is the perceived feels-like temperature combining
/// wind chill factor, relative humidity and solar radiation, °C
@override@JsonKey(name: 'apparent_temperature') final  double apparentTemp;
/// 1 if the current time step has daylight, 0 at night.
@override@protected@JsonKey(name: 'is_day') final  int isDayInt;
/// Probability of precipitation with more than 0.1 mm of the preceding hour.
///
/// Probability is based on ensemble weather models with 0.25° (~27 km) resolution.
/// 30 different simulations are computed to better represent future weather
/// conditions, 0-100 %
@override@JsonKey(name: 'precipitation_probability') final  int pop;
/// Total precipitation (rain, showers, snow) sum of the preceding hour, mm
@override@JsonKey(name: 'precipitation') final  double precipitation;
/// Rain from large scale weather systems of the preceding hour in millimeter, mm
@override@JsonKey(name: 'rain') final  double rain;
/// Showers from convective precipitation in millimeters from the preceding hour, mm
@override@JsonKey(name: 'showers') final  double showers;
/// Snowfall amount of the preceding hour in centimeters (cm). For the water
/// equivalent in millimeter, divide by 7.
/// E.g. 7 cm snow = 10 mm precipitation water equivalent.
@override@JsonKey(name: 'snowfall') final  double snowfall;
/// Cloudiness, 0-100 %
@override@JsonKey(name: 'cloud_cover') final  int cloudCover;
/// Atmospheric air pressure reduced to mean sea level (msl) or pressure
/// at surface, hPa
///
/// Typically pressure on mean sea level is used in meteorology.
@override@JsonKey(name: 'pressure_msl') final  double pressureMsl;
/// Viewing distance in meters (m). Influenced by low clouds, humidity and aerosols.
/// Maximum visibility is approximately 24 km.
@override@JsonKey(name: 'visibility') final  double visibility;
///	Daily maximum in UV Index starting from 0.
@override@JsonKey(name: 'uv_index') final  double uvi;
/// Wind speed at 10 meters above ground, m/s
///
/// Wind speed on 10 meters is the standard level.
@override@JsonKey(name: 'wind_speed_10m') final  double windSpeed10m;
/// Wind direction at 10 meters above ground, 0-360°
@override@JsonKey(name: 'wind_direction_10m') final  int windDirection10m;
/// Gusts at 10 meters above ground as a maximum of the preceding hour, m/s
@override@JsonKey(name: 'wind_gusts_10m') final  double windGusts10m;
/// WMO Weather interpretation codes, 0-99
@override@JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter() final  OpenMeteoWeatherCode weatherCode;

/// Create a copy of HourlyWeatherOpenMeteo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HourlyWeatherOpenMeteoCopyWith<_HourlyWeatherOpenMeteo> get copyWith => __$HourlyWeatherOpenMeteoCopyWithImpl<_HourlyWeatherOpenMeteo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HourlyWeatherOpenMeteoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HourlyWeatherOpenMeteo&&(identical(other.time, time) || other.time == time)&&(identical(other.temp2m, temp2m) || other.temp2m == temp2m)&&(identical(other.relativeHumidity2m, relativeHumidity2m) || other.relativeHumidity2m == relativeHumidity2m)&&(identical(other.dewPoint2m, dewPoint2m) || other.dewPoint2m == dewPoint2m)&&(identical(other.apparentTemp, apparentTemp) || other.apparentTemp == apparentTemp)&&(identical(other.isDayInt, isDayInt) || other.isDayInt == isDayInt)&&(identical(other.pop, pop) || other.pop == pop)&&(identical(other.precipitation, precipitation) || other.precipitation == precipitation)&&(identical(other.rain, rain) || other.rain == rain)&&(identical(other.showers, showers) || other.showers == showers)&&(identical(other.snowfall, snowfall) || other.snowfall == snowfall)&&(identical(other.cloudCover, cloudCover) || other.cloudCover == cloudCover)&&(identical(other.pressureMsl, pressureMsl) || other.pressureMsl == pressureMsl)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&(identical(other.uvi, uvi) || other.uvi == uvi)&&(identical(other.windSpeed10m, windSpeed10m) || other.windSpeed10m == windSpeed10m)&&(identical(other.windDirection10m, windDirection10m) || other.windDirection10m == windDirection10m)&&(identical(other.windGusts10m, windGusts10m) || other.windGusts10m == windGusts10m)&&(identical(other.weatherCode, weatherCode) || other.weatherCode == weatherCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,time,temp2m,relativeHumidity2m,dewPoint2m,apparentTemp,isDayInt,pop,precipitation,rain,showers,snowfall,cloudCover,pressureMsl,visibility,uvi,windSpeed10m,windDirection10m,windGusts10m,weatherCode]);

@override
String toString() {
  return 'HourlyWeatherOpenMeteo(time: $time, temp2m: $temp2m, relativeHumidity2m: $relativeHumidity2m, dewPoint2m: $dewPoint2m, apparentTemp: $apparentTemp, isDayInt: $isDayInt, pop: $pop, precipitation: $precipitation, rain: $rain, showers: $showers, snowfall: $snowfall, cloudCover: $cloudCover, pressureMsl: $pressureMsl, visibility: $visibility, uvi: $uvi, windSpeed10m: $windSpeed10m, windDirection10m: $windDirection10m, windGusts10m: $windGusts10m, weatherCode: $weatherCode)';
}


}

/// @nodoc
abstract mixin class _$HourlyWeatherOpenMeteoCopyWith<$Res> implements $HourlyWeatherOpenMeteoCopyWith<$Res> {
  factory _$HourlyWeatherOpenMeteoCopyWith(_HourlyWeatherOpenMeteo value, $Res Function(_HourlyWeatherOpenMeteo) _then) = __$HourlyWeatherOpenMeteoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'time')@DateTimeISO8601Converter() DateTime time,@JsonKey(name: 'temperature_2m') double temp2m,@JsonKey(name: 'relative_humidity_2m') int relativeHumidity2m,@JsonKey(name: 'dew_point_2m') double dewPoint2m,@JsonKey(name: 'apparent_temperature') double apparentTemp,@protected@JsonKey(name: 'is_day') int isDayInt,@JsonKey(name: 'precipitation_probability') int pop,@JsonKey(name: 'precipitation') double precipitation,@JsonKey(name: 'rain') double rain,@JsonKey(name: 'showers') double showers,@JsonKey(name: 'snowfall') double snowfall,@JsonKey(name: 'cloud_cover') int cloudCover,@JsonKey(name: 'pressure_msl') double pressureMsl,@JsonKey(name: 'visibility') double visibility,@JsonKey(name: 'uv_index') double uvi,@JsonKey(name: 'wind_speed_10m') double windSpeed10m,@JsonKey(name: 'wind_direction_10m') int windDirection10m,@JsonKey(name: 'wind_gusts_10m') double windGusts10m,@JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter() OpenMeteoWeatherCode weatherCode
});




}
/// @nodoc
class __$HourlyWeatherOpenMeteoCopyWithImpl<$Res>
    implements _$HourlyWeatherOpenMeteoCopyWith<$Res> {
  __$HourlyWeatherOpenMeteoCopyWithImpl(this._self, this._then);

  final _HourlyWeatherOpenMeteo _self;
  final $Res Function(_HourlyWeatherOpenMeteo) _then;

/// Create a copy of HourlyWeatherOpenMeteo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? temp2m = null,Object? relativeHumidity2m = null,Object? dewPoint2m = null,Object? apparentTemp = null,Object? isDayInt = null,Object? pop = null,Object? precipitation = null,Object? rain = null,Object? showers = null,Object? snowfall = null,Object? cloudCover = null,Object? pressureMsl = null,Object? visibility = null,Object? uvi = null,Object? windSpeed10m = null,Object? windDirection10m = null,Object? windGusts10m = null,Object? weatherCode = null,}) {
  return _then(_HourlyWeatherOpenMeteo(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,temp2m: null == temp2m ? _self.temp2m : temp2m // ignore: cast_nullable_to_non_nullable
as double,relativeHumidity2m: null == relativeHumidity2m ? _self.relativeHumidity2m : relativeHumidity2m // ignore: cast_nullable_to_non_nullable
as int,dewPoint2m: null == dewPoint2m ? _self.dewPoint2m : dewPoint2m // ignore: cast_nullable_to_non_nullable
as double,apparentTemp: null == apparentTemp ? _self.apparentTemp : apparentTemp // ignore: cast_nullable_to_non_nullable
as double,isDayInt: null == isDayInt ? _self.isDayInt : isDayInt // ignore: cast_nullable_to_non_nullable
as int,pop: null == pop ? _self.pop : pop // ignore: cast_nullable_to_non_nullable
as int,precipitation: null == precipitation ? _self.precipitation : precipitation // ignore: cast_nullable_to_non_nullable
as double,rain: null == rain ? _self.rain : rain // ignore: cast_nullable_to_non_nullable
as double,showers: null == showers ? _self.showers : showers // ignore: cast_nullable_to_non_nullable
as double,snowfall: null == snowfall ? _self.snowfall : snowfall // ignore: cast_nullable_to_non_nullable
as double,cloudCover: null == cloudCover ? _self.cloudCover : cloudCover // ignore: cast_nullable_to_non_nullable
as int,pressureMsl: null == pressureMsl ? _self.pressureMsl : pressureMsl // ignore: cast_nullable_to_non_nullable
as double,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as double,uvi: null == uvi ? _self.uvi : uvi // ignore: cast_nullable_to_non_nullable
as double,windSpeed10m: null == windSpeed10m ? _self.windSpeed10m : windSpeed10m // ignore: cast_nullable_to_non_nullable
as double,windDirection10m: null == windDirection10m ? _self.windDirection10m : windDirection10m // ignore: cast_nullable_to_non_nullable
as int,windGusts10m: null == windGusts10m ? _self.windGusts10m : windGusts10m // ignore: cast_nullable_to_non_nullable
as double,weatherCode: null == weatherCode ? _self.weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as OpenMeteoWeatherCode,
  ));
}


}


/// @nodoc
mixin _$DailyWeatherOpenMeteo {

/// iso8601
@JsonKey(name: 'time')@DateTimeISO8601Converter() DateTime get time;/// Maximum daily air temperature at 2 meters above ground, °C
@JsonKey(name: 'temperature_2m_max') double get temp2mMax;/// Minimum daily air temperature at 2 meters above ground, °C
@JsonKey(name: 'temperature_2m_min') double get temp2mMin;/// Maximum daily apparent temperature, °C
@JsonKey(name: 'apparent_temperature_max') double get apparentTempMax;/// Minimum daily apparent temperature, °C
@JsonKey(name: 'apparent_temperature_min') double get apparentTempMin;/// Sunset time, iso8601
@JsonKey(name: 'sunrise')@DateTimeISO8601Converter() DateTime get sunrise;/// Sunset time, iso8601
@JsonKey(name: 'sunset')@DateTimeISO8601Converter() DateTime get sunset;/// Number of seconds of daylight per day, seconds
@JsonKey(name: 'daylight_duration')@DurationSecConverter() Duration get daylightDur;///	Daily maximum in UV Index starting from 0.
@JsonKey(name: 'uv_index_max') double get uviMax;/// Sum of daily precipitation (including rain, showers and snowfall), mm
@JsonKey(name: 'precipitation_sum') double get precipitationSum;/// Probability of precipitation, 0-100 %
@JsonKey(name: 'precipitation_probability_max') double get popMax;/// Sum of daily rain, mm
@JsonKey(name: 'rain_sum') double get rainSum;/// Sum of daily showers, mm
@JsonKey(name: 'showers_sum') double get showersSum;/// Sum of daily snowfall, cm
@JsonKey(name: 'snowfall_sum') double get snowfallSum;/// Maximum wind speed on a day, m/s
@JsonKey(name: 'wind_speed_10m_max') double get windSpeed10mMax;/// Maximum wind gusts on a day, m/s
@JsonKey(name: 'wind_gusts_10m_max') double get windGusts10mMax;/// Dominant wind direction, 0-360°
@JsonKey(name: 'wind_direction_10m_dominant') int get windDirection10mDominant;/// WMO Weather interpretation codes, 0-99
@JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter() OpenMeteoWeatherCode get weatherCode;
/// Create a copy of DailyWeatherOpenMeteo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailyWeatherOpenMeteoCopyWith<DailyWeatherOpenMeteo> get copyWith => _$DailyWeatherOpenMeteoCopyWithImpl<DailyWeatherOpenMeteo>(this as DailyWeatherOpenMeteo, _$identity);

  /// Serializes this DailyWeatherOpenMeteo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailyWeatherOpenMeteo&&(identical(other.time, time) || other.time == time)&&(identical(other.temp2mMax, temp2mMax) || other.temp2mMax == temp2mMax)&&(identical(other.temp2mMin, temp2mMin) || other.temp2mMin == temp2mMin)&&(identical(other.apparentTempMax, apparentTempMax) || other.apparentTempMax == apparentTempMax)&&(identical(other.apparentTempMin, apparentTempMin) || other.apparentTempMin == apparentTempMin)&&(identical(other.sunrise, sunrise) || other.sunrise == sunrise)&&(identical(other.sunset, sunset) || other.sunset == sunset)&&(identical(other.daylightDur, daylightDur) || other.daylightDur == daylightDur)&&(identical(other.uviMax, uviMax) || other.uviMax == uviMax)&&(identical(other.precipitationSum, precipitationSum) || other.precipitationSum == precipitationSum)&&(identical(other.popMax, popMax) || other.popMax == popMax)&&(identical(other.rainSum, rainSum) || other.rainSum == rainSum)&&(identical(other.showersSum, showersSum) || other.showersSum == showersSum)&&(identical(other.snowfallSum, snowfallSum) || other.snowfallSum == snowfallSum)&&(identical(other.windSpeed10mMax, windSpeed10mMax) || other.windSpeed10mMax == windSpeed10mMax)&&(identical(other.windGusts10mMax, windGusts10mMax) || other.windGusts10mMax == windGusts10mMax)&&(identical(other.windDirection10mDominant, windDirection10mDominant) || other.windDirection10mDominant == windDirection10mDominant)&&(identical(other.weatherCode, weatherCode) || other.weatherCode == weatherCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,temp2mMax,temp2mMin,apparentTempMax,apparentTempMin,sunrise,sunset,daylightDur,uviMax,precipitationSum,popMax,rainSum,showersSum,snowfallSum,windSpeed10mMax,windGusts10mMax,windDirection10mDominant,weatherCode);

@override
String toString() {
  return 'DailyWeatherOpenMeteo(time: $time, temp2mMax: $temp2mMax, temp2mMin: $temp2mMin, apparentTempMax: $apparentTempMax, apparentTempMin: $apparentTempMin, sunrise: $sunrise, sunset: $sunset, daylightDur: $daylightDur, uviMax: $uviMax, precipitationSum: $precipitationSum, popMax: $popMax, rainSum: $rainSum, showersSum: $showersSum, snowfallSum: $snowfallSum, windSpeed10mMax: $windSpeed10mMax, windGusts10mMax: $windGusts10mMax, windDirection10mDominant: $windDirection10mDominant, weatherCode: $weatherCode)';
}


}

/// @nodoc
abstract mixin class $DailyWeatherOpenMeteoCopyWith<$Res>  {
  factory $DailyWeatherOpenMeteoCopyWith(DailyWeatherOpenMeteo value, $Res Function(DailyWeatherOpenMeteo) _then) = _$DailyWeatherOpenMeteoCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'time')@DateTimeISO8601Converter() DateTime time,@JsonKey(name: 'temperature_2m_max') double temp2mMax,@JsonKey(name: 'temperature_2m_min') double temp2mMin,@JsonKey(name: 'apparent_temperature_max') double apparentTempMax,@JsonKey(name: 'apparent_temperature_min') double apparentTempMin,@JsonKey(name: 'sunrise')@DateTimeISO8601Converter() DateTime sunrise,@JsonKey(name: 'sunset')@DateTimeISO8601Converter() DateTime sunset,@JsonKey(name: 'daylight_duration')@DurationSecConverter() Duration daylightDur,@JsonKey(name: 'uv_index_max') double uviMax,@JsonKey(name: 'precipitation_sum') double precipitationSum,@JsonKey(name: 'precipitation_probability_max') double popMax,@JsonKey(name: 'rain_sum') double rainSum,@JsonKey(name: 'showers_sum') double showersSum,@JsonKey(name: 'snowfall_sum') double snowfallSum,@JsonKey(name: 'wind_speed_10m_max') double windSpeed10mMax,@JsonKey(name: 'wind_gusts_10m_max') double windGusts10mMax,@JsonKey(name: 'wind_direction_10m_dominant') int windDirection10mDominant,@JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter() OpenMeteoWeatherCode weatherCode
});




}
/// @nodoc
class _$DailyWeatherOpenMeteoCopyWithImpl<$Res>
    implements $DailyWeatherOpenMeteoCopyWith<$Res> {
  _$DailyWeatherOpenMeteoCopyWithImpl(this._self, this._then);

  final DailyWeatherOpenMeteo _self;
  final $Res Function(DailyWeatherOpenMeteo) _then;

/// Create a copy of DailyWeatherOpenMeteo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? time = null,Object? temp2mMax = null,Object? temp2mMin = null,Object? apparentTempMax = null,Object? apparentTempMin = null,Object? sunrise = null,Object? sunset = null,Object? daylightDur = null,Object? uviMax = null,Object? precipitationSum = null,Object? popMax = null,Object? rainSum = null,Object? showersSum = null,Object? snowfallSum = null,Object? windSpeed10mMax = null,Object? windGusts10mMax = null,Object? windDirection10mDominant = null,Object? weatherCode = null,}) {
  return _then(_self.copyWith(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,temp2mMax: null == temp2mMax ? _self.temp2mMax : temp2mMax // ignore: cast_nullable_to_non_nullable
as double,temp2mMin: null == temp2mMin ? _self.temp2mMin : temp2mMin // ignore: cast_nullable_to_non_nullable
as double,apparentTempMax: null == apparentTempMax ? _self.apparentTempMax : apparentTempMax // ignore: cast_nullable_to_non_nullable
as double,apparentTempMin: null == apparentTempMin ? _self.apparentTempMin : apparentTempMin // ignore: cast_nullable_to_non_nullable
as double,sunrise: null == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as DateTime,sunset: null == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as DateTime,daylightDur: null == daylightDur ? _self.daylightDur : daylightDur // ignore: cast_nullable_to_non_nullable
as Duration,uviMax: null == uviMax ? _self.uviMax : uviMax // ignore: cast_nullable_to_non_nullable
as double,precipitationSum: null == precipitationSum ? _self.precipitationSum : precipitationSum // ignore: cast_nullable_to_non_nullable
as double,popMax: null == popMax ? _self.popMax : popMax // ignore: cast_nullable_to_non_nullable
as double,rainSum: null == rainSum ? _self.rainSum : rainSum // ignore: cast_nullable_to_non_nullable
as double,showersSum: null == showersSum ? _self.showersSum : showersSum // ignore: cast_nullable_to_non_nullable
as double,snowfallSum: null == snowfallSum ? _self.snowfallSum : snowfallSum // ignore: cast_nullable_to_non_nullable
as double,windSpeed10mMax: null == windSpeed10mMax ? _self.windSpeed10mMax : windSpeed10mMax // ignore: cast_nullable_to_non_nullable
as double,windGusts10mMax: null == windGusts10mMax ? _self.windGusts10mMax : windGusts10mMax // ignore: cast_nullable_to_non_nullable
as double,windDirection10mDominant: null == windDirection10mDominant ? _self.windDirection10mDominant : windDirection10mDominant // ignore: cast_nullable_to_non_nullable
as int,weatherCode: null == weatherCode ? _self.weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as OpenMeteoWeatherCode,
  ));
}

}


/// Adds pattern-matching-related methods to [DailyWeatherOpenMeteo].
extension DailyWeatherOpenMeteoPatterns on DailyWeatherOpenMeteo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailyWeatherOpenMeteo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailyWeatherOpenMeteo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailyWeatherOpenMeteo value)  $default,){
final _that = this;
switch (_that) {
case _DailyWeatherOpenMeteo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailyWeatherOpenMeteo value)?  $default,){
final _that = this;
switch (_that) {
case _DailyWeatherOpenMeteo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'time')@DateTimeISO8601Converter()  DateTime time, @JsonKey(name: 'temperature_2m_max')  double temp2mMax, @JsonKey(name: 'temperature_2m_min')  double temp2mMin, @JsonKey(name: 'apparent_temperature_max')  double apparentTempMax, @JsonKey(name: 'apparent_temperature_min')  double apparentTempMin, @JsonKey(name: 'sunrise')@DateTimeISO8601Converter()  DateTime sunrise, @JsonKey(name: 'sunset')@DateTimeISO8601Converter()  DateTime sunset, @JsonKey(name: 'daylight_duration')@DurationSecConverter()  Duration daylightDur, @JsonKey(name: 'uv_index_max')  double uviMax, @JsonKey(name: 'precipitation_sum')  double precipitationSum, @JsonKey(name: 'precipitation_probability_max')  double popMax, @JsonKey(name: 'rain_sum')  double rainSum, @JsonKey(name: 'showers_sum')  double showersSum, @JsonKey(name: 'snowfall_sum')  double snowfallSum, @JsonKey(name: 'wind_speed_10m_max')  double windSpeed10mMax, @JsonKey(name: 'wind_gusts_10m_max')  double windGusts10mMax, @JsonKey(name: 'wind_direction_10m_dominant')  int windDirection10mDominant, @JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter()  OpenMeteoWeatherCode weatherCode)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailyWeatherOpenMeteo() when $default != null:
return $default(_that.time,_that.temp2mMax,_that.temp2mMin,_that.apparentTempMax,_that.apparentTempMin,_that.sunrise,_that.sunset,_that.daylightDur,_that.uviMax,_that.precipitationSum,_that.popMax,_that.rainSum,_that.showersSum,_that.snowfallSum,_that.windSpeed10mMax,_that.windGusts10mMax,_that.windDirection10mDominant,_that.weatherCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'time')@DateTimeISO8601Converter()  DateTime time, @JsonKey(name: 'temperature_2m_max')  double temp2mMax, @JsonKey(name: 'temperature_2m_min')  double temp2mMin, @JsonKey(name: 'apparent_temperature_max')  double apparentTempMax, @JsonKey(name: 'apparent_temperature_min')  double apparentTempMin, @JsonKey(name: 'sunrise')@DateTimeISO8601Converter()  DateTime sunrise, @JsonKey(name: 'sunset')@DateTimeISO8601Converter()  DateTime sunset, @JsonKey(name: 'daylight_duration')@DurationSecConverter()  Duration daylightDur, @JsonKey(name: 'uv_index_max')  double uviMax, @JsonKey(name: 'precipitation_sum')  double precipitationSum, @JsonKey(name: 'precipitation_probability_max')  double popMax, @JsonKey(name: 'rain_sum')  double rainSum, @JsonKey(name: 'showers_sum')  double showersSum, @JsonKey(name: 'snowfall_sum')  double snowfallSum, @JsonKey(name: 'wind_speed_10m_max')  double windSpeed10mMax, @JsonKey(name: 'wind_gusts_10m_max')  double windGusts10mMax, @JsonKey(name: 'wind_direction_10m_dominant')  int windDirection10mDominant, @JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter()  OpenMeteoWeatherCode weatherCode)  $default,) {final _that = this;
switch (_that) {
case _DailyWeatherOpenMeteo():
return $default(_that.time,_that.temp2mMax,_that.temp2mMin,_that.apparentTempMax,_that.apparentTempMin,_that.sunrise,_that.sunset,_that.daylightDur,_that.uviMax,_that.precipitationSum,_that.popMax,_that.rainSum,_that.showersSum,_that.snowfallSum,_that.windSpeed10mMax,_that.windGusts10mMax,_that.windDirection10mDominant,_that.weatherCode);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'time')@DateTimeISO8601Converter()  DateTime time, @JsonKey(name: 'temperature_2m_max')  double temp2mMax, @JsonKey(name: 'temperature_2m_min')  double temp2mMin, @JsonKey(name: 'apparent_temperature_max')  double apparentTempMax, @JsonKey(name: 'apparent_temperature_min')  double apparentTempMin, @JsonKey(name: 'sunrise')@DateTimeISO8601Converter()  DateTime sunrise, @JsonKey(name: 'sunset')@DateTimeISO8601Converter()  DateTime sunset, @JsonKey(name: 'daylight_duration')@DurationSecConverter()  Duration daylightDur, @JsonKey(name: 'uv_index_max')  double uviMax, @JsonKey(name: 'precipitation_sum')  double precipitationSum, @JsonKey(name: 'precipitation_probability_max')  double popMax, @JsonKey(name: 'rain_sum')  double rainSum, @JsonKey(name: 'showers_sum')  double showersSum, @JsonKey(name: 'snowfall_sum')  double snowfallSum, @JsonKey(name: 'wind_speed_10m_max')  double windSpeed10mMax, @JsonKey(name: 'wind_gusts_10m_max')  double windGusts10mMax, @JsonKey(name: 'wind_direction_10m_dominant')  int windDirection10mDominant, @JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter()  OpenMeteoWeatherCode weatherCode)?  $default,) {final _that = this;
switch (_that) {
case _DailyWeatherOpenMeteo() when $default != null:
return $default(_that.time,_that.temp2mMax,_that.temp2mMin,_that.apparentTempMax,_that.apparentTempMin,_that.sunrise,_that.sunset,_that.daylightDur,_that.uviMax,_that.precipitationSum,_that.popMax,_that.rainSum,_that.showersSum,_that.snowfallSum,_that.windSpeed10mMax,_that.windGusts10mMax,_that.windDirection10mDominant,_that.weatherCode);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailyWeatherOpenMeteo implements DailyWeatherOpenMeteo {
  const _DailyWeatherOpenMeteo({@JsonKey(name: 'time')@DateTimeISO8601Converter() required this.time, @JsonKey(name: 'temperature_2m_max') required this.temp2mMax, @JsonKey(name: 'temperature_2m_min') required this.temp2mMin, @JsonKey(name: 'apparent_temperature_max') required this.apparentTempMax, @JsonKey(name: 'apparent_temperature_min') required this.apparentTempMin, @JsonKey(name: 'sunrise')@DateTimeISO8601Converter() required this.sunrise, @JsonKey(name: 'sunset')@DateTimeISO8601Converter() required this.sunset, @JsonKey(name: 'daylight_duration')@DurationSecConverter() required this.daylightDur, @JsonKey(name: 'uv_index_max') required this.uviMax, @JsonKey(name: 'precipitation_sum') required this.precipitationSum, @JsonKey(name: 'precipitation_probability_max') required this.popMax, @JsonKey(name: 'rain_sum') required this.rainSum, @JsonKey(name: 'showers_sum') required this.showersSum, @JsonKey(name: 'snowfall_sum') required this.snowfallSum, @JsonKey(name: 'wind_speed_10m_max') required this.windSpeed10mMax, @JsonKey(name: 'wind_gusts_10m_max') required this.windGusts10mMax, @JsonKey(name: 'wind_direction_10m_dominant') required this.windDirection10mDominant, @JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter() required this.weatherCode});
  factory _DailyWeatherOpenMeteo.fromJson(Map<String, dynamic> json) => _$DailyWeatherOpenMeteoFromJson(json);

/// iso8601
@override@JsonKey(name: 'time')@DateTimeISO8601Converter() final  DateTime time;
/// Maximum daily air temperature at 2 meters above ground, °C
@override@JsonKey(name: 'temperature_2m_max') final  double temp2mMax;
/// Minimum daily air temperature at 2 meters above ground, °C
@override@JsonKey(name: 'temperature_2m_min') final  double temp2mMin;
/// Maximum daily apparent temperature, °C
@override@JsonKey(name: 'apparent_temperature_max') final  double apparentTempMax;
/// Minimum daily apparent temperature, °C
@override@JsonKey(name: 'apparent_temperature_min') final  double apparentTempMin;
/// Sunset time, iso8601
@override@JsonKey(name: 'sunrise')@DateTimeISO8601Converter() final  DateTime sunrise;
/// Sunset time, iso8601
@override@JsonKey(name: 'sunset')@DateTimeISO8601Converter() final  DateTime sunset;
/// Number of seconds of daylight per day, seconds
@override@JsonKey(name: 'daylight_duration')@DurationSecConverter() final  Duration daylightDur;
///	Daily maximum in UV Index starting from 0.
@override@JsonKey(name: 'uv_index_max') final  double uviMax;
/// Sum of daily precipitation (including rain, showers and snowfall), mm
@override@JsonKey(name: 'precipitation_sum') final  double precipitationSum;
/// Probability of precipitation, 0-100 %
@override@JsonKey(name: 'precipitation_probability_max') final  double popMax;
/// Sum of daily rain, mm
@override@JsonKey(name: 'rain_sum') final  double rainSum;
/// Sum of daily showers, mm
@override@JsonKey(name: 'showers_sum') final  double showersSum;
/// Sum of daily snowfall, cm
@override@JsonKey(name: 'snowfall_sum') final  double snowfallSum;
/// Maximum wind speed on a day, m/s
@override@JsonKey(name: 'wind_speed_10m_max') final  double windSpeed10mMax;
/// Maximum wind gusts on a day, m/s
@override@JsonKey(name: 'wind_gusts_10m_max') final  double windGusts10mMax;
/// Dominant wind direction, 0-360°
@override@JsonKey(name: 'wind_direction_10m_dominant') final  int windDirection10mDominant;
/// WMO Weather interpretation codes, 0-99
@override@JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter() final  OpenMeteoWeatherCode weatherCode;

/// Create a copy of DailyWeatherOpenMeteo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailyWeatherOpenMeteoCopyWith<_DailyWeatherOpenMeteo> get copyWith => __$DailyWeatherOpenMeteoCopyWithImpl<_DailyWeatherOpenMeteo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailyWeatherOpenMeteoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailyWeatherOpenMeteo&&(identical(other.time, time) || other.time == time)&&(identical(other.temp2mMax, temp2mMax) || other.temp2mMax == temp2mMax)&&(identical(other.temp2mMin, temp2mMin) || other.temp2mMin == temp2mMin)&&(identical(other.apparentTempMax, apparentTempMax) || other.apparentTempMax == apparentTempMax)&&(identical(other.apparentTempMin, apparentTempMin) || other.apparentTempMin == apparentTempMin)&&(identical(other.sunrise, sunrise) || other.sunrise == sunrise)&&(identical(other.sunset, sunset) || other.sunset == sunset)&&(identical(other.daylightDur, daylightDur) || other.daylightDur == daylightDur)&&(identical(other.uviMax, uviMax) || other.uviMax == uviMax)&&(identical(other.precipitationSum, precipitationSum) || other.precipitationSum == precipitationSum)&&(identical(other.popMax, popMax) || other.popMax == popMax)&&(identical(other.rainSum, rainSum) || other.rainSum == rainSum)&&(identical(other.showersSum, showersSum) || other.showersSum == showersSum)&&(identical(other.snowfallSum, snowfallSum) || other.snowfallSum == snowfallSum)&&(identical(other.windSpeed10mMax, windSpeed10mMax) || other.windSpeed10mMax == windSpeed10mMax)&&(identical(other.windGusts10mMax, windGusts10mMax) || other.windGusts10mMax == windGusts10mMax)&&(identical(other.windDirection10mDominant, windDirection10mDominant) || other.windDirection10mDominant == windDirection10mDominant)&&(identical(other.weatherCode, weatherCode) || other.weatherCode == weatherCode));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,time,temp2mMax,temp2mMin,apparentTempMax,apparentTempMin,sunrise,sunset,daylightDur,uviMax,precipitationSum,popMax,rainSum,showersSum,snowfallSum,windSpeed10mMax,windGusts10mMax,windDirection10mDominant,weatherCode);

@override
String toString() {
  return 'DailyWeatherOpenMeteo(time: $time, temp2mMax: $temp2mMax, temp2mMin: $temp2mMin, apparentTempMax: $apparentTempMax, apparentTempMin: $apparentTempMin, sunrise: $sunrise, sunset: $sunset, daylightDur: $daylightDur, uviMax: $uviMax, precipitationSum: $precipitationSum, popMax: $popMax, rainSum: $rainSum, showersSum: $showersSum, snowfallSum: $snowfallSum, windSpeed10mMax: $windSpeed10mMax, windGusts10mMax: $windGusts10mMax, windDirection10mDominant: $windDirection10mDominant, weatherCode: $weatherCode)';
}


}

/// @nodoc
abstract mixin class _$DailyWeatherOpenMeteoCopyWith<$Res> implements $DailyWeatherOpenMeteoCopyWith<$Res> {
  factory _$DailyWeatherOpenMeteoCopyWith(_DailyWeatherOpenMeteo value, $Res Function(_DailyWeatherOpenMeteo) _then) = __$DailyWeatherOpenMeteoCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'time')@DateTimeISO8601Converter() DateTime time,@JsonKey(name: 'temperature_2m_max') double temp2mMax,@JsonKey(name: 'temperature_2m_min') double temp2mMin,@JsonKey(name: 'apparent_temperature_max') double apparentTempMax,@JsonKey(name: 'apparent_temperature_min') double apparentTempMin,@JsonKey(name: 'sunrise')@DateTimeISO8601Converter() DateTime sunrise,@JsonKey(name: 'sunset')@DateTimeISO8601Converter() DateTime sunset,@JsonKey(name: 'daylight_duration')@DurationSecConverter() Duration daylightDur,@JsonKey(name: 'uv_index_max') double uviMax,@JsonKey(name: 'precipitation_sum') double precipitationSum,@JsonKey(name: 'precipitation_probability_max') double popMax,@JsonKey(name: 'rain_sum') double rainSum,@JsonKey(name: 'showers_sum') double showersSum,@JsonKey(name: 'snowfall_sum') double snowfallSum,@JsonKey(name: 'wind_speed_10m_max') double windSpeed10mMax,@JsonKey(name: 'wind_gusts_10m_max') double windGusts10mMax,@JsonKey(name: 'wind_direction_10m_dominant') int windDirection10mDominant,@JsonKey(name: 'weather_code')@OpenMeteoWeatherCodeConverter() OpenMeteoWeatherCode weatherCode
});




}
/// @nodoc
class __$DailyWeatherOpenMeteoCopyWithImpl<$Res>
    implements _$DailyWeatherOpenMeteoCopyWith<$Res> {
  __$DailyWeatherOpenMeteoCopyWithImpl(this._self, this._then);

  final _DailyWeatherOpenMeteo _self;
  final $Res Function(_DailyWeatherOpenMeteo) _then;

/// Create a copy of DailyWeatherOpenMeteo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? time = null,Object? temp2mMax = null,Object? temp2mMin = null,Object? apparentTempMax = null,Object? apparentTempMin = null,Object? sunrise = null,Object? sunset = null,Object? daylightDur = null,Object? uviMax = null,Object? precipitationSum = null,Object? popMax = null,Object? rainSum = null,Object? showersSum = null,Object? snowfallSum = null,Object? windSpeed10mMax = null,Object? windGusts10mMax = null,Object? windDirection10mDominant = null,Object? weatherCode = null,}) {
  return _then(_DailyWeatherOpenMeteo(
time: null == time ? _self.time : time // ignore: cast_nullable_to_non_nullable
as DateTime,temp2mMax: null == temp2mMax ? _self.temp2mMax : temp2mMax // ignore: cast_nullable_to_non_nullable
as double,temp2mMin: null == temp2mMin ? _self.temp2mMin : temp2mMin // ignore: cast_nullable_to_non_nullable
as double,apparentTempMax: null == apparentTempMax ? _self.apparentTempMax : apparentTempMax // ignore: cast_nullable_to_non_nullable
as double,apparentTempMin: null == apparentTempMin ? _self.apparentTempMin : apparentTempMin // ignore: cast_nullable_to_non_nullable
as double,sunrise: null == sunrise ? _self.sunrise : sunrise // ignore: cast_nullable_to_non_nullable
as DateTime,sunset: null == sunset ? _self.sunset : sunset // ignore: cast_nullable_to_non_nullable
as DateTime,daylightDur: null == daylightDur ? _self.daylightDur : daylightDur // ignore: cast_nullable_to_non_nullable
as Duration,uviMax: null == uviMax ? _self.uviMax : uviMax // ignore: cast_nullable_to_non_nullable
as double,precipitationSum: null == precipitationSum ? _self.precipitationSum : precipitationSum // ignore: cast_nullable_to_non_nullable
as double,popMax: null == popMax ? _self.popMax : popMax // ignore: cast_nullable_to_non_nullable
as double,rainSum: null == rainSum ? _self.rainSum : rainSum // ignore: cast_nullable_to_non_nullable
as double,showersSum: null == showersSum ? _self.showersSum : showersSum // ignore: cast_nullable_to_non_nullable
as double,snowfallSum: null == snowfallSum ? _self.snowfallSum : snowfallSum // ignore: cast_nullable_to_non_nullable
as double,windSpeed10mMax: null == windSpeed10mMax ? _self.windSpeed10mMax : windSpeed10mMax // ignore: cast_nullable_to_non_nullable
as double,windGusts10mMax: null == windGusts10mMax ? _self.windGusts10mMax : windGusts10mMax // ignore: cast_nullable_to_non_nullable
as double,windDirection10mDominant: null == windDirection10mDominant ? _self.windDirection10mDominant : windDirection10mDominant // ignore: cast_nullable_to_non_nullable
as int,weatherCode: null == weatherCode ? _self.weatherCode : weatherCode // ignore: cast_nullable_to_non_nullable
as OpenMeteoWeatherCode,
  ));
}


}


/// @nodoc
mixin _$OpenMeteoPlace {

@JsonKey(name: 'id') int get id;@JsonKey(name: 'name') String get name;@JsonKey(name: 'latitude') double get latitude;@JsonKey(name: 'longitude') double get longitude;@JsonKey(name: 'elevation') double get elevation;@JsonKey(name: 'feature_code') String get featureCode;@JsonKey(name: 'country_code') String get countryCode;@JsonKey(name: 'admin1_id') int? get admin1Id;@JsonKey(name: 'admin2_id') int? get admin2Id;@JsonKey(name: 'admin3_id') int? get admin3Id;@JsonKey(name: 'admin4_id') int? get admin4Id;@JsonKey(name: 'timezone') String get timezone;@JsonKey(name: 'population') int? get population;@JsonKey(name: 'postcodes') List<String> get postcodes;@JsonKey(name: 'country_id') int get countryID;@JsonKey(name: 'country') String get country;@JsonKey(name: 'admin1') String? get admin1;@JsonKey(name: 'admin2') String? get admin2;@JsonKey(name: 'admin3') String? get admin3;@JsonKey(name: 'admin4') String? get admin4;
/// Create a copy of OpenMeteoPlace
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OpenMeteoPlaceCopyWith<OpenMeteoPlace> get copyWith => _$OpenMeteoPlaceCopyWithImpl<OpenMeteoPlace>(this as OpenMeteoPlace, _$identity);

  /// Serializes this OpenMeteoPlace to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OpenMeteoPlace&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.elevation, elevation) || other.elevation == elevation)&&(identical(other.featureCode, featureCode) || other.featureCode == featureCode)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.admin1Id, admin1Id) || other.admin1Id == admin1Id)&&(identical(other.admin2Id, admin2Id) || other.admin2Id == admin2Id)&&(identical(other.admin3Id, admin3Id) || other.admin3Id == admin3Id)&&(identical(other.admin4Id, admin4Id) || other.admin4Id == admin4Id)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.population, population) || other.population == population)&&const DeepCollectionEquality().equals(other.postcodes, postcodes)&&(identical(other.countryID, countryID) || other.countryID == countryID)&&(identical(other.country, country) || other.country == country)&&(identical(other.admin1, admin1) || other.admin1 == admin1)&&(identical(other.admin2, admin2) || other.admin2 == admin2)&&(identical(other.admin3, admin3) || other.admin3 == admin3)&&(identical(other.admin4, admin4) || other.admin4 == admin4));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,latitude,longitude,elevation,featureCode,countryCode,admin1Id,admin2Id,admin3Id,admin4Id,timezone,population,const DeepCollectionEquality().hash(postcodes),countryID,country,admin1,admin2,admin3,admin4]);

@override
String toString() {
  return 'OpenMeteoPlace(id: $id, name: $name, latitude: $latitude, longitude: $longitude, elevation: $elevation, featureCode: $featureCode, countryCode: $countryCode, admin1Id: $admin1Id, admin2Id: $admin2Id, admin3Id: $admin3Id, admin4Id: $admin4Id, timezone: $timezone, population: $population, postcodes: $postcodes, countryID: $countryID, country: $country, admin1: $admin1, admin2: $admin2, admin3: $admin3, admin4: $admin4)';
}


}

/// @nodoc
abstract mixin class $OpenMeteoPlaceCopyWith<$Res>  {
  factory $OpenMeteoPlaceCopyWith(OpenMeteoPlace value, $Res Function(OpenMeteoPlace) _then) = _$OpenMeteoPlaceCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'latitude') double latitude,@JsonKey(name: 'longitude') double longitude,@JsonKey(name: 'elevation') double elevation,@JsonKey(name: 'feature_code') String featureCode,@JsonKey(name: 'country_code') String countryCode,@JsonKey(name: 'admin1_id') int? admin1Id,@JsonKey(name: 'admin2_id') int? admin2Id,@JsonKey(name: 'admin3_id') int? admin3Id,@JsonKey(name: 'admin4_id') int? admin4Id,@JsonKey(name: 'timezone') String timezone,@JsonKey(name: 'population') int? population,@JsonKey(name: 'postcodes') List<String> postcodes,@JsonKey(name: 'country_id') int countryID,@JsonKey(name: 'country') String country,@JsonKey(name: 'admin1') String? admin1,@JsonKey(name: 'admin2') String? admin2,@JsonKey(name: 'admin3') String? admin3,@JsonKey(name: 'admin4') String? admin4
});




}
/// @nodoc
class _$OpenMeteoPlaceCopyWithImpl<$Res>
    implements $OpenMeteoPlaceCopyWith<$Res> {
  _$OpenMeteoPlaceCopyWithImpl(this._self, this._then);

  final OpenMeteoPlace _self;
  final $Res Function(OpenMeteoPlace) _then;

/// Create a copy of OpenMeteoPlace
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? latitude = null,Object? longitude = null,Object? elevation = null,Object? featureCode = null,Object? countryCode = null,Object? admin1Id = freezed,Object? admin2Id = freezed,Object? admin3Id = freezed,Object? admin4Id = freezed,Object? timezone = null,Object? population = freezed,Object? postcodes = null,Object? countryID = null,Object? country = null,Object? admin1 = freezed,Object? admin2 = freezed,Object? admin3 = freezed,Object? admin4 = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,elevation: null == elevation ? _self.elevation : elevation // ignore: cast_nullable_to_non_nullable
as double,featureCode: null == featureCode ? _self.featureCode : featureCode // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,admin1Id: freezed == admin1Id ? _self.admin1Id : admin1Id // ignore: cast_nullable_to_non_nullable
as int?,admin2Id: freezed == admin2Id ? _self.admin2Id : admin2Id // ignore: cast_nullable_to_non_nullable
as int?,admin3Id: freezed == admin3Id ? _self.admin3Id : admin3Id // ignore: cast_nullable_to_non_nullable
as int?,admin4Id: freezed == admin4Id ? _self.admin4Id : admin4Id // ignore: cast_nullable_to_non_nullable
as int?,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,population: freezed == population ? _self.population : population // ignore: cast_nullable_to_non_nullable
as int?,postcodes: null == postcodes ? _self.postcodes : postcodes // ignore: cast_nullable_to_non_nullable
as List<String>,countryID: null == countryID ? _self.countryID : countryID // ignore: cast_nullable_to_non_nullable
as int,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,admin1: freezed == admin1 ? _self.admin1 : admin1 // ignore: cast_nullable_to_non_nullable
as String?,admin2: freezed == admin2 ? _self.admin2 : admin2 // ignore: cast_nullable_to_non_nullable
as String?,admin3: freezed == admin3 ? _self.admin3 : admin3 // ignore: cast_nullable_to_non_nullable
as String?,admin4: freezed == admin4 ? _self.admin4 : admin4 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [OpenMeteoPlace].
extension OpenMeteoPlacePatterns on OpenMeteoPlace {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OpenMeteoPlace value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OpenMeteoPlace() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OpenMeteoPlace value)  $default,){
final _that = this;
switch (_that) {
case _OpenMeteoPlace():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OpenMeteoPlace value)?  $default,){
final _that = this;
switch (_that) {
case _OpenMeteoPlace() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'latitude')  double latitude, @JsonKey(name: 'longitude')  double longitude, @JsonKey(name: 'elevation')  double elevation, @JsonKey(name: 'feature_code')  String featureCode, @JsonKey(name: 'country_code')  String countryCode, @JsonKey(name: 'admin1_id')  int? admin1Id, @JsonKey(name: 'admin2_id')  int? admin2Id, @JsonKey(name: 'admin3_id')  int? admin3Id, @JsonKey(name: 'admin4_id')  int? admin4Id, @JsonKey(name: 'timezone')  String timezone, @JsonKey(name: 'population')  int? population, @JsonKey(name: 'postcodes')  List<String> postcodes, @JsonKey(name: 'country_id')  int countryID, @JsonKey(name: 'country')  String country, @JsonKey(name: 'admin1')  String? admin1, @JsonKey(name: 'admin2')  String? admin2, @JsonKey(name: 'admin3')  String? admin3, @JsonKey(name: 'admin4')  String? admin4)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OpenMeteoPlace() when $default != null:
return $default(_that.id,_that.name,_that.latitude,_that.longitude,_that.elevation,_that.featureCode,_that.countryCode,_that.admin1Id,_that.admin2Id,_that.admin3Id,_that.admin4Id,_that.timezone,_that.population,_that.postcodes,_that.countryID,_that.country,_that.admin1,_that.admin2,_that.admin3,_that.admin4);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'latitude')  double latitude, @JsonKey(name: 'longitude')  double longitude, @JsonKey(name: 'elevation')  double elevation, @JsonKey(name: 'feature_code')  String featureCode, @JsonKey(name: 'country_code')  String countryCode, @JsonKey(name: 'admin1_id')  int? admin1Id, @JsonKey(name: 'admin2_id')  int? admin2Id, @JsonKey(name: 'admin3_id')  int? admin3Id, @JsonKey(name: 'admin4_id')  int? admin4Id, @JsonKey(name: 'timezone')  String timezone, @JsonKey(name: 'population')  int? population, @JsonKey(name: 'postcodes')  List<String> postcodes, @JsonKey(name: 'country_id')  int countryID, @JsonKey(name: 'country')  String country, @JsonKey(name: 'admin1')  String? admin1, @JsonKey(name: 'admin2')  String? admin2, @JsonKey(name: 'admin3')  String? admin3, @JsonKey(name: 'admin4')  String? admin4)  $default,) {final _that = this;
switch (_that) {
case _OpenMeteoPlace():
return $default(_that.id,_that.name,_that.latitude,_that.longitude,_that.elevation,_that.featureCode,_that.countryCode,_that.admin1Id,_that.admin2Id,_that.admin3Id,_that.admin4Id,_that.timezone,_that.population,_that.postcodes,_that.countryID,_that.country,_that.admin1,_that.admin2,_that.admin3,_that.admin4);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'id')  int id, @JsonKey(name: 'name')  String name, @JsonKey(name: 'latitude')  double latitude, @JsonKey(name: 'longitude')  double longitude, @JsonKey(name: 'elevation')  double elevation, @JsonKey(name: 'feature_code')  String featureCode, @JsonKey(name: 'country_code')  String countryCode, @JsonKey(name: 'admin1_id')  int? admin1Id, @JsonKey(name: 'admin2_id')  int? admin2Id, @JsonKey(name: 'admin3_id')  int? admin3Id, @JsonKey(name: 'admin4_id')  int? admin4Id, @JsonKey(name: 'timezone')  String timezone, @JsonKey(name: 'population')  int? population, @JsonKey(name: 'postcodes')  List<String> postcodes, @JsonKey(name: 'country_id')  int countryID, @JsonKey(name: 'country')  String country, @JsonKey(name: 'admin1')  String? admin1, @JsonKey(name: 'admin2')  String? admin2, @JsonKey(name: 'admin3')  String? admin3, @JsonKey(name: 'admin4')  String? admin4)?  $default,) {final _that = this;
switch (_that) {
case _OpenMeteoPlace() when $default != null:
return $default(_that.id,_that.name,_that.latitude,_that.longitude,_that.elevation,_that.featureCode,_that.countryCode,_that.admin1Id,_that.admin2Id,_that.admin3Id,_that.admin4Id,_that.timezone,_that.population,_that.postcodes,_that.countryID,_that.country,_that.admin1,_that.admin2,_that.admin3,_that.admin4);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OpenMeteoPlace implements OpenMeteoPlace {
  const _OpenMeteoPlace({@JsonKey(name: 'id') required this.id, @JsonKey(name: 'name') required this.name, @JsonKey(name: 'latitude') required this.latitude, @JsonKey(name: 'longitude') required this.longitude, @JsonKey(name: 'elevation') required this.elevation, @JsonKey(name: 'feature_code') required this.featureCode, @JsonKey(name: 'country_code') required this.countryCode, @JsonKey(name: 'admin1_id') this.admin1Id, @JsonKey(name: 'admin2_id') this.admin2Id, @JsonKey(name: 'admin3_id') this.admin3Id, @JsonKey(name: 'admin4_id') this.admin4Id, @JsonKey(name: 'timezone') required this.timezone, @JsonKey(name: 'population') this.population, @JsonKey(name: 'postcodes') final  List<String> postcodes = const [], @JsonKey(name: 'country_id') required this.countryID, @JsonKey(name: 'country') required this.country, @JsonKey(name: 'admin1') this.admin1, @JsonKey(name: 'admin2') this.admin2, @JsonKey(name: 'admin3') this.admin3, @JsonKey(name: 'admin4') this.admin4}): _postcodes = postcodes;
  factory _OpenMeteoPlace.fromJson(Map<String, dynamic> json) => _$OpenMeteoPlaceFromJson(json);

@override@JsonKey(name: 'id') final  int id;
@override@JsonKey(name: 'name') final  String name;
@override@JsonKey(name: 'latitude') final  double latitude;
@override@JsonKey(name: 'longitude') final  double longitude;
@override@JsonKey(name: 'elevation') final  double elevation;
@override@JsonKey(name: 'feature_code') final  String featureCode;
@override@JsonKey(name: 'country_code') final  String countryCode;
@override@JsonKey(name: 'admin1_id') final  int? admin1Id;
@override@JsonKey(name: 'admin2_id') final  int? admin2Id;
@override@JsonKey(name: 'admin3_id') final  int? admin3Id;
@override@JsonKey(name: 'admin4_id') final  int? admin4Id;
@override@JsonKey(name: 'timezone') final  String timezone;
@override@JsonKey(name: 'population') final  int? population;
 final  List<String> _postcodes;
@override@JsonKey(name: 'postcodes') List<String> get postcodes {
  if (_postcodes is EqualUnmodifiableListView) return _postcodes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_postcodes);
}

@override@JsonKey(name: 'country_id') final  int countryID;
@override@JsonKey(name: 'country') final  String country;
@override@JsonKey(name: 'admin1') final  String? admin1;
@override@JsonKey(name: 'admin2') final  String? admin2;
@override@JsonKey(name: 'admin3') final  String? admin3;
@override@JsonKey(name: 'admin4') final  String? admin4;

/// Create a copy of OpenMeteoPlace
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OpenMeteoPlaceCopyWith<_OpenMeteoPlace> get copyWith => __$OpenMeteoPlaceCopyWithImpl<_OpenMeteoPlace>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OpenMeteoPlaceToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OpenMeteoPlace&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.elevation, elevation) || other.elevation == elevation)&&(identical(other.featureCode, featureCode) || other.featureCode == featureCode)&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.admin1Id, admin1Id) || other.admin1Id == admin1Id)&&(identical(other.admin2Id, admin2Id) || other.admin2Id == admin2Id)&&(identical(other.admin3Id, admin3Id) || other.admin3Id == admin3Id)&&(identical(other.admin4Id, admin4Id) || other.admin4Id == admin4Id)&&(identical(other.timezone, timezone) || other.timezone == timezone)&&(identical(other.population, population) || other.population == population)&&const DeepCollectionEquality().equals(other._postcodes, _postcodes)&&(identical(other.countryID, countryID) || other.countryID == countryID)&&(identical(other.country, country) || other.country == country)&&(identical(other.admin1, admin1) || other.admin1 == admin1)&&(identical(other.admin2, admin2) || other.admin2 == admin2)&&(identical(other.admin3, admin3) || other.admin3 == admin3)&&(identical(other.admin4, admin4) || other.admin4 == admin4));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,latitude,longitude,elevation,featureCode,countryCode,admin1Id,admin2Id,admin3Id,admin4Id,timezone,population,const DeepCollectionEquality().hash(_postcodes),countryID,country,admin1,admin2,admin3,admin4]);

@override
String toString() {
  return 'OpenMeteoPlace(id: $id, name: $name, latitude: $latitude, longitude: $longitude, elevation: $elevation, featureCode: $featureCode, countryCode: $countryCode, admin1Id: $admin1Id, admin2Id: $admin2Id, admin3Id: $admin3Id, admin4Id: $admin4Id, timezone: $timezone, population: $population, postcodes: $postcodes, countryID: $countryID, country: $country, admin1: $admin1, admin2: $admin2, admin3: $admin3, admin4: $admin4)';
}


}

/// @nodoc
abstract mixin class _$OpenMeteoPlaceCopyWith<$Res> implements $OpenMeteoPlaceCopyWith<$Res> {
  factory _$OpenMeteoPlaceCopyWith(_OpenMeteoPlace value, $Res Function(_OpenMeteoPlace) _then) = __$OpenMeteoPlaceCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'id') int id,@JsonKey(name: 'name') String name,@JsonKey(name: 'latitude') double latitude,@JsonKey(name: 'longitude') double longitude,@JsonKey(name: 'elevation') double elevation,@JsonKey(name: 'feature_code') String featureCode,@JsonKey(name: 'country_code') String countryCode,@JsonKey(name: 'admin1_id') int? admin1Id,@JsonKey(name: 'admin2_id') int? admin2Id,@JsonKey(name: 'admin3_id') int? admin3Id,@JsonKey(name: 'admin4_id') int? admin4Id,@JsonKey(name: 'timezone') String timezone,@JsonKey(name: 'population') int? population,@JsonKey(name: 'postcodes') List<String> postcodes,@JsonKey(name: 'country_id') int countryID,@JsonKey(name: 'country') String country,@JsonKey(name: 'admin1') String? admin1,@JsonKey(name: 'admin2') String? admin2,@JsonKey(name: 'admin3') String? admin3,@JsonKey(name: 'admin4') String? admin4
});




}
/// @nodoc
class __$OpenMeteoPlaceCopyWithImpl<$Res>
    implements _$OpenMeteoPlaceCopyWith<$Res> {
  __$OpenMeteoPlaceCopyWithImpl(this._self, this._then);

  final _OpenMeteoPlace _self;
  final $Res Function(_OpenMeteoPlace) _then;

/// Create a copy of OpenMeteoPlace
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? latitude = null,Object? longitude = null,Object? elevation = null,Object? featureCode = null,Object? countryCode = null,Object? admin1Id = freezed,Object? admin2Id = freezed,Object? admin3Id = freezed,Object? admin4Id = freezed,Object? timezone = null,Object? population = freezed,Object? postcodes = null,Object? countryID = null,Object? country = null,Object? admin1 = freezed,Object? admin2 = freezed,Object? admin3 = freezed,Object? admin4 = freezed,}) {
  return _then(_OpenMeteoPlace(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,latitude: null == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double,longitude: null == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double,elevation: null == elevation ? _self.elevation : elevation // ignore: cast_nullable_to_non_nullable
as double,featureCode: null == featureCode ? _self.featureCode : featureCode // ignore: cast_nullable_to_non_nullable
as String,countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,admin1Id: freezed == admin1Id ? _self.admin1Id : admin1Id // ignore: cast_nullable_to_non_nullable
as int?,admin2Id: freezed == admin2Id ? _self.admin2Id : admin2Id // ignore: cast_nullable_to_non_nullable
as int?,admin3Id: freezed == admin3Id ? _self.admin3Id : admin3Id // ignore: cast_nullable_to_non_nullable
as int?,admin4Id: freezed == admin4Id ? _self.admin4Id : admin4Id // ignore: cast_nullable_to_non_nullable
as int?,timezone: null == timezone ? _self.timezone : timezone // ignore: cast_nullable_to_non_nullable
as String,population: freezed == population ? _self.population : population // ignore: cast_nullable_to_non_nullable
as int?,postcodes: null == postcodes ? _self._postcodes : postcodes // ignore: cast_nullable_to_non_nullable
as List<String>,countryID: null == countryID ? _self.countryID : countryID // ignore: cast_nullable_to_non_nullable
as int,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,admin1: freezed == admin1 ? _self.admin1 : admin1 // ignore: cast_nullable_to_non_nullable
as String?,admin2: freezed == admin2 ? _self.admin2 : admin2 // ignore: cast_nullable_to_non_nullable
as String?,admin3: freezed == admin3 ? _self.admin3 : admin3 // ignore: cast_nullable_to_non_nullable
as String?,admin4: freezed == admin4 ? _self.admin4 : admin4 // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
