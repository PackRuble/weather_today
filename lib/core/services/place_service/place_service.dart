import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/core/services/api/api_OWM.dart';

import 'interface/i_place_service.dart';
import 'place_service_OWM.dart';

/// Сервис по предоставлению места.
final placeServiceOWMPr = Provider.autoDispose<IPlaceService>(
  (ref) {
    final String apikey = ref.watch(ApiServiceOwm.apiKey);
    return PlaceServiceOWM(GeocodingService(apikey));
  },
  name: 'placeServiceOWMPr->$PlaceServiceOWM',
);
