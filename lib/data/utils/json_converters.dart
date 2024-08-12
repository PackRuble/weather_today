import 'package:cardoteka/cardoteka.dart' show Converters;
import 'package:json_annotation/json_annotation.dart';

import '../open_meteo/models/enums.dart';

class DateTimeISO8601Converter extends JsonConverter<DateTime, String> {
  const DateTimeISO8601Converter();

  @override
  DateTime fromJson(String json) => Converters.dateTimeAsString.from(json);

  @override
  String toJson(DateTime object) => Converters.dateTimeAsString.to(object);
}

class DurationSecConverter extends JsonConverter<Duration, int> {
  const DurationSecConverter();

  @override
  Duration fromJson(int data) => Duration(seconds: data);

  @override
  int toJson(Duration object) => object.inSeconds;
}

class OpenMeteoWeatherCodeConverter
    extends JsonConverter<OpenMeteoWeatherCode, int> {
  const OpenMeteoWeatherCodeConverter();

  @override
  OpenMeteoWeatherCode fromJson(int data) => OpenMeteoWeatherCode.byCode(data);

  @override
  int toJson(OpenMeteoWeatherCode object) => object.code;
}
