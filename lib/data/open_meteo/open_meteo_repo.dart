import 'dart:convert' show jsonDecode;

import 'package:http/http.dart' as http;
import 'package:weather_today/domain/models/place/place_model.dart';
import 'package:weather_today/utils/logger/_observers/global_logger.dart';

import 'models/enums.dart';
import 'models/models.dart';

class OpenMeteoApiException implements Exception {
  const OpenMeteoApiException(this.code, this.message);

  const OpenMeteoApiException.error(Object error)
      : message = '$error',
        code = 0;

  /// Message about error.
  final String message;

  /// Code api error.
  final int code;

  @override
  String toString() => '$OpenMeteoApiException(code: $code, message: $message)';
}

class OpenMeteoRepo {
  const OpenMeteoRepo();

  Future<ForecastOpenMeteoResponse> fetchForecast(
    Place place, {
    List<OpenMeteoCurrentParam> currentParams = OpenMeteoCurrentParam.values,
    List<OpenMeteoHourlyParam>? hourlyParams = OpenMeteoHourlyParam.values,
    List<OpenMeteoDailyParam>? dailyParams = OpenMeteoDailyParam.values,
  }) async {
    ForecastOpenMeteoResponse result;

    try {
      final uri = Uri.https(
        'api.open-meteo.com',
        '/v1/forecast',
        {
          'latitude': '${place.latitude}',
          'longitude': '${place.longitude}',
          'temperature_unit': 'celsius', // celsius | fahrenheit
          'wind_speed_unit': 'ms', // kmh | ms | mph | kn
          'precipitation_unit': 'mm', // mm | inch
          // todo(03.08.2024):
          'timezone': 'auto', // GMT | auto
          'current': currentParams.map((e) => e.name).join(','),
          if (hourlyParams != null)
            'hourly': hourlyParams.map((e) => e.name).join(','),
          if (dailyParams != null) ...{
            'past_days': '0', // for daily
            'daily': dailyParams.map((e) => e.name).join(','),
          },
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
            json["reason"]?.toString() ?? '$json',
          );
      }

      print(json);

      result = ForecastOpenMeteoResponse.fromJson(json);
    } on OpenMeteoApiException {
      // ignore
      rethrow;
    } catch (error, stackTrace) {
      throw OpenMeteoApiException.error(error);
    }

    return result;
  }
}
