import 'package:cardoteka/cardoteka.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';

import 'converters.dart';

class OpenMeteoStorage extends Cardoteka {
  OpenMeteoStorage._() : super(config: OpenMeteoCards._config);

  static final i = Provider((_) => OpenMeteoStorage._());
}

enum OpenMeteoCards<T extends Object?> implements Card<T> {
  latestWeatherForecast<WeatherOneCall?>(DataType.string, null),
  latestRequestTimeForecast<DateTime?>(DataType.string, null),
  ;

  const OpenMeteoCards(this.type, this.defaultValue);

  @override
  final T defaultValue;

  @override
  String get key => name;

  @override
  final DataType type;

  static const _config = CardotekaConfig(
    name: 'OpenMeteoCards',
    cards: values,
    converters: {
      latestWeatherForecast: WeatherOneCallConverter(),
      latestRequestTimeForecast: Converters.dateTimeAsString,
    },
  );
}
