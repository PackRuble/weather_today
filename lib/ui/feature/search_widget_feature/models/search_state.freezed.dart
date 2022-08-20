// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'search_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SearchState {
  /// Список мест, которые будут выведены на экран.
  List<Place> get displayedPlaces => throw _privateConstructorUsedError;

  /// Подсказка.
  String get tip => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res>;
  $Res call({List<Place> displayedPlaces, String tip});
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res> implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  final SearchState _value;
  // ignore: unused_field
  final $Res Function(SearchState) _then;

  @override
  $Res call({
    Object? displayedPlaces = freezed,
    Object? tip = freezed,
  }) {
    return _then(_value.copyWith(
      displayedPlaces: displayedPlaces == freezed
          ? _value.displayedPlaces
          : displayedPlaces // ignore: cast_nullable_to_non_nullable
              as List<Place>,
      tip: tip == freezed
          ? _value.tip
          : tip // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_SearchStateCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$_SearchStateCopyWith(
          _$_SearchState value, $Res Function(_$_SearchState) then) =
      __$$_SearchStateCopyWithImpl<$Res>;
  @override
  $Res call({List<Place> displayedPlaces, String tip});
}

/// @nodoc
class __$$_SearchStateCopyWithImpl<$Res> extends _$SearchStateCopyWithImpl<$Res>
    implements _$$_SearchStateCopyWith<$Res> {
  __$$_SearchStateCopyWithImpl(
      _$_SearchState _value, $Res Function(_$_SearchState) _then)
      : super(_value, (v) => _then(v as _$_SearchState));

  @override
  _$_SearchState get _value => super._value as _$_SearchState;

  @override
  $Res call({
    Object? displayedPlaces = freezed,
    Object? tip = freezed,
  }) {
    return _then(_$_SearchState(
      displayedPlaces: displayedPlaces == freezed
          ? _value._displayedPlaces
          : displayedPlaces // ignore: cast_nullable_to_non_nullable
              as List<Place>,
      tip: tip == freezed
          ? _value.tip
          : tip // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SearchState implements _SearchState {
  const _$_SearchState(
      {required final List<Place> displayedPlaces, required this.tip})
      : _displayedPlaces = displayedPlaces;

  /// Список мест, которые будут выведены на экран.
  final List<Place> _displayedPlaces;

  /// Список мест, которые будут выведены на экран.
  @override
  List<Place> get displayedPlaces {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_displayedPlaces);
  }

  /// Подсказка.
  @override
  final String tip;

  @override
  String toString() {
    return 'SearchState(displayedPlaces: $displayedPlaces, tip: $tip)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SearchState &&
            const DeepCollectionEquality()
                .equals(other._displayedPlaces, _displayedPlaces) &&
            const DeepCollectionEquality().equals(other.tip, tip));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_displayedPlaces),
      const DeepCollectionEquality().hash(tip));

  @JsonKey(ignore: true)
  @override
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      __$$_SearchStateCopyWithImpl<_$_SearchState>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {required final List<Place> displayedPlaces,
      required final String tip}) = _$_SearchState;

  @override

  /// Список мест, которые будут выведены на экран.
  List<Place> get displayedPlaces;
  @override

  /// Подсказка.
  String get tip;
  @override
  @JsonKey(ignore: true)
  _$$_SearchStateCopyWith<_$_SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}
