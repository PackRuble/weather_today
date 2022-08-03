import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/core/models/place/place_model.dart';

/// Первоначальное местоположение. Используется, когда место не выбрано.
/// Как правило, при первом запуске приложения.
Place get initialPlace => const Place(
      name: 'Moscow',
      localNames: {
        WeatherLanguage.Russian: 'Москва',
        WeatherLanguage.English: 'Moscow',
      },
      country: 'Russian Federation',
      latitude: 55.751999,
      longitude: 37.617734,
      countryCode: 'RU',
      state: 'Moscow',
      note: 'Любимое место?',
    );

/// Изначально список мест включает в себя текущее местоположение.
List<Place> get initialSavedPlaces => [initialPlace];
