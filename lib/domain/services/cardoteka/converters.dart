import 'dart:convert';

import 'package:cardoteka/cardoteka.dart';
import 'package:weather_today/domain/models/place/place_model.dart';

class PlaceConverter extends Converter<Place, String> {
  const PlaceConverter();

  @override
  Place from(String element) =>
      Place.fromJson(jsonDecode(element) as Map<String, dynamic>);

  @override
  String to(Place obj) => jsonEncode(obj.toJson());
}
