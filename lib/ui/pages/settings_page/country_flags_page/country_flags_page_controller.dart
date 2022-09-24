import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/const/countries_code.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';
import 'package:weather_today/i18n/translations.g.dart';

/// Class represent controller [CountryFlagsPage].
class CountryFlagsPageController {
  CountryFlagsPageController(this._ref);

  final Ref _ref;

  Reader get _reader => _ref.read;

  Reader get _refresh => _ref.refresh;

  static final cr = Provider.autoDispose<CountryFlagsPageController>(
      (ref) => CountryFlagsPageController(ref));

  /// Провайдер возвращает translate.
  static final tr = Provider.autoDispose<TranslationsRu>(
      (ref) => ref.watch(AppLocalization.currentTranslation));

  /// Получить страны вида:
  /// [[countryCode, countryName], ...]
  List<List<String>> getCountries() => [
        for (final e in countriesCode.entries) [e.key, e.value]
      ];
}
