// ignore_for_file: constant_identifier_names

/// Current enums provided by Open-Meteo.
enum OpenMeteoCurrentParam {
  temperature_2m,
  relative_humidity_2m,
  apparent_temperature,
  is_day,
  precipitation,
  rain,
  showers,
  snowfall,
  weather_code,
  cloud_cover,
  pressure_msl,
  surface_pressure,
  wind_speed_10m,
  wind_direction_10m,
  wind_gusts_10m,
}

/// WMO Weather interpretation codes, 0-99.
///
/// (*) Thunderstorm forecast with hail is only available in Central Europe.
enum OpenMeteoWeatherCode {
  code0(0, 'Clear sky'),
  code1(1, 'Mainly clear'),
  code2(2, 'Partly cloudy'),
  code3(3, 'Overcast'),
  code45(45, 'Fog'),
  code48(48, 'Depositing rime fog'),
  code51(51, 'Light drizzle'),
  code53(53, 'Moderate drizzle'),
  code55(55, 'Dense drizzle'),
  code56(56, 'Light freezing drizzle'),
  code57(57, 'Dense freezing drizzle'),
  code61(61, 'Slight rain'),
  code63(63, 'Moderate rain'),
  code65(65, 'Heavy rain'),
  code66(66, 'Light freezing rain'),
  code67(67, 'Heavy freezing rain'),
  code71(71, 'Slight snow fall'),
  code73(73, 'Moderate snow fall'),
  code75(75, 'Heavy snow fall'),
  code77(77, 'Snow grains'),
  code80(80, 'Slight rain showers'),
  code81(81, 'Moderate rain showers'),
  code82(82, 'Violent rain showers'),
  code85(85, 'Slight snow showers'),
  code86(86, 'Heavy snow showers'),
  code95(95, 'Thunderstorm'), // (*)
  code96(96, 'Thunderstorm with slight hail'), // (*)
  code99(99, 'Thunderstorm with heavy hail'), // (*)
  ;

  const OpenMeteoWeatherCode(this.code, this.desc);

  /// 0-99.
  final int code;

  /// Short description.
  final String desc;

  static OpenMeteoWeatherCode byCode(int code) =>
      values.firstWhere((e) => e.code == code);
}
