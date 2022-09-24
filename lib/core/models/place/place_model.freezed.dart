// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'place_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Place _$PlaceFromJson(Map<String, dynamic> json) {
  return _SavedPlace.fromJson(json);
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

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaceCopyWith<Place> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceCopyWith<$Res> {
  factory $PlaceCopyWith(Place value, $Res Function(Place) then) =
      _$PlaceCopyWithImpl<$Res>;

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
class _$PlaceCopyWithImpl<$Res> implements $PlaceCopyWith<$Res> {
  _$PlaceCopyWithImpl(this._value, this._then);

  final Place _value;

  // ignore: unused_field
  final $Res Function(Place) _then;

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
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      localNames: localNames == freezed
          ? _value.localNames
          : localNames // ignore: cast_nullable_to_non_nullable
              as Map<WeatherLanguage, String>?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: countryCode == freezed
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_SavedPlaceCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$$_SavedPlaceCopyWith(
          _$_SavedPlace value, $Res Function(_$_SavedPlace) then) =
      __$$_SavedPlaceCopyWithImpl<$Res>;

  @override
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
class __$$_SavedPlaceCopyWithImpl<$Res> extends _$PlaceCopyWithImpl<$Res>
    implements _$$_SavedPlaceCopyWith<$Res> {
  __$$_SavedPlaceCopyWithImpl(
      _$_SavedPlace _value, $Res Function(_$_SavedPlace) _then)
      : super(_value, (v) => _then(v as _$_SavedPlace));

  @override
  _$_SavedPlace get _value => super._value as _$_SavedPlace;

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
    return _then(_$_SavedPlace(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      localNames: localNames == freezed
          ? _value._localNames
          : localNames // ignore: cast_nullable_to_non_nullable
              as Map<WeatherLanguage, String>?,
      latitude: latitude == freezed
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: longitude == freezed
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCode: countryCode == freezed
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      state: state == freezed
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      note: note == freezed
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_SavedPlace extends _SavedPlace {
  const _$_SavedPlace(
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

  factory _$_SavedPlace.fromJson(Map<String, dynamic> json) =>
      _$$_SavedPlaceFromJson(json);

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

  @JsonKey(ignore: true)
  @override
  _$$_SavedPlaceCopyWith<_$_SavedPlace> get copyWith =>
      __$$_SavedPlaceCopyWithImpl<_$_SavedPlace>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SavedPlaceToJson(
      this,
    );
  }
}

abstract class _SavedPlace extends Place {
  const factory _SavedPlace(
      {required final String? name,
      required final Map<WeatherLanguage, String>? localNames,
      required final double? latitude,
      required final double? longitude,
      required final String? country,
      required final String? countryCode,
      required final String? state,
      final String? note}) = _$_SavedPlace;

  const _SavedPlace._() : super._();

  factory _SavedPlace.fromJson(Map<String, dynamic> json) =
      _$_SavedPlace.fromJson;

  @override

  /// Название местоположения.
  String? get name;

  @override

  /// Словарь локальных названий местоположения.
  Map<WeatherLanguage, String>? get localNames;

  @override

  /// Широта местоположения.
  double? get latitude;

  @override

  /// Долгота местоположения.
  double? get longitude;

  @override

  /// Название страны.
  String? get country;

  @override

  /// Код страны в формате ISO 3166-alpha2.
  String? get countryCode;

  @override

  /// Штат или область.
  String? get state;

  @override

  /// Заметка об этом месте.
  String? get note;

  @override
  @JsonKey(ignore: true)
  _$$_SavedPlaceCopyWith<_$_SavedPlace> get copyWith =>
      throw _privateConstructorUsedError;
}
