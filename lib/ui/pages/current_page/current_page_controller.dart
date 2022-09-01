import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/core/controllers/weather_current_controller.dart';
import 'package:weather_today/core/controllers/weather_service_controllers.dart';

/// Контроллер страницы CURRENT-погоды.
class CurrentPageController {
  CurrentPageController(this._reader);

  final Reader _reader;

  /// Актуальная Weather_CURRENT.
  static final current = Provider<AsyncValue<WeatherCurrent>>(
      (ref) => ref.watch(weatherCurrentController));

  /// экземляр контроллера.
  static final pr = Provider.autoDispose<CurrentPageController>(
      (ref) => CurrentPageController(ref.read));

  /// Единицы измерения скорости.
  static final speedUnits =
      Provider<Speed>((ref) => ref.watch(WeatherServices.speedUnits));

  /// Единицы измерения температуры.
  static final tempUnits =
      Provider<Temp>((ref) => ref.watch(WeatherServices.tempUnits));

  /// Обновление CURRENT-погоды.
  Future<void> updateWeather() async =>
      _reader(weatherCurrentController.notifier).updateWeather();
}
