import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/application/const/countries_code.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';

/// Class represent presenter for [CountryFlagsPage].
class CountryFlagsPagePresenter {
  CountryFlagsPagePresenter(this._ref);

  // ignore: unused_field
  final Ref _ref;

  /// Instance of current class.
  static final instance = Provider.autoDispose(
    CountryFlagsPagePresenter.new,
    name: '$CountryFlagsPagePresenter',
  );

  /// Provider returns translation.
  static StateProvider<TranslationsRu> get tr =>
      AppLocalization.currentTranslation;

  /// Получить страны вида:
  /// [[countryCode, countryName], ...]
  List<List<String>> getCountries() => [
        for (final e in countriesCode.entries) [e.key, e.value]
      ];
}
