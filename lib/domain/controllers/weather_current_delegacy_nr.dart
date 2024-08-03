import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/domain/weather/mapper.dart';
import 'package:weather_today/domain/weather/models.dart';

import 'weather/open_meteo/weather_open_meteo_nr.dart';
import 'weather/open_weather_map/weather_current_controller.dart';
import 'weather_provider_nr.dart';

class WeatherCurrentDelegacyNR extends AsyncNotifier<WeatherCurrent?> {
  static final i =
      AsyncNotifierProvider<WeatherCurrentDelegacyNR, WeatherCurrent?>(
    WeatherCurrentDelegacyNR.new,
    name: '$WeatherCurrentDelegacyNR',
  );

  @override
  Future<WeatherCurrent?> build() async {
    final weatherProvider = ref.watch(WeatherProviderNR.i);

    final WeatherCurrent? current = await switch (weatherProvider) {
      WeatherProvider.openMeteo =>
        (await ref.watch(WeatherOpenMeteoNR.i.future))
            ?.convertToOneCall(
              current: true,
              daily: false,
              hourly: false,
            )
            .current,
      WeatherProvider.openWeatherMap =>
        ref.watch(WeatherCurrentNotifier.instance.future),
    };

    return current;
  }
}
