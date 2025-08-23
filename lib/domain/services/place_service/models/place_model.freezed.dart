// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Place {

/// Название местоположения.
 String? get name;/// Словарь локальных названий местоположения.
 Map<WeatherLanguage, String>? get localNames;/// Широта местоположения.
 double? get latitude;/// Долгота местоположения.
 double? get longitude;/// Название страны.
 String? get country;/// Код страны в формате ISO 3166-alpha2.
 String? get countryCode;/// Штат или область.
 String? get state;/// Заметка об этом месте.
 String? get note;
/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceCopyWith<Place> get copyWith => _$PlaceCopyWithImpl<Place>(this as Place, _$identity);

  /// Serializes this Place to a JSON map.
  Map<String, dynamic> toJson();




@override
String toString() {
  return 'Place(name: $name, localNames: $localNames, latitude: $latitude, longitude: $longitude, country: $country, countryCode: $countryCode, state: $state, note: $note)';
}


}

/// @nodoc
abstract mixin class $PlaceCopyWith<$Res>  {
  factory $PlaceCopyWith(Place value, $Res Function(Place) _then) = _$PlaceCopyWithImpl;
@useResult
$Res call({
 String? name, Map<WeatherLanguage, String>? localNames, double? latitude, double? longitude, String? country, String? countryCode, String? state, String? note
});




}
/// @nodoc
class _$PlaceCopyWithImpl<$Res>
    implements $PlaceCopyWith<$Res> {
  _$PlaceCopyWithImpl(this._self, this._then);

  final Place _self;
  final $Res Function(Place) _then;

/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? localNames = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? country = freezed,Object? countryCode = freezed,Object? state = freezed,Object? note = freezed,}) {
  return _then(_self.copyWith(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,localNames: freezed == localNames ? _self.localNames : localNames // ignore: cast_nullable_to_non_nullable
as Map<WeatherLanguage, String>?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Place].
extension PlacePatterns on Place {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Place value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Place() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Place value)  $default,){
final _that = this;
switch (_that) {
case _Place():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Place value)?  $default,){
final _that = this;
switch (_that) {
case _Place() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  Map<WeatherLanguage, String>? localNames,  double? latitude,  double? longitude,  String? country,  String? countryCode,  String? state,  String? note)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Place() when $default != null:
return $default(_that.name,_that.localNames,_that.latitude,_that.longitude,_that.country,_that.countryCode,_that.state,_that.note);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  Map<WeatherLanguage, String>? localNames,  double? latitude,  double? longitude,  String? country,  String? countryCode,  String? state,  String? note)  $default,) {final _that = this;
switch (_that) {
case _Place():
return $default(_that.name,_that.localNames,_that.latitude,_that.longitude,_that.country,_that.countryCode,_that.state,_that.note);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  Map<WeatherLanguage, String>? localNames,  double? latitude,  double? longitude,  String? country,  String? countryCode,  String? state,  String? note)?  $default,) {final _that = this;
switch (_that) {
case _Place() when $default != null:
return $default(_that.name,_that.localNames,_that.latitude,_that.longitude,_that.country,_that.countryCode,_that.state,_that.note);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _Place extends Place {
  const _Place({required this.name, required final  Map<WeatherLanguage, String>? localNames, required this.latitude, required this.longitude, required this.country, required this.countryCode, required this.state, this.note}): _localNames = localNames,super._();
  factory _Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);

/// Название местоположения.
@override final  String? name;
/// Словарь локальных названий местоположения.
 final  Map<WeatherLanguage, String>? _localNames;
/// Словарь локальных названий местоположения.
@override Map<WeatherLanguage, String>? get localNames {
  final value = _localNames;
  if (value == null) return null;
  if (_localNames is EqualUnmodifiableMapView) return _localNames;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

/// Широта местоположения.
@override final  double? latitude;
/// Долгота местоположения.
@override final  double? longitude;
/// Название страны.
@override final  String? country;
/// Код страны в формате ISO 3166-alpha2.
@override final  String? countryCode;
/// Штат или область.
@override final  String? state;
/// Заметка об этом месте.
@override final  String? note;

/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceCopyWith<_Place> get copyWith => __$PlaceCopyWithImpl<_Place>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaceToJson(this, );
}



@override
String toString() {
  return 'Place(name: $name, localNames: $localNames, latitude: $latitude, longitude: $longitude, country: $country, countryCode: $countryCode, state: $state, note: $note)';
}


}

/// @nodoc
abstract mixin class _$PlaceCopyWith<$Res> implements $PlaceCopyWith<$Res> {
  factory _$PlaceCopyWith(_Place value, $Res Function(_Place) _then) = __$PlaceCopyWithImpl;
@override @useResult
$Res call({
 String? name, Map<WeatherLanguage, String>? localNames, double? latitude, double? longitude, String? country, String? countryCode, String? state, String? note
});




}
/// @nodoc
class __$PlaceCopyWithImpl<$Res>
    implements _$PlaceCopyWith<$Res> {
  __$PlaceCopyWithImpl(this._self, this._then);

  final _Place _self;
  final $Res Function(_Place) _then;

/// Create a copy of Place
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? localNames = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? country = freezed,Object? countryCode = freezed,Object? state = freezed,Object? note = freezed,}) {
  return _then(_Place(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,localNames: freezed == localNames ? _self._localNames : localNames // ignore: cast_nullable_to_non_nullable
as Map<WeatherLanguage, String>?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as double?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as double?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,countryCode: freezed == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String?,state: freezed == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String?,note: freezed == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
