import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/domain/controllers/owm_controller.dart';

import '../services/place_service/interface/place_service.dart';
import '../services/place_service/place_service_impl.dart';

/// Сервис по предоставлению места.
final placeServiceOWMPr = Provider.autoDispose<PlaceService>(
  (ref) {
    final String apikey = ref.watch(OWMController.apiKey);
    return PlaceServiceOWM(GeocodingService(apikey));
  },
  name: 'placeServiceOWMPr->$PlaceServiceOWM',
);
