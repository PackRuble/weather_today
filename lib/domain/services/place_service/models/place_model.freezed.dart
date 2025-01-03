// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return _Place.fromJson(json);
}

/// @nodoc
mixin _$Place {
  /// Название местоположения.
  String? get name => throw _privateConstructorUsedError;

  /// Словарь локальных названий местоположения.
  Map<WeatherLanguage, String>? get localNames =>
      throw _privateConstructorUsedError;

  /// Широта местоположения.
  double? get latitude => throw _privateConstructorUsedError;

  /// Долгота местоположения.
  double? get longitude => throw _privateConstructorUsedError;

  /// Название страны.
  String? get country => throw _privateConstructorUsedError;

  /// Код страны в формате ISO 3166-alpha2.
  String? get countryCode => throw _privateConstructorUsedError;

  /// Штат или область.
  String? get state => throw _privateConstructorUsedError;

  /// Заметка об этом месте.
  String? get note => throw _privateConstructorUsedError;

  /// Serializes this Place to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlaceCopyWith<Place> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceCopyWith<$Res> {
  factory $PlaceCopyWith(Place value, $Res Function(Place) then) =
      _$PlaceCopyWithImpl<$Res, Place>;
  @useResult
  $Res call(
      {String? name,
      Map<WeatherLanguage, String>? localNames,
      double? latitude,
      double? longitude,
      String? country,
      String? countryCode,
      String? state,
      String? note});
}

/// @nodoc
class _$PlaceCopyWithImpl<$Res, $Val extends Place>
    implements $PlaceCopyWith<$Res> {
  _$PlaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? localNames = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? country = freezed,
    Object? countryCode = freezed,
    Object? state = freezed,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      localNames: freezed == localNames
          ? _value.localNames
          : localNames // ignore: cast_nullable_to_non_nullable
              as Map<WeatherLanguage, String>?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlaceImplCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$$PlaceImplCopyWith(
          _$PlaceImpl value, $Res Function(_$PlaceImpl) then) =
      __$$PlaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? name,
      Map<WeatherLanguage, String>? localNames,
      double? latitude,
      double? longitude,
      String? country,
      String? countryCode,
      String? state,
      String? note});
}

/// @nodoc
class __$$PlaceImplCopyWithImpl<$Res>
    extends _$PlaceCopyWithImpl<$Res, _$PlaceImpl>
    implements _$$PlaceImplCopyWith<$Res> {
  __$$PlaceImplCopyWithImpl(
      _$PlaceImpl _value, $Res Function(_$PlaceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? localNames = freezed,
    Object? latitude = freezed,
    Object? longitude = freezed,
    Object? country = freezed,
    Object? countryCode = freezed,
    Object? state = freezed,
    Object? note = freezed,
  }) {
    return _then(_$PlaceImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      localNames: freezed == localNames
          ? _value._localNames
          : localNames // ignore: cast_nullable_to_non_nullable
              as Map<WeatherLanguage, String>?,
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: freezed == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$PlaceImpl extends _Place {
  const _$PlaceImpl(
      {required this.name,
      required final Map<WeatherLanguage, String>? localNames,
      required this.latitude,
      required this.longitude,
      required this.country,
      required this.countryCode,
      required this.state,
      this.note})
      : _localNames = localNames,
        super._();

  factory _$PlaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaceImplFromJson(json);

  /// Название местоположения.
  @override
  final String? name;

  /// Словарь локальных названий местоположения.
  final Map<WeatherLanguage, String>? _localNames;

  /// Словарь локальных названий местоположения.
  @override
  Map<WeatherLanguage, String>? get localNames {
    final value = _localNames;
    if (value == null) return null;
    if (_localNames is EqualUnmodifiableMapView) return _localNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  /// Широта местоположения.
  @override
  final double? latitude;

  /// Долгота местоположения.
  @override
  final double? longitude;

  /// Название страны.
  @override
  final String? country;

  /// Код страны в формате ISO 3166-alpha2.
  @override
  final String? countryCode;

  /// Штат или область.
  @override
  final String? state;

  /// Заметка об этом месте.
  @override
  final String? note;

  @override
  String toString() {
    return 'Place(name: $name, localNames: $localNames, latitude: $latitude, longitude: $longitude, country: $country, countryCode: $countryCode, state: $state, note: $note)';
  }

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      __$$PlaceImplCopyWithImpl<_$PlaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaceImplToJson(
      this,
    );
  }
}

abstract class _Place extends Place {
  const factory _Place(
      {required final String? name,
      required final Map<WeatherLanguage, String>? localNames,
      required final double? latitude,
      required final double? longitude,
      required final String? country,
      required final String? countryCode,
      required final String? state,
      final String? note}) = _$PlaceImpl;
  const _Place._() : super._();

  factory _Place.fromJson(Map<String, dynamic> json) = _$PlaceImpl.fromJson;

  /// Название местоположения.
  @override
  String? get name;

  /// Словарь локальных названий местоположения.
  @override
  Map<WeatherLanguage, String>? get localNames;

  /// Широта местоположения.
  @override
  double? get latitude;

  /// Долгота местоположения.
  @override
  double? get longitude;

  /// Название страны.
  @override
  String? get country;

  /// Код страны в формате ISO 3166-alpha2.
  @override
  String? get countryCode;

  /// Штат или область.
  @override
  String? get state;

  /// Заметка об этом месте.
  @override
  String? get note;

  /// Create a copy of Place
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlaceImplCopyWith<_$PlaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
