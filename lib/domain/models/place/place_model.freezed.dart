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
abstract class _$$SavedPlaceImplCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$$SavedPlaceImplCopyWith(
          _$SavedPlaceImpl value, $Res Function(_$SavedPlaceImpl) then) =
      __$$SavedPlaceImplCopyWithImpl<$Res>;
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
class __$$SavedPlaceImplCopyWithImpl<$Res>
    extends _$PlaceCopyWithImpl<$Res, _$SavedPlaceImpl>
    implements _$$SavedPlaceImplCopyWith<$Res> {
  __$$SavedPlaceImplCopyWithImpl(
      _$SavedPlaceImpl _value, $Res Function(_$SavedPlaceImpl) _then)
      : super(_value, _then);

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
    return _then(_$SavedPlaceImpl(
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
class _$SavedPlaceImpl extends _SavedPlace {
  const _$SavedPlaceImpl(
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

  factory _$SavedPlaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$SavedPlaceImplFromJson(json);

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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SavedPlaceImplCopyWith<_$SavedPlaceImpl> get copyWith =>
      __$$SavedPlaceImplCopyWithImpl<_$SavedPlaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SavedPlaceImplToJson(
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
      final String? note}) = _$SavedPlaceImpl;
  const _SavedPlace._() : super._();

  factory _SavedPlace.fromJson(Map<String, dynamic> json) =
      _$SavedPlaceImpl.fromJson;

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
  _$$SavedPlaceImplCopyWith<_$SavedPlaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
