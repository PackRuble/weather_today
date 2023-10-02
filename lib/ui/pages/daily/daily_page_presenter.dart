import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/weather/weather_onecall_controller.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';

/// Daily weather page presenter.
class DailyPagePresenter {
  const DailyPagePresenter(this._ref);

  final Ref _ref;

  /// Instance of current class.
  static final instance = Provider.autoDispose(
    DailyPagePresenter.new,
    name: '$DailyPagePresenter',
  );

  ///  Actual [WeatherOneCall] ONE_CALL-weather.
  static StateNotifierProvider<WeatherOnecallNotifier,
      AsyncValue<WeatherOneCall?>> get onecall => weatherOneCallController;

  /// The ONE_CALL-weather for 7 days [WeatherDaily].
  static final daily = Provider<AsyncValue<List<WeatherDaily>?>>((ref) {
    final AsyncValue<WeatherOneCall?> asyncWeather = ref.watch(onecall);

    if (asyncWeather.isRefreshing || asyncWeather.isLoading) {
      return const AsyncValue.loading();
    }

    return AsyncValue.data(asyncWeather.value?.daily);
  });

  /// Weather alerts from ONE_CALL-weather.
  static final alerts = Provider<AsyncValue<List<WeatherAlert>?>>((ref) {
    final AsyncValue<WeatherOneCall?> asyncWeather = ref.watch(onecall);

    if (asyncWeather.isRefreshing || asyncWeather.isLoading) {
      return const AsyncValue.loading();
    }

    return AsyncValue.data(asyncWeather.value?.alerts);
  });

  /// Provider returns translation.
  static StateProvider<TranslationsRu> get tr =>
      AppLocalization.currentTranslation;

  /// Units of velocity measurement.
  static StateProvider<Speed> get speedUnits => WeatherServices.speedUnits;

  /// Units of temperature measurement.
  static StateProvider<Temp> get tempUnits => WeatherServices.tempUnits;

  /// The ONE_CALL-weather update.
  Future<void> updateWeather() async =>
      _ref.read(weatherOneCallController.notifier).updateWeather();
}
