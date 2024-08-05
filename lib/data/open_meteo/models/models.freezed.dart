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

ForecastOpenMeteoResponse _$ForecastOpenMeteoResponseFromJson(
    Map<String, dynamic> json) {
  return _ForecastOpenMeteoResponse.fromJson(json);
}

/// @nodoc
mixin _$ForecastOpenMeteoResponse {
  /// Geographical WGS84 coordinates of the location. Multiple coordinates can
  /// be comma separated. E.g. &latitude=52.52,48.85&longitude=13.41,2.35.
  /// To return data for multiple locations the JSON output changes to a list
  /// of structures.
  @JsonKey(name: 'latitude')
  double get latitude => throw _privateConstructorUsedError;

  /// Geographical WGS84 coordinates of the location. Multiple coordinates can
  /// be comma separated. E.g. &latitude=52.52,48.85&longitude=13.41,2.35.
  /// To return data for multiple locations the JSON output changes to a list
  /// of structures.
  @JsonKey(name: 'longitude')
  double get longitude => throw _privateConstructorUsedError;

  /// Data generation time, ms
  @JsonKey(name: 'generationtime_ms')
  double get genTimeMs => throw _privateConstructorUsedError;
  @JsonKey(name: 'utc_offset_seconds')
  int get utcOffsetSeconds => throw _privateConstructorUsedError;

  /// If timezone is set, all timestamps are returned as local-time and data
  /// is returned starting at 00:00 local-time. Any time zone name from the
  /// time zone database is supported. If auto is set as a time zone, the
  /// coordinates will be automatically resolved to the local time zone.
  /// For multiple coordinates, a comma separated list of timezones can be
  /// specified.
  @JsonKey(name: 'timezone')
  String get timezone => throw _privateConstructorUsedError;
  @JsonKey(name: 'timezone_abbreviation')
  String get timezoneAbbr => throw _privateConstructorUsedError;

  /// The elevation used for statistical downscaling. Per default, a 90 meter
  /// digital elevation model is used. You can manually set the elevation to
  /// correctly match mountain peaks. If &elevation=nan is specified,
  /// downscaling will be disabled and the API uses the average grid-cell height.
  /// For multiple locations, elevation can also be comma separated.
  @JsonKey(name: 'elevation')
  double get elevation => throw _privateConstructorUsedError;

  /// A list of weather variables to get current conditions.
  @JsonKey(name: 'current')
  CurrentWeatherOpenMeteo get currentWeather =>
      throw _privateConstructorUsedError;

  /// A list of weather variables which should be returned. Values can be comma
  /// separated, or multiple &hourly= parameter in the URL can be used.
  @protected
  @JsonKey(name: 'hourly')
  Map<String, Iterable<Object>>? get hourlyWeatherMap =>
      throw _privateConstructorUsedError;

  /// A list of daily weather variable aggregations which should be returned.
  /// Values can be comma separated, or multiple &daily= parameter in the URL
  /// can be used. If daily weather variables are specified, parameter timezone
  /// is required.
  @protected
  @JsonKey(name: 'daily')
  Map<String, Iterable<Object>>? get dailyWeatherMap =>
      throw _privateConstructorUsedError;

  /// Serializes this ForecastOpenMeteoResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ForecastOpenMeteoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ForecastOpenMeteoResponseCopyWith<ForecastOpenMeteoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForecastOpenMeteoResponseCopyWith<$Res> {
  factory $ForecastOpenMeteoResponseCopyWith(ForecastOpenMeteoResponse value,
          $Res Function(ForecastOpenMeteoResponse) then) =
      _$ForecastOpenMeteoResponseCopyWithImpl<$Res, ForecastOpenMeteoResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'latitude') double latitude,
      @JsonKey(name: 'longitude') double longitude,
      @JsonKey(name: 'generationtime_ms') double genTimeMs,
      @JsonKey(name: 'utc_offset_seconds') int utcOffsetSeconds,
      @JsonKey(name: 'timezone') String timezone,
      @JsonKey(name: 'timezone_abbreviation') String timezoneAbbr,
      @JsonKey(name: 'elevation') double elevation,
      @JsonKey(name: 'current') CurrentWeatherOpenMeteo currentWeather,
      @protected
      @JsonKey(name: 'hourly')
      Map<String, Iterable<Object>>? hourlyWeatherMap,
      @protected
      @JsonKey(name: 'daily')
      Map<String, Iterable<Object>>? dailyWeatherMap});

  $CurrentWeatherOpenMeteoCopyWith<$Res> get currentWeather;
}

