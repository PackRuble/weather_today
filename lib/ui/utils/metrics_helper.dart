import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/extension/string_extension.dart';
import 'package:weather_today/i18n/translations.g.dart';
import 'package:weather_today/i18n/translations_enum.dart';

import '../../core/models/place/place_model.dart';

// ignore_for_file: prefer_interpolation_to_compose_strings

/// Вспомогательный класс для корректного отображения различных метрик.
///
/// Поддерживает преобразование следующих сущностей:
/// * преобразование места
/// * преобразование скорости ветра
/// * преобразование температуры
/// * преобразование сторон света
/// * преобразование давления
class MetricsHelper {
  MetricsHelper._();

  /// Получить корректное название места следующего вида:
  /// --> '[countryCode], [state]' || [name] || null
  static String? getCountryCodeAndStateOrName(Place place) {
    String result = '';

    if (place.countryCode?.isNotEmpty ?? false) result += place.countryCode!;
    if (place.state?.isNotEmpty ?? false) result += ', ${place.state}';
    if (result.isEmpty) result += place.name ?? '';

    return result.isNotEmpty ? result : null;
  }

  /// Получить корректное название места следующего вида:
  /// --> '[countryCode], [localName]' || '[countryCode], [name]' || [name] || null
  static String? getCountryCodeAndNameOrName(Place place, String languageCode) {
    String result = '';

    if (place.countryCode?.isNotEmpty ?? false) result += place.countryCode!;

    final String? name = getLocalNameOrName(place, languageCode);
    if (name != null) result += result.isNotEmpty ? ', $name' : name;

    return result.isNotEmpty ? result : null;
  }

  /// Получить корректное название места следующего вида:
  /// --> '[localName]' || '[name]' || null
  static String? getLocalNameOrName(Place place, String languageCode) =>
      getLocalName(place, languageCode) ??
      ((place.name?.isNotEmpty ?? false) ? place.name : null);

  /// Получить корректное название места следующего вида:
  /// --> '[name], [localName]' || null
  static String? getNameAndLocalName(Place place, String languageCode) {
    String result = '';

    if (place.name?.isNotEmpty ?? false) {
      result += place.name!;
    } else {
      return null;
    }

    final String? localName = getLocalName(place, languageCode);
    if (localName != null) {
      result += ', $localName';
    } else {
      return null;
    }

    return result;
  }

  /// Получить корректное название места следующего вида:
  /// --> '[localName]' || null
  static String? getLocalName(Place place, String languageCode) =>
      place.localNames?[codeAndLangMatching[languageCode.toLowerCase()]];

  static SideOfTheWorld getNSEWDirect(double degree) {
    return SideOfTheWorld.fromDegrees(degree);
  }

  // ===========================================================================
  // conversion of other parameters

  /// Вернуть с указанной точностью.
  ///
  /// Нюансы:
  /// * при использовании [withFiller] всегда вернется [String].
  ///
  /// Аргументы:
  /// * [precision] - количество цифр после десятичной точки. =0 - целое число
  /// * [withFiller] - использовать заполнитель при [value]=null.
  /// * [filler] - заполнитель при [value]=null.
  static String? withPrecision(double? value,
      {bool withFiller = false, String filler = '–', int precision = 0}) {
    if (value != null) return value.toStringAsFixed(precision);
    if (withFiller) return filler;
    return null;
  }

  /// Вернуть процентное число от максимального значения.
  static double? getPercentage(double? value, double maxValue,
      [double minValue = 0.0]) {
    assert(0.0 <= minValue && minValue < maxValue);
    if (value != null) assert(minValue <= value && value <= maxValue);

    if (value != null) return (value / (maxValue - minValue)) * 100.0;
    return null;
  }

  // ===========================================================================
  // temperature conversion

  /// Получить темпрературу в строковом виде.
  ///
  /// Нюансы:
  /// * знак [-] отрицательной температуры всегда заменяется на тире [–].
  /// * при использовании [withFiller] всегда вернется [String].
  ///
  /// Аргументы:
  /// * [withSign] - добавлять знак + для положительной температуры.
  /// * [withUnits] - добавлять единицы измерения после значения.
  /// * [withFiller] - использовать заполнитель при [value]=null.
  /// * [filler] - заполнитель при [value]=null.
  /// * [precision] - количество цифр после десятичной точки. =0 - целое число
  static String? getTemp(
    double? value,
    Temp units, {
    bool withSign = false,
    bool withUnits = true,
    bool withFiller = false,
    String filler = '–',
    int? precision,
  }) {
    String result = '';

    if (value != null) {
      // используем нужную точность знаков?
      if (precision != null) {
        result = units.valueToString(value, precision);
      } else {
        result = units.valueToString(value);
      }

      // заменяем минус на тире в обязательном порядке
      if (value < 0.0) {
        result = '–' + result.substring(1);
      }

      // температура со знаком?
      if (withSign) {
        if (value > 0.0) {
          result = '+' + result;
        }
      }
    } else {
      // применяем заполнитель при null значениях value
      if (withFiller) {
        result = filler;
      } else {
        return null;
      }
    }

    // добавлять единицы измерения?
    if (withUnits) return '$result ${getTempUnits(units)}';

    return result;
  }

