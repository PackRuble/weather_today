// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'design_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DesignPage {

 WeatherPage get page; AppVisualDesign get design;
/// Create a copy of DesignPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DesignPageCopyWith<DesignPage> get copyWith => _$DesignPageCopyWithImpl<DesignPage>(this as DesignPage, _$identity);

  /// Serializes this DesignPage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DesignPage&&(identical(other.page, page) || other.page == page)&&(identical(other.design, design) || other.design == design));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,design);

@override
String toString() {
  return 'DesignPage(page: $page, design: $design)';
}


}

/// @nodoc
abstract mixin class $DesignPageCopyWith<$Res>  {
  factory $DesignPageCopyWith(DesignPage value, $Res Function(DesignPage) _then) = _$DesignPageCopyWithImpl;
@useResult
$Res call({
 WeatherPage page, AppVisualDesign design
});




}
/// @nodoc
class _$DesignPageCopyWithImpl<$Res>
    implements $DesignPageCopyWith<$Res> {
  _$DesignPageCopyWithImpl(this._self, this._then);

  final DesignPage _self;
  final $Res Function(DesignPage) _then;

/// Create a copy of DesignPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? page = null,Object? design = null,}) {
  return _then(_self.copyWith(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as WeatherPage,design: null == design ? _self.design : design // ignore: cast_nullable_to_non_nullable
as AppVisualDesign,
  ));
}

}


/// Adds pattern-matching-related methods to [DesignPage].
extension DesignPagePatterns on DesignPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DesignPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DesignPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DesignPage value)  $default,){
final _that = this;
switch (_that) {
case _DesignPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DesignPage value)?  $default,){
final _that = this;
switch (_that) {
case _DesignPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( WeatherPage page,  AppVisualDesign design)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DesignPage() when $default != null:
return $default(_that.page,_that.design);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( WeatherPage page,  AppVisualDesign design)  $default,) {final _that = this;
switch (_that) {
case _DesignPage():
return $default(_that.page,_that.design);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( WeatherPage page,  AppVisualDesign design)?  $default,) {final _that = this;
switch (_that) {
case _DesignPage() when $default != null:
return $default(_that.page,_that.design);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DesignPage implements DesignPage {
  const _DesignPage({required this.page, required this.design});
  factory _DesignPage.fromJson(Map<String, dynamic> json) => _$DesignPageFromJson(json);

@override final  WeatherPage page;
@override final  AppVisualDesign design;

/// Create a copy of DesignPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DesignPageCopyWith<_DesignPage> get copyWith => __$DesignPageCopyWithImpl<_DesignPage>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DesignPageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DesignPage&&(identical(other.page, page) || other.page == page)&&(identical(other.design, design) || other.design == design));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,page,design);

@override
String toString() {
  return 'DesignPage(page: $page, design: $design)';
}


}

/// @nodoc
abstract mixin class _$DesignPageCopyWith<$Res> implements $DesignPageCopyWith<$Res> {
  factory _$DesignPageCopyWith(_DesignPage value, $Res Function(_DesignPage) _then) = __$DesignPageCopyWithImpl;
@override @useResult
$Res call({
 WeatherPage page, AppVisualDesign design
});




}
/// @nodoc
class __$DesignPageCopyWithImpl<$Res>
    implements _$DesignPageCopyWith<$Res> {
  __$DesignPageCopyWithImpl(this._self, this._then);

  final _DesignPage _self;
  final $Res Function(_DesignPage) _then;

/// Create a copy of DesignPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? page = null,Object? design = null,}) {
  return _then(_DesignPage(
page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as WeatherPage,design: null == design ? _self.design : design // ignore: cast_nullable_to_non_nullable
as AppVisualDesign,
  ));
}


}

// dart format on
