import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';
import 'package:weather_today/core/controllers/weather/weather_current_controller.dart';
import 'package:weather_today/core/controllers/weather/weather_onecall_controller.dart';
import 'package:weather_today/core/controllers/weather_service_controllers.dart';
import 'package:weather_today/i18n/translations.g.dart';

/// Контроллер страницы CURRENT-погоды.
class CurrentPageController {
  CurrentPageController(this._ref);

  final Ref _ref;

  /// Актуальная Weather_CURRENT.
  static final current = Provider<AsyncValue<WeatherCurrent>>(
      (ref) => ref.watch(weatherCurrentController));

  /// Предупреждения.
  static final alerts = Provider.autoDispose<AsyncValue<List<WeatherAlert>>>(
      (ref) => ref.watch(alertsAsync));

  /// экземляр контроллера.
  static final instance = Provider.autoDispose(CurrentPageController.new);

  /// Провайдер возвращает translate.
  static final tr = Provider.autoDispose<TranslationsRu>(
      (ref) => ref.watch(AppLocalization.currentTranslation));

  /// Единицы измерения скорости.
  static final speedUnits =
      Provider<Speed>((ref) => ref.watch(WeatherServices.speedUnits));

  /// Единицы измерения температуры.
  static final tempUnits =
      Provider<Temp>((ref) => ref.watch(WeatherServices.tempUnits));

  /// Обновление CURRENT-погоды.
  Future<void> updateWeather() async =>
      _ref.read(weatherCurrentController.notifier).updateWeather();
}