  /// Получить единицы температуры вида `°C`.
  static String getTempUnits(Temp units) => units.abbr;

  // ===========================================================================
  // pressure conversion

  /// Получить атмосферное давление вида `1005 hPa` с учетом локали.
  ///
  /// Note: использование [withFiller] всегда вернет ненулевое значение!
  static String? getPressure(
    double? pressure,
    Pressure units, {
    bool withUnits = true,
    bool withFiller = false,
    String filler = '–',
    int? precision,
  }) {
    String result = '';

    if (pressure != null) {
      if (precision != null) {
        result = units.valueToString(pressure, precision);
      } else {
        result = units.valueToString(pressure);
      }
    } else {
      if (withFiller) {
        result = filler;
      } else {
        return null;
      }
    }

    if (withUnits) return '$result ${getPressureUnits(units)}';

    return result;
  }

  /// Получить единицы атмосферного давления вида `hPa` с учетом локали.
  static String getPressureUnits(Pressure units) => units.abbrTr;

  // ===========================================================================
  // speed conversion

  /// Получить скорость вида `1005 m/s` с учетом локали.
  ///
  /// Note: использование [withFiller] всегда вернет ненулевое значение!
  static String? getSpeed(
    double? speed,
    Speed units, {
    bool withUnits = true,
    bool withFiller = false,
    String filler = '–',
    int? precision,
  }) {
    String result = '';

    if (speed != null) {
      if (precision != null) {
        result = units.valueToString(speed, precision);
      } else {
        result = units.valueToString(speed);
      }
    } else {
      if (withFiller) {
        result = filler;
      } else {
        return null;
      }
    }

    if (withUnits) return '$result ${getSpeedUnits(units)}';

    return result;
  }

  /// Получить единицы скорости вида `m/s` с учетом локали.
  static String getSpeedUnits(Speed units) => units.abbrTr;

  /// Получить сторону света с учетом локали.
  static String? getSideOfTheWorldAdjective(double? degree) {
    if (degree == null) return null;

    return SideOfTheWorld.fromDegrees(degree).nameAdjTr;
  }

  /// Функция конвертации радиан в градусы.
  static double fromRadiansToDegrees(double rad) => rad * 3.14 / 180.0;

  /// Обработать вручную поля AlertWeather.
  ///
  /// На выходе мы получаем список, в котором у [WeatherAlert]:
  /// * event, description, start, end не равны null
  static List<WeatherAlert> getCorrectAlert(List<WeatherAlert> oldAlerts) {
    final List<WeatherAlert> newAlerts = [];

    for (final WeatherAlert alert in oldAlerts) {
      // воспрос: возможно, пустое [alert.description] нам тоже подойдет?
      // ответ: json подсказывает, если нет description - это не локальные
      // уведомления. А нам такие не нужны :)
      if ((alert.event?.isEmpty ?? true) ||
          (alert.description?.isEmpty ?? true)) {
        continue;
      }

      if (alert.start == null || alert.end == null) {
        continue;
      }

      final DateTime? start;
      final DateTime? end;
      if (alert.start == alert.end) {
        start = alert.start;
        end = null;
      } else {
        start = alert.start;
        end = alert.end;
      }

      newAlerts.add(WeatherAlert(
        alert.toJson(),
        senderName: (alert.senderName?.isNotEmpty ?? false)
            ? alert.senderName!.toCapitalized()
            : null,
        event: alert.event!.toCapitalized(),
        start: start,
        end: end,
        description: alert.description!.toCapitalized(),
        tags: alert.tags,
      ));
    }

    return newAlerts;
  }

  /// Получить перевод короткого [WeatherCurrent.weatherMain] описания погоды.
  static String? getWeatherMainTr(String? weatherMain, TranslationsRu t) {
    if (weatherMain == null) return null;

    return t.weather.condition[weatherMain.toLowerCase()] ?? weatherMain;
  }
}
