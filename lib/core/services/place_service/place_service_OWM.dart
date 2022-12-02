import 'dart:async';

import 'package:loggy/loggy.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/core/models/place/place_model.dart';

import '../../../const/countries_code.dart';
import 'interface/i_place_service.dart';

/// Implementation of the "openweathermap.org == OWM" service.
class PlaceServiceOWM implements IPlaceService {
  PlaceServiceOWM(this._service);

  /// Сервис для подключения погоды.
  final GeocodingService _service;

  /// Включает логгирование и безопасное общение с сервисом получения мест.
  /// coldfix: Это должно работать иначе во всём приложении.
  Future<T?> _safelyCall<T>(Future<T> Function() func) async {
    try {
      return func.call().timeout(const Duration(seconds: 10));
    } catch (e, s) {
      logError(e, s);
      return null;
    }
  }

  @override
  Future<List<Place>> getPlacesByCoordinates(
      {required double latitude, required double longitude}) async {
    final List<PlaceGeocode> placesDirect = (await _safelyCall(
          () => _service.getLocationByCoordinates(
              latitude: latitude, longitude: longitude),
        )) ??
        [];

    final List<Place> places = placesDirect.map(_convertGeocodePlaces).toList();

    return places;
  }

  @override
  Future<List<Place>> getPlacesByName(String queryCity) async {
    final List<PlaceGeocode> placesDirect = (await _safelyCall(
          () => _service.getLocationByCityName(queryCity),
        )) ??
        [];

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
