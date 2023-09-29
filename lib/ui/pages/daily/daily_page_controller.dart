import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/weather/weather_onecall_controller.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';

/// Контроллер страницы погоды на каждый день.
class DailyPageController {
  DailyPageController(this._ref);

  final Ref _ref;

  /// Погода [WeatherOneCall].
  static final onecall = Provider<AsyncValue<WeatherOneCall?>>(
      (ref) => ref.watch(weatherOneCallController));

  /// Погода ONE_CALL на 7 дней [WeatherDaily].
  static final daily = Provider<AsyncValue<List<WeatherDaily>?>>((ref) {
    final AsyncValue<WeatherOneCall?> asyncWeather = ref.watch(onecall);

    if (asyncWeather.isRefreshing || asyncWeather.isLoading) {
      return const AsyncValue.loading();
    }

    return AsyncValue.data(asyncWeather.value?.daily);
  });

  /// Погодные предупреждения от ONE_CALL.
  static final alerts = Provider<AsyncValue<List<WeatherAlert>?>>((ref) {
    final AsyncValue<WeatherOneCall?> asyncWeather = ref.watch(onecall);

    if (asyncWeather.isRefreshing || asyncWeather.isLoading) {
      return const AsyncValue.loading();
    }

    return AsyncValue.data(asyncWeather.value?.alerts);
  });

  /// Провайдер возвращает translate.
  static final tr = Provider.autoDispose<TranslationsRu>(
      (ref) => ref.watch(AppLocalization.currentTranslation));

  /// Единицы измерения скорости.
  static final speedUnits =
      Provider<Speed>((ref) => ref.watch(WeatherServices.speedUnits));

  /// Единицы измерения температуры.
  static final tempUnits =
      Provider<Temp>((ref) => ref.watch(WeatherServices.tempUnits));

  /// экземпляр.
  static final instance = Provider(DailyPageController.new);

  /// Обновление погоды.
  Future<void> updateWeather() async =>
      _ref.read(weatherOneCallController.notifier).updateWeather();
}