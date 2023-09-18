import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/ui/feature/charts/chart_utils.dart';
import 'package:weather_today/ui/feature/charts/chart_widget.dart';

import '../hourly_page_by_ruble/hourly_page_controller_R.dart';
import '../hourly_page_controller.dart';
import 'chart_model.dart';
import 'theme_charts.dart';

/// График, отражающий wind, windGust на пару дней.
class ChartOtherWidget extends ConsumerWidget {
  const ChartOtherWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme styles = Theme.of(context).textTheme;

    final t = ref.watch(HourlyPageController.tr);

    final ChartModel<WeatherHourly> chart =
        ref.watch(HPByRubleCtrl.chartCloudsParam);

    final Widget titleWidget = HeadChartWidget(
      t.mainPageDRuble.hourlyPage.more.title,
      ChartTheme.oIcon,
      ChartTheme.oColorIcon,
    );

    if (!chart.isDataCorrect) {
      return CustomChartWidget(
        generateData: const [],
        generateLabelsData: const FlTitlesData(),
        titleWidget: titleWidget,
        ifEmptyDataWidget: Text(t.mainPageDRuble.hourlyPage.more.noData,
            style: styles.bodyMedium),
      );
    }

    final List<BarChartGroupData> generateData = _generateData(chart);

    final FlTitlesData generateLabelsData = _generateLabelsData(context, chart);

    final List<LegendWidget> legends = [
      LegendWidget(
          color: ChartTheme.oColorClouds,
          description: t.mainPageDRuble.hourlyPage.more.legend.clouds),
      LegendWidget(
          color: ChartTheme.oColorHumidity,
          description: t.mainPageDRuble.hourlyPage.more.legend.humidity),
      LegendWidget(
          color: ChartTheme.oColorPressure,
          description: t.mainPageDRuble.hourlyPage.more.legend.pressure),
    ];

    final Widget unitsRight = Align(
      alignment: Alignment.topCenter,
      child: OverflowBox(
        maxWidth: 40.0,
        maxHeight: 100.0,
        child: Text(t.mainPageDRuble.hourlyPage.more.unitsRight,
            textAlign: TextAlign.center,
            style:
                styles.bodySmall?.copyWith(color: ChartTheme.oColorPressure)),
      ),
    );

    final bool isPortrait =
        MediaQuery.orientationOf(context) == Orientation.portrait;

    return CustomChartWidget(
      generateData: generateData,
      generateLabelsData: generateLabelsData,
      chartPaddingReserved: ChartTheme.oPaddingChart,
      titleWidget: titleWidget,
      legendWidgets: legends,
      unitsLeft: '%',
      unitsRight: unitsRight,
      aspectRatio: isPortrait
          ? ChartTheme.oAspectRatio
          : ChartTheme.oAspectRatioLandscape,
    );
  }

  List<BarChartGroupData> _generateData(ChartModel<WeatherHourly> chart) {
    BarChartGroupData _generateGroup(int x, double yClouds, double yHumidity) {
      return BarChartGroupData(
        x: x,
        groupVertically: true,
        barRods: [
          BarChartRodData(
            fromY: 0.0,
            toY: yClouds,
            color: ChartTheme.oColorClouds,
            width: 3.0,
          ),
          BarChartRodData(
            fromY: yHumidity - chart.constantPrecisionPointLeft!,
            toY: yHumidity + chart.constantPrecisionPointLeft!,
            color: ChartTheme.oColorHumidity,
            width: 5.0,
          ),
        ],
      );
    }

    final List<BarChartGroupData> dataList = [];

    for (int i = 0; i < chart.data.length; i++) {
      dataList.addAll([
        _generateGroup(
          i,
          chart.data[i].cloudiness ?? 0.0,
          chart.data[i].humidity ?? 0.0,
        )
      ]);
    }

    return dataList;
  }

  FlTitlesData _generateLabelsData(
      BuildContext context, ChartModel<WeatherHourly> chart) {
    final TextTheme styles = Theme.of(context).textTheme;

    // метки pop, вероятность осадков в %
    Widget _topTitles(double value, TitleMeta _) {
      final int topPoint = value.toInt();
      final WeatherHourly weather = chart.data[topPoint];

      if (chart.labelIntervalsTop!.contains(topPoint) &&
          weather.pressure != null) {
        return Center(
          child: Text(
            Pressure.mmHg.valueToString(weather.pressure!, 0),
            textAlign: TextAlign.center,
            style: styles.bodySmall?.copyWith(
              color: ChartTheme.oColorPressure,
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

    // метки времени по оси x снизу
    Widget _bottomTitles(double value, TitleMeta _) {
      final int bottomPoint = value.toInt();

      if (chart.labelIntervalsBottomTime!.contains(bottomPoint)) {
        if (chart.data[bottomPoint].date == null) {
          return const SizedBox.shrink();
        }

        final String time =
            DateFormat.Hm().format(chart.data[bottomPoint].date!);
        final String date =
            DateFormat.MMMd().format(chart.data[bottomPoint].date!);

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(time, style: styles.bodySmall),
            Text(date, style: styles.bodySmall),
          ],
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
            reservedSize: ChartTheme.oPaddingChart.left),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (_, __) => const SizedBox.shrink(),
          reservedSize: ChartTheme.oPaddingChart.right,
        ),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: _topTitles,
          reservedSize: ChartTheme.oPaddingChart.top,
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: _bottomTitles,
            reservedSize: ChartTheme.oPaddingChart.bottom),
      ),
    );
  }
}
