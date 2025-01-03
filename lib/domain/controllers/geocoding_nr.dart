import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/data/weather_base/models.dart';
import 'package:weather_today/domain/controllers/geocoding_provider_nr.dart';
import 'package:weather_today/domain/controllers/owm_controller.dart';
import 'package:weather_today/domain/services/place_service/interface/place_service.dart';
import 'package:weather_today/domain/services/place_service/place_service_om.dart';
import 'package:weather_today/domain/services/place_service/place_service_owm.dart';

/// Сервис по предоставлению места.
final geocodingNR = Provider.autoDispose<PlaceService>(
  (ref) {
    final geocodingProvider = ref.watch(GeocodingProviderNR.i);

    return switch (geocodingProvider) {
      GeocodingProvider.openWeatherMap =>
        PlaceServiceOWM(GeocodingService(ref.watch(OWMController.apiKey))),
      GeocodingProvider.openMeteo => ref.watch(PlaceOMService.i.notifier),
    };
  },
  name: 'placeServiceOWMPr->$PlaceServiceOWM',
);
