import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:weather_today/const/app_colors.dart';

import '../../shared/shared_widget.dart';

class CustomChartWidget extends StatelessWidget {
  const CustomChartWidget({
    required this.generateData,
    required this.generateLabelsData,
    this.chartPaddingReserved = EdgeInsets.zero,
    this.unitsLeft,
    this.unitsRight,
    this.titleWidget,
    this.subtitleWidget,
    this.legendWidgets,
    this.ifEmptyDataWidget = const SizedBox.shrink(),
    this.aspectRatio,
  });

  final String? unitsLeft;
  final Widget? unitsRight;
  final Widget? titleWidget;
  final Widget? subtitleWidget;
  final List<Widget>? legendWidgets;

  /// Если график не имеет значений.
  final Widget ifEmptyDataWidget;

  /// Размер графика в соотношении размеров экрана.
  final double? aspectRatio;

  final EdgeInsets chartPaddingReserved;

  /// Данные графика. Если пуст, покажем [ifEmptyDataWidget].
  final List<BarChartGroupData> generateData;

  /// Все лэйблы графика.
  final FlTitlesData generateLabelsData;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextTheme styles = theme.textTheme;

    return Card(
      margin: const EdgeInsets.all(6.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
        side: BorderSide(color: AppColors.of(context).cardSelectedBorder),
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 4,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (titleWidget != null) ...[
                  titleWidget!,
                  const SizedBox(height: 8.0),
                ],
                if (subtitleWidget != null) ...[
                  subtitleWidget!,
                  const SizedBox(height: 8.0),
                ],
                if (legendWidgets != null && generateData.isNotEmpty) ...[
                  Wrap(
                    spacing: 8.0,
                    children: [for (final l in legendWidgets!) l],
                  ),
                  const SizedBox(height: 8.0),
                ],
              ],
            ),
          ),
          generateData.isEmpty
              ? Padding(
                  padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                  child: ifEmptyDataWidget,
                )
              : AspectRatio(
                  aspectRatio: aspectRatio ?? 2 / 1,
                  child: Stack(
                    children: [
                      unitsLeft != null
                          ? SizedBox(
                              width: chartPaddingReserved.left,
                              child: Align(
                                alignment: Alignment.topCenter,
                                child:
                                    Text(unitsLeft!, style: styles.bodySmall),
                              ),
                            )
                          : const SizedBox.shrink(),
                      unitsRight != null
                          ? Align(
                              alignment: Alignment.topRight,
                              child: SizedBox(
                                width: chartPaddingReserved.right,
                                height: chartPaddingReserved.top,
                                child: unitsRight ?? const SizedBox.shrink(),
                              ),
                            )
                          : const SizedBox.shrink(),
                      BarChart(
                        BarChartData(
                          barTouchData: BarTouchData(enabled: false),
                          borderData: FlBorderData(show: false),
                          gridData: FlGridData(show: false),
                          titlesData: generateLabelsData,
                          barGroups: generateData,
                        ),
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}

/// Легенда, т.е. обозначение данных на графике.
class LegendWidget extends StatelessWidget {
  const LegendWidget({
    required this.color,
    required this.description,
  });

  final Color color;
  final String description;

  @override
  Widget build(BuildContext context) {
    final TextTheme styles = Theme.of(context).textTheme;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.circle_rounded, color: color, size: 12.0),
        const SizedBox(width: 5.0),
        Text(description, style: styles.bodyMedium),
      ],
    );
  }
}

/// Заголовок графика.
class HeadChartWidget extends StatelessWidget {
  const HeadChartWidget(this.name, this.iconData, this.color);

  final IconData iconData;
  final Color color;
  final String name;

  @override
  Widget build(BuildContext context) {
    final TextTheme styles = Theme.of(context).textTheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Icon(
          iconData,
          color: color,
        ),
        const SizedBox(width: 8.0),
        HeaderRWidget(
          name,
          padding: EdgeInsets.zero,
          textStyle: styles.labelLarge,
          // fontStyle: FontStyle.italic,
        ),
      ],
    );
  }
}