/// @nodoc
class _$ForecastOpenMeteoResponseCopyWithImpl<$Res,
        $Val extends ForecastOpenMeteoResponse>
    implements $ForecastOpenMeteoResponseCopyWith<$Res> {
  _$ForecastOpenMeteoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ForecastOpenMeteoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? genTimeMs = null,
    Object? utcOffsetSeconds = null,
    Object? timezone = null,
    Object? timezoneAbbr = null,
    Object? elevation = null,
    Object? currentWeather = null,
    Object? hourlyWeatherMap = freezed,
    Object? dailyWeatherMap = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      genTimeMs: null == genTimeMs
          ? _value.genTimeMs
          : genTimeMs // ignore: cast_nullable_to_non_nullable
              as double,
      utcOffsetSeconds: null == utcOffsetSeconds
          ? _value.utcOffsetSeconds
          : utcOffsetSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      timezoneAbbr: null == timezoneAbbr
          ? _value.timezoneAbbr
          : timezoneAbbr // ignore: cast_nullable_to_non_nullable
              as String,
      elevation: null == elevation
          ? _value.elevation
          : elevation // ignore: cast_nullable_to_non_nullable
              as double,
      currentWeather: null == currentWeather
          ? _value.currentWeather
          : currentWeather // ignore: cast_nullable_to_non_nullable
              as CurrentWeatherOpenMeteo,
      hourlyWeatherMap: freezed == hourlyWeatherMap
          ? _value.hourlyWeatherMap
          : hourlyWeatherMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Iterable<Object>>?,
      dailyWeatherMap: freezed == dailyWeatherMap
          ? _value.dailyWeatherMap
          : dailyWeatherMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Iterable<Object>>?,
    ) as $Val);
  }

  /// Create a copy of ForecastOpenMeteoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CurrentWeatherOpenMeteoCopyWith<$Res> get currentWeather {
    return $CurrentWeatherOpenMeteoCopyWith<$Res>(_value.currentWeather,
        (value) {
      return _then(_value.copyWith(currentWeather: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ForecastOpenMeteoResponseImplCopyWith<$Res>
    implements $ForecastOpenMeteoResponseCopyWith<$Res> {
  factory _$$ForecastOpenMeteoResponseImplCopyWith(
          _$ForecastOpenMeteoResponseImpl value,
          $Res Function(_$ForecastOpenMeteoResponseImpl) then) =
      __$$ForecastOpenMeteoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'latitude') double latitude,
      @JsonKey(name: 'longitude') double longitude,
      @JsonKey(name: 'generationtime_ms') double genTimeMs,
      @JsonKey(name: 'utc_offset_seconds') int utcOffsetSeconds,
      @JsonKey(name: 'timezone') String timezone,
      @JsonKey(name: 'timezone_abbreviation') String timezoneAbbr,
      @JsonKey(name: 'elevation') double elevation,
      @JsonKey(name: 'current') CurrentWeatherOpenMeteo currentWeather,
      @protected
      @JsonKey(name: 'hourly')
      Map<String, Iterable<Object>>? hourlyWeatherMap,
      @protected
      @JsonKey(name: 'daily')
      Map<String, Iterable<Object>>? dailyWeatherMap});

  @override
  $CurrentWeatherOpenMeteoCopyWith<$Res> get currentWeather;
}

/// @nodoc
class __$$ForecastOpenMeteoResponseImplCopyWithImpl<$Res>
    extends _$ForecastOpenMeteoResponseCopyWithImpl<$Res,
        _$ForecastOpenMeteoResponseImpl>
    implements _$$ForecastOpenMeteoResponseImplCopyWith<$Res> {
  __$$ForecastOpenMeteoResponseImplCopyWithImpl(
      _$ForecastOpenMeteoResponseImpl _value,
      $Res Function(_$ForecastOpenMeteoResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ForecastOpenMeteoResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = null,
    Object? longitude = null,
    Object? genTimeMs = null,
    Object? utcOffsetSeconds = null,
    Object? timezone = null,
    Object? timezoneAbbr = null,
    Object? elevation = null,
    Object? currentWeather = null,
    Object? hourlyWeatherMap = freezed,
    Object? dailyWeatherMap = freezed,
  }) {
    return _then(_$ForecastOpenMeteoResponseImpl(
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double,
      genTimeMs: null == genTimeMs
          ? _value.genTimeMs
          : genTimeMs // ignore: cast_nullable_to_non_nullable
              as double,
      utcOffsetSeconds: null == utcOffsetSeconds
          ? _value.utcOffsetSeconds
          : utcOffsetSeconds // ignore: cast_nullable_to_non_nullable
              as int,
      timezone: null == timezone
          ? _value.timezone
          : timezone // ignore: cast_nullable_to_non_nullable
              as String,
      timezoneAbbr: null == timezoneAbbr
          ? _value.timezoneAbbr
          : timezoneAbbr // ignore: cast_nullable_to_non_nullable
              as String,
      elevation: null == elevation
          ? _value.elevation
          : elevation // ignore: cast_nullable_to_non_nullable
              as double,
      currentWeather: null == currentWeather
          ? _value.currentWeather
          : currentWeather // ignore: cast_nullable_to_non_nullable
              as CurrentWeatherOpenMeteo,
      hourlyWeatherMap: freezed == hourlyWeatherMap
          ? _value._hourlyWeatherMap
          : hourlyWeatherMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Iterable<Object>>?,
      dailyWeatherMap: freezed == dailyWeatherMap
          ? _value._dailyWeatherMap
          : dailyWeatherMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Iterable<Object>>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ForecastOpenMeteoResponseImpl extends _ForecastOpenMeteoResponse {
  const _$ForecastOpenMeteoResponseImpl(
      {@JsonKey(name: 'latitude') required this.latitude,
      @JsonKey(name: 'longitude') required this.longitude,
      @JsonKey(name: 'generationtime_ms') required this.genTimeMs,
      @JsonKey(name: 'utc_offset_seconds') required this.utcOffsetSeconds,
      @JsonKey(name: 'timezone') required this.timezone,
      @JsonKey(name: 'timezone_abbreviation') required this.timezoneAbbr,
      @JsonKey(name: 'elevation') required this.elevation,
      @JsonKey(name: 'current') required this.currentWeather,
      @protected
      @JsonKey(name: 'hourly')
      final Map<String, Iterable<Object>>? hourlyWeatherMap,
      @protected
      @JsonKey(name: 'daily')
      final Map<String, Iterable<Object>>? dailyWeatherMap})
      : _hourlyWeatherMap = hourlyWeatherMap,
        _dailyWeatherMap = dailyWeatherMap,
        super._();

  factory _$ForecastOpenMeteoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ForecastOpenMeteoResponseImplFromJson(json);

  /// Geographical WGS84 coordinates of the location. Multiple coordinates can
  /// be comma separated. E.g. &latitude=52.52,48.85&longitude=13.41,2.35.
  /// To return data for multiple locations the JSON output changes to a list
  /// of structures.
  @override
  @JsonKey(name: 'latitude')
  final double latitude;

  /// Geographical WGS84 coordinates of the location. Multiple coordinates can
  /// be comma separated. E.g. &latitude=52.52,48.85&longitude=13.41,2.35.
  /// To return data for multiple locations the JSON output changes to a list
  /// of structures.
  @override
  @JsonKey(name: 'longitude')
  final double longitude;

  /// Data generation time, ms
  @override
  @JsonKey(name: 'generationtime_ms')
  final double genTimeMs;
  @override
  @JsonKey(name: 'utc_offset_seconds')
  final int utcOffsetSeconds;

  /// If timezone is set, all timestamps are returned as local-time and data
  /// is returned starting at 00:00 local-time. Any time zone name from the
  /// time zone database is supported. If auto is set as a time zone, the
  /// coordinates will be automatically resolved to the local time zone.
  /// For multiple coordinates, a comma separated list of timezones can be
  /// specified.
  @override
  @JsonKey(name: 'timezone')
  final String timezone;
  @override
  @JsonKey(name: 'timezone_abbreviation')
  final String timezoneAbbr;

  /// The elevation used for statistical downscaling. Per default, a 90 meter
  /// digital elevation model is used. You can manually set the elevation to
  /// correctly match mountain peaks. If &elevation=nan is specified,
  /// downscaling will be disabled and the API uses the average grid-cell height.
  /// For multiple locations, elevation can also be comma separated.
  @override
  @JsonKey(name: 'elevation')
  final double elevation;

  /// A list of weather variables to get current conditions.
  @override
  @JsonKey(name: 'current')
  final CurrentWeatherOpenMeteo currentWeather;

  /// A list of weather variables which should be returned. Values can be comma
  /// separated, or multiple &hourly= parameter in the URL can be used.
  final Map<String, Iterable<Object>>? _hourlyWeatherMap;

  /// A list of weather variables which should be returned. Values can be comma
  /// separated, or multiple &hourly= parameter in the URL can be used.
  @override
  @protected
  @JsonKey(name: 'hourly')
  Map<String, Iterable<Object>>? get hourlyWeatherMap {
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
  final Map<String, Iterable<Object>>? _dailyWeatherMap;

  /// A list of daily weather variable aggregations which should be returned.
  /// Values can be comma separated, or multiple &daily= parameter in the URL
  /// can be used. If daily weather variables are specified, parameter timezone
  /// is required.
  @override
  @protected
  @JsonKey(name: 'daily')
  Map<String, Iterable<Object>>? get dailyWeatherMap {
    final value = _dailyWeatherMap;
    if (value == null) return null;
    if (_dailyWeatherMap is EqualUnmodifiableMapView) return _dailyWeatherMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'ForecastOpenMeteoResponse(latitude: $latitude, longitude: $longitude, genTimeMs: $genTimeMs, utcOffsetSeconds: $utcOffsetSeconds, timezone: $timezone, timezoneAbbr: $timezoneAbbr, elevation: $elevation, currentWeather: $currentWeather, hourlyWeatherMap: $hourlyWeatherMap, dailyWeatherMap: $dailyWeatherMap)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForecastOpenMeteoResponseImpl &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.genTimeMs, genTimeMs) ||
                other.genTimeMs == genTimeMs) &&
            (identical(other.utcOffsetSeconds, utcOffsetSeconds) ||
                other.utcOffsetSeconds == utcOffsetSeconds) &&
            (identical(other.timezone, timezone) ||
                other.timezone == timezone) &&
            (identical(other.timezoneAbbr, timezoneAbbr) ||
                other.timezoneAbbr == timezoneAbbr) &&
            (identical(other.elevation, elevation) ||
                other.elevation == elevation) &&
            (identical(other.currentWeather, currentWeather) ||
                other.currentWeather == currentWeather) &&
            const DeepCollectionEquality()
                .equals(other._hourlyWeatherMap, _hourlyWeatherMap) &&
            const DeepCollectionEquality()
                .equals(other._dailyWeatherMap, _dailyWeatherMap));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      latitude,
      longitude,
      genTimeMs,
      utcOffsetSeconds,
      timezone,
      timezoneAbbr,
      elevation,
      currentWeather,
      const DeepCollectionEquality().hash(_hourlyWeatherMap),
      const DeepCollectionEquality().hash(_dailyWeatherMap));

  /// Create a copy of ForecastOpenMeteoResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ForecastOpenMeteoResponseImplCopyWith<_$ForecastOpenMeteoResponseImpl>
      get copyWith => __$$ForecastOpenMeteoResponseImplCopyWithImpl<
          _$ForecastOpenMeteoResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ForecastOpenMeteoResponseImplToJson(
      this,
    );
  }
}

abstract class _ForecastOpenMeteoResponse extends ForecastOpenMeteoResponse {
  const factory _ForecastOpenMeteoResponse(
      {@JsonKey(name: 'latitude') required final double latitude,
      @JsonKey(name: 'longitude') required final double longitude,
      @JsonKey(name: 'generationtime_ms') required final double genTimeMs,
      @JsonKey(name: 'utc_offset_seconds') required final int utcOffsetSeconds,
      @JsonKey(name: 'timezone') required final String timezone,
      @JsonKey(name: 'timezone_abbreviation')
      required final String timezoneAbbr,
      @JsonKey(name: 'elevation') required final double elevation,
      @JsonKey(name: 'current')
      required final CurrentWeatherOpenMeteo currentWeather,
      @protected
      @JsonKey(name: 'hourly')
      final Map<String, Iterable<Object>>? hourlyWeatherMap,
      @protected
      @JsonKey(name: 'daily')
      final Map<String, Iterable<Object>>?
          dailyWeatherMap}) = _$ForecastOpenMeteoResponseImpl;
  const _ForecastOpenMeteoResponse._() : super._();

  factory _ForecastOpenMeteoResponse.fromJson(Map<String, dynamic> json) =
      _$ForecastOpenMeteoResponseImpl.fromJson;

  /// Geographical WGS84 coordinates of the location. Multiple coordinates can
  /// be comma separated. E.g. &latitude=52.52,48.85&longitude=13.41,2.35.
  /// To return data for multiple locations the JSON output changes to a list
  /// of structures.
  @override
  @JsonKey(name: 'latitude')
  double get latitude;

  /// Geographical WGS84 coordinates of the location. Multiple coordinates can
  /// be comma separated. E.g. &latitude=52.52,48.85&longitude=13.41,2.35.
  /// To return data for multiple locations the JSON output changes to a list
  /// of structures.
  @override
  @JsonKey(name: 'longitude')
  double get longitude;

  /// Data generation time, ms
  @override
  @JsonKey(name: 'generationtime_ms')
  double get genTimeMs;
  @override
  @JsonKey(name: 'utc_offset_seconds')
  int get utcOffsetSeconds;

  /// If timezone is set, all timestamps are returned as local-time and data
  /// is returned starting at 00:00 local-time. Any time zone name from the
  /// time zone database is supported. If auto is set as a time zone, the
  /// coordinates will be automatically resolved to the local time zone.
  /// For multiple coordinates, a comma separated list of timezones can be
  /// specified.
  @override
  @JsonKey(name: 'timezone')
  String get timezone;
  @override
  @JsonKey(name: 'timezone_abbreviation')
  String get timezoneAbbr;

  /// The elevation used for statistical downscaling. Per default, a 90 meter
  /// digital elevation model is used. You can manually set the elevation to
  /// correctly match mountain peaks. If &elevation=nan is specified,
  /// downscaling will be disabled and the API uses the average grid-cell height.
  /// For multiple locations, elevation can also be comma separated.
  @override
  @JsonKey(name: 'elevation')
  double get elevation;

  /// A list of weather variables to get current conditions.
  @override
  @JsonKey(name: 'current')
  CurrentWeatherOpenMeteo get currentWeather;

  /// A list of weather variables which should be returned. Values can be comma
  /// separated, or multiple &hourly= parameter in the URL can be used.
  @override
  @protected
  @JsonKey(name: 'hourly')
  Map<String, Iterable<Object>>? get hourlyWeatherMap;

  /// A list of daily weather variable aggregations which should be returned.
  /// Values can be comma separated, or multiple &daily= parameter in the URL
  /// can be used. If daily weather variables are specified, parameter timezone
  /// is required.
  @override
  @protected
  @JsonKey(name: 'daily')
  Map<String, Iterable<Object>>? get dailyWeatherMap;

  /// Create a copy of ForecastOpenMeteoResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ForecastOpenMeteoResponseImplCopyWith<_$ForecastOpenMeteoResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

CurrentWeatherOpenMeteo _$CurrentWeatherOpenMeteoFromJson(
    Map<String, dynamic> json) {
  return _CurrentWeatherOpenMeteo.fromJson(json);
}

/// @nodoc
mixin _$CurrentWeatherOpenMeteo {
  /// iso8601
  @JsonKey(name: 'time')
  @DateTimeISO8601Converter()
  DateTime get time => throw _privateConstructorUsedError;
  @JsonKey(name: 'interval')
  int get interval => throw _privateConstructorUsedError;
  @JsonKey(name: 'temperature_2m')
  double get temp2m => throw _privateConstructorUsedError;
  @JsonKey(name: 'relative_humidity_2m')
  int get relativeHumidity2m => throw _privateConstructorUsedError;
  @JsonKey(name: 'apparent_temperature')
  double get apparentTemp => throw _privateConstructorUsedError;

  /// 1 if the current time step has daylight, 0 at night.
  @protected
  @JsonKey(name: 'is_day')
  int get isDayInt => throw _privateConstructorUsedError;
  @JsonKey(name: 'precipitation')
  double get precipitation => throw _privateConstructorUsedError;
  @JsonKey(name: 'rain')
  double get rain => throw _privateConstructorUsedError;

  /// Showers from convective precipitation in millimeters from the preceding hour, mm
  ///
  /// Preceding hour sum.
  @JsonKey(name: 'showers')
  double get showers => throw _privateConstructorUsedError;
  @JsonKey(name: 'snowfall')
  double get snowfall => throw _privateConstructorUsedError;
  @JsonKey(name: 'cloud_cover')
  int get cloudCover => throw _privateConstructorUsedError;
  @JsonKey(name: 'pressure_msl')
  double get pressureMsl => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_speed_10m')
  double get windSpeed10m => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_direction_10m')
  int get windDirection10m => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_gusts_10m')
  double get windGusts10m => throw _privateConstructorUsedError;
  @JsonKey(name: 'weather_code')
  @OpenMeteoWeatherCodeConverter()
  OpenMeteoWeatherCode get weatherCode => throw _privateConstructorUsedError;

  /// Serializes this CurrentWeatherOpenMeteo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurrentWeatherOpenMeteo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrentWeatherOpenMeteoCopyWith<CurrentWeatherOpenMeteo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentWeatherOpenMeteoCopyWith<$Res> {
  factory $CurrentWeatherOpenMeteoCopyWith(CurrentWeatherOpenMeteo value,
          $Res Function(CurrentWeatherOpenMeteo) then) =
      _$CurrentWeatherOpenMeteoCopyWithImpl<$Res, CurrentWeatherOpenMeteo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'time') @DateTimeISO8601Converter() DateTime time,
      @JsonKey(name: 'interval') int interval,
      @JsonKey(name: 'temperature_2m') double temp2m,
      @JsonKey(name: 'relative_humidity_2m') int relativeHumidity2m,
      @JsonKey(name: 'apparent_temperature') double apparentTemp,
      @protected @JsonKey(name: 'is_day') int isDayInt,
      @JsonKey(name: 'precipitation') double precipitation,
      @JsonKey(name: 'rain') double rain,
      @JsonKey(name: 'showers') double showers,
      @JsonKey(name: 'snowfall') double snowfall,
      @JsonKey(name: 'cloud_cover') int cloudCover,
      @JsonKey(name: 'pressure_msl') double pressureMsl,
      @JsonKey(name: 'wind_speed_10m') double windSpeed10m,
      @JsonKey(name: 'wind_direction_10m') int windDirection10m,
      @JsonKey(name: 'wind_gusts_10m') double windGusts10m,
      @JsonKey(name: 'weather_code')
      @OpenMeteoWeatherCodeConverter()
      OpenMeteoWeatherCode weatherCode});
}

/// @nodoc
class _$CurrentWeatherOpenMeteoCopyWithImpl<$Res,
        $Val extends CurrentWeatherOpenMeteo>
    implements $CurrentWeatherOpenMeteoCopyWith<$Res> {
  _$CurrentWeatherOpenMeteoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrentWeatherOpenMeteo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? interval = null,
    Object? temp2m = null,
    Object? relativeHumidity2m = null,
    Object? apparentTemp = null,
    Object? isDayInt = null,
    Object? precipitation = null,
    Object? rain = null,
    Object? showers = null,
    Object? snowfall = null,
    Object? cloudCover = null,
    Object? pressureMsl = null,
    Object? windSpeed10m = null,
    Object? windDirection10m = null,
    Object? windGusts10m = null,
    Object? weatherCode = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      temp2m: null == temp2m
          ? _value.temp2m
          : temp2m // ignore: cast_nullable_to_non_nullable
              as double,
      relativeHumidity2m: null == relativeHumidity2m
          ? _value.relativeHumidity2m
          : relativeHumidity2m // ignore: cast_nullable_to_non_nullable
              as int,
      apparentTemp: null == apparentTemp
          ? _value.apparentTemp
          : apparentTemp // ignore: cast_nullable_to_non_nullable
              as double,
      isDayInt: null == isDayInt
          ? _value.isDayInt
          : isDayInt // ignore: cast_nullable_to_non_nullable
              as int,
      precipitation: null == precipitation
          ? _value.precipitation
          : precipitation // ignore: cast_nullable_to_non_nullable
              as double,
      rain: null == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as double,
      showers: null == showers
          ? _value.showers
          : showers // ignore: cast_nullable_to_non_nullable
              as double,
      snowfall: null == snowfall
          ? _value.snowfall
          : snowfall // ignore: cast_nullable_to_non_nullable
              as double,
      cloudCover: null == cloudCover
          ? _value.cloudCover
          : cloudCover // ignore: cast_nullable_to_non_nullable
              as int,
      pressureMsl: null == pressureMsl
          ? _value.pressureMsl
          : pressureMsl // ignore: cast_nullable_to_non_nullable
              as double,
      windSpeed10m: null == windSpeed10m
          ? _value.windSpeed10m
          : windSpeed10m // ignore: cast_nullable_to_non_nullable
              as double,
      windDirection10m: null == windDirection10m
          ? _value.windDirection10m
          : windDirection10m // ignore: cast_nullable_to_non_nullable
              as int,
      windGusts10m: null == windGusts10m
          ? _value.windGusts10m
          : windGusts10m // ignore: cast_nullable_to_non_nullable
              as double,
      weatherCode: null == weatherCode
          ? _value.weatherCode
          : weatherCode // ignore: cast_nullable_to_non_nullable
              as OpenMeteoWeatherCode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CurrentWeatherOpenMeteoImplCopyWith<$Res>
    implements $CurrentWeatherOpenMeteoCopyWith<$Res> {
  factory _$$CurrentWeatherOpenMeteoImplCopyWith(
          _$CurrentWeatherOpenMeteoImpl value,
          $Res Function(_$CurrentWeatherOpenMeteoImpl) then) =
      __$$CurrentWeatherOpenMeteoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'time') @DateTimeISO8601Converter() DateTime time,
      @JsonKey(name: 'interval') int interval,
      @JsonKey(name: 'temperature_2m') double temp2m,
      @JsonKey(name: 'relative_humidity_2m') int relativeHumidity2m,
      @JsonKey(name: 'apparent_temperature') double apparentTemp,
      @protected @JsonKey(name: 'is_day') int isDayInt,
      @JsonKey(name: 'precipitation') double precipitation,
      @JsonKey(name: 'rain') double rain,
      @JsonKey(name: 'showers') double showers,
      @JsonKey(name: 'snowfall') double snowfall,
      @JsonKey(name: 'cloud_cover') int cloudCover,
      @JsonKey(name: 'pressure_msl') double pressureMsl,
      @JsonKey(name: 'wind_speed_10m') double windSpeed10m,
      @JsonKey(name: 'wind_direction_10m') int windDirection10m,
      @JsonKey(name: 'wind_gusts_10m') double windGusts10m,
      @JsonKey(name: 'weather_code')
      @OpenMeteoWeatherCodeConverter()
      OpenMeteoWeatherCode weatherCode});
}

