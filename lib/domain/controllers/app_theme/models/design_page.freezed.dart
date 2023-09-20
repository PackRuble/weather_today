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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DesignPage _$DesignPageFromJson(Map<String, dynamic> json) {
  return _DesignPage.fromJson(json);
}

/// @nodoc
mixin _$DesignPage {
  WeatherPage get page => throw _privateConstructorUsedError;
  AppVisualDesign get design => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
abstract class _$$_DesignPageCopyWith<$Res>
    implements $DesignPageCopyWith<$Res> {
  factory _$$_DesignPageCopyWith(
          _$_DesignPage value, $Res Function(_$_DesignPage) then) =
      __$$_DesignPageCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WeatherPage page, AppVisualDesign design});
}

/// @nodoc
class __$$_DesignPageCopyWithImpl<$Res>
    extends _$DesignPageCopyWithImpl<$Res, _$_DesignPage>
    implements _$$_DesignPageCopyWith<$Res> {
  __$$_DesignPageCopyWithImpl(
      _$_DesignPage _value, $Res Function(_$_DesignPage) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? design = null,
  }) {
    return _then(_$_DesignPage(
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
class _$_DesignPage implements _DesignPage {
  const _$_DesignPage({required this.page, required this.design});

  factory _$_DesignPage.fromJson(Map<String, dynamic> json) =>
      _$$_DesignPageFromJson(json);

  @override
  final WeatherPage page;
  @override
  final AppVisualDesign design;

  @override
  String toString() {
    return 'DesignPage(page: $page, design: $design)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DesignPage &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.design, design) || other.design == design));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, page, design);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DesignPageCopyWith<_$_DesignPage> get copyWith =>
      __$$_DesignPageCopyWithImpl<_$_DesignPage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DesignPageToJson(
      this,
    );
  }
}

abstract class _DesignPage implements DesignPage {
  const factory _DesignPage(
      {required final WeatherPage page,
      required final AppVisualDesign design}) = _$_DesignPage;

  factory _DesignPage.fromJson(Map<String, dynamic> json) =
      _$_DesignPage.fromJson;

  @override
  WeatherPage get page;
  @override
  AppVisualDesign get design;
  @override
  @JsonKey(ignore: true)
  _$$_DesignPageCopyWith<_$_DesignPage> get copyWith =>
      throw _privateConstructorUsedError;
}
