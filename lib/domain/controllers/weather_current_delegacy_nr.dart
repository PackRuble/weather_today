import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/data/weather_base/mapper.dart';
import 'package:weather_today/data/weather_base/models.dart';
import 'package:weather_today/domain/controllers/weather/weather_nr.dart';

import 'weather/open_meteo/weather_open_meteo_nr.dart';
import 'weather/open_weather_map/weather_current_owm_nr.dart';
import 'weather_provider_nr.dart';

class WeatherCurrentDelegacyNR extends AsyncNotifier<WeatherCurrent?> {
  static final i =
      AsyncNotifierProvider<WeatherCurrentDelegacyNR, WeatherCurrent?>(
    WeatherCurrentDelegacyNR.new,
    name: '$WeatherCurrentDelegacyNR',
  );

  WeatherNR get _weatherNR => switch (_weatherProvider) {
        WeatherProvider.openMeteo => ref.read(WeatherOpenMeteoNR.i.notifier),
        WeatherProvider.openWeatherMap =>
          ref.read(WeatherCurrentOwmNR.i.notifier),
      };

  late WeatherProvider _weatherProvider;

  @override
  Future<WeatherCurrent?> build() async {
    _weatherProvider = ref.watch(WeatherProviderNR.i);

    final WeatherCurrent? current = await switch (_weatherProvider) {
      WeatherProvider.openMeteo =>
        (await ref.watch(WeatherOpenMeteoNR.i.future))
            ?.convertToOneCall(
              current: true,
              daily: false,
              hourly: false,
            )
            .current,
      WeatherProvider.openWeatherMap => ref.watch(WeatherCurrentOwmNR.i.future),
    };

    return current;
  }

  Future<void> updateWeather() async => await _weatherNR.updateWeather();
}
