import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/domain/services/cardoteka/weather_storage.dart';

class OnecallEndpointNR extends Notifier<OneCallApi> {
  static final i = NotifierProvider<OnecallEndpointNR, OneCallApi>(
    OnecallEndpointNR.new,
    name: '$OnecallEndpointNR',
  );

  late WeatherStorage _weatherStorage;

  @override
  OneCallApi build() {
    _weatherStorage = ref.watch(WeatherStorage.instance);
    return _weatherStorage.attach<OneCallApi>(
      WeatherCards.oneCallApiVersion,
      (value) => state = value,
      detacher: ref.onDispose,
    );
  }

  Future<void> change(OneCallApi value) async =>
      _weatherStorage.set<OneCallApi>(WeatherCards.oneCallApiVersion, value);
}
