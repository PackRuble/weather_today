import 'dart:convert' show jsonDecode;

import 'package:http/http.dart' as http;
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/domain/models/place/place_model.dart';
import 'package:weather_today/utils/logger/_observers/global_logger.dart';

import 'models/enums.dart';
import 'models/models.dart';

class OpenMeteoRepo {
  Future<ForecastOpenMeteoResponse> fetchForecast(Place place) async {
    ForecastOpenMeteoResponse result;

    try {
      final uri = Uri.https(
        'api.open-meteo.com',
        '/v1/forecast',
        {
          'latitude': '${place.latitude}',
          'longitude': '${place.longitude}',
          'current': OpenMeteoCurrentParam.values.map((e) => e.name).join(','),
          'hourly': OpenMeteoHourlyParam.values.map((e) => e.name).join(','),
          'daily': OpenMeteoDailyParam.values.map((e) => e.name).join(','),
        },
      );
      logInfo(uri);

      final http.Response response = await http.get(uri);

      switch (response.statusCode) {
        case 200:
          break;
        default:
          // todo(03.08.2024): create OpenMeteoException
          //  example:
          // {
          //   "error": true,
          //   "reason": "Cannot initialize WeatherVariable from invalid String value tempeture_2m for key hourly"
          // }
          throw OwmApiException(response.statusCode, response.body);
      }

      final json = jsonDecode(response.body) as Map<String, dynamic>;

      result = ForecastOpenMeteoResponse.fromJson(json);
    } catch (error, stackTrace) {
      throw OwmApiException.error(error, stackTrace);
    }

    return result;
  }
}
