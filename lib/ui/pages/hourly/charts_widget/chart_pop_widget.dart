import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/ui/feature/charts/chart_utils.dart';
import 'package:weather_today/ui/feature/charts/chart_widget.dart';

import '../hourly_page_by_ruble/hourly_page_by_ruble_presenter.dart';
import '../hourly_page_presenter.dart';
import 'chart_model.dart';
import 'theme_charts.dart';

/// График, отражающий количество осадков.
class ChartPopWidget extends ConsumerWidget {
  const ChartPopWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(HourlyPagePresenter.tr);

    final TextTheme styles = Theme.of(context).textTheme;

    final ChartModel chart = ref.watch(HourlyPageByRublePresenter.chartPop);

    final Widget titleWidget = HeadChartWidget(
      t.mainPageDRuble.hourlyPage.pop.title,
      ChartTheme.pIcon,
      ChartTheme.pColorIcon,
    );

    if (!chart.isDataCorrect) {
      // проверяем, доступно ли время
      final DateTime? startDate = chart.data.first.date;
      final DateTime? endDate = chart.data[chart.data.length - 1].date;

      return CustomChartWidget(
        generateData: const [],
        generateLabelsData: const FlTitlesData(),
        titleWidget: titleWidget,
        ifEmptyDataWidget: (startDate == null || endDate == null)
            ? Text(
                t.mainPageDRuble.hourlyPage.pop.noPopExpected,
                style: styles.bodyMedium,
              )
            : Text(
                t.mainPageDRuble.hourlyPage.pop.popExpected(
                  startDate: DateFormat.MMMMd().format(startDate),
                  endDate: DateFormat.MMMMd().format(endDate),
                ),
                style: styles.bodyMedium,
              ),
      );
    }

    // ***************************************************
    // определим общее количество осадков
    double rainfall = 0.0;
    for (final p in chart.data) {
      rainfall += p.rain ?? 0.0;
      rainfall += p.snow ?? 0.0;
    }

    Widget? subtitle;
    if (rainfall != 0.0) {
      subtitle = Text.rich(
        TextSpan(
          style: styles.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
          children: <TextSpan>[
            TextSpan(text: t.mainPageDRuble.hourlyPage.pop.subtitle),
            const TextSpan(text: ' - '),
            TextSpan(
              text: rainfall.toStringAsFixed(chart.precisionLeft),
              style: styles.labelLarge,
            ),
            TextSpan(
              text: ' ${t.mainPageDRuble.hourlyPage.pop.units}',
              style: styles.bodySmall,
            ),
          ],
        ),
      );
    }
    // ***************************************************

    final List<BarChartGroupData> generateData = _generateData(chart);

    final FlTitlesData generateLabelsData = _generateLabelsData(context, chart);

    final List<LegendWidget> legends = [
      LegendWidget(
        color: ChartTheme.pColorRain,
        description: t.mainPageDRuble.hourlyPage.pop.legend.rain,
      ),
      LegendWidget(
        color: ChartTheme.pColorSnow,
        description: t.mainPageDRuble.hourlyPage.pop.legend.snow,
      ),
    ];

    final Widget unitsRight = Align(
      alignment: Alignment.center,
      child: Text(
        '%',
        style: styles.bodySmall?.copyWith(color: ChartTheme.pColorIcon),
      ),
    );

    final bool isPortrait =
        MediaQuery.orientationOf(context) == Orientation.portrait;

