import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/weather/weather_onecall_controller.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';

/// Контроллер [HourlyPage].
class HourlyPageController {
  HourlyPageController(this._ref);

  final Ref _ref;

  /// экземпляр.
  static final instance = Provider(
    HourlyPageController.new,
    name: '$HourlyPageController',
  );

  /// Провайдер возвращает translate.
  static final tr = Provider.autoDispose<TranslationsRu>(
      (ref) => ref.watch(AppLocalization.currentTranslation));

  /// Погода [WeatherOneCall].
  static final onecall = Provider<AsyncValue<WeatherOneCall?>>(
      (ref) => ref.watch(weatherOneCallController));

  /// Погода ONE_CALL на 2 дня почасовая [WeatherHourly].
  static final hourly = Provider<AsyncValue<List<WeatherHourly>?>>((ref) {
    final AsyncValue<WeatherOneCall?> asyncWeather = ref.watch(onecall);

    if (asyncWeather.isRefreshing || asyncWeather.isLoading) {
      return const AsyncValue.loading();
    }

    return AsyncValue.data(asyncWeather.value?.hourly);
  });

  /// Погода ONE_CALL на час поминутная [WeatherHourly].
  static final minutely = Provider<AsyncValue<List<WeatherMinutely>>>((ref) {
    final AsyncValue<WeatherOneCall?> asyncWeather =
        ref.watch(weatherOneCallController);

    if (asyncWeather.isRefreshing || asyncWeather.isLoading) {
      return const AsyncValue.loading();
    }

    return AsyncValue.data(asyncWeather.value?.minutely ?? []);
  });

  /// Единицы измерения скорости.
  static final speedUnits =
      Provider<Speed>((ref) => ref.watch(WeatherServices.speedUnits));

  /// Единицы измерения температуры.
  static final tempUnits =
      Provider<Temp>((ref) => ref.watch(WeatherServices.tempUnits));

  /// Обновление погоды.
  Future<void> updateWeather() async =>
      _ref.read(weatherOneCallController.notifier).updateWeather();
}