import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/core/models/place/place_model.dart';

import '../../../const/countries_code.dart';
import 'interface/i_place_service.dart';

/// Implementation of the "openweathermap.org == OWM" service.
class PlaceServiceOWM implements IPlaceService {
  PlaceServiceOWM(this._service);

  /// Сервис для подключения погоды.
  final GeocodingService _service;

  // todo logger and exception
  @override
  Future<List<Place>> getPlacesByCoordinates(
      {required double latitude, required double longitude}) async {
    final List<PlaceGeocode> placesDirect = await _service
        .getLocationByCoordinates(latitude: latitude, longitude: longitude);

    final List<Place> places = placesDirect.map(_convertGeocodePlaces).toList();

    return places;
  }

  @override
  Future<List<Place>> getPlacesByName(String queryCity) async {
    final List<PlaceGeocode> placesDirect =
        await _service.getLocationByCityName(queryCity);

    final List<Place> places = placesDirect.map(_convertGeocodePlaces).toList();

    return places;
  }

  /// Конвертировать сущность местоположения в собственную сущность.
  Place _convertGeocodePlaces(PlaceGeocode placeGeocode) {
    return Place(
      name: placeGeocode.name,
      localNames: placeGeocode.localNames,
      latitude: placeGeocode.latitude,
      longitude: placeGeocode.longitude,
      countryCode: placeGeocode.countryCode,
      country: countriesCode[placeGeocode.countryCode?.toUpperCase()],
      state: placeGeocode.state,
    );
  }
}
