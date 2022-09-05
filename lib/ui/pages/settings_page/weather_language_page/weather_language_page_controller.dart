import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';
import 'package:weather_today/core/controllers/weather_service_controllers.dart';
import 'package:weather_today/i18n/translations.g.dart';

/// Модель страницы [WeatherLanguagePage].
class WeatherLanguagePageController {
  WeatherLanguagePageController(this._reader);

  final Reader _reader;

  /// экземпляр.
  static final pr = Provider.autoDispose<WeatherLanguagePageController>((ref) {
    return WeatherLanguagePageController(ref.read);
  }, name: '$WeatherLanguagePageController');

  /// Провайдер возвращает translate.
  static final tr = Provider.autoDispose<TranslationsRu>(
      (ref) => ref.watch(AppLocalize.currentTranslation));

  static final currentLanguage = Provider.autoDispose<WeatherLanguage>(
      (ref) => ref.watch(WeatherServices.currentLanguage));

  /// Установка языка погоды.
  Future<void> setWeatherLanguage(WeatherLanguage lang) async =>
      _reader(WeatherServices.pr).setCurrentLanguage(lang);
}
