import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/data/json_converters.dart';
import 'package:weather_today/data/open_meteo/models/enums.dart';

part 'models.freezed.dart';
part 'models.g.dart';

/// Не переименовывать, используется в Cardoteka!
enum WeatherProvider { openWeatherMap, openMeteo }

// todo(05.08.2024): Классы моделей ниже не используется, однако показывают
//  возможность объединения нескольких погодных моделей от разных провайдеров

// @freezed
// class WeatherExtra with _$WeatherExtra {
//   @JsonSerializable(explicitToJson: true)
//   const factory WeatherExtra({
//     /// Weather provider.
//     @JsonKey(name: 'provider') required WeatherProvider provider,
//   }) = _WeatherExtra;
//
//   factory WeatherExtra.fromJson(Map<String, dynamic> json) =>
//       _$WeatherExtraFromJson(json);
// }

@freezed
abstract class WeatherUnits with _$WeatherUnits {
  @JsonSerializable(explicitToJson: true)
  const factory WeatherUnits({
    @JsonKey(name: 'temp') @Default(Temp.celsius) Temp temp,
    @JsonKey(name: 'speed') @Default(Speed.ms) Speed speed,
    @JsonKey(name: 'pressure') @Default(Pressure.mmHg) Pressure pressure,
  }) = _WeatherUnits;

  factory WeatherUnits.fromJson(Map<String, dynamic> json) =>
      _$WeatherUnitsFromJson(json);
}

@freezed
class CurrentWeatherBase with _$CurrentWeatherBase {
  @JsonSerializable(explicitToJson: true)
  const factory CurrentWeatherBase({
    /// Units of measurement for the parameters of this weather object.
    @JsonKey(name: 'units') @Default(WeatherUnits()) WeatherUnits units,

    /// Weather provider.
    @JsonKey(name: 'provider') required WeatherProvider provider,

    //
    // /// Additional data specific to the provider.
    // @JsonKey(name: 'weather_extra') required WeatherExtra extra,

    ///
    @JsonKey(name: 'time')
    @DateTimeISO8601Converter()
    required DateTime datetime,

    /// Temperature now.
    @JsonKey(name: 'temp') required double temp,

    /// This Temperature parameter accounts for the human perception of weather.
    @JsonKey(name: 'temp_feels_like') required double tempFeelsLike,

    /// Relative humidity, %
    @JsonKey(name: 'relative_humidity') required int relativeHumidity,

    /// Is Day or Night
    // @JsonKey(name: 'is_day') required int isDay,
    // @JsonKey(name: 'precipitation') required int precipitation,
    // @JsonKey(name: 'rain') required int rain,
    // @JsonKey(name: 'showers') required int showers,
    // @JsonKey(name: 'snowfall') required int snowfall,
    /// Cloud cover, %
    @JsonKey(name: 'cloudiness') required int cloudiness,

    /// Sea level pressure, %
    @JsonKey(name: 'pressure_sea_level') required double pressureSeaLevel,

    /// Surface pressure, %
    @JsonKey(name: 'pressure_surface') required double pressureSurface,
    @JsonKey(name: 'wind_speed') required double windSpeed,
    @JsonKey(name: 'wind_direction') required int windDirection,
    @JsonKey(name: 'wind_gusts') required double windGusts,
    @JsonKey(name: 'weather_code') required int weatherCode,
  }) = _CurrentWeatherBase;

  factory CurrentWeatherBase.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherBaseFromJson(json);

  const CurrentWeatherBase._();

  /// A brief description of the weather.
  String? get weatherBrief => switch (provider) {
        // todo(02.08.2024):
        WeatherProvider.openWeatherMap => null,
        WeatherProvider.openMeteo =>
          OpenMeteoWeatherCode.byCode(weatherCode).desc,
      };
}
