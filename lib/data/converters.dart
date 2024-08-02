import 'package:cardoteka/cardoteka.dart' show Converters;
import 'package:json_annotation/json_annotation.dart';

class DateTimeISO8601Converter extends JsonConverter<DateTime, String> {
  const DateTimeISO8601Converter();

  @override
  DateTime fromJson(String json) => Converters.dateTimeAsString.from(json);

  @override
  String toJson(DateTime object) => Converters.dateTimeAsString.to(object);
}