/// @nodoc
class __$$CurrentWeatherOpenMeteoImplCopyWithImpl<$Res>
    extends _$CurrentWeatherOpenMeteoCopyWithImpl<$Res,
        _$CurrentWeatherOpenMeteoImpl>
    implements _$$CurrentWeatherOpenMeteoImplCopyWith<$Res> {
  __$$CurrentWeatherOpenMeteoImplCopyWithImpl(
      _$CurrentWeatherOpenMeteoImpl _value,
      $Res Function(_$CurrentWeatherOpenMeteoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrentWeatherOpenMeteo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? interval = null,
    Object? temp2m = null,
    Object? relativeHumidity2m = null,
    Object? apparentTemp = null,
    Object? isDayInt = null,
    Object? precipitation = null,
    Object? rain = null,
    Object? showers = null,
    Object? snowfall = null,
    Object? cloudCover = null,
    Object? pressureMsl = null,
    Object? windSpeed10m = null,
    Object? windDirection10m = null,
    Object? windGusts10m = null,
    Object? weatherCode = null,
  }) {
    return _then(_$CurrentWeatherOpenMeteoImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      interval: null == interval
          ? _value.interval
          : interval // ignore: cast_nullable_to_non_nullable
              as int,
      temp2m: null == temp2m
          ? _value.temp2m
          : temp2m // ignore: cast_nullable_to_non_nullable
              as double,
      relativeHumidity2m: null == relativeHumidity2m
          ? _value.relativeHumidity2m
          : relativeHumidity2m // ignore: cast_nullable_to_non_nullable
              as int,
      apparentTemp: null == apparentTemp
          ? _value.apparentTemp
          : apparentTemp // ignore: cast_nullable_to_non_nullable
              as double,
      isDayInt: null == isDayInt
          ? _value.isDayInt
          : isDayInt // ignore: cast_nullable_to_non_nullable
              as int,
      precipitation: null == precipitation
          ? _value.precipitation
          : precipitation // ignore: cast_nullable_to_non_nullable
              as double,
      rain: null == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as double,
      showers: null == showers
          ? _value.showers
          : showers // ignore: cast_nullable_to_non_nullable
              as double,
      snowfall: null == snowfall
          ? _value.snowfall
          : snowfall // ignore: cast_nullable_to_non_nullable
              as double,
      cloudCover: null == cloudCover
          ? _value.cloudCover
          : cloudCover // ignore: cast_nullable_to_non_nullable
              as int,
      pressureMsl: null == pressureMsl
          ? _value.pressureMsl
          : pressureMsl // ignore: cast_nullable_to_non_nullable
              as double,
      windSpeed10m: null == windSpeed10m
          ? _value.windSpeed10m
          : windSpeed10m // ignore: cast_nullable_to_non_nullable
              as double,
      windDirection10m: null == windDirection10m
          ? _value.windDirection10m
          : windDirection10m // ignore: cast_nullable_to_non_nullable
              as int,
      windGusts10m: null == windGusts10m
          ? _value.windGusts10m
          : windGusts10m // ignore: cast_nullable_to_non_nullable
              as double,
      weatherCode: null == weatherCode
          ? _value.weatherCode
          : weatherCode // ignore: cast_nullable_to_non_nullable
              as OpenMeteoWeatherCode,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CurrentWeatherOpenMeteoImpl extends _CurrentWeatherOpenMeteo {
  const _$CurrentWeatherOpenMeteoImpl(
      {@JsonKey(name: 'time') @DateTimeISO8601Converter() required this.time,
      @JsonKey(name: 'interval') required this.interval,
      @JsonKey(name: 'temperature_2m') required this.temp2m,
      @JsonKey(name: 'relative_humidity_2m') required this.relativeHumidity2m,
      @JsonKey(name: 'apparent_temperature') required this.apparentTemp,
      @protected @JsonKey(name: 'is_day') required this.isDayInt,
      @JsonKey(name: 'precipitation') required this.precipitation,
      @JsonKey(name: 'rain') required this.rain,
      @JsonKey(name: 'showers') required this.showers,
      @JsonKey(name: 'snowfall') required this.snowfall,
      @JsonKey(name: 'cloud_cover') required this.cloudCover,
      @JsonKey(name: 'pressure_msl') required this.pressureMsl,
      @JsonKey(name: 'wind_speed_10m') required this.windSpeed10m,
      @JsonKey(name: 'wind_direction_10m') required this.windDirection10m,
      @JsonKey(name: 'wind_gusts_10m') required this.windGusts10m,
      @JsonKey(name: 'weather_code')
      @OpenMeteoWeatherCodeConverter()
      required this.weatherCode})
      : super._();

  factory _$CurrentWeatherOpenMeteoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CurrentWeatherOpenMeteoImplFromJson(json);

  /// iso8601
  @override
  @JsonKey(name: 'time')
  @DateTimeISO8601Converter()
  final DateTime time;
  @override
  @JsonKey(name: 'interval')
  final int interval;
  @override
  @JsonKey(name: 'temperature_2m')
  final double temp2m;
  @override
  @JsonKey(name: 'relative_humidity_2m')
  final int relativeHumidity2m;
  @override
  @JsonKey(name: 'apparent_temperature')
  final double apparentTemp;

  /// 1 if the current time step has daylight, 0 at night.
  @override
  @protected
  @JsonKey(name: 'is_day')
  final int isDayInt;
  @override
  @JsonKey(name: 'precipitation')
  final double precipitation;
  @override
  @JsonKey(name: 'rain')
  final double rain;

  /// Showers from convective precipitation in millimeters from the preceding hour, mm
  ///
  /// Preceding hour sum.
  @override
  @JsonKey(name: 'showers')
  final double showers;
  @override
  @JsonKey(name: 'snowfall')
  final double snowfall;
  @override
  @JsonKey(name: 'cloud_cover')
  final int cloudCover;
  @override
  @JsonKey(name: 'pressure_msl')
  final double pressureMsl;
  @override
  @JsonKey(name: 'wind_speed_10m')
  final double windSpeed10m;
  @override
  @JsonKey(name: 'wind_direction_10m')
  final int windDirection10m;
  @override
  @JsonKey(name: 'wind_gusts_10m')
  final double windGusts10m;
  @override
  @JsonKey(name: 'weather_code')
  @OpenMeteoWeatherCodeConverter()
  final OpenMeteoWeatherCode weatherCode;

  @override
  String toString() {
    return 'CurrentWeatherOpenMeteo(time: $time, interval: $interval, temp2m: $temp2m, relativeHumidity2m: $relativeHumidity2m, apparentTemp: $apparentTemp, isDayInt: $isDayInt, precipitation: $precipitation, rain: $rain, showers: $showers, snowfall: $snowfall, cloudCover: $cloudCover, pressureMsl: $pressureMsl, windSpeed10m: $windSpeed10m, windDirection10m: $windDirection10m, windGusts10m: $windGusts10m, weatherCode: $weatherCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentWeatherOpenMeteoImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            (identical(other.temp2m, temp2m) || other.temp2m == temp2m) &&
            (identical(other.relativeHumidity2m, relativeHumidity2m) ||
                other.relativeHumidity2m == relativeHumidity2m) &&
            (identical(other.apparentTemp, apparentTemp) ||
                other.apparentTemp == apparentTemp) &&
            (identical(other.isDayInt, isDayInt) ||
                other.isDayInt == isDayInt) &&
            (identical(other.precipitation, precipitation) ||
                other.precipitation == precipitation) &&
            (identical(other.rain, rain) || other.rain == rain) &&
            (identical(other.showers, showers) || other.showers == showers) &&
            (identical(other.snowfall, snowfall) ||
                other.snowfall == snowfall) &&
            (identical(other.cloudCover, cloudCover) ||
                other.cloudCover == cloudCover) &&
            (identical(other.pressureMsl, pressureMsl) ||
                other.pressureMsl == pressureMsl) &&
            (identical(other.windSpeed10m, windSpeed10m) ||
                other.windSpeed10m == windSpeed10m) &&
            (identical(other.windDirection10m, windDirection10m) ||
                other.windDirection10m == windDirection10m) &&
            (identical(other.windGusts10m, windGusts10m) ||
                other.windGusts10m == windGusts10m) &&
            (identical(other.weatherCode, weatherCode) ||
                other.weatherCode == weatherCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      time,
      interval,
      temp2m,
      relativeHumidity2m,
      apparentTemp,
      isDayInt,
      precipitation,
      rain,
      showers,
      snowfall,
      cloudCover,
      pressureMsl,
      windSpeed10m,
      windDirection10m,
      windGusts10m,
      weatherCode);

  /// Create a copy of CurrentWeatherOpenMeteo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CurrentWeatherOpenMeteoImplCopyWith<_$CurrentWeatherOpenMeteoImpl>
      get copyWith => __$$CurrentWeatherOpenMeteoImplCopyWithImpl<
          _$CurrentWeatherOpenMeteoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CurrentWeatherOpenMeteoImplToJson(
      this,
    );
  }
}

abstract class _CurrentWeatherOpenMeteo extends CurrentWeatherOpenMeteo {
  const factory _CurrentWeatherOpenMeteo(
      {@JsonKey(name: 'time')
      @DateTimeISO8601Converter()
      required final DateTime time,
      @JsonKey(name: 'interval') required final int interval,
      @JsonKey(name: 'temperature_2m') required final double temp2m,
      @JsonKey(name: 'relative_humidity_2m')
      required final int relativeHumidity2m,
      @JsonKey(name: 'apparent_temperature') required final double apparentTemp,
      @protected @JsonKey(name: 'is_day') required final int isDayInt,
      @JsonKey(name: 'precipitation') required final double precipitation,
      @JsonKey(name: 'rain') required final double rain,
      @JsonKey(name: 'showers') required final double showers,
      @JsonKey(name: 'snowfall') required final double snowfall,
      @JsonKey(name: 'cloud_cover') required final int cloudCover,
      @JsonKey(name: 'pressure_msl') required final double pressureMsl,
      @JsonKey(name: 'wind_speed_10m') required final double windSpeed10m,
      @JsonKey(name: 'wind_direction_10m') required final int windDirection10m,
      @JsonKey(name: 'wind_gusts_10m') required final double windGusts10m,
      @JsonKey(name: 'weather_code')
      @OpenMeteoWeatherCodeConverter()
      required final OpenMeteoWeatherCode
          weatherCode}) = _$CurrentWeatherOpenMeteoImpl;
  const _CurrentWeatherOpenMeteo._() : super._();

  factory _CurrentWeatherOpenMeteo.fromJson(Map<String, dynamic> json) =
      _$CurrentWeatherOpenMeteoImpl.fromJson;

  /// iso8601
  @override
  @JsonKey(name: 'time')
  @DateTimeISO8601Converter()
  DateTime get time;
  @override
  @JsonKey(name: 'interval')
  int get interval;
  @override
  @JsonKey(name: 'temperature_2m')
  double get temp2m;
  @override
  @JsonKey(name: 'relative_humidity_2m')
  int get relativeHumidity2m;
  @override
  @JsonKey(name: 'apparent_temperature')
  double get apparentTemp;

  /// 1 if the current time step has daylight, 0 at night.
  @override
  @protected
  @JsonKey(name: 'is_day')
  int get isDayInt;
  @override
  @JsonKey(name: 'precipitation')
  double get precipitation;
  @override
  @JsonKey(name: 'rain')
  double get rain;

  /// Showers from convective precipitation in millimeters from the preceding hour, mm
  ///
  /// Preceding hour sum.
  @override
  @JsonKey(name: 'showers')
  double get showers;
  @override
  @JsonKey(name: 'snowfall')
  double get snowfall;
  @override
  @JsonKey(name: 'cloud_cover')
  int get cloudCover;
  @override
  @JsonKey(name: 'pressure_msl')
  double get pressureMsl;
  @override
  @JsonKey(name: 'wind_speed_10m')
  double get windSpeed10m;
  @override
  @JsonKey(name: 'wind_direction_10m')
  int get windDirection10m;
  @override
  @JsonKey(name: 'wind_gusts_10m')
  double get windGusts10m;
  @override
  @JsonKey(name: 'weather_code')
  @OpenMeteoWeatherCodeConverter()
  OpenMeteoWeatherCode get weatherCode;

  /// Create a copy of CurrentWeatherOpenMeteo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrentWeatherOpenMeteoImplCopyWith<_$CurrentWeatherOpenMeteoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

HourlyWeatherOpenMeteo _$HourlyWeatherOpenMeteoFromJson(
    Map<String, dynamic> json) {
  return _HourlyWeatherOpenMeteo.fromJson(json);
}

/// @nodoc
mixin _$HourlyWeatherOpenMeteo {
  /// iso8601
  @JsonKey(name: 'time')
  @DateTimeISO8601Converter()
  DateTime get time => throw _privateConstructorUsedError;

  /// Air temperature at 2 meters above ground, °C
  @JsonKey(name: 'temperature_2m')
  double get temp2m => throw _privateConstructorUsedError;

  /// Relative humidity at 2 meters above ground, 0-100 %
  @JsonKey(name: 'relative_humidity_2m')
  int get relativeHumidity2m => throw _privateConstructorUsedError;

  /// Dew point temperature at 2 meters above ground, °C
  @JsonKey(name: 'dew_point_2m')
  double get dewPoint2m => throw _privateConstructorUsedError;

  /// Apparent temperature is the perceived feels-like temperature combining
  /// wind chill factor, relative humidity and solar radiation, °C
  @JsonKey(name: 'apparent_temperature')
  double get apparentTemp => throw _privateConstructorUsedError;

  /// 1 if the current time step has daylight, 0 at night.
  @protected
  @JsonKey(name: 'is_day')
  int get isDayInt => throw _privateConstructorUsedError;

  /// Probability of precipitation with more than 0.1 mm of the preceding hour.
  ///
  /// Probability is based on ensemble weather models with 0.25° (~27 km) resolution.
  /// 30 different simulations are computed to better represent future weather
  /// conditions, 0-100 %
  @JsonKey(name: 'precipitation_probability')
  int get pop => throw _privateConstructorUsedError;

  /// Total precipitation (rain, showers, snow) sum of the preceding hour, mm
  @JsonKey(name: 'precipitation')
  double get precipitation => throw _privateConstructorUsedError;

  /// Rain from large scale weather systems of the preceding hour in millimeter, mm
  @JsonKey(name: 'rain')
  double get rain => throw _privateConstructorUsedError;

  /// Showers from convective precipitation in millimeters from the preceding hour, mm
  @JsonKey(name: 'showers')
  double get showers => throw _privateConstructorUsedError;

  /// Snowfall amount of the preceding hour in centimeters (cm). For the water
  /// equivalent in millimeter, divide by 7.
  /// E.g. 7 cm snow = 10 mm precipitation water equivalent.
  @JsonKey(name: 'snowfall')
  double get snowfall => throw _privateConstructorUsedError;

  /// Cloudiness, 0-100 %
  @JsonKey(name: 'cloud_cover')
  int get cloudCover => throw _privateConstructorUsedError;

  /// Atmospheric air pressure reduced to mean sea level (msl) or pressure
  /// at surface, hPa
  ///
  /// Typically pressure on mean sea level is used in meteorology.
  @JsonKey(name: 'pressure_msl')
  double get pressureMsl => throw _privateConstructorUsedError;

  /// Viewing distance in meters (m). Influenced by low clouds, humidity and aerosols.
  /// Maximum visibility is approximately 24 km.
  @JsonKey(name: 'visibility')
  double get visibility => throw _privateConstructorUsedError;

  ///	Daily maximum in UV Index starting from 0.
  @JsonKey(name: 'uv_index')
  double get uvi => throw _privateConstructorUsedError;

  /// Wind speed at 10 meters above ground, m/s
  ///
  /// Wind speed on 10 meters is the standard level.
  @JsonKey(name: 'wind_speed_10m')
  double get windSpeed10m => throw _privateConstructorUsedError;

  /// Wind direction at 10 meters above ground, 0-360°
  @JsonKey(name: 'wind_direction_10m')
  int get windDirection10m => throw _privateConstructorUsedError;

  /// Gusts at 10 meters above ground as a maximum of the preceding hour, m/s
  @JsonKey(name: 'wind_gusts_10m')
  double get windGusts10m => throw _privateConstructorUsedError;

  /// WMO Weather interpretation codes, 0-99
  @JsonKey(name: 'weather_code')
  @OpenMeteoWeatherCodeConverter()
  OpenMeteoWeatherCode get weatherCode => throw _privateConstructorUsedError;

  /// Serializes this HourlyWeatherOpenMeteo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HourlyWeatherOpenMeteo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HourlyWeatherOpenMeteoCopyWith<HourlyWeatherOpenMeteo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HourlyWeatherOpenMeteoCopyWith<$Res> {
  factory $HourlyWeatherOpenMeteoCopyWith(HourlyWeatherOpenMeteo value,
          $Res Function(HourlyWeatherOpenMeteo) then) =
      _$HourlyWeatherOpenMeteoCopyWithImpl<$Res, HourlyWeatherOpenMeteo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'time') @DateTimeISO8601Converter() DateTime time,
      @JsonKey(name: 'temperature_2m') double temp2m,
      @JsonKey(name: 'relative_humidity_2m') int relativeHumidity2m,
      @JsonKey(name: 'dew_point_2m') double dewPoint2m,
      @JsonKey(name: 'apparent_temperature') double apparentTemp,
      @protected @JsonKey(name: 'is_day') int isDayInt,
      @JsonKey(name: 'precipitation_probability') int pop,
      @JsonKey(name: 'precipitation') double precipitation,
      @JsonKey(name: 'rain') double rain,
      @JsonKey(name: 'showers') double showers,
      @JsonKey(name: 'snowfall') double snowfall,
      @JsonKey(name: 'cloud_cover') int cloudCover,
      @JsonKey(name: 'pressure_msl') double pressureMsl,
      @JsonKey(name: 'visibility') double visibility,
      @JsonKey(name: 'uv_index') double uvi,
      @JsonKey(name: 'wind_speed_10m') double windSpeed10m,
      @JsonKey(name: 'wind_direction_10m') int windDirection10m,
      @JsonKey(name: 'wind_gusts_10m') double windGusts10m,
      @JsonKey(name: 'weather_code')
      @OpenMeteoWeatherCodeConverter()
      OpenMeteoWeatherCode weatherCode});
}

/// @nodoc
class _$HourlyWeatherOpenMeteoCopyWithImpl<$Res,
        $Val extends HourlyWeatherOpenMeteo>
    implements $HourlyWeatherOpenMeteoCopyWith<$Res> {
  _$HourlyWeatherOpenMeteoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HourlyWeatherOpenMeteo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temp2m = null,
    Object? relativeHumidity2m = null,
    Object? dewPoint2m = null,
    Object? apparentTemp = null,
    Object? isDayInt = null,
    Object? pop = null,
    Object? precipitation = null,
    Object? rain = null,
    Object? showers = null,
    Object? snowfall = null,
    Object? cloudCover = null,
    Object? pressureMsl = null,
    Object? visibility = null,
    Object? uvi = null,
    Object? windSpeed10m = null,
    Object? windDirection10m = null,
    Object? windGusts10m = null,
    Object? weatherCode = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temp2m: null == temp2m
          ? _value.temp2m
          : temp2m // ignore: cast_nullable_to_non_nullable
              as double,
      relativeHumidity2m: null == relativeHumidity2m
          ? _value.relativeHumidity2m
          : relativeHumidity2m // ignore: cast_nullable_to_non_nullable
              as int,
      dewPoint2m: null == dewPoint2m
          ? _value.dewPoint2m
          : dewPoint2m // ignore: cast_nullable_to_non_nullable
              as double,
      apparentTemp: null == apparentTemp
          ? _value.apparentTemp
          : apparentTemp // ignore: cast_nullable_to_non_nullable
              as double,
      isDayInt: null == isDayInt
          ? _value.isDayInt
          : isDayInt // ignore: cast_nullable_to_non_nullable
              as int,
      pop: null == pop
          ? _value.pop
          : pop // ignore: cast_nullable_to_non_nullable
              as int,
      precipitation: null == precipitation
          ? _value.precipitation
          : precipitation // ignore: cast_nullable_to_non_nullable
              as double,
      rain: null == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as double,
      showers: null == showers
          ? _value.showers
          : showers // ignore: cast_nullable_to_non_nullable
              as double,
      snowfall: null == snowfall
          ? _value.snowfall
          : snowfall // ignore: cast_nullable_to_non_nullable
              as double,
      cloudCover: null == cloudCover
          ? _value.cloudCover
          : cloudCover // ignore: cast_nullable_to_non_nullable
              as int,
      pressureMsl: null == pressureMsl
          ? _value.pressureMsl
          : pressureMsl // ignore: cast_nullable_to_non_nullable
              as double,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as double,
      uvi: null == uvi
          ? _value.uvi
          : uvi // ignore: cast_nullable_to_non_nullable
              as double,
      windSpeed10m: null == windSpeed10m
          ? _value.windSpeed10m
          : windSpeed10m // ignore: cast_nullable_to_non_nullable
              as double,
      windDirection10m: null == windDirection10m
          ? _value.windDirection10m
          : windDirection10m // ignore: cast_nullable_to_non_nullable
              as int,
      windGusts10m: null == windGusts10m
          ? _value.windGusts10m
          : windGusts10m // ignore: cast_nullable_to_non_nullable
              as double,
      weatherCode: null == weatherCode
          ? _value.weatherCode
          : weatherCode // ignore: cast_nullable_to_non_nullable
              as OpenMeteoWeatherCode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HourlyWeatherOpenMeteoImplCopyWith<$Res>
    implements $HourlyWeatherOpenMeteoCopyWith<$Res> {
  factory _$$HourlyWeatherOpenMeteoImplCopyWith(
          _$HourlyWeatherOpenMeteoImpl value,
          $Res Function(_$HourlyWeatherOpenMeteoImpl) then) =
      __$$HourlyWeatherOpenMeteoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'time') @DateTimeISO8601Converter() DateTime time,
      @JsonKey(name: 'temperature_2m') double temp2m,
      @JsonKey(name: 'relative_humidity_2m') int relativeHumidity2m,
      @JsonKey(name: 'dew_point_2m') double dewPoint2m,
      @JsonKey(name: 'apparent_temperature') double apparentTemp,
      @protected @JsonKey(name: 'is_day') int isDayInt,
      @JsonKey(name: 'precipitation_probability') int pop,
      @JsonKey(name: 'precipitation') double precipitation,
      @JsonKey(name: 'rain') double rain,
      @JsonKey(name: 'showers') double showers,
      @JsonKey(name: 'snowfall') double snowfall,
      @JsonKey(name: 'cloud_cover') int cloudCover,
      @JsonKey(name: 'pressure_msl') double pressureMsl,
      @JsonKey(name: 'visibility') double visibility,
      @JsonKey(name: 'uv_index') double uvi,
      @JsonKey(name: 'wind_speed_10m') double windSpeed10m,
      @JsonKey(name: 'wind_direction_10m') int windDirection10m,
      @JsonKey(name: 'wind_gusts_10m') double windGusts10m,
      @JsonKey(name: 'weather_code')
      @OpenMeteoWeatherCodeConverter()
      OpenMeteoWeatherCode weatherCode});
}

