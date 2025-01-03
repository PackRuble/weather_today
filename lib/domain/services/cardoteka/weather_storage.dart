import 'package:cardoteka/cardoteka.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/data/weather_base/models.dart';
import 'package:weather_today/domain/services/place_service/models/place_model.dart';

import 'converters.dart';

class WeatherStorage extends Cardoteka with WatcherImpl {
  WeatherStorage._() : super(config: WeatherCards._config);

  static final instance = Provider((ref) => WeatherStorage._());
}

enum WeatherCards<T extends Object?> implements Card<T> {
  previousPlace<Place?>(DataType.string, null),
  weatherProvider(DataType.string, WeatherProvider.openMeteo),
  geocodingProvider(DataType.string, GeocodingProvider.openMeteo),
  oneCallApiVersion(DataType.string, OneCallApi.api_2_5),
  isAllowONECALLUpdateDueToDiffPrevAndCurrentPlaces(DataType.bool, false),
  isAllowCURRENTUpdateDueToDiffPrevAndCurrentPlaces(DataType.bool, false),
  ;

  const WeatherCards(this.type, this.defaultValue);

  @override
  final T defaultValue;

  @override
  String get key => name;

  @override
  final DataType type;

  static final _config = CardotekaConfig(
    name: 'WeatherCards',
    cards: values,
    converters: {
      previousPlace: const PlaceConverter(),
      weatherProvider: Converters.enumAsString(WeatherProvider.values),
      geocodingProvider: Converters.enumAsString(GeocodingProvider.values),
      oneCallApiVersion: Converters.enumAsString(OneCallApi.values),
    },
  );
}
