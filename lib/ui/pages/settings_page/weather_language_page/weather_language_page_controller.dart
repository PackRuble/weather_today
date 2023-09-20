import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';
import 'package:weather_today/application/i18n/translations.g.dart';

/// Модель страницы [WeatherLanguagePage].
class WeatherLanguagePageController {
  WeatherLanguagePageController(this._ref);

  final Ref _ref;

  /// экземпляр.
  static final instance = Provider.autoDispose(
    WeatherLanguagePageController.new,
    name: '$WeatherLanguagePageController',
  );

  /// Провайдер возвращает translate.
  static final tr = Provider.autoDispose<TranslationsRu>(
      (ref) => ref.watch(AppLocalization.currentTranslation));

  static final currentLanguage = Provider.autoDispose<WeatherLanguage>(
      (ref) => ref.watch(WeatherServices.currentLanguage));

  /// Установка языка погоды.
  Future<void> setWeatherLanguage(WeatherLanguage lang) async =>
      _ref.read(WeatherServices.instance).setCurrentLanguage(lang);
}
