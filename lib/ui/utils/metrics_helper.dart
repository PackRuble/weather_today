// ignore_for_file: unused_field, prefer_interpolation_to_compose_strings

import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/application/i18n/translations_enum.dart';
import 'package:weather_today/domain/weather/mapper.dart';
import 'package:weather_today/domain/weather/models.dart';
import 'package:weather_today/extension/string_extension.dart';

import '../../domain/models/place/place_model.dart';

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

  // `\u2212` или `String.fromCharCode(0x2212)` - знак минуса `−`
  static const _minus = '\u2212';

  // `\u2010` или `String.fromCharCode(0x2010)` - знак дефиса `-`
  static const _hyphen = '\u2010';

  // `\u002D` или `String.fromCharCode(0x002D)` - знак дефис-минус `-`
  static const _hyphenMinus = '\u002D';

  /// Получить корректное название места следующего вида:
  /// --> '[countryCode], [state]' || [name] || null
  ///
  /// Note: without country
  static String? getCountryCodeAndStateOrName(Place place) {
    String result = '';

    if (place.state?.isNotEmpty ?? false) result += '${place.state}';
    if (result.isEmpty) result += place.name ?? '';

    return result.isNotEmpty ? result : null;
  }

  /// Получить корректное название места следующего вида:
  /// --> '[countryCode], [localName]' || '[countryCode], [name]' || [name] || null
  ///
  /// Note: without country
  static String? getCountryCodeAndNameOrName(Place place, String languageCode) {
    String result = '';

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
  static double? getPercentage(
    double? value,
    double maxValue, [
    double minValue = 0.0,
  ]) {
    if (value == null) return null;

    return (value.clamp(minValue, maxValue) / (maxValue - minValue)) * 100.0;
  }

  // ===========================================================================
  // temperature conversion

  /// Заменяем дефис-минус на настоящий минус. Он просто больше :)
  static String _fixMinus(String value) {
    if (value == '${_hyphenMinus}0.0' || value == '${_hyphenMinus}0') {
      return value.substring(1);
    }

    return value.contains(_hyphenMinus) ? _minus + value.substring(1) : value;
  }

  /// Получить температуру в строковом виде.
  ///
  /// Нюансы:
  /// * знак дефис-минус всегда заменяется на минус.
  /// * при использовании [withFiller] всегда вернется [String].
  ///
  /// Аргументы:
  /// * [withSign] - добавлять знак + для положительной температуры.
  /// * [withUnits] - добавлять единицы измерения после значения.
  /// * [withFiller] - использовать заполнитель при [value]=null.
  /// * [filler] - заполнитель при [value]=null.
  /// * [precision] - количество знаков после запятой. Всегда >=0
  static String? getTempOrNull(
    double? value,
    Temp units, {
    bool withSign = false,
    bool withUnits = true,
    bool withFiller = false,
    String filler = '–',
    int? precision,
  }) {
    String result = '';
    double _value;

    assert((precision ?? 0) >= 0, 'precision must be greater than 0 (or ==)');
    final int _precision = precision ?? 0;

    if (value != null) {
      result = units.valueToString(value, _precision);
      _value = units.value(value, _precision);

      result = _fixMinus(result);

      // температура со знаком +?
      if (withSign) {
        if (_value > 0.0) {
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

  /// Отличается от [getTempOrNull] только тем, что всегда использует [filler],
  /// если [value] равно null.
  static String getTemp(
    double? value,
    Temp units, {
    bool withSign = false,
    bool withUnits = true,
    String filler = '–',
    int? precision,
  }) =>
      getTempOrNull(
        value,
        units,
        withSign: withSign,
        withUnits: withUnits,
        withFiller: true,
        filler: filler,
        precision: precision,
      )!;

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
      // отправитель mecom.ru дублирует информацию на английский, в котором отсутствует description
      // coldfix: можно добавить также текущий язык
      // проверить на содержание ещё одного английского аллерта с таким же временем
      if ((alert.description?.isEmpty ?? true) &&
          (alert.senderName?.contains('mecom.ru') ?? false) &&
          oldAlerts.any((element) =>
              element.start == alert.start &&
              element.end == alert.end &&
              element.hashCode != alert.hashCode)) {
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
        description: (alert.description?.isNotEmpty ?? false)
            ? alert.description!.toCapitalized()
            : null,
        tags: alert.tags,
      ));
    }

    return newAlerts;
  }

  static String? weatherBriefTrByCode({
    required int weatherCode,
    required TranslationsRu tr,
    required WeatherProvider provider,
  }) {
    return switch (provider) {
      WeatherProvider.openWeatherMap => tr.weather.owmConditionsBriefByName[
          OWMWeatherCode.byCode(weatherCode).brief.toLowerCase()],
      WeatherProvider.openMeteo =>
        tr.weather.omConditionsBrief['code$weatherCode'],
    };
  }

  static String? weatherDescTrByCode({
    required int weatherCode,
    required TranslationsRu tr,
    required WeatherProvider provider,
  }) {
    return switch (provider) {
      WeatherProvider.openWeatherMap => null,
      WeatherProvider.openMeteo =>
        tr.weather.omConditionsDesc['code$weatherCode'],
    };
  }
}
