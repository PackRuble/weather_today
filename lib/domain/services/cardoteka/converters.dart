import 'dart:convert';

import 'package:cardoteka/cardoteka.dart';
import 'package:weather_pack/weather_pack.dart' show WeatherOneCall;
import 'package:weather_today/domain/models/place/place_model.dart';

class PlaceConverter extends Converter<Place, String> {
  const PlaceConverter();

  @override
  Place from(String element) =>
      Place.fromJson(jsonDecode(element) as Map<String, dynamic>);

  @override
  String to(Place object) => jsonEncode(object.toJson());
}

class WeatherOneCallConverter extends Converter<WeatherOneCall, String> {
  const WeatherOneCallConverter();

  @override
  WeatherOneCall from(String element) =>
      WeatherOneCall.fromJson(jsonDecode(element) as Map<String, dynamic>);

  @override
  String to(WeatherOneCall object) => jsonEncode(object.toJson());
}