/// @nodoc
class __$$HourlyWeatherOpenMeteoImplCopyWithImpl<$Res>
    extends _$HourlyWeatherOpenMeteoCopyWithImpl<$Res,
        _$HourlyWeatherOpenMeteoImpl>
    implements _$$HourlyWeatherOpenMeteoImplCopyWith<$Res> {
  __$$HourlyWeatherOpenMeteoImplCopyWithImpl(
      _$HourlyWeatherOpenMeteoImpl _value,
      $Res Function(_$HourlyWeatherOpenMeteoImpl) _then)
      : super(_value, _then);

  /// Create a copy of HourlyWeatherOpenMeteo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temp2m = null,
    Object? relativeHumidity2m = null,
    Object? dewPoint2m = null,
    Object? apparentTemp = null,
    Object? isDayInt = null,
    Object? pop = null,
    Object? precipitation = null,
    Object? rain = null,
    Object? showers = null,
    Object? snowfall = null,
    Object? cloudCover = null,
    Object? pressureMsl = null,
    Object? visibility = null,
    Object? uvi = null,
    Object? windSpeed10m = null,
    Object? windDirection10m = null,
    Object? windGusts10m = null,
    Object? weatherCode = null,
  }) {
    return _then(_$HourlyWeatherOpenMeteoImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temp2m: null == temp2m
          ? _value.temp2m
          : temp2m // ignore: cast_nullable_to_non_nullable
              as double,
      relativeHumidity2m: null == relativeHumidity2m
          ? _value.relativeHumidity2m
          : relativeHumidity2m // ignore: cast_nullable_to_non_nullable
              as int,
      dewPoint2m: null == dewPoint2m
          ? _value.dewPoint2m
          : dewPoint2m // ignore: cast_nullable_to_non_nullable
              as double,
      apparentTemp: null == apparentTemp
          ? _value.apparentTemp
          : apparentTemp // ignore: cast_nullable_to_non_nullable
              as double,
      isDayInt: null == isDayInt
          ? _value.isDayInt
          : isDayInt // ignore: cast_nullable_to_non_nullable
              as int,
      pop: null == pop
          ? _value.pop
          : pop // ignore: cast_nullable_to_non_nullable
              as int,
      precipitation: null == precipitation
          ? _value.precipitation
          : precipitation // ignore: cast_nullable_to_non_nullable
              as double,
      rain: null == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as double,
      showers: null == showers
          ? _value.showers
          : showers // ignore: cast_nullable_to_non_nullable
              as double,
      snowfall: null == snowfall
          ? _value.snowfall
          : snowfall // ignore: cast_nullable_to_non_nullable
              as double,
      cloudCover: null == cloudCover
          ? _value.cloudCover
          : cloudCover // ignore: cast_nullable_to_non_nullable
              as int,
      pressureMsl: null == pressureMsl
          ? _value.pressureMsl
          : pressureMsl // ignore: cast_nullable_to_non_nullable
              as double,
      visibility: null == visibility
          ? _value.visibility
          : visibility // ignore: cast_nullable_to_non_nullable
              as double,
      uvi: null == uvi
          ? _value.uvi
          : uvi // ignore: cast_nullable_to_non_nullable
              as double,
      windSpeed10m: null == windSpeed10m
          ? _value.windSpeed10m
          : windSpeed10m // ignore: cast_nullable_to_non_nullable
              as double,
      windDirection10m: null == windDirection10m
          ? _value.windDirection10m
          : windDirection10m // ignore: cast_nullable_to_non_nullable
              as int,
      windGusts10m: null == windGusts10m
          ? _value.windGusts10m
          : windGusts10m // ignore: cast_nullable_to_non_nullable
              as double,
      weatherCode: null == weatherCode
          ? _value.weatherCode
          : weatherCode // ignore: cast_nullable_to_non_nullable
              as OpenMeteoWeatherCode,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$HourlyWeatherOpenMeteoImpl extends _HourlyWeatherOpenMeteo {
  const _$HourlyWeatherOpenMeteoImpl(
      {@JsonKey(name: 'time') @DateTimeISO8601Converter() required this.time,
      @JsonKey(name: 'temperature_2m') required this.temp2m,
      @JsonKey(name: 'relative_humidity_2m') required this.relativeHumidity2m,
      @JsonKey(name: 'dew_point_2m') required this.dewPoint2m,
      @JsonKey(name: 'apparent_temperature') required this.apparentTemp,
      @protected @JsonKey(name: 'is_day') required this.isDayInt,
      @JsonKey(name: 'precipitation_probability') required this.pop,
      @JsonKey(name: 'precipitation') required this.precipitation,
      @JsonKey(name: 'rain') required this.rain,
      @JsonKey(name: 'showers') required this.showers,
      @JsonKey(name: 'snowfall') required this.snowfall,
      @JsonKey(name: 'cloud_cover') required this.cloudCover,
      @JsonKey(name: 'pressure_msl') required this.pressureMsl,
      @JsonKey(name: 'visibility') required this.visibility,
      @JsonKey(name: 'uv_index') required this.uvi,
      @JsonKey(name: 'wind_speed_10m') required this.windSpeed10m,
      @JsonKey(name: 'wind_direction_10m') required this.windDirection10m,
      @JsonKey(name: 'wind_gusts_10m') required this.windGusts10m,
      @JsonKey(name: 'weather_code')
      @OpenMeteoWeatherCodeConverter()
      required this.weatherCode})
      : super._();

  factory _$HourlyWeatherOpenMeteoImpl.fromJson(Map<String, dynamic> json) =>
      _$$HourlyWeatherOpenMeteoImplFromJson(json);

  /// iso8601
  @override
  @JsonKey(name: 'time')
  @DateTimeISO8601Converter()
  final DateTime time;

  /// Air temperature at 2 meters above ground, °C
  @override
  @JsonKey(name: 'temperature_2m')
  final double temp2m;

  /// Relative humidity at 2 meters above ground, 0-100 %
  @override
  @JsonKey(name: 'relative_humidity_2m')
  final int relativeHumidity2m;

  /// Dew point temperature at 2 meters above ground, °C
  @override
  @JsonKey(name: 'dew_point_2m')
  final double dewPoint2m;

  /// Apparent temperature is the perceived feels-like temperature combining
  /// wind chill factor, relative humidity and solar radiation, °C
  @override
  @JsonKey(name: 'apparent_temperature')
  final double apparentTemp;

  /// 1 if the current time step has daylight, 0 at night.
  @override
  @protected
  @JsonKey(name: 'is_day')
  final int isDayInt;

  /// Probability of precipitation with more than 0.1 mm of the preceding hour.
  ///
  /// Probability is based on ensemble weather models with 0.25° (~27 km) resolution.
  /// 30 different simulations are computed to better represent future weather
  /// conditions, 0-100 %
  @override
  @JsonKey(name: 'precipitation_probability')
  final int pop;

  /// Total precipitation (rain, showers, snow) sum of the preceding hour, mm
  @override
  @JsonKey(name: 'precipitation')
  final double precipitation;

  /// Rain from large scale weather systems of the preceding hour in millimeter, mm
  @override
  @JsonKey(name: 'rain')
  final double rain;

  /// Showers from convective precipitation in millimeters from the preceding hour, mm
  @override
  @JsonKey(name: 'showers')
  final double showers;

  /// Snowfall amount of the preceding hour in centimeters (cm). For the water
  /// equivalent in millimeter, divide by 7.
  /// E.g. 7 cm snow = 10 mm precipitation water equivalent.
  @override
  @JsonKey(name: 'snowfall')
  final double snowfall;

  /// Cloudiness, 0-100 %
  @override
  @JsonKey(name: 'cloud_cover')
  final int cloudCover;

  /// Atmospheric air pressure reduced to mean sea level (msl) or pressure
  /// at surface, hPa
  ///
  /// Typically pressure on mean sea level is used in meteorology.
  @override
  @JsonKey(name: 'pressure_msl')
  final double pressureMsl;

  /// Viewing distance in meters (m). Influenced by low clouds, humidity and aerosols.
  /// Maximum visibility is approximately 24 km.
  @override
  @JsonKey(name: 'visibility')
  final double visibility;

  ///	Daily maximum in UV Index starting from 0.
  @override
  @JsonKey(name: 'uv_index')
  final double uvi;

  /// Wind speed at 10 meters above ground, m/s
  ///
  /// Wind speed on 10 meters is the standard level.
  @override
  @JsonKey(name: 'wind_speed_10m')
  final double windSpeed10m;

  /// Wind direction at 10 meters above ground, 0-360°
  @override
  @JsonKey(name: 'wind_direction_10m')
  final int windDirection10m;

  /// Gusts at 10 meters above ground as a maximum of the preceding hour, m/s
  @override
  @JsonKey(name: 'wind_gusts_10m')
  final double windGusts10m;

  /// WMO Weather interpretation codes, 0-99
  @override
  @JsonKey(name: 'weather_code')
  @OpenMeteoWeatherCodeConverter()
  final OpenMeteoWeatherCode weatherCode;

  @override
  String toString() {
    return 'HourlyWeatherOpenMeteo(time: $time, temp2m: $temp2m, relativeHumidity2m: $relativeHumidity2m, dewPoint2m: $dewPoint2m, apparentTemp: $apparentTemp, isDayInt: $isDayInt, pop: $pop, precipitation: $precipitation, rain: $rain, showers: $showers, snowfall: $snowfall, cloudCover: $cloudCover, pressureMsl: $pressureMsl, visibility: $visibility, uvi: $uvi, windSpeed10m: $windSpeed10m, windDirection10m: $windDirection10m, windGusts10m: $windGusts10m, weatherCode: $weatherCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HourlyWeatherOpenMeteoImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.temp2m, temp2m) || other.temp2m == temp2m) &&
            (identical(other.relativeHumidity2m, relativeHumidity2m) ||
                other.relativeHumidity2m == relativeHumidity2m) &&
            (identical(other.dewPoint2m, dewPoint2m) ||
                other.dewPoint2m == dewPoint2m) &&
            (identical(other.apparentTemp, apparentTemp) ||
                other.apparentTemp == apparentTemp) &&
            (identical(other.isDayInt, isDayInt) ||
                other.isDayInt == isDayInt) &&
            (identical(other.pop, pop) || other.pop == pop) &&
            (identical(other.precipitation, precipitation) ||
                other.precipitation == precipitation) &&
            (identical(other.rain, rain) || other.rain == rain) &&
            (identical(other.showers, showers) || other.showers == showers) &&
            (identical(other.snowfall, snowfall) ||
                other.snowfall == snowfall) &&
            (identical(other.cloudCover, cloudCover) ||
                other.cloudCover == cloudCover) &&
            (identical(other.pressureMsl, pressureMsl) ||
                other.pressureMsl == pressureMsl) &&
            (identical(other.visibility, visibility) ||
                other.visibility == visibility) &&
            (identical(other.uvi, uvi) || other.uvi == uvi) &&
            (identical(other.windSpeed10m, windSpeed10m) ||
                other.windSpeed10m == windSpeed10m) &&
            (identical(other.windDirection10m, windDirection10m) ||
                other.windDirection10m == windDirection10m) &&
            (identical(other.windGusts10m, windGusts10m) ||
                other.windGusts10m == windGusts10m) &&
            (identical(other.weatherCode, weatherCode) ||
                other.weatherCode == weatherCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        time,
        temp2m,
        relativeHumidity2m,
        dewPoint2m,
        apparentTemp,
        isDayInt,
        pop,
        precipitation,
        rain,
        showers,
        snowfall,
        cloudCover,
        pressureMsl,
        visibility,
        uvi,
        windSpeed10m,
        windDirection10m,
        windGusts10m,
        weatherCode
      ]);

  /// Create a copy of HourlyWeatherOpenMeteo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HourlyWeatherOpenMeteoImplCopyWith<_$HourlyWeatherOpenMeteoImpl>
      get copyWith => __$$HourlyWeatherOpenMeteoImplCopyWithImpl<
          _$HourlyWeatherOpenMeteoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HourlyWeatherOpenMeteoImplToJson(
      this,
    );
  }
}

abstract class _HourlyWeatherOpenMeteo extends HourlyWeatherOpenMeteo {
  const factory _HourlyWeatherOpenMeteo(
      {@JsonKey(name: 'time')
      @DateTimeISO8601Converter()
      required final DateTime time,
      @JsonKey(name: 'temperature_2m') required final double temp2m,
      @JsonKey(name: 'relative_humidity_2m')
      required final int relativeHumidity2m,
      @JsonKey(name: 'dew_point_2m') required final double dewPoint2m,
      @JsonKey(name: 'apparent_temperature') required final double apparentTemp,
      @protected @JsonKey(name: 'is_day') required final int isDayInt,
      @JsonKey(name: 'precipitation_probability') required final int pop,
      @JsonKey(name: 'precipitation') required final double precipitation,
      @JsonKey(name: 'rain') required final double rain,
      @JsonKey(name: 'showers') required final double showers,
      @JsonKey(name: 'snowfall') required final double snowfall,
      @JsonKey(name: 'cloud_cover') required final int cloudCover,
      @JsonKey(name: 'pressure_msl') required final double pressureMsl,
      @JsonKey(name: 'visibility') required final double visibility,
      @JsonKey(name: 'uv_index') required final double uvi,
      @JsonKey(name: 'wind_speed_10m') required final double windSpeed10m,
      @JsonKey(name: 'wind_direction_10m') required final int windDirection10m,
      @JsonKey(name: 'wind_gusts_10m') required final double windGusts10m,
      @JsonKey(name: 'weather_code')
      @OpenMeteoWeatherCodeConverter()
      required final OpenMeteoWeatherCode
          weatherCode}) = _$HourlyWeatherOpenMeteoImpl;
  const _HourlyWeatherOpenMeteo._() : super._();

  factory _HourlyWeatherOpenMeteo.fromJson(Map<String, dynamic> json) =
      _$HourlyWeatherOpenMeteoImpl.fromJson;

  /// iso8601
  @override
  @JsonKey(name: 'time')
  @DateTimeISO8601Converter()
  DateTime get time;

  /// Air temperature at 2 meters above ground, °C
  @override
  @JsonKey(name: 'temperature_2m')
  double get temp2m;

  /// Relative humidity at 2 meters above ground, 0-100 %
  @override
  @JsonKey(name: 'relative_humidity_2m')
  int get relativeHumidity2m;

  /// Dew point temperature at 2 meters above ground, °C
  @override
  @JsonKey(name: 'dew_point_2m')
  double get dewPoint2m;

  /// Apparent temperature is the perceived feels-like temperature combining
  /// wind chill factor, relative humidity and solar radiation, °C
  @override
  @JsonKey(name: 'apparent_temperature')
  double get apparentTemp;

  /// 1 if the current time step has daylight, 0 at night.
  @override
  @protected
  @JsonKey(name: 'is_day')
  int get isDayInt;

  /// Probability of precipitation with more than 0.1 mm of the preceding hour.
  ///
  /// Probability is based on ensemble weather models with 0.25° (~27 km) resolution.
  /// 30 different simulations are computed to better represent future weather
  /// conditions, 0-100 %
  @override
  @JsonKey(name: 'precipitation_probability')
  int get pop;

  /// Total precipitation (rain, showers, snow) sum of the preceding hour, mm
  @override
  @JsonKey(name: 'precipitation')
  double get precipitation;

  /// Rain from large scale weather systems of the preceding hour in millimeter, mm
  @override
  @JsonKey(name: 'rain')
  double get rain;

  /// Showers from convective precipitation in millimeters from the preceding hour, mm
  @override
  @JsonKey(name: 'showers')
  double get showers;

  /// Snowfall amount of the preceding hour in centimeters (cm). For the water
  /// equivalent in millimeter, divide by 7.
  /// E.g. 7 cm snow = 10 mm precipitation water equivalent.
  @override
  @JsonKey(name: 'snowfall')
  double get snowfall;

  /// Cloudiness, 0-100 %
  @override
  @JsonKey(name: 'cloud_cover')
  int get cloudCover;

  /// Atmospheric air pressure reduced to mean sea level (msl) or pressure
  /// at surface, hPa
  ///
  /// Typically pressure on mean sea level is used in meteorology.
  @override
  @JsonKey(name: 'pressure_msl')
  double get pressureMsl;

  /// Viewing distance in meters (m). Influenced by low clouds, humidity and aerosols.
  /// Maximum visibility is approximately 24 km.
  @override
  @JsonKey(name: 'visibility')
  double get visibility;

  ///	Daily maximum in UV Index starting from 0.
  @override
  @JsonKey(name: 'uv_index')
  double get uvi;

  /// Wind speed at 10 meters above ground, m/s
  ///
  /// Wind speed on 10 meters is the standard level.
  @override
  @JsonKey(name: 'wind_speed_10m')
  double get windSpeed10m;

  /// Wind direction at 10 meters above ground, 0-360°
  @override
  @JsonKey(name: 'wind_direction_10m')
  int get windDirection10m;

  /// Gusts at 10 meters above ground as a maximum of the preceding hour, m/s
  @override
  @JsonKey(name: 'wind_gusts_10m')
  double get windGusts10m;

  /// WMO Weather interpretation codes, 0-99
  @override
  @JsonKey(name: 'weather_code')
  @OpenMeteoWeatherCodeConverter()
  OpenMeteoWeatherCode get weatherCode;

  /// Create a copy of HourlyWeatherOpenMeteo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HourlyWeatherOpenMeteoImplCopyWith<_$HourlyWeatherOpenMeteoImpl>
      get copyWith => throw _privateConstructorUsedError;
}

DailyWeatherOpenMeteo _$DailyWeatherOpenMeteoFromJson(
    Map<String, dynamic> json) {
  return _DailyWeatherOpenMeteo.fromJson(json);
}

/// @nodoc
mixin _$DailyWeatherOpenMeteo {
  /// iso8601
  @JsonKey(name: 'time')
  @DateTimeISO8601Converter()
  DateTime get time => throw _privateConstructorUsedError;

  /// Maximum daily air temperature at 2 meters above ground, °C
  @JsonKey(name: 'temperature_2m_max')
  double get temp2mMax => throw _privateConstructorUsedError;

  /// Minimum daily air temperature at 2 meters above ground, °C
  @JsonKey(name: 'temperature_2m_min')
  double get temp2mMin => throw _privateConstructorUsedError;

  /// Maximum daily apparent temperature, °C
  @JsonKey(name: 'apparent_temperature_max')
  double get apparentTempMax => throw _privateConstructorUsedError;

  /// Minimum daily apparent temperature, °C
  @JsonKey(name: 'apparent_temperature_min')
  double get apparentTempMin => throw _privateConstructorUsedError;

  /// Sunset time, iso8601
  @JsonKey(name: 'sunrise')
  @DateTimeISO8601Converter()
  DateTime get sunrise => throw _privateConstructorUsedError;

  /// Sunset time, iso8601
  @JsonKey(name: 'sunset')
  @DateTimeISO8601Converter()
  DateTime get sunset => throw _privateConstructorUsedError;

  /// Number of seconds of daylight per day, seconds
  @JsonKey(name: 'daylight_duration')
  @DurationSecConverter()
  Duration get daylightDur => throw _privateConstructorUsedError;

  ///	Daily maximum in UV Index starting from 0.
  @JsonKey(name: 'uv_index_max')
  double get uviMax => throw _privateConstructorUsedError;

  /// Sum of daily precipitation (including rain, showers and snowfall), mm
  @JsonKey(name: 'precipitation_sum')
  double get precipitationSum => throw _privateConstructorUsedError;

  /// Probability of precipitation, 0-100 %
  @JsonKey(name: 'precipitation_probability_max')
  double get popMax => throw _privateConstructorUsedError;

  /// Sum of daily rain, mm
  @JsonKey(name: 'rain_sum')
  double get rainSum => throw _privateConstructorUsedError;

  /// Sum of daily showers, mm
  @JsonKey(name: 'showers_sum')
  double get showersSum => throw _privateConstructorUsedError;

  /// Sum of daily snowfall, cm
  @JsonKey(name: 'snowfall_sum')
  double get snowfallSum => throw _privateConstructorUsedError;

  /// Maximum wind speed on a day, m/s
  @JsonKey(name: 'wind_speed_10m_max')
  double get windSpeed10mMax => throw _privateConstructorUsedError;

  /// Maximum wind gusts on a day, m/s
  @JsonKey(name: 'wind_gusts_10m_max')
  double get windGusts10mMax => throw _privateConstructorUsedError;

  /// Dominant wind direction, 0-360°
  @JsonKey(name: 'wind_direction_10m_dominant')
  int get windDirection10mDominant => throw _privateConstructorUsedError;

  /// WMO Weather interpretation codes, 0-99
  @JsonKey(name: 'weather_code')
  @OpenMeteoWeatherCodeConverter()
  OpenMeteoWeatherCode get weatherCode => throw _privateConstructorUsedError;

  /// Serializes this DailyWeatherOpenMeteo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyWeatherOpenMeteo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyWeatherOpenMeteoCopyWith<DailyWeatherOpenMeteo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyWeatherOpenMeteoCopyWith<$Res> {
  factory $DailyWeatherOpenMeteoCopyWith(DailyWeatherOpenMeteo value,
          $Res Function(DailyWeatherOpenMeteo) then) =
      _$DailyWeatherOpenMeteoCopyWithImpl<$Res, DailyWeatherOpenMeteo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'time') @DateTimeISO8601Converter() DateTime time,
      @JsonKey(name: 'temperature_2m_max') double temp2mMax,
      @JsonKey(name: 'temperature_2m_min') double temp2mMin,
      @JsonKey(name: 'apparent_temperature_max') double apparentTempMax,
      @JsonKey(name: 'apparent_temperature_min') double apparentTempMin,
      @JsonKey(name: 'sunrise') @DateTimeISO8601Converter() DateTime sunrise,
      @JsonKey(name: 'sunset') @DateTimeISO8601Converter() DateTime sunset,
      @JsonKey(name: 'daylight_duration')
      @DurationSecConverter()
      Duration daylightDur,
      @JsonKey(name: 'uv_index_max') double uviMax,
      @JsonKey(name: 'precipitation_sum') double precipitationSum,
      @JsonKey(name: 'precipitation_probability_max') double popMax,
      @JsonKey(name: 'rain_sum') double rainSum,
      @JsonKey(name: 'showers_sum') double showersSum,
      @JsonKey(name: 'snowfall_sum') double snowfallSum,
      @JsonKey(name: 'wind_speed_10m_max') double windSpeed10mMax,
      @JsonKey(name: 'wind_gusts_10m_max') double windGusts10mMax,
      @JsonKey(name: 'wind_direction_10m_dominant')
      int windDirection10mDominant,
      @JsonKey(name: 'weather_code')
      @OpenMeteoWeatherCodeConverter()
      OpenMeteoWeatherCode weatherCode});
}

