import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';

/// The [WeatherLanguagePage] page presenter.
class WeatherLanguagePresenter {
  WeatherLanguagePresenter(this._ref);

  final Ref _ref;

  /// Instance of current class.
  static final instance = Provider.autoDispose(
    WeatherLanguagePresenter.new,
    name: '$WeatherLanguagePresenter',
  );

  /// Provider returns translation.
  static StateProvider<TranslationsRu> get tr =>
      AppLocalization.currentTranslation;

  static StateProvider<WeatherLanguage> get currentLanguage =>
      WeatherServices.currentLanguage;

  /// Установка языка погоды.
  Future<void> setWeatherLanguage(WeatherLanguage lang) async =>
      _ref.read(WeatherServices.instance).setCurrentLanguage(lang);
}
