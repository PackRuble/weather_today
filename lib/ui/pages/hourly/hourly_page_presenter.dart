import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/weather/open_weather_map/weather_onecall_controller.dart';
import 'package:weather_today/domain/controllers/weather_onecall_delegacy_nr.dart';
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

  static final hourly = Provider<AsyncValue<List<WeatherHourly>?>>(
    (ref) => ref.watch(WeatherOnecallDelegacyNR.i).when(
          data: (weather) => AsyncValue.data(weather?.hourly),
          error: (e, st) => AsyncValue.error(e, st),
          loading: () => const AsyncValue.loading(),
        ),
    name: '$HourlyPagePresenter->hourly',
  );

  /// Units of velocity measurement.
  static StateProvider<Speed> get speedUnits => WeatherServices.speedUnits;

  /// Units of temperature measurement.
  static StateProvider<Temp> get tempUnits => WeatherServices.tempUnits;

  /// The ONE_CALL-weather update.
  Future<void> updateWeather() async =>
      _ref.read(WeatherOnecallNotifier.instance.notifier).updateWeather();
}
