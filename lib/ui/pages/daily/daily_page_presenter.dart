import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/weather/open_weather_map/weather_onecall_controller.dart';
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
  static AsyncNotifierProvider<WeatherOnecallNotifier, WeatherOneCall?>
      get onecall => WeatherOnecallNotifier.instance;

  /// The ONE_CALL-weather for 7 days [WeatherDaily].
  static final daily = Provider<AsyncValue<List<WeatherDaily>?>>(
    (ref) {
      final WeatherOneCall? weather = ref.watch(onecall).value;

      if (weather != null) {
        return AsyncValue.data(weather.daily);
      } else {
        return const AsyncValue.loading();
      }
    },
    name: '$DailyPagePresenter->daily',
  );

  /// Weather alerts from ONE_CALL-weather.
  static final alerts = Provider<AsyncValue<List<WeatherAlert>?>>((ref) {
    final WeatherOneCall? weather = ref.watch(onecall).value;

    if (weather != null) {
      return AsyncValue.data(weather.alerts);
    } else {
      return const AsyncValue.loading();
    }
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
      _ref.read(WeatherOnecallNotifier.instance.notifier).updateWeather();
}
