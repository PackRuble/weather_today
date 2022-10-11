import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/core/services/api/api_OWM.dart';

import 'interface/i_place_service.dart';
import 'place_service_OWM.dart';

/// Сервис по предоставлению места.
final placeServiceOWMPr = Provider<IPlaceService>((ref) {
  final String apikey = ref.watch(ApiServiceOwm.apiKey);
  return PlaceServiceOWM(GeocodingService(apikey));
});
