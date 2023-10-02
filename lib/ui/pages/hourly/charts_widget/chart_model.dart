import 'dart:math';

import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/ui/feature/charts/chart_utils.dart';
import 'package:weather_today/ui/feature/charts/model/count_label.dart';
import 'package:weather_today/ui/pages/hourly/charts_widget/theme_charts.dart';

/// Chart models.
class ChartModel {
  /// Include Humidity(%), Clouds(%) and Pressure(hPa)
  ChartModel.clouds(this.data) {
    if (data.length < 2) {
      flagDataError();
      return;
    }

    countLabel = ChartTheme.oLabelsChart;

    valueMinY = 0.0;
    valueMaxY = 100.0;

    // интервал между метками слева от графика
    scaleDivisionLeft = 25.0;

    // точность меток слева от графика
    precisionLeft = 0;

    // находим интервальные точки сверху от графика
    labelIntervalsTop =
        ChartUtils.getXInterval(countLabel.top, data.length, false);

    // находим интервальные точки снизу от графика (время)
    labelIntervalsBottomTime =
        ChartUtils.getXInterval(countLabel.bottom, data.length, true);

    // определяем константу точность точки
    constantPrecisionPointLeft = pow(0.1, precisionLeft + 1).toDouble();

    isDataCorrect = true;
  }

  ChartModel.pop(this.data) {
    if (data.length < 2) {
      flagDataError();
      return;
    }

    countLabel = ChartTheme.pLabelsChart;

    // находим максимальное значение осадков
    double _rainMax = 0.0;
    double _snowMax = 0.0;
    for (final WeatherHourly h in data) {
      _rainMax = max(_rainMax, h.rain ?? 0.0);
      _snowMax = max(_snowMax, h.snow ?? 0.0);
    }

    final double _popMax = max(_rainMax, _snowMax);

    // если количество осадков == 0
    if (_popMax == 0.0) {
      flagDataError();
      return;
    }

    // интервал между метками слева от графика
    scaleDivisionLeft =
        ChartUtils.getYIntervalBetweenLabel(0.0, _popMax, countLabel.left);

    // точность меток слева от графика
    precisionLeft = ChartUtils.getYPrecision(scaleDivisionLeft);

    // находим интервальные точки сверху от графика
    labelIntervalsTop =
        ChartUtils.getXInterval(data.length ~/ 3, data.length, false);

    // находим интервальные точки снизу от графика (время)
    labelIntervalsBottomTime =
        ChartUtils.getXInterval(countLabel.bottom, data.length, true);

    isDataCorrect = true;
  }

  /// Расчет графика ветра.
  ChartModel.wind(this.data) {
    if (data.length < 2) {
      flagDataError();
      return;
    }

    countLabel = ChartTheme.wLabelsChart;

    // находим максимальное значение порывов ветра
    double _windSpeedMax = 0.0;
    double _windGustMax = 0.0;
    for (final WeatherHourly h in data) {
      _windSpeedMax = max(_windSpeedMax, h.windSpeed ?? 0.0);
      _windGustMax = max(_windGustMax, h.windGust ?? 0.0);
    }

    final double _windMax = max(_windSpeedMax, _windGustMax);

    // если ветра нет, то это штиль
    if (_windMax == 0.0) {
      flagDataError();
      return;
    }

    valueMaxY = _windMax;

    // интервал между метками слева от графика
    scaleDivisionLeft =
        ChartUtils.getYIntervalBetweenLabel(0.0, _windMax, countLabel.left);

    // точность меток слева от графика
    precisionLeft = ChartUtils.getYPrecision(scaleDivisionLeft);

    // находим интервальные точки сверху от графика
    labelIntervalsTop =
        ChartUtils.getXInterval(countLabel.top, data.length, false);

    // находим интервальные точки снизу от графика
    labelIntervalsBottomTime =
        ChartUtils.getXInterval(countLabel.bottom, data.length, true);

    isDataCorrect = true;
  }

