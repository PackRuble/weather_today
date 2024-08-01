import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/weather/open_weather_map/weather_onecall_controller.dart';
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
  static AsyncNotifierProvider<WeatherOnecallNotifier, WeatherOneCall?>
      get onecall => WeatherOnecallNotifier.instance;

  /// Weather ONE_CALL for 2 days hourly [WeatherHourly].
  static final hourly = Provider<AsyncValue<List<WeatherHourly>?>>(
    (ref) {
      final WeatherOneCall? weather = ref.watch(onecall).value;

      if (weather != null) {
        return AsyncValue.data(weather.hourly);
      } else {
        return const AsyncValue.loading();
      }
    },
    name: '$HourlyPagePresenter->hourly',
  );

  /// Weather ONE_CALL for an hour per minute [WeatherHourly].
  /*Uncomment if necessary*/
  // static final minutely = Provider<AsyncValue<List<WeatherMinutely>>>(
  //   (ref) {
  //     final WeatherOneCall? weather = ref.watch(onecall).value;
  //
  //     if (weather != null) {
  //       return AsyncValue.data(weather.minutely ?? []);
  //     } else {
  //       return const AsyncValue.loading();
  //     }
  //   },
  //   name: '$HourlyPagePresenter->minutely',
  // );

  /// Units of velocity measurement.
  static StateProvider<Speed> get speedUnits => WeatherServices.speedUnits;

  /// Units of temperature measurement.
  static StateProvider<Temp> get tempUnits => WeatherServices.tempUnits;

  /// The ONE_CALL-weather update.
  Future<void> updateWeather() async =>
      _ref.read(WeatherOnecallNotifier.instance.notifier).updateWeather();
}
