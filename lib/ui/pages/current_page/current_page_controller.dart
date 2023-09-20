import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/weather/weather_current_controller.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';
import 'package:weather_today/application/i18n/translations.g.dart';

/// Контроллер страницы CURRENT-погоды.
class CurrentPageController {
  CurrentPageController(this._ref);

  final Ref _ref;

  /// Актуальная Weather_CURRENT.
  static final current = Provider<AsyncValue<WeatherCurrent?>>(
      (ref) => ref.watch(weatherCurrentController));

  /// экземляр контроллера.
  static final instance = Provider.autoDispose(
    CurrentPageController.new,
    name: '$CurrentPageController',
  );

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