  ChartModel.forecast(this.data) {
    if (data.length < 2) {
      flagDataError();
      return;
    }

    countLabel = ChartTheme.fLabelsChart;

    const double startValue = -1000.0;

    // находим максимальное значение температур
    double _dewPointMax = startValue;
    double _tempMax = startValue;
    double _tempFeelsMax = startValue;
    double _dewPointMin = startValue * -1;
    double _tempMin = startValue * -1;
    double _tempFeelsMin = startValue * -1;

    for (final WeatherHourly h in data) {
      _dewPointMax = max(_dewPointMax, h.dewPoint ?? _dewPointMax);
      _tempMax = max(_tempMax, h.temp ?? _tempMax);
      _tempFeelsMax = max(_tempFeelsMax, h.tempFeelsLike ?? _tempFeelsMax);

      _dewPointMin = min(_dewPointMin, h.dewPoint ?? _dewPointMin);
      _tempMin = min(_tempMin, h.temp ?? _tempMin);
      _tempFeelsMin = min(_tempFeelsMin, h.tempFeelsLike ?? _tempFeelsMin);
    }

    final double _maxValueY = max(max(_dewPointMax, _tempMax), _tempFeelsMax);
    final double _minValueY = min(min(_dewPointMin, _tempMin), _tempFeelsMin);

    // доп проверка на корректность данных
    if (_maxValueY == startValue || _minValueY == startValue) {
      flagDataError();
      return;
    }

    // определяем минимальное и максимальное значение лэйбла на графике
    valueMinY = Temp.celsius.value(_minValueY);
    valueMaxY = Temp.celsius.value(_maxValueY);

    // интервал между метками слева от графика
    scaleDivisionLeft = ChartUtils.getYIntervalBetweenLabel(
        valueMinY, valueMaxY!, countLabel.left);

    // точность меток слева от графика
    precisionLeft = ChartUtils.getYPrecision(scaleDivisionLeft);

    // находим интервальные точки сверху от графика
    labelIntervalsTop =
        ChartUtils.getXInterval(countLabel.top, data.length, false);

    // находим интервальные точки снизу от графика **ДЛЯ ПОГОДЫ**
    labelIntervalsBottomIcon =
        ChartUtils.getXInterval(countLabel.bottom, data.length, false);

    // находим интервальные точки снизу от графика **ДЛЯ ВРЕМЕНИ**
    labelIntervalsBottomTime =
        ChartUtils.getXInterval(countLabel.bottomLow!, data.length, true);

    // определяем константу точность точки
    constantPrecisionPointLeft = pow(0.1, precisionLeft + 1).toDouble();

    isDataCorrect = true;
  }

  bool isDataCorrect = false;

  /// Список, по которому будет составляться график.
  final List<WeatherHourly> data;

  void flagDataError() => isDataCorrect = false;

  CountLabel countLabel = CountLabel.zero;

  /// Списки расположения лейблов с определенным интервалом.
  ///
  /// В процессе построения лейблов графика происходит сверка с этим списоком.
  late final List<int> labelIntervalsTop;
  late final List<int> labelIntervalsBottomIcon;
  late final List<int> labelIntervalsBottomTime;

  /// Некоторая константа, которая позволяет нарисовать на графике круглую точку
  /// в заданной позиции.
  ///
  /// Саморасчетная величина, зависит от точности [precisionLeft]
  late double constantPrecisionPointLeft;

  /// Цена деления шкалы. Она же интервал расположения лэйблов.
  ///
  /// Цена деления шкалы — разность значений величины, соответствующих двум соседним отметкам шкалы.
  late double scaleDivisionLeft;

  /// Количество знаков после запятой.
  ///
  /// Саморасчетная величина. Определяется исходя из разницы макс и мин значений.
  late int precisionLeft;

  /// Минимальное и максимальное значение по оси Y
  double valueMinY = 0.0;
  double? valueMaxY;

  /// Система счисления для температуры по умолчанию - celsius. И неизменна.
  static const Temp tempUnits = Temp.celsius;

  /// Система счисления для скорости по умолчанию - м/с. И неизменна.
  static const Speed windUnits = Speed.ms;
}
