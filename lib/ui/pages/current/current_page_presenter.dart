import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/weather/weather_current_controller.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';

/// CURRENT weather page presenter.
class CurrentPagePresenter {
  const CurrentPagePresenter(this._ref);

  final Ref _ref;

  /// Actual [WeatherCurrent] CURRENT-weather.
  static AsyncNotifierProvider<WeatherCurrentNotifier, WeatherCurrent?>
      get current => WeatherCurrentNotifier.instance;

  /// Instance of current class.
  static final instance = Provider.autoDispose(
    CurrentPagePresenter.new,
    name: '$CurrentPagePresenter',
  );

  /// Provider returns translation.
  static StateProvider<TranslationsRu> get tr =>
      AppLocalization.currentTranslation;

  /// Units of velocity measurement.
  static StateProvider<Speed> get speedUnits => WeatherServices.speedUnits;

  /// Units of temperature measurement.
  static StateProvider<Temp> get tempUnits => WeatherServices.tempUnits;

  /// The CURRENT-weather update.
  Future<void> updateWeather() async =>
      _ref.read(WeatherCurrentNotifier.instance.notifier).updateWeather();
}
