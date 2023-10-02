import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/weather/weather_onecall_controller.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';

/// Presenter for [HourlyPage].
class HourlyPagePresenter {
  const HourlyPagePresenter(this._ref);

  final Ref _ref;

  /// Instance of current class.
  static final instance = Provider(
    HourlyPagePresenter.new,
    name: '$HourlyPagePresenter',
  );

  /// Provider returns translation.
  static StateProvider<TranslationsRu> get tr =>
      AppLocalization.currentTranslation;

  ///  Actual [WeatherOneCall] ONE_CALL-weather.
  static StateNotifierProvider<WeatherOnecallNotifier,
      AsyncValue<WeatherOneCall?>> get onecall => weatherOneCallController;

  /// Weather ONE_CALL for 2 days hourly [WeatherHourly].
  static final hourly = Provider<AsyncValue<List<WeatherHourly>?>>((ref) {
    final AsyncValue<WeatherOneCall?> asyncWeather = ref.watch(onecall);

    if (asyncWeather.isRefreshing || asyncWeather.isLoading) {
      return const AsyncValue.loading();
    }

    return AsyncValue.data(asyncWeather.value?.hourly);
  });

  /// Weather ONE_CALL for an hour per minute [WeatherHourly].
  static final minutely = Provider<AsyncValue<List<WeatherMinutely>>>((ref) {
    final AsyncValue<WeatherOneCall?> asyncWeather =
        ref.watch(weatherOneCallController);

    if (asyncWeather.isRefreshing || asyncWeather.isLoading) {
      return const AsyncValue.loading();
    }

    return AsyncValue.data(asyncWeather.value?.minutely ?? []);
  });

  /// Units of velocity measurement.
  static StateProvider<Speed> get speedUnits => WeatherServices.speedUnits;

  /// Units of temperature measurement.
  static StateProvider<Temp> get tempUnits => WeatherServices.tempUnits;

  /// The ONE_CALL-weather update.
  Future<void> updateWeather() async =>
      _ref.read(weatherOneCallController.notifier).updateWeather();
}
