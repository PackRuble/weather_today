// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'design_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DesignPage _$DesignPageFromJson(Map<String, dynamic> json) {
  return _DesignPage.fromJson(json);
}

/// @nodoc
mixin _$DesignPage {
  WeatherPage get page => throw _privateConstructorUsedError;
  AppVisualDesign get design => throw _privateConstructorUsedError;

  /// Serializes this DesignPage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DesignPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DesignPageCopyWith<DesignPage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DesignPageCopyWith<$Res> {
  factory $DesignPageCopyWith(
          DesignPage value, $Res Function(DesignPage) then) =
      _$DesignPageCopyWithImpl<$Res, DesignPage>;
  @useResult
  $Res call({WeatherPage page, AppVisualDesign design});
}

/// @nodoc
class _$DesignPageCopyWithImpl<$Res, $Val extends DesignPage>
    implements $DesignPageCopyWith<$Res> {
  _$DesignPageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DesignPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? design = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as WeatherPage,
      design: null == design
          ? _value.design
          : design // ignore: cast_nullable_to_non_nullable
              as AppVisualDesign,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DesignPageImplCopyWith<$Res>
    implements $DesignPageCopyWith<$Res> {
  factory _$$DesignPageImplCopyWith(
          _$DesignPageImpl value, $Res Function(_$DesignPageImpl) then) =
      __$$DesignPageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WeatherPage page, AppVisualDesign design});
}

/// @nodoc
class __$$DesignPageImplCopyWithImpl<$Res>
    extends _$DesignPageCopyWithImpl<$Res, _$DesignPageImpl>
    implements _$$DesignPageImplCopyWith<$Res> {
  __$$DesignPageImplCopyWithImpl(
      _$DesignPageImpl _value, $Res Function(_$DesignPageImpl) _then)
      : super(_value, _then);

  /// Create a copy of DesignPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? design = null,
  }) {
    return _then(_$DesignPageImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as WeatherPage,
      design: null == design
          ? _value.design
          : design // ignore: cast_nullable_to_non_nullable
              as AppVisualDesign,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DesignPageImpl implements _DesignPage {
  const _$DesignPageImpl({required this.page, required this.design});

  factory _$DesignPageImpl.fromJson(Map<String, dynamic> json) =>
      _$$DesignPageImplFromJson(json);

  @override
  final WeatherPage page;
  @override
  final AppVisualDesign design;

  @override
  String toString() {
    return 'DesignPage(page: $page, design: $design)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DesignPageImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.design, design) || other.design == design));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, page, design);

  /// Create a copy of DesignPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DesignPageImplCopyWith<_$DesignPageImpl> get copyWith =>
      __$$DesignPageImplCopyWithImpl<_$DesignPageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DesignPageImplToJson(
      this,
    );
  }
}

abstract class _DesignPage implements DesignPage {
  const factory _DesignPage(
      {required final WeatherPage page,
      required final AppVisualDesign design}) = _$DesignPageImpl;

  factory _DesignPage.fromJson(Map<String, dynamic> json) =
      _$DesignPageImpl.fromJson;

  @override
  WeatherPage get page;
  @override
  AppVisualDesign get design;

  /// Create a copy of DesignPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DesignPageImplCopyWith<_$DesignPageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
