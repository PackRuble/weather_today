import 'dart:convert' show jsonDecode;

import 'package:http/http.dart' as http;
import 'package:weather_today/domain/models/place/place_model.dart';
import 'package:weather_today/utils/logger/_observers/global_logger.dart';

import 'models/enums.dart';
import 'models/models.dart';

class OpenMeteoApiException implements Exception {
  const OpenMeteoApiException(this.code, this.message);

  const OpenMeteoApiException.error(Object error, StackTrace stackTrace)
      : message = '$error\n$stackTrace',
        code = 0;

  /// Message about error.
  final String message;

  /// Code api error.
  final int code;

  @override
  String toString() => '$this(code: $code, message: $message)';
}

class OpenMeteoRepo {
  const OpenMeteoRepo();

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

      final json = jsonDecode(response.body) as Map<String, dynamic>;

      switch (response.statusCode) {
        case 200:
          break;
        default:
          throw OpenMeteoApiException(
            response.statusCode,
            json["reason"].toString(),
          );
      }

      result = ForecastOpenMeteoResponse.fromJson(json);
    } catch (error, stackTrace) {
      throw OpenMeteoApiException.error(error, stackTrace);
    }

    return result;
  }
}
