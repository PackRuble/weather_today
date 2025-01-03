import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/data/weather_base/models.dart';
import 'package:weather_today/domain/services/cardoteka/weather_storage.dart';

class GeocodingProviderNR extends Notifier<GeocodingProvider> {
  static final i = NotifierProvider<GeocodingProviderNR, GeocodingProvider>(
    GeocodingProviderNR.new,
    name: '$GeocodingProviderNR',
  );

  late WeatherStorage _weatherStorage;

  @override
  GeocodingProvider build() {
    _weatherStorage = ref.watch(WeatherStorage.instance);
    return _weatherStorage.attach<GeocodingProvider>(
      WeatherCards.geocodingProvider,
      (value) => state = value,
      detacher: ref.onDispose,
    );
  }

  Future<void> change(GeocodingProvider value) async => _weatherStorage
      .set<GeocodingProvider>(WeatherCards.geocodingProvider, value);
}
