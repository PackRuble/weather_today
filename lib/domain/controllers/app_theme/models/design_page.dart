import 'package:freezed_annotation/freezed_annotation.dart';

part 'design_page.freezed.dart';
part 'design_page.g.dart';

// ignore_for_file: avoid_final_parameters

@freezed
class DesignPage with _$DesignPage {
  const factory DesignPage({
    required final WeatherPage page,
    required final AppVisualDesign design,
  }) = _DesignPage;

  factory DesignPage.fromJson(Map<String, dynamic> json) =>
      _$DesignPageFromJson(json);
}

@JsonEnum()
enum WeatherPage {
  @JsonValue('hourly')
  hourly,
  @JsonValue('currently')
  currently,
  @JsonValue('daily')
  daily,
}

/// Авторский дизайн некоторых элементов главных страниц.
@JsonEnum()
enum AppVisualDesign {
  @JsonValue('byRuble')
  byRuble,
  @JsonValue('byTolskaya')
  byTolskaya,
}
