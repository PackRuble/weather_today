import 'package:cardoteka/cardoteka.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/domain/models/place/place_model.dart';

import 'converters.dart';

class WeatherStorage extends Cardoteka {
  WeatherStorage._() : super(config: WeatherCards._config);

  static final instance = Provider<WeatherStorage>((ref) => WeatherStorage._());
}

enum WeatherCards<T extends Object?> implements Card<T> {
  previousPlace<Place?>(DataType.string, null),
  isAllowONECALLUpdateDueToDiffPrevAndCurrentPlaces<bool>(DataType.bool, false),
  isAllowCURRENTUpdateDueToDiffPrevAndCurrentPlaces<bool>(DataType.bool, false),
  ;

  const WeatherCards(this.type, this.defaultValue);

  @override
  final T defaultValue;

  @override
  String get key => name;

  @override
  final DataType type;

  static const _config = CardConfig(
    name: 'WeatherCards',
    cards: values,
    converters: {
      previousPlace: PlaceConverter(),
    },
  );
}
