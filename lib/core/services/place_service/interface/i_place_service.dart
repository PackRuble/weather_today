import 'package:weather_today/core/models/place/place_model.dart';

/// Интерфейс для предоставления доступа к сервису "Место".
abstract class IPlaceService {
  /// Получить местоположения по предположительному названию города.
  Future<List<Place>> getPlacesByName(String queryCity);

  /// Получить местоположения по координатам.
  Future<List<Place>> getPlacesByCoordinates({
    required double latitude,
    required double longitude,
  });
}
