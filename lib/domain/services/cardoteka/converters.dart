import 'dart:convert';

import 'package:cardoteka/cardoteka.dart';
import 'package:weather_pack/weather_pack.dart' show WeatherOneCall;
import 'package:weather_today/data/open_meteo/models/models.dart';
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

class ForecastOpenMeteoResponseConverter
    extends Converter<ForecastOpenMeteoResponse, String> {
  const ForecastOpenMeteoResponseConverter();

  @override
  ForecastOpenMeteoResponse from(String element) =>
      ForecastOpenMeteoResponse.fromJson(
          jsonDecode(element) as Map<String, dynamic>);

  @override
  String to(ForecastOpenMeteoResponse object) => jsonEncode(object.toJson());
}
