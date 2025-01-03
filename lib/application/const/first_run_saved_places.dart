import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/domain/services/place_service/models/place_model.dart';

/// Первоначальное местоположение. Используется, когда место не выбрано.
/// Как правило, при первом запуске приложения.
Place get initialPlace => const Place(
      name: 'Moscow',
      localNames: {
        WeatherLanguage.russian: 'Москва',
        WeatherLanguage.english: 'Moscow',
      },
      country: 'Russian Federation',
      latitude: 55.751999,
      longitude: 37.617734,
      countryCode: 'RU',
      state: 'Moscow',
      note: 'Любимое место?',
    );

/// Изначально список мест включает в себя первоначальное местоположение.
List<Place> get initialSavedPlaces => [initialPlace];
