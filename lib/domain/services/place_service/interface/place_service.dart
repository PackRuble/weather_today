import 'dart:async';

import 'package:weather_today/domain/services/place_service/models/place_model.dart';

/// Интерфейс для предоставления доступа к сервису "Геокодинг".
abstract class PlaceService {
  /// Получить местоположения по предположительному названию города.
  Future<List<Place>> getPlacesByName(String queryCity);

  /// Получить местоположения по координатам.
  Future<List<Place>> getPlacesByCoordinates({
    required double latitude,
    required double longitude,
  });
}
