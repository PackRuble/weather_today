import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/application/const/countries_code.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/application/i18n/translations.g.dart';

/// Class represent controller [CountryFlagsPage].
class CountryFlagsPageController {
  CountryFlagsPageController(this._ref);

  // ignore: unused_field
  final Ref _ref;

  static final instance = Provider.autoDispose(CountryFlagsPageController.new);

  /// Провайдер возвращает translate.
  static final tr = Provider.autoDispose<TranslationsRu>(
      (ref) => ref.watch(AppLocalization.currentTranslation));

  /// Получить страны вида:
  /// [[countryCode, countryName], ...]
  List<List<String>> getCountries() => [
        for (final e in countriesCode.entries) [e.key, e.value]
      ];
}