/// @nodoc
class _$DailyWeatherOpenMeteoCopyWithImpl<$Res,
        $Val extends DailyWeatherOpenMeteo>
    implements $DailyWeatherOpenMeteoCopyWith<$Res> {
  _$DailyWeatherOpenMeteoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyWeatherOpenMeteo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temp2mMax = null,
    Object? temp2mMin = null,
    Object? apparentTempMax = null,
    Object? apparentTempMin = null,
    Object? sunrise = null,
    Object? sunset = null,
    Object? daylightDur = null,
    Object? uviMax = null,
    Object? precipitationSum = null,
    Object? popMax = null,
    Object? rainSum = null,
    Object? showersSum = null,
    Object? snowfallSum = null,
    Object? windSpeed10mMax = null,
    Object? windGusts10mMax = null,
    Object? windDirection10mDominant = null,
    Object? weatherCode = null,
  }) {
    return _then(_value.copyWith(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temp2mMax: null == temp2mMax
          ? _value.temp2mMax
          : temp2mMax // ignore: cast_nullable_to_non_nullable
              as double,
      temp2mMin: null == temp2mMin
          ? _value.temp2mMin
          : temp2mMin // ignore: cast_nullable_to_non_nullable
              as double,
      apparentTempMax: null == apparentTempMax
          ? _value.apparentTempMax
          : apparentTempMax // ignore: cast_nullable_to_non_nullable
              as double,
      apparentTempMin: null == apparentTempMin
          ? _value.apparentTempMin
          : apparentTempMin // ignore: cast_nullable_to_non_nullable
              as double,
      sunrise: null == sunrise
          ? _value.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sunset: null == sunset
          ? _value.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as DateTime,
      daylightDur: null == daylightDur
          ? _value.daylightDur
          : daylightDur // ignore: cast_nullable_to_non_nullable
              as Duration,
      uviMax: null == uviMax
          ? _value.uviMax
          : uviMax // ignore: cast_nullable_to_non_nullable
              as double,
      precipitationSum: null == precipitationSum
          ? _value.precipitationSum
          : precipitationSum // ignore: cast_nullable_to_non_nullable
              as double,
      popMax: null == popMax
          ? _value.popMax
          : popMax // ignore: cast_nullable_to_non_nullable
              as double,
      rainSum: null == rainSum
          ? _value.rainSum
          : rainSum // ignore: cast_nullable_to_non_nullable
              as double,
      showersSum: null == showersSum
          ? _value.showersSum
          : showersSum // ignore: cast_nullable_to_non_nullable
              as double,
      snowfallSum: null == snowfallSum
          ? _value.snowfallSum
          : snowfallSum // ignore: cast_nullable_to_non_nullable
              as double,
      windSpeed10mMax: null == windSpeed10mMax
          ? _value.windSpeed10mMax
          : windSpeed10mMax // ignore: cast_nullable_to_non_nullable
              as double,
      windGusts10mMax: null == windGusts10mMax
          ? _value.windGusts10mMax
          : windGusts10mMax // ignore: cast_nullable_to_non_nullable
              as double,
      windDirection10mDominant: null == windDirection10mDominant
          ? _value.windDirection10mDominant
          : windDirection10mDominant // ignore: cast_nullable_to_non_nullable
              as int,
      weatherCode: null == weatherCode
          ? _value.weatherCode
          : weatherCode // ignore: cast_nullable_to_non_nullable
              as OpenMeteoWeatherCode,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyWeatherOpenMeteoImplCopyWith<$Res>
    implements $DailyWeatherOpenMeteoCopyWith<$Res> {
  factory _$$DailyWeatherOpenMeteoImplCopyWith(
          _$DailyWeatherOpenMeteoImpl value,
          $Res Function(_$DailyWeatherOpenMeteoImpl) then) =
      __$$DailyWeatherOpenMeteoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'time') @DateTimeISO8601Converter() DateTime time,
      @JsonKey(name: 'temperature_2m_max') double temp2mMax,
      @JsonKey(name: 'temperature_2m_min') double temp2mMin,
      @JsonKey(name: 'apparent_temperature_max') double apparentTempMax,
      @JsonKey(name: 'apparent_temperature_min') double apparentTempMin,
      @JsonKey(name: 'sunrise') @DateTimeISO8601Converter() DateTime sunrise,
      @JsonKey(name: 'sunset') @DateTimeISO8601Converter() DateTime sunset,
      @JsonKey(name: 'daylight_duration')
      @DurationSecConverter()
      Duration daylightDur,
      @JsonKey(name: 'uv_index_max') double uviMax,
      @JsonKey(name: 'precipitation_sum') double precipitationSum,
      @JsonKey(name: 'precipitation_probability_max') double popMax,
      @JsonKey(name: 'rain_sum') double rainSum,
      @JsonKey(name: 'showers_sum') double showersSum,
      @JsonKey(name: 'snowfall_sum') double snowfallSum,
      @JsonKey(name: 'wind_speed_10m_max') double windSpeed10mMax,
      @JsonKey(name: 'wind_gusts_10m_max') double windGusts10mMax,
      @JsonKey(name: 'wind_direction_10m_dominant')
      int windDirection10mDominant,
      @JsonKey(name: 'weather_code')
      @OpenMeteoWeatherCodeConverter()
      OpenMeteoWeatherCode weatherCode});
}

