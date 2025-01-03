import 'dart:convert' show jsonDecode;

import 'package:http/http.dart' as http;
import 'package:weather_today/domain/services/place_service/models/place_model.dart';
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

      result = ForecastOpenMeteoResponse.fromJson(json);
    } on OpenMeteoApiException {
      // ignore
      rethrow;
    } catch (error, _) {
      throw OpenMeteoApiException.error(error);
    }

    return result;
  }
}

/// [Geocoding API | Open-Meteo.com](https://open-meteo.com/en/docs/geocoding-api)
final class OpenMeteoGeocodingRepo {
  const OpenMeteoGeocodingRepo();

  /// [text] String to search for. An empty string or only 1 character will return an empty result. 2 characters will only match exact matching locations. 3 and more characters will perform fuzzy matching. The search string can be a location name or a postal code.
  /// [count] The number of search results to return. Up to 100 results can be retrieved.
  /// [lang] Return translated results, if available, otherwise return english or the native location name. Lower-cased.
  Future<List<OpenMeteoPlace>> geocode({
    required String text,
    int count = 5,
    String lang = 'en',
  }) async {
    final List<OpenMeteoPlace> result;
    final uri = Uri.https(
      'geocoding-api.open-meteo.com',
      '/v1/search',
      <String, String>{
        'name': text,
        'count': '$count', // Up to 100
        'format': 'json', // json | protobuf
        'language': lang,
        // 'apikey': '',
      },
    );

    logInfo(uri);

    try {
      final http.Response response = await http.get(uri);

      final json = jsonDecode(response.body) as Map<String, dynamic>;

      if (json case {'results': final List places}) {
        result = [
          for (final place in places)
            OpenMeteoPlace.fromJson(place as Map<String, Object?>)
        ];
      } else if (response.statusCode case 200) {
        result = [];
      } else if (json
          case {
            'error': true,
            'reason': final String reason,
          }) {
        throw OpenMeteoApiException(response.statusCode, reason);
      } else {
        throw OpenMeteoApiException(response.statusCode, json.toString());
      }
    } catch (_) {
      rethrow;
    }

    return result;
  }
}
