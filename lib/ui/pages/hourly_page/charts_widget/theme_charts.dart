import 'package:flutter/material.dart';
import 'package:weather_today/ui/feature/charts/model/count_label.dart';

// ignore_for_file: constant_identifier_names

class ChartTheme {
  ChartTheme._();

  // ---------------------------------------------------------------------------
  // Constants chart main Forecast
  static const IconData fIcon = Icons.sunny_snowing;
  static const Color fColorIcon = Colors.orange;

  static const Color fColorUvi = Colors.amber;
  static const Color fColorDewPoint = Colors.indigo;
  static const Color fColorTemp = Colors.orange;
  static const Color fColorTempFeels = Colors.pinkAccent;

  static const double fSizeWeatherIcon = 30.0;

  /// Соотношения сторон графика.
  static const double fAspectRatio = 3 / 2;
  static const double fAspectRatioLandscape = 6 / 2;

  /// Зарезервированный отступ по краям графика для лэйблов.
  static const EdgeInsets fPaddingChart =
      EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 90.0);

  /// Количество лэйблов по сторонам графика.
  static const CountLabel fLabelsChart =
      CountLabel.fromLTRB(6, 12, 0, 10, bottomLow: 4);

  // ---------------------------------------------------------------------------
  // Constants chart Wind
  static const IconData wIcon = Icons.wind_power_rounded;
  static const Color wColorIcon = Colors.green;

  static const Color wColorWind = Colors.green;
  static final Color wColorWindGust = Colors.lime.shade800;

  /// Соотношения сторон графика.
  static const double wAspectRatio = 4.5 / 2;
  static const double wAspectRatioLandscape = 8 / 2;

  /// Зарезервированный отступ по краям графика для лэйблов.
  static const EdgeInsets wPaddingChart =
      EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 50.0);

  /// Количество лэйблов по сторонам графика.
  static const CountLabel wLabelsChart = CountLabel.fromLTRB(5, 10, 0, 4);

  // ---------------------------------------------------------------------------
  // Constants chart Precipitation - pop
  static const IconData pIcon = Icons.cloudy_snowing;
  static const Color pColorIcon = Colors.blueAccent;

  static const Color pColorRain = Colors.blue;
  static const Color pColorSnow = Colors.cyan;

  /// Соотношения сторон графика.
  static const double pAspectRatio = 5 / 2;
  static const double pAspectRatioLandscape = 8 / 2;

  /// Зарезервированный отступ по краям графика для лэйблов.
  static const EdgeInsets pPaddingChart =
      EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 50.0);

  /// Количество лэйблов по сторонам графика.
  ///
  /// -1 означает, что данное значение используется,
  /// но присваивается по в другом месте.
  static const CountLabel pLabelsChart = CountLabel.fromLTRB(4, -1, 0, 5);

  // ---------------------------------------------------------------------------
  // Constants chart other parameters
  static const IconData oIcon = Icons.spa_rounded;
  static const Color oColorIcon = Colors.grey;

  static const Color oColorHumidity = Colors.lightBlue;
  static const Color oColorClouds = Colors.grey;
  static const Color oColorPressure = Colors.deepOrangeAccent;

  /// Соотношения сторон графика.
  static const double oAspectRatio = 4 / 2;
  static const double oAspectRatioLandscape = 8 / 2;

  /// Зарезервированный отступ по краям графика для лэйблов.
  static const EdgeInsets oPaddingChart =
      EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 50.0);

  /// Количество лэйблов по сторонам графика.
  static const CountLabel oLabelsChart = CountLabel.fromLTRB(5, 8, 0, 5);
}
