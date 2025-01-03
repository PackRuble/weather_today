// ignore_for_file: file_names

import 'dart:async';

import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/domain/controllers/utils/call_wrapper.dart';
import 'package:weather_today/domain/services/place_service/models/place_model.dart';

import '../../../application/const/countries_code.dart';
import 'interface/place_service.dart';

/// Implementation of the "openweathermap.org == OWM" service.
class PlaceServiceOWM with CallWrapper implements PlaceService {
  PlaceServiceOWM(this._service);

  /// Сервис для подключения погоды.
  final GeocodingService _service;

  @override
  Future<List<Place>> getPlacesByCoordinates(
      {required double latitude, required double longitude}) async {
    final List<PlaceGeocode> placesDirect = (await callSafely(
          () => _service.getLocationByCoordinates(
              latitude: latitude, longitude: longitude),
        )) ??
        [];

    final List<Place> places = placesDirect.map(_convertGeocodePlaces).toList();

    return places;
  }

  @override
  Future<List<Place>> getPlacesByName(String queryCity) async {
    final List<PlaceGeocode> placesDirect = (await callSafely(
          () => _service.getLocationByCityName(queryCity),
        )) ??
        [];

    final List<Place> places = placesDirect.map(_convertGeocodePlaces).toList();

    return places;
  }

  /// Convert the location entity to its own entity.
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
