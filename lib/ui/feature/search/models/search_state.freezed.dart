// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState()';
}


}

/// @nodoc
class $SearchStateCopyWith<$Res>  {
$SearchStateCopyWith(SearchState _, $Res Function(SearchState) __);
}


/// Adds pattern-matching-related methods to [SearchState].
extension SearchStatePatterns on SearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Found value)?  found,TResult Function( _Saved value)?  saved,TResult Function( _Loading value)?  loading,TResult Function( _Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Found() when found != null:
return found(_that);case _Saved() when saved != null:
return saved(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Found value)  found,required TResult Function( _Saved value)  saved,required TResult Function( _Loading value)  loading,required TResult Function( _Error value)  error,}){
final _that = this;
switch (_that) {
case _Found():
return found(_that);case _Saved():
return saved(_that);case _Loading():
return loading(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Found value)?  found,TResult? Function( _Saved value)?  saved,TResult? Function( _Loading value)?  loading,TResult? Function( _Error value)?  error,}){
final _that = this;
switch (_that) {
case _Found() when found != null:
return found(_that);case _Saved() when saved != null:
return saved(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<Place> places)?  found,TResult Function( List<Place> places)?  saved,TResult Function()?  loading,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Found() when found != null:
return found(_that.places);case _Saved() when saved != null:
return saved(_that.places);case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<Place> places)  found,required TResult Function( List<Place> places)  saved,required TResult Function()  loading,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case _Found():
return found(_that.places);case _Saved():
return saved(_that.places);case _Loading():
return loading();case _Error():
return error();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<Place> places)?  found,TResult? Function( List<Place> places)?  saved,TResult? Function()?  loading,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case _Found() when found != null:
return found(_that.places);case _Saved() when saved != null:
return saved(_that.places);case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class _Found implements SearchState {
  const _Found(final  List<Place> places): _places = places;
  

 final  List<Place> _places;
 List<Place> get places {
  if (_places is EqualUnmodifiableListView) return _places;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_places);
}


/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FoundCopyWith<_Found> get copyWith => __$FoundCopyWithImpl<_Found>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Found&&const DeepCollectionEquality().equals(other._places, _places));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_places));

@override
String toString() {
  return 'SearchState.found(places: $places)';
}


}

/// @nodoc
abstract mixin class _$FoundCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$FoundCopyWith(_Found value, $Res Function(_Found) _then) = __$FoundCopyWithImpl;
@useResult
$Res call({
 List<Place> places
});




}
/// @nodoc
class __$FoundCopyWithImpl<$Res>
    implements _$FoundCopyWith<$Res> {
  __$FoundCopyWithImpl(this._self, this._then);

  final _Found _self;
  final $Res Function(_Found) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? places = null,}) {
  return _then(_Found(
null == places ? _self._places : places // ignore: cast_nullable_to_non_nullable
as List<Place>,
  ));
}


}

/// @nodoc


class _Saved implements SearchState {
  const _Saved(final  List<Place> places): _places = places;
  

 final  List<Place> _places;
 List<Place> get places {
  if (_places is EqualUnmodifiableListView) return _places;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_places);
}


/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SavedCopyWith<_Saved> get copyWith => __$SavedCopyWithImpl<_Saved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Saved&&const DeepCollectionEquality().equals(other._places, _places));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_places));

@override
String toString() {
  return 'SearchState.saved(places: $places)';
}


}

/// @nodoc
abstract mixin class _$SavedCopyWith<$Res> implements $SearchStateCopyWith<$Res> {
  factory _$SavedCopyWith(_Saved value, $Res Function(_Saved) _then) = __$SavedCopyWithImpl;
@useResult
$Res call({
 List<Place> places
});




}
/// @nodoc
class __$SavedCopyWithImpl<$Res>
    implements _$SavedCopyWith<$Res> {
  __$SavedCopyWithImpl(this._self, this._then);

  final _Saved _self;
  final $Res Function(_Saved) _then;

/// Create a copy of SearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? places = null,}) {
  return _then(_Saved(
null == places ? _self._places : places // ignore: cast_nullable_to_non_nullable
as List<Place>,
  ));
}


}

/// @nodoc


class _Loading implements SearchState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.loading()';
}


}




/// @nodoc


class _Error implements SearchState {
  const _Error();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchState.error()';
}


}




// dart format on