    return CustomChartWidget(
      generateData: generateData,
      generateLabelsData: generateLabelsData,
      chartPaddingReserved: ChartTheme.pPaddingChart,
      titleWidget: titleWidget,
      subtitleWidget: subtitle,
      legendWidgets: legends,
      unitsLeft: t.mainPageDRuble.hourlyPage.pop.units,
      unitsRight: unitsRight,
      aspectRatio: isPortrait
          ? ChartTheme.pAspectRatio
          : ChartTheme.pAspectRatioLandscape,
    );
  }

  List<BarChartGroupData> _generateData(ChartModel chart) {
    BarChartGroupData _generateGroup(int x, double yRain, double ySnow) {
      return BarChartGroupData(
        x: x,
        groupVertically: true,
        barRods: [
          BarChartRodData(
            fromY: 0.0,
            toY: ySnow,
            color: ChartTheme.pColorSnow,
            width: 3.0,
          ),
          BarChartRodData(
            fromY: 0.0,
            toY: yRain,
            color: ChartTheme.pColorRain,
            width: 3.0,
          ),
        ],
      );
    }

    return [
      for (final (i, item) in chart.data.indexed)
        _generateGroup(
          i,
          item.rain ?? 0.0,
          item.snow ?? 0.0,
        ),
    ];
  }

  FlTitlesData _generateLabelsData(BuildContext context, ChartModel chart) {
    final TextTheme styles = Theme.of(context).textTheme;

    // метки pop, вероятность осадков в %
    Widget _topTitles(double value, TitleMeta _) {
      final int index = value.toInt();
      final WeatherHourly weather = chart.data[index];

      // есть ли осадки?
      bool isPrecip(WeatherHourly w) =>
          (w.pop ?? 0.0) > 0.0 &&
          ((w.rain ?? 0.0) != 0.0 || (w.snow ?? 0.0) != 0.0);

      if (!isPrecip(weather)) return const SizedBox();

      // print(
      //     '${weather.pop! * 100} * ${weather.rain} * ${weather.snow} * ${isPrecip(weather)}');

      // только в два отступа вместится цифра
      bool? secondPreviousPrecip;
      bool? previousPrecip;
      bool? nextPrecip;
      bool? secondNextPrecip;

      if (index != 0 &&
          index != 1 &&
          index != chart.data.length - 1 &&
          index != chart.data.length - 2) {
        secondPreviousPrecip = isPrecip(chart.data[index - 2]);
        previousPrecip = isPrecip(chart.data[index - 1]);
        nextPrecip = isPrecip(chart.data[index + 1]);
        secondNextPrecip = isPrecip(chart.data[index + 2]);
      }

      // можно разместить, если рядом в двух шагах нет значений
      bool maybeTwoSteps() {
        if (secondPreviousPrecip == null ||
            previousPrecip == null ||
            nextPrecip == null ||
            secondNextPrecip == null) return false;
        if (!secondPreviousPrecip &&
            !previousPrecip &&
            !nextPrecip &&
            !secondNextPrecip) return true;
        return false;
      }

      if (chart.labelIntervalsTop.contains(index) || maybeTwoSteps()) {
        String? label;

        if (weather.pop == 1.0) label = '!';
        label ??= ((weather.pop ?? 0) * 100).round().toString();

        return Center(
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: styles.bodySmall?.copyWith(
              color: (weather.rain ?? 0.0) > 0.0
                  ? ChartTheme.pColorRain
                  : ChartTheme.pColorSnow,
            ),
          ),
        );
      }
      return const SizedBox();
    }

    // метки температуры по оси y
    Widget _leftTitles(double value, TitleMeta meta) {
      if (ChartUtils.isSuitYLabel(
        value,
        meta.min,
        meta.max,
        chart.scaleDivisionLeft,
      )) {
        return Center(
          child: Text(
            value.toStringAsFixed(chart.precisionLeft),
            style: styles.bodySmall,
          ),
        );
      }

      return const SizedBox.shrink();
    }

    // метки времени по оси x снизу
    Widget _bottomTitles(double value, TitleMeta _) {
      final int bottomPoint = value.toInt();
      final weather = chart.data[bottomPoint];

      if (chart.labelIntervalsBottomTime.contains(bottomPoint)) {
        final dataDate = weather.date;
        if (dataDate == null) {
          return const SizedBox.shrink();
        }

        final String time = DateFormat.Hm().format(dataDate);
        final String date = DateFormat.MMMd().format(dataDate);

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
          reservedSize: ChartTheme.pPaddingChart.left,
        ),
      ),
      rightTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: (_, __) => const SizedBox.shrink(),
          reservedSize: ChartTheme.pPaddingChart.right,
        ),
      ),
      topTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: _topTitles,
          reservedSize: ChartTheme.pPaddingChart.top,
        ),
      ),
      bottomTitles: AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: _bottomTitles,
          reservedSize: ChartTheme.pPaddingChart.bottom,
        ),
      ),
    );
  }
}
