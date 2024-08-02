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
      @JsonKey(name: 'current') CurrentWeatherOpenMeteo currentWeather});

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
      @JsonKey(name: 'current') CurrentWeatherOpenMeteo currentWeather});

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
      @JsonKey(name: 'current') required this.currentWeather})
      : super._();

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

  @override
  String toString() {
    return 'ForecastOpenMeteoResponse(latitude: $latitude, longitude: $longitude, genTimeMs: $genTimeMs, utcOffsetSeconds: $utcOffsetSeconds, timezone: $timezone, timezoneAbbr: $timezoneAbbr, elevation: $elevation, currentWeather: $currentWeather)';
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
                other.currentWeather == currentWeather));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude, genTimeMs,
      utcOffsetSeconds, timezone, timezoneAbbr, elevation, currentWeather);

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
      required final CurrentWeatherOpenMeteo
          currentWeather}) = _$ForecastOpenMeteoResponseImpl;
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
  double get temperature2m => throw _privateConstructorUsedError;
  @JsonKey(name: 'relative_humidity_2m')
  int get relativeHumidity2m => throw _privateConstructorUsedError;
  @JsonKey(name: 'apparent_temperature')
  double get apparentTemperature => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_day')
  int get isDay => throw _privateConstructorUsedError;
  @JsonKey(name: 'precipitation')
  int get precipitation => throw _privateConstructorUsedError;
  @JsonKey(name: 'rain')
  int get rain => throw _privateConstructorUsedError;
  @JsonKey(name: 'showers')
  int get showers => throw _privateConstructorUsedError;
  @JsonKey(name: 'snowfall')
  int get snowfall => throw _privateConstructorUsedError;
  @JsonKey(name: 'weather_code')
  int get weatherCode => throw _privateConstructorUsedError;
  @JsonKey(name: 'cloud_cover')
  int get cloudCover => throw _privateConstructorUsedError;
  @JsonKey(name: 'pressure_msl')
  double get pressureMsl => throw _privateConstructorUsedError;
  @JsonKey(name: 'surface_pressure')
  double get surfacePressure => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_speed_10m')
  double get windSpeed10m => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_direction_10m')
  int get windDirection10m => throw _privateConstructorUsedError;
  @JsonKey(name: 'wind_gusts_10m')
  double get windGusts10m => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'temperature_2m') double temperature2m,
      @JsonKey(name: 'relative_humidity_2m') int relativeHumidity2m,
      @JsonKey(name: 'apparent_temperature') double apparentTemperature,
      @JsonKey(name: 'is_day') int isDay,
      @JsonKey(name: 'precipitation') int precipitation,
      @JsonKey(name: 'rain') int rain,
      @JsonKey(name: 'showers') int showers,
      @JsonKey(name: 'snowfall') int snowfall,
      @JsonKey(name: 'weather_code') int weatherCode,
      @JsonKey(name: 'cloud_cover') int cloudCover,
      @JsonKey(name: 'pressure_msl') double pressureMsl,
      @JsonKey(name: 'surface_pressure') double surfacePressure,
      @JsonKey(name: 'wind_speed_10m') double windSpeed10m,
      @JsonKey(name: 'wind_direction_10m') int windDirection10m,
      @JsonKey(name: 'wind_gusts_10m') double windGusts10m});
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
    Object? temperature2m = null,
    Object? relativeHumidity2m = null,
    Object? apparentTemperature = null,
    Object? isDay = null,
    Object? precipitation = null,
    Object? rain = null,
    Object? showers = null,
    Object? snowfall = null,
    Object? weatherCode = null,
    Object? cloudCover = null,
    Object? pressureMsl = null,
    Object? surfacePressure = null,
    Object? windSpeed10m = null,
    Object? windDirection10m = null,
    Object? windGusts10m = null,
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
      temperature2m: null == temperature2m
          ? _value.temperature2m
          : temperature2m // ignore: cast_nullable_to_non_nullable
              as double,
      relativeHumidity2m: null == relativeHumidity2m
          ? _value.relativeHumidity2m
          : relativeHumidity2m // ignore: cast_nullable_to_non_nullable
              as int,
      apparentTemperature: null == apparentTemperature
          ? _value.apparentTemperature
          : apparentTemperature // ignore: cast_nullable_to_non_nullable
              as double,
      isDay: null == isDay
          ? _value.isDay
          : isDay // ignore: cast_nullable_to_non_nullable
              as int,
      precipitation: null == precipitation
          ? _value.precipitation
          : precipitation // ignore: cast_nullable_to_non_nullable
              as int,
      rain: null == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as int,
      showers: null == showers
          ? _value.showers
          : showers // ignore: cast_nullable_to_non_nullable
              as int,
      snowfall: null == snowfall
          ? _value.snowfall
          : snowfall // ignore: cast_nullable_to_non_nullable
              as int,
      weatherCode: null == weatherCode
          ? _value.weatherCode
          : weatherCode // ignore: cast_nullable_to_non_nullable
              as int,
      cloudCover: null == cloudCover
          ? _value.cloudCover
          : cloudCover // ignore: cast_nullable_to_non_nullable
              as int,
      pressureMsl: null == pressureMsl
          ? _value.pressureMsl
          : pressureMsl // ignore: cast_nullable_to_non_nullable
              as double,
      surfacePressure: null == surfacePressure
          ? _value.surfacePressure
          : surfacePressure // ignore: cast_nullable_to_non_nullable
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
      @JsonKey(name: 'temperature_2m') double temperature2m,
      @JsonKey(name: 'relative_humidity_2m') int relativeHumidity2m,
      @JsonKey(name: 'apparent_temperature') double apparentTemperature,
      @JsonKey(name: 'is_day') int isDay,
      @JsonKey(name: 'precipitation') int precipitation,
      @JsonKey(name: 'rain') int rain,
      @JsonKey(name: 'showers') int showers,
      @JsonKey(name: 'snowfall') int snowfall,
      @JsonKey(name: 'weather_code') int weatherCode,
      @JsonKey(name: 'cloud_cover') int cloudCover,
      @JsonKey(name: 'pressure_msl') double pressureMsl,
      @JsonKey(name: 'surface_pressure') double surfacePressure,
      @JsonKey(name: 'wind_speed_10m') double windSpeed10m,
      @JsonKey(name: 'wind_direction_10m') int windDirection10m,
      @JsonKey(name: 'wind_gusts_10m') double windGusts10m});
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
    Object? temperature2m = null,
    Object? relativeHumidity2m = null,
    Object? apparentTemperature = null,
    Object? isDay = null,
    Object? precipitation = null,
    Object? rain = null,
    Object? showers = null,
    Object? snowfall = null,
    Object? weatherCode = null,
    Object? cloudCover = null,
    Object? pressureMsl = null,
    Object? surfacePressure = null,
    Object? windSpeed10m = null,
    Object? windDirection10m = null,
    Object? windGusts10m = null,
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
      temperature2m: null == temperature2m
          ? _value.temperature2m
          : temperature2m // ignore: cast_nullable_to_non_nullable
              as double,
      relativeHumidity2m: null == relativeHumidity2m
          ? _value.relativeHumidity2m
          : relativeHumidity2m // ignore: cast_nullable_to_non_nullable
              as int,
      apparentTemperature: null == apparentTemperature
          ? _value.apparentTemperature
          : apparentTemperature // ignore: cast_nullable_to_non_nullable
              as double,
      isDay: null == isDay
          ? _value.isDay
          : isDay // ignore: cast_nullable_to_non_nullable
              as int,
      precipitation: null == precipitation
          ? _value.precipitation
          : precipitation // ignore: cast_nullable_to_non_nullable
              as int,
      rain: null == rain
          ? _value.rain
          : rain // ignore: cast_nullable_to_non_nullable
              as int,
      showers: null == showers
          ? _value.showers
          : showers // ignore: cast_nullable_to_non_nullable
              as int,
      snowfall: null == snowfall
          ? _value.snowfall
          : snowfall // ignore: cast_nullable_to_non_nullable
              as int,
      weatherCode: null == weatherCode
          ? _value.weatherCode
          : weatherCode // ignore: cast_nullable_to_non_nullable
              as int,
      cloudCover: null == cloudCover
          ? _value.cloudCover
          : cloudCover // ignore: cast_nullable_to_non_nullable
              as int,
      pressureMsl: null == pressureMsl
          ? _value.pressureMsl
          : pressureMsl // ignore: cast_nullable_to_non_nullable
              as double,
      surfacePressure: null == surfacePressure
          ? _value.surfacePressure
          : surfacePressure // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$CurrentWeatherOpenMeteoImpl extends _CurrentWeatherOpenMeteo {
  const _$CurrentWeatherOpenMeteoImpl(
      {@JsonKey(name: 'time') @DateTimeISO8601Converter() required this.time,
      @JsonKey(name: 'interval') required this.interval,
      @JsonKey(name: 'temperature_2m') required this.temperature2m,
      @JsonKey(name: 'relative_humidity_2m') required this.relativeHumidity2m,
      @JsonKey(name: 'apparent_temperature') required this.apparentTemperature,
      @JsonKey(name: 'is_day') required this.isDay,
      @JsonKey(name: 'precipitation') required this.precipitation,
      @JsonKey(name: 'rain') required this.rain,
      @JsonKey(name: 'showers') required this.showers,
      @JsonKey(name: 'snowfall') required this.snowfall,
      @JsonKey(name: 'weather_code') required this.weatherCode,
      @JsonKey(name: 'cloud_cover') required this.cloudCover,
      @JsonKey(name: 'pressure_msl') required this.pressureMsl,
      @JsonKey(name: 'surface_pressure') required this.surfacePressure,
      @JsonKey(name: 'wind_speed_10m') required this.windSpeed10m,
      @JsonKey(name: 'wind_direction_10m') required this.windDirection10m,
      @JsonKey(name: 'wind_gusts_10m') required this.windGusts10m})
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
  final double temperature2m;
  @override
  @JsonKey(name: 'relative_humidity_2m')
  final int relativeHumidity2m;
  @override
  @JsonKey(name: 'apparent_temperature')
  final double apparentTemperature;
  @override
  @JsonKey(name: 'is_day')
  final int isDay;
  @override
  @JsonKey(name: 'precipitation')
  final int precipitation;
  @override
  @JsonKey(name: 'rain')
  final int rain;
  @override
  @JsonKey(name: 'showers')
  final int showers;
  @override
  @JsonKey(name: 'snowfall')
  final int snowfall;
  @override
  @JsonKey(name: 'weather_code')
  final int weatherCode;
  @override
  @JsonKey(name: 'cloud_cover')
  final int cloudCover;
  @override
  @JsonKey(name: 'pressure_msl')
  final double pressureMsl;
  @override
  @JsonKey(name: 'surface_pressure')
  final double surfacePressure;
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
  String toString() {
    return 'CurrentWeatherOpenMeteo(time: $time, interval: $interval, temperature2m: $temperature2m, relativeHumidity2m: $relativeHumidity2m, apparentTemperature: $apparentTemperature, isDay: $isDay, precipitation: $precipitation, rain: $rain, showers: $showers, snowfall: $snowfall, weatherCode: $weatherCode, cloudCover: $cloudCover, pressureMsl: $pressureMsl, surfacePressure: $surfacePressure, windSpeed10m: $windSpeed10m, windDirection10m: $windDirection10m, windGusts10m: $windGusts10m)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CurrentWeatherOpenMeteoImpl &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.interval, interval) ||
                other.interval == interval) &&
            (identical(other.temperature2m, temperature2m) ||
                other.temperature2m == temperature2m) &&
            (identical(other.relativeHumidity2m, relativeHumidity2m) ||
                other.relativeHumidity2m == relativeHumidity2m) &&
            (identical(other.apparentTemperature, apparentTemperature) ||
                other.apparentTemperature == apparentTemperature) &&
            (identical(other.isDay, isDay) || other.isDay == isDay) &&
            (identical(other.precipitation, precipitation) ||
                other.precipitation == precipitation) &&
            (identical(other.rain, rain) || other.rain == rain) &&
            (identical(other.showers, showers) || other.showers == showers) &&
            (identical(other.snowfall, snowfall) ||
                other.snowfall == snowfall) &&
            (identical(other.weatherCode, weatherCode) ||
                other.weatherCode == weatherCode) &&
            (identical(other.cloudCover, cloudCover) ||
                other.cloudCover == cloudCover) &&
            (identical(other.pressureMsl, pressureMsl) ||
                other.pressureMsl == pressureMsl) &&
            (identical(other.surfacePressure, surfacePressure) ||
                other.surfacePressure == surfacePressure) &&
            (identical(other.windSpeed10m, windSpeed10m) ||
                other.windSpeed10m == windSpeed10m) &&
            (identical(other.windDirection10m, windDirection10m) ||
                other.windDirection10m == windDirection10m) &&
            (identical(other.windGusts10m, windGusts10m) ||
                other.windGusts10m == windGusts10m));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      time,
      interval,
      temperature2m,
      relativeHumidity2m,
      apparentTemperature,
      isDay,
      precipitation,
      rain,
      showers,
      snowfall,
      weatherCode,
      cloudCover,
      pressureMsl,
      surfacePressure,
      windSpeed10m,
      windDirection10m,
      windGusts10m);

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
      @JsonKey(name: 'temperature_2m') required final double temperature2m,
      @JsonKey(name: 'relative_humidity_2m')
      required final int relativeHumidity2m,
      @JsonKey(name: 'apparent_temperature')
      required final double apparentTemperature,
      @JsonKey(name: 'is_day') required final int isDay,
      @JsonKey(name: 'precipitation') required final int precipitation,
      @JsonKey(name: 'rain') required final int rain,
      @JsonKey(name: 'showers') required final int showers,
      @JsonKey(name: 'snowfall') required final int snowfall,
      @JsonKey(name: 'weather_code') required final int weatherCode,
      @JsonKey(name: 'cloud_cover') required final int cloudCover,
      @JsonKey(name: 'pressure_msl') required final double pressureMsl,
      @JsonKey(name: 'surface_pressure') required final double surfacePressure,
      @JsonKey(name: 'wind_speed_10m') required final double windSpeed10m,
      @JsonKey(name: 'wind_direction_10m') required final int windDirection10m,
      @JsonKey(name: 'wind_gusts_10m')
      required final double windGusts10m}) = _$CurrentWeatherOpenMeteoImpl;
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
  double get temperature2m;
  @override
  @JsonKey(name: 'relative_humidity_2m')
  int get relativeHumidity2m;
  @override
  @JsonKey(name: 'apparent_temperature')
  double get apparentTemperature;
  @override
  @JsonKey(name: 'is_day')
  int get isDay;
  @override
  @JsonKey(name: 'precipitation')
  int get precipitation;
  @override
  @JsonKey(name: 'rain')
  int get rain;
  @override
  @JsonKey(name: 'showers')
  int get showers;
  @override
  @JsonKey(name: 'snowfall')
  int get snowfall;
  @override
  @JsonKey(name: 'weather_code')
  int get weatherCode;
  @override
  @JsonKey(name: 'cloud_cover')
  int get cloudCover;
  @override
  @JsonKey(name: 'pressure_msl')
  double get pressureMsl;
  @override
  @JsonKey(name: 'surface_pressure')
  double get surfacePressure;
  @override
  @JsonKey(name: 'wind_speed_10m')
  double get windSpeed10m;
  @override
  @JsonKey(name: 'wind_direction_10m')
  int get windDirection10m;
  @override
  @JsonKey(name: 'wind_gusts_10m')
  double get windGusts10m;

  /// Create a copy of CurrentWeatherOpenMeteo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CurrentWeatherOpenMeteoImplCopyWith<_$CurrentWeatherOpenMeteoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
