import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/const/app_icons.dart';
import 'package:weather_today/ui/feature/charts/chart_utils.dart';
import 'package:weather_today/ui/feature/charts/chart_widget.dart';

import '../../../utils/metrics_helper.dart';
import '../hourly_page_by_ruble/hourly_page_controller_R.dart';
import '../hourly_page_controller.dart';
import 'chart_model.dart';
import 'theme_charts.dart';

/// График, отражающий wind, windGust на пару дней.
class ChartWindWidget extends ConsumerWidget {
  const ChartWindWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(HourlyPageController.tr);

    final TextTheme styles = Theme.of(context).textTheme;

    final ChartModel<WeatherHourly> chart = ref.watch(HPByRubleCtrl.chartWind);

    final Widget titleWidget = HeadChartWidget(
      t.mainPageDRuble.hourlyPage.wind.title,
      ChartTheme.wIcon,
      ChartTheme.wColorIcon,
    );

    if (!chart.isDataCorrect) {
      final hourly = chart.data;
      // проверяем, доступно ли время
      final DateTime? startDate = hourly.length < 2 ? null : hourly.first.date;
      final DateTime? endDate =
          hourly.length < 2 ? null : hourly[hourly.length - 1].date;

      return CustomChartWidget(
        generateData: const [],
        generateLabelsData: const FlTitlesData(),
        titleWidget: titleWidget,
        ifEmptyDataWidget: (startDate == null || endDate == null)
            ? Text(t.mainPageDRuble.hourlyPage.wind.noWindExpected,
                style: styles.bodyMedium)
            : Text(
                t.mainPageDRuble.hourlyPage.wind.windExpected(
                    startDate: DateFormat.Hm().format(startDate),
                    endDate: DateFormat.Hm().format(endDate)),
                style: styles.bodyMedium,
              ),
      );
    }

    // ***************************************************
    // определим максимальный ветер
    // double rainfall = 0.0;
    // for (final p in chart.data) {
    //   rainfall += p.rain ?? 0.0;
    //   rainfall += p.snow ?? 0.0;
    // }

    Widget? subtitle;
    if (chart.valueMaxY != null) {
      subtitle = Text.rich(
        TextSpan(
          style: styles.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
          children: <TextSpan>[
            TextSpan(text: '${t.mainPageDRuble.hourlyPage.wind.subtitle} - '),
            TextSpan(
                text:
                    chart.valueMaxY!.toStringAsFixed(chart.precisionLeft ?? 1),
                style: styles.labelLarge),
            TextSpan(
                text: ' ${MetricsHelper.getSpeedUnits(Speed.ms)}',
                style: styles.bodySmall),
          ],
        ),
      );
    }
    // ***************************************************

    final List<BarChartGroupData> generateData = _generateData(chart);

    final FlTitlesData generateLabelsData = _generateLabelsData(context, chart);

    final List<LegendWidget> legends = [
      LegendWidget(
          color: ChartTheme.wColorWind,
          description: t.mainPageDRuble.hourlyPage.wind.legend.wind),
      LegendWidget(
          color: ChartTheme.wColorWindGust,
          description: t.mainPageDRuble.hourlyPage.wind.legend.gust),
    ];

    final bool isPortrait =
        MediaQuery.orientationOf(context) == Orientation.portrait;

    return CustomChartWidget(
      generateData: generateData,
      generateLabelsData: generateLabelsData,
      chartPaddingReserved: ChartTheme.wPaddingChart,
      titleWidget: titleWidget,
      subtitleWidget: subtitle,
      legendWidgets: legends,
      unitsLeft: t.mainPageDRuble.hourlyPage.wind.units,
      aspectRatio: isPortrait
          ? ChartTheme.wAspectRatio
          : ChartTheme.wAspectRatioLandscape,
    );
  }

  List<BarChartGroupData> _generateData(ChartModel<WeatherHourly> chart) {
    // температура в цельсиях.
    BarChartGroupData _generateGroup(int x, double yWind, double yGust) {
      return BarChartGroupData(
        x: x,
        groupVertically: true,
        barRods: [
          BarChartRodData(
            fromY: 0,
            toY: yGust,
            color: ChartTheme.wColorWindGust,
            width: 3,
          ),
          BarChartRodData(
            fromY: 0,
            toY: yWind,
            color: ChartTheme.wColorWind,
            width: 3,
          ),
        ],
      );
    }

    final List<BarChartGroupData> dataList = [];

    for (int i = 0; i < chart.data.length; i++) {
      dataList.addAll([
        _generateGroup(
          i,
          chart.data[i].windSpeed ?? 0.0,
          chart.data[i].windGust ?? 0.0,
        )
      ]);
    }

    return dataList;
  }

  FlTitlesData _generateLabelsData(
      BuildContext context, ChartModel<WeatherHourly> chart) {
    final TextTheme styles = Theme.of(context).textTheme;

    // метки направления ветра
    // value здесь - это 1.0, 2.0, 3.0 ..., то есть количество столбцов == длина списка
    Widget _topTitles(double value, TitleMeta _) {
      final int topPoint = value.toInt();

      if (chart.labelIntervalsTop!.contains(topPoint)) {
        return Center(
          child: Transform.scale(
            scale: 0.7,
            child: Transform.rotate(
              angle: MetricsHelper.fromRadiansToDegrees(
                  chart.data[topPoint].windDegree ?? 0),
              child: Icon(
                AppIcons.directWind,
                color: Theme.of(context).iconTheme.color,
              ),
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
            reservedSize: ChartTheme.wPaddingChart.left),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (_, __) => const SizedBox.shrink(),
          reservedSize: ChartTheme.wPaddingChart.right,
        ),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: _topTitles,
          reservedSize: ChartTheme.wPaddingChart.top,
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: _bottomTitles,
            reservedSize: ChartTheme.wPaddingChart.bottom),
      ),
    );
  }
}
