import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/domain/weather/mapper.dart';
import 'package:weather_today/domain/weather/models.dart';

import 'weather/open_meteo/weather_open_meteo_nr.dart';
import 'weather/open_weather_map/weather_onecall_controller.dart';
import 'weather_provider_nr.dart';

class WeatherOnecallDelegacyNR extends AsyncNotifier<WeatherOneCall?> {
  static final i =
      AsyncNotifierProvider<WeatherOnecallDelegacyNR, WeatherOneCall?>(
    WeatherOnecallDelegacyNR.new,
    name: '$WeatherOnecallDelegacyNR',
  );

  @override
  Future<WeatherOneCall?> build() async {
    final weatherProvider = ref.watch(WeatherProviderNR.i);

    final WeatherOneCall? oneCall = await switch (weatherProvider) {
      WeatherProvider.openMeteo =>
        (await ref.watch(WeatherOpenMeteoNR.i.future))?.convertToOneCall(),
      WeatherProvider.openWeatherMap =>
        ref.watch(WeatherOnecallNotifier.instance.future),
    };

    return oneCall;
  }
}
