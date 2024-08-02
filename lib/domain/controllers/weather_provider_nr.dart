import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/domain/services/cardoteka/weather_storage.dart';
import 'package:weather_today/domain/weather/models.dart';

class WeatherProviderNR extends Notifier<WeatherProvider> {
  static final i = NotifierProvider<WeatherProviderNR, WeatherProvider>(
    WeatherProviderNR.new,
    name: '$WeatherProviderNR',
  );

  late WeatherStorage _weatherStorage;

  @override
  WeatherProvider build() {
    _weatherStorage = ref.watch(WeatherStorage.instance);
    return _weatherStorage.attach<WeatherProvider>(
      WeatherCards.weatherProvider,
      (value) => state = value,
      detacher: ref.onDispose,
    );
  }

  Future<void> change(WeatherProvider value) async =>
      _weatherStorage.set(WeatherCards.weatherProvider, value);
}
