import 'dart:convert';

import 'package:cardoteka/cardoteka.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/domain/controllers/app_theme/models/design_page.dart';

class SettingsStorage extends Cardoteka with WatcherImpl {
  SettingsStorage._() : super(config: SettingsCards._config);

  static final instance =
      Provider<SettingsStorage>((ref) => SettingsStorage._());
}

enum SettingsCards<T extends Object> implements Card<T> {
  designPages<List<DesignPage>>(DataType.stringList, [
    DesignPage(page: WeatherPage.hourly, design: AppVisualDesign.byRuble),
    DesignPage(page: WeatherPage.currently, design: AppVisualDesign.byRuble),
    DesignPage(page: WeatherPage.daily, design: AppVisualDesign.byRuble),
  ]),
  ;

  const SettingsCards(this.type, this.defaultValue);

  @override
  final T defaultValue;

  @override
  String get key => name;

  @override
  final DataType type;

  static const _config = CardotekaConfig(
    name: 'SettingsCards',
    cards: values,
    converters: {
      designPages: _DesignPagesConverter(),
    },
  );
}

class _DesignPagesConverter extends ListConverter<DesignPage> {
  const _DesignPagesConverter();

  @override
  DesignPage objFrom(String element) =>
      DesignPage.fromJson(jsonDecode(element) as Map<String, dynamic>);

  @override
  String objTo(DesignPage obj) => jsonEncode(obj.toJson());
}