/// @nodoc
class __$$DailyWeatherOpenMeteoImplCopyWithImpl<$Res>
    extends _$DailyWeatherOpenMeteoCopyWithImpl<$Res,
        _$DailyWeatherOpenMeteoImpl>
    implements _$$DailyWeatherOpenMeteoImplCopyWith<$Res> {
  __$$DailyWeatherOpenMeteoImplCopyWithImpl(_$DailyWeatherOpenMeteoImpl _value,
      $Res Function(_$DailyWeatherOpenMeteoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyWeatherOpenMeteo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? time = null,
    Object? temp2mMax = null,
    Object? temp2mMin = null,
    Object? apparentTempMax = null,
    Object? apparentTempMin = null,
    Object? sunrise = null,
    Object? sunset = null,
    Object? daylightDur = null,
    Object? uviMax = null,
    Object? precipitationSum = null,
    Object? popMax = null,
    Object? rainSum = null,
    Object? showersSum = null,
    Object? snowfallSum = null,
    Object? windSpeed10mMax = null,
    Object? windGusts10mMax = null,
    Object? windDirection10mDominant = null,
    Object? weatherCode = null,
  }) {
    return _then(_$DailyWeatherOpenMeteoImpl(
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as DateTime,
      temp2mMax: null == temp2mMax
          ? _value.temp2mMax
          : temp2mMax // ignore: cast_nullable_to_non_nullable
              as double,
      temp2mMin: null == temp2mMin
          ? _value.temp2mMin
          : temp2mMin // ignore: cast_nullable_to_non_nullable
              as double,
      apparentTempMax: null == apparentTempMax
          ? _value.apparentTempMax
          : apparentTempMax // ignore: cast_nullable_to_non_nullable
              as double,
      apparentTempMin: null == apparentTempMin
          ? _value.apparentTempMin
          : apparentTempMin // ignore: cast_nullable_to_non_nullable
              as double,
      sunrise: null == sunrise
          ? _value.sunrise
          : sunrise // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sunset: null == sunset
          ? _value.sunset
          : sunset // ignore: cast_nullable_to_non_nullable
              as DateTime,
      daylightDur: null == daylightDur
          ? _value.daylightDur
          : daylightDur // ignore: cast_nullable_to_non_nullable
              as Duration,
      uviMax: null == uviMax
          ? _value.uviMax
          : uviMax // ignore: cast_nullable_to_non_nullable
              as double,
      precipitationSum: null == precipitationSum
          ? _value.precipitationSum
          : precipitationSum // ignore: cast_nullable_to_non_nullable
              as double,
      popMax: null == popMax
          ? _value.popMax
          : popMax // ignore: cast_nullable_to_non_nullable
              as double,
      rainSum: null == rainSum
          ? _value.rainSum
          : rainSum // ignore: cast_nullable_to_non_nullable
              as double,
      showersSum: null == showersSum
          ? _value.showersSum
          : showersSum // ignore: cast_nullable_to_non_nullable
              as double,
      snowfallSum: null == snowfallSum
          ? _value.snowfallSum
          : snowfallSum // ignore: cast_nullable_to_non_nullable
              as double,
      windSpeed10mMax: null == windSpeed10mMax
          ? _value.windSpeed10mMax
          : windSpeed10mMax // ignore: cast_nullable_to_non_nullable
              as double,
      windGusts10mMax: null == windGusts10mMax
          ? _value.windGusts10mMax
          : windGusts10mMax // ignore: cast_nullable_to_non_nullable
              as double,
      windDirection10mDominant: null == windDirection10mDominant
          ? _value.windDirection10mDominant
          : windDirection10mDominant // ignore: cast_nullable_to_non_nullable
              as int,
      weatherCode: null == weatherCode
          ? _value.weatherCode
          : weatherCode // ignore: cast_nullable_to_non_nullable
              as OpenMeteoWeatherCode,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyWeatherOpenMeteoImpl implements _DailyWeatherOpenMeteo {
  const _$DailyWeatherOpenMeteoImpl(
      {@JsonKey(name: 'time') @DateTimeISO8601Converter() required this.time,
      @JsonKey(name: 'temperature_2m_max') required this.temp2mMax,
      @JsonKey(name: 'temperature_2m_min') required this.temp2mMin,
      @JsonKey(name: 'apparent_temperature_max') required this.apparentTempMax,
      @JsonKey(name: 'apparent_temperature_min') required this.apparentTempMin,
      @JsonKey(name: 'sunrise')
      @DateTimeISO8601Converter()
      required this.sunrise,
      @JsonKey(name: 'sunset') @DateTimeISO8601Converter() required this.sunset,
      @JsonKey(name: 'daylight_duration')
      @DurationSecConverter()
      required this.daylightDur,
      @JsonKey(name: 'uv_index_max') required this.uviMax,
      @JsonKey(name: 'precipitation_sum') required this.precipitationSum,
      @JsonKey(name: 'precipitation_probability_max') required this.popMax,
      @JsonKey(name: 'rain_sum') required this.rainSum,
      @JsonKey(name: 'showers_sum') required this.showersSum,
      @JsonKey(name: 'snowfall_sum') required this.snowfallSum,
      @JsonKey(name: 'wind_speed_10m_max') required this.windSpeed10mMax,
      @JsonKey(name: 'wind_gusts_10m_max') required this.windGusts10mMax,
      @JsonKey(name: 'wind_direction_10m_dominant')
      required this.windDirection10mDominant,
      @JsonKey(name: 'weather_code')
      @OpenMeteoWeatherCodeConverter()
      required this.weatherCode});

  factory _$DailyWeatherOpenMeteoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyWeatherOpenMeteoImplFromJson(json);

  /// iso8601
  @override
  @JsonKey(name: 'time')
  @DateTimeISO8601Converter()
  final DateTime time;

  /// Maximum daily air temperature at 2 meters above ground, °C
  @override
  @JsonKey(name: 'temperature_2m_max')
  final double temp2mMax;

  /// Minimum daily air temperature at 2 meters above ground, °C
  @override
  @JsonKey(name: 'temperature_2m_min')
  final double temp2mMin;

  /// Maximum daily apparent temperature, °C
  @override
  @JsonKey(name: 'apparent_temperature_max')
  final double apparentTempMax;

  /// Minimum daily apparent temperature, °C
  @override
  @JsonKey(name: 'apparent_temperature_min')
  final double apparentTempMin;

  /// Sunset time, iso8601
  @override
  @JsonKey(name: 'sunrise')
  @DateTimeISO8601Converter()
  final DateTime sunrise;

  /// Sunset time, iso8601
  @override
  @JsonKey(name: 'sunset')
  @DateTimeISO8601Converter()
  final DateTime sunset;

  /// Number of seconds of daylight per day, seconds
  @override
  @JsonKey(name: 'daylight_duration')
  @DurationSecConverter()
  final Duration daylightDur;

  ///	Daily maximum in UV Index starting from 0.
  @override
  @JsonKey(name: 'uv_index_max')
  final double uviMax;

  /// Sum of daily precipitation (including rain, showers and snowfall), mm
  @override
  @JsonKey(name: 'precipitation_sum')
  final double precipitationSum;

  /// Probability of precipitation, 0-100 %
  @override
  @JsonKey(name: 'precipitation_probability_max')
  final double popMax;

  /// Sum of daily rain, mm
  @override
  @JsonKey(name: 'rain_sum')
  final double rainSum;

  /// Sum of daily showers, mm
  @override
  @JsonKey(name: 'showers_sum')
  final double showersSum;

  /// Sum of daily snowfall, cm
  @override
  @JsonKey(name: 'snowfall_sum')
  final double snowfallSum;

  /// Maximum wind speed on a day, m/s
  @override
  @JsonKey(name: 'wind_speed_10m_max')
  final double windSpeed10mMax;

  /// Maximum wind gusts on a day, m/s
  @override
  @JsonKey(name: 'wind_gusts_10m_max')
  final double windGusts10mMax;

  /// Dominant wind direction, 0-360°
  @override
  @JsonKey(name: 'wind_direction_10m_dominant')
  final int windDirection10mDominant;

  /// WMO Weather interpretation codes, 0-99
  @override
  @JsonKey(name: 'weather_code')
  @OpenMeteoWeatherCodeConverter()
  final OpenMeteoWeatherCode weatherCode;

  @override
  String toString() {
    return 'DailyWeatherOpenMeteo(time: $time, temp2mMax: $temp2mMax, temp2mMin: $temp2mMin, apparentTempMax: $apparentTempMax, apparentTempMin: $apparentTempMin, sunrise: $sunrise, sunset: $sunset, daylightDur: $daylightDur, uviMax: $uviMax, precipitationSum: $precipitationSum, popMax: $popMax, rainSum: $rainSum, showersSum: $showersSum, snowfallSum: $snowfallSum, windSpeed10mMax: $windSpeed10mMax, windGusts10mMax: $windGusts10mMax, windDirection10mDominant: $windDirection10mDominant, weatherCode: $weatherCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyWeatherOpenMeteoImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.temp2mMax, temp2mMax) ||
                other.temp2mMax == temp2mMax) &&
            (identical(other.temp2mMin, temp2mMin) ||
                other.temp2mMin == temp2mMin) &&
            (identical(other.apparentTempMax, apparentTempMax) ||
                other.apparentTempMax == apparentTempMax) &&
            (identical(other.apparentTempMin, apparentTempMin) ||
                other.apparentTempMin == apparentTempMin) &&
            (identical(other.sunrise, sunrise) || other.sunrise == sunrise) &&
            (identical(other.sunset, sunset) || other.sunset == sunset) &&
            (identical(other.daylightDur, daylightDur) ||
                other.daylightDur == daylightDur) &&
            (identical(other.uviMax, uviMax) || other.uviMax == uviMax) &&
            (identical(other.precipitationSum, precipitationSum) ||
                other.precipitationSum == precipitationSum) &&
            (identical(other.popMax, popMax) || other.popMax == popMax) &&
            (identical(other.rainSum, rainSum) || other.rainSum == rainSum) &&
            (identical(other.showersSum, showersSum) ||
                other.showersSum == showersSum) &&
            (identical(other.snowfallSum, snowfallSum) ||
                other.snowfallSum == snowfallSum) &&
            (identical(other.windSpeed10mMax, windSpeed10mMax) ||
                other.windSpeed10mMax == windSpeed10mMax) &&
            (identical(other.windGusts10mMax, windGusts10mMax) ||
                other.windGusts10mMax == windGusts10mMax) &&
            (identical(
                    other.windDirection10mDominant, windDirection10mDominant) ||
                other.windDirection10mDominant == windDirection10mDominant) &&
            (identical(other.weatherCode, weatherCode) ||
                other.weatherCode == weatherCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      time,
      temp2mMax,
      temp2mMin,
      apparentTempMax,
      apparentTempMin,
      sunrise,
      sunset,
      daylightDur,
      uviMax,
      precipitationSum,
      popMax,
      rainSum,
      showersSum,
      snowfallSum,
      windSpeed10mMax,
      windGusts10mMax,
      windDirection10mDominant,
      weatherCode);

  /// Create a copy of DailyWeatherOpenMeteo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyWeatherOpenMeteoImplCopyWith<_$DailyWeatherOpenMeteoImpl>
      get copyWith => __$$DailyWeatherOpenMeteoImplCopyWithImpl<
          _$DailyWeatherOpenMeteoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyWeatherOpenMeteoImplToJson(
      this,
    );
  }
}

abstract class _DailyWeatherOpenMeteo implements DailyWeatherOpenMeteo {
  const factory _DailyWeatherOpenMeteo(
          {@JsonKey(name: 'time')
          @DateTimeISO8601Converter()
          required final DateTime time,
          @JsonKey(name: 'temperature_2m_max') required final double temp2mMax,
          @JsonKey(name: 'temperature_2m_min') required final double temp2mMin,
          @JsonKey(name: 'apparent_temperature_max')
          required final double apparentTempMax,
          @JsonKey(name: 'apparent_temperature_min')
          required final double apparentTempMin,
          @JsonKey(name: 'sunrise')
          @DateTimeISO8601Converter()
          required final DateTime sunrise,
          @JsonKey(name: 'sunset')
          @DateTimeISO8601Converter()
          required final DateTime sunset,
          @JsonKey(name: 'daylight_duration')
          @DurationSecConverter()
          required final Duration daylightDur,
          @JsonKey(name: 'uv_index_max') required final double uviMax,
          @JsonKey(name: 'precipitation_sum')
          required final double precipitationSum,
          @JsonKey(name: 'precipitation_probability_max')
          required final double popMax,
          @JsonKey(name: 'rain_sum') required final double rainSum,
          @JsonKey(name: 'showers_sum') required final double showersSum,
          @JsonKey(name: 'snowfall_sum') required final double snowfallSum,
          @JsonKey(name: 'wind_speed_10m_max')
          required final double windSpeed10mMax,
          @JsonKey(name: 'wind_gusts_10m_max')
          required final double windGusts10mMax,
          @JsonKey(name: 'wind_direction_10m_dominant')
          required final int windDirection10mDominant,
          @JsonKey(name: 'weather_code')
          @OpenMeteoWeatherCodeConverter()
          required final OpenMeteoWeatherCode weatherCode}) =
      _$DailyWeatherOpenMeteoImpl;

  factory _DailyWeatherOpenMeteo.fromJson(Map<String, dynamic> json) =
      _$DailyWeatherOpenMeteoImpl.fromJson;

  /// iso8601
  @override
  @JsonKey(name: 'time')
  @DateTimeISO8601Converter()
  DateTime get time;

  /// Maximum daily air temperature at 2 meters above ground, °C
  @override
  @JsonKey(name: 'temperature_2m_max')
  double get temp2mMax;

  /// Minimum daily air temperature at 2 meters above ground, °C
  @override
  @JsonKey(name: 'temperature_2m_min')
  double get temp2mMin;

  /// Maximum daily apparent temperature, °C
  @override
  @JsonKey(name: 'apparent_temperature_max')
  double get apparentTempMax;

  /// Minimum daily apparent temperature, °C
  @override
  @JsonKey(name: 'apparent_temperature_min')
  double get apparentTempMin;

  /// Sunset time, iso8601
  @override
  @JsonKey(name: 'sunrise')
  @DateTimeISO8601Converter()
  DateTime get sunrise;

  /// Sunset time, iso8601
  @override
  @JsonKey(name: 'sunset')
  @DateTimeISO8601Converter()
  DateTime get sunset;

  /// Number of seconds of daylight per day, seconds
  @override
  @JsonKey(name: 'daylight_duration')
  @DurationSecConverter()
  Duration get daylightDur;

  ///	Daily maximum in UV Index starting from 0.
  @override
  @JsonKey(name: 'uv_index_max')
  double get uviMax;

  /// Sum of daily precipitation (including rain, showers and snowfall), mm
  @override
  @JsonKey(name: 'precipitation_sum')
  double get precipitationSum;

  /// Probability of precipitation, 0-100 %
  @override
  @JsonKey(name: 'precipitation_probability_max')
  double get popMax;

  /// Sum of daily rain, mm
  @override
  @JsonKey(name: 'rain_sum')
  double get rainSum;

  /// Sum of daily showers, mm
  @override
  @JsonKey(name: 'showers_sum')
  double get showersSum;

  /// Sum of daily snowfall, cm
  @override
  @JsonKey(name: 'snowfall_sum')
  double get snowfallSum;

  /// Maximum wind speed on a day, m/s
  @override
  @JsonKey(name: 'wind_speed_10m_max')
  double get windSpeed10mMax;

  /// Maximum wind gusts on a day, m/s
  @override
  @JsonKey(name: 'wind_gusts_10m_max')
  double get windGusts10mMax;

  /// Dominant wind direction, 0-360°
  @override
  @JsonKey(name: 'wind_direction_10m_dominant')
  int get windDirection10mDominant;

  /// WMO Weather interpretation codes, 0-99
  @override
  @JsonKey(name: 'weather_code')
  @OpenMeteoWeatherCodeConverter()
  OpenMeteoWeatherCode get weatherCode;

  /// Create a copy of DailyWeatherOpenMeteo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyWeatherOpenMeteoImplCopyWith<_$DailyWeatherOpenMeteoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
