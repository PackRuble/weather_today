import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/ui/feature/charts/chart_utils.dart';
import 'package:weather_today/ui/feature/charts/chart_widget.dart';
import 'package:weather_today/ui/utils/image_helper.dart';

import '../hourly_page_by_ruble/hourly_page_controller_R.dart';
import '../hourly_page_controller.dart';
import 'chart_model.dart';
import 'theme_charts.dart';

/// График, отражающий temp, tempFeels, dewPoint and Uvi на пару дней.
class ChartForecastWidget extends ConsumerWidget {
  const ChartForecastWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme styles = Theme.of(context).textTheme;

    final t = ref.watch(HourlyPageController.tr);

    final bool isPortrait =
        MediaQuery.orientationOf(context) == Orientation.portrait;

    final ChartModel<WeatherHourly> chart =
        ref.watch(HPByRubleCtrl.chartMainForecast);

    final Widget titleWidget = HeadChartWidget(
      t.mainPageDRuble.hourlyPage.forecast.title,
      ChartTheme.fIcon,
      ChartTheme.fColorIcon,
    );

    if (!chart.isDataCorrect) {
      return CustomChartWidget(
        generateData: const [],
        generateLabelsData: const FlTitlesData(),
        titleWidget: titleWidget,
        ifEmptyDataWidget:
            Text(t.weather.noDataProvided, style: styles.bodyMedium),
      );
    }

    final List<BarChartGroupData> generateData = _generateData(chart);

    final FlTitlesData generateLabelsData = _generateLabelsData(context, chart);

    final List<LegendWidget> legends = [
      LegendWidget(
          color: ChartTheme.fColorTemp,
          description: t.mainPageDRuble.hourlyPage.forecast.legend.realTemp),
      LegendWidget(
          color: ChartTheme.fColorTempFeels,
          description: t.mainPageDRuble.hourlyPage.forecast.legend.feelTemp),
      LegendWidget(
          color: ChartTheme.fColorDewPoint,
          description: t.mainPageDRuble.hourlyPage.forecast.legend.dewPoint),
    ];

    final Widget unitsRight = Align(
      alignment: Alignment.center,
      child: Text(t.mainPageDRuble.hourlyPage.forecast.uvi,
          style: styles.bodySmall?.copyWith(color: ChartTheme.fColorUvi)),
    );

    return CustomChartWidget(
      generateData: generateData,
      generateLabelsData: generateLabelsData,
      chartPaddingReserved: ChartTheme.fPaddingChart,
      titleWidget: titleWidget,
      legendWidgets: legends,
      unitsLeft: chart.tempUnits.abbr,
      unitsRight: unitsRight,
      aspectRatio: isPortrait
          ? ChartTheme.fAspectRatio
          : ChartTheme.fAspectRatioLandscape,
    );
  }

  List<BarChartGroupData> _generateData(ChartModel<WeatherHourly> chart) {
    // температура в цельсиях.
    BarChartGroupData _generateGroup(
        int x, double temp, double tempFeelsLike, double dewPoint) {
      // накладывается ли температура tempFeels на temp
      final bool isOverlap = temp * tempFeelsLike > 0;

      final double widthTempFeels = isOverlap ? 1 : 3;

      final barTempFeels = BarChartRodData(
        fromY: 0,
        toY: tempFeelsLike,
        color: ChartTheme.fColorTempFeels,
        width: widthTempFeels,
      );

      return BarChartGroupData(
        x: x,
        groupVertically: true,
        barRods: [
          BarChartRodData(
            fromY: 0,
            toY: temp,
            color: ChartTheme.fColorTemp,
            width: 3,
          ),
          BarChartRodData(
            fromY: dewPoint - chart.constantPrecisionPointLeft!,
            toY: dewPoint + chart.constantPrecisionPointLeft!,
            color: ChartTheme.fColorDewPoint,
            width: 5,
          ),
        ]..insert(isOverlap ? 1 : 0, barTempFeels),
      );
    }

    final List<BarChartGroupData> dataList = [];

    for (int i = 0; i < chart.data.length; i++) {
      dataList.addAll([
        _generateGroup(
          i,
          chart.tempUnits.value(chart.data[i].temp ?? 0.0),
          chart.tempUnits.value(chart.data[i].tempFeelsLike ?? 0.0),
          chart.tempUnits.value(chart.data[i].dewPoint ?? 0.0),
        )
      ]);
    }

    return dataList;
  }

  FlTitlesData _generateLabelsData(
      BuildContext context, ChartModel<WeatherHourly> chart) {
    final TextTheme styles = Theme.of(context).textTheme;

    // метки uvi
    // value здесь - это 1.0, 2.0, 3.0 ..., то есть количество столбцов == длина списка
    Widget _topTitles(double value, TitleMeta _) {
      final int topPoint = value.toInt();

      if (chart.labelIntervalsTop!.contains(topPoint)) {
        return Center(
          child: Text(
            chart.data[topPoint].uvi?.round().toString() ?? '-',
            style: styles.bodySmall?.copyWith(
              color: ChartTheme.fColorUvi,
            ),
          ),
        );
      }
      return const SizedBox();
    }

    // метки температуры по оси y
    Widget _leftTitles(double value, TitleMeta meta) {
      if (ChartUtils.isSuitYLabel(
          value, meta.min, meta.max, chart.scaleDivisionLeft!)) {
        return Center(
          child: Text(
            value.toStringAsFixed(chart.precisionLeft!),
            style: styles.bodySmall,
          ),
        );
      }

      return const SizedBox.shrink();
    }

    // метки времени и иконок по оси x снизу
    Widget _bottomTitles(double value, TitleMeta _) {
      final int bottomPoint = value.toInt();

      final List<Widget> bottomWidgets = [];

      if (chart.labelIntervalsBottomTime!.contains(bottomPoint)) {
        if (chart.data[bottomPoint].date != null) {
          final String time =
              DateFormat.Hm().format(chart.data[bottomPoint].date!);
          final String date =
              DateFormat.MMMd().format(chart.data[bottomPoint].date!);

          bottomWidgets.insert(
            0,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(time, style: styles.bodySmall),
                  Text(date, style: styles.bodySmall),
                ],
              ),
            ),
          );
        }
      }

      if (chart.labelIntervalsBottomIcon!.contains(bottomPoint)) {
        final String? weatherIcon = chart.data[bottomPoint].weatherIcon;

        if (weatherIcon != null) {
          if (bottomWidgets.isEmpty) {
            bottomWidgets.add(const Expanded(child: SizedBox()));
          }

          bottomWidgets.insert(
            0,
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox.square(
                    dimension: ChartTheme.fSizeWeatherIcon,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: WeatherImageIcon(weatherIcon: weatherIcon),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }

      if (bottomWidgets.isNotEmpty) {
        if (bottomWidgets.length == 1) {
          bottomWidgets.insert(0, const Expanded(child: SizedBox()));
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: bottomWidgets,
        );
      }

      return const SizedBox.shrink();
    }

    return FlTitlesData(
      leftTitles: AxisTitles(
        sideTitles: SideTitles(
            interval: chart.scaleDivisionLeft,
            showTitles: true,
            getTitlesWidget: _leftTitles,
            reservedSize: ChartTheme.fPaddingChart.left),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (_, __) => const SizedBox.shrink(),
          reservedSize: ChartTheme.fPaddingChart.right,
        ),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: _topTitles,
          reservedSize: ChartTheme.fPaddingChart.top,
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: _bottomTitles,
            reservedSize: ChartTheme.fPaddingChart.bottom),
      ),
    );
  }
}
