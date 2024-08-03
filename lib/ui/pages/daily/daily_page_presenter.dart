import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/weather_onecall_delegacy_nr.dart';
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

  /// The ONE_CALL-weather for future days [WeatherDaily].
  static final daily = Provider<AsyncValue<List<WeatherDaily>?>>(
    (ref) => ref.watch(WeatherOnecallDelegacyNR.i).when(
          data: (weather) => AsyncValue.data(weather?.daily),
          error: (e, st) => AsyncValue.error(e, st),
          loading: () => const AsyncValue.loading(),
        ),
    name: '$DailyPagePresenter->daily',
  );

  /// Weather alerts from ONE_CALL-weather [WeatherAlert].
  static final alerts = Provider<AsyncValue<List<WeatherAlert>?>>((ref) {
    return ref.watch(WeatherOnecallDelegacyNR.i).when(
          data: (weather) => AsyncValue.data(weather?.alerts),
          error: (e, st) => AsyncValue.error(e, st),
          loading: () => const AsyncValue.loading(),
        );
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
      _ref.read(WeatherOnecallDelegacyNR.i.notifier).updateWeather();
}
