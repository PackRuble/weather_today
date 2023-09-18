import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/const/app_colors.dart';
import 'package:weather_today/const/app_icons.dart';
import 'package:weather_today/const/app_insets.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';
import 'package:weather_today/core/controllers/weather_service_controllers.dart';
import 'package:weather_today/ui/pages/hourly_page/hourly_page_controller.dart';
import 'package:weather_today/ui/utils/image_helper.dart';

import '../../../shared/attribution_weather_widget.dart';
import '../../../shared/rowtile_table_widget.dart';
import '../../../utils/metrics_helper.dart';

class HourlyPageByTolskaya extends ConsumerWidget {
  const HourlyPageByTolskaya(this.hourly);

  final List<WeatherHourly> hourly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme styles = Theme.of(context).textTheme;

    return ListView.separated(
        itemCount: hourly.length,
        separatorBuilder: (BuildContext context, int index) {
          if (hourly[index].date?.hour == 23) {
            return Column(
              children: [
                // const Divider(height: 5.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    DateFormat.MMMMEEEEd().format(
                        hourly[index].date?.add(const Duration(days: 1)) ??
                            DateTime.now()),
                    style: styles.titleSmall,
                  ),
                ),
                // const Divider(height: 5.0),
              ],
            );
          }
          return const SizedBox.shrink();
        },
        itemBuilder: (BuildContext context, int index) {
          if (index + 1 == hourly.length) {
            return const AttributionWeatherWidget();
          }
          return Column(
            children: [
              if (index == 0) _DateWidget(hourly.first.date),
              _GroupExpansionWidget(hourly[index]),
            ],
          );
        }
        // children: [for (final h in hourly) _GroupExpansionWidget(h)],
        );
  }
}

class _DateWidget extends ConsumerWidget {
  const _DateWidget(this.actualData);

  final DateTime? actualData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(HourlyPageController.tr);

    final TextTheme styles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text.rich(
            TextSpan(
              style: styles.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
              children: <TextSpan>[
                TextSpan(text: t.weather.currentAsOf),
                if (actualData != null)
                  TextSpan(
                    text: ' ${DateFormat.MMMd().add_Hm().format(actualData!)}',
                    style: styles.bodyMedium
                        ?.copyWith(fontStyle: FontStyle.italic),
                  ),
              ],
            ),
          ),
          // Text(
          //   DateFormat.MMMd().add_Hm().format(DateTime.now()),
          //   style: styles.bodyMedium?.copyWith(
          //     fontStyle: FontStyle.italic,
          //   ),
          // ),
        ],
      ),
    );
  }
}

class _GroupExpansionWidget extends ConsumerWidget {
  const _GroupExpansionWidget(this.weather);

  final WeatherHourly weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppColors colors = AppColors.of(context);

    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppInsets.cornerRadiusCard),
        side: BorderSide(
          color: colors.cardBorderColor,
        ),
      ),
      child: ExpandableNotifier(
        child: ScrollOnExpand(
          child: ExpandablePanel(
            theme: ExpandableThemeData(
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              tapHeaderToExpand: true,
              tapBodyToExpand: false,
              tapBodyToCollapse: false,
              hasIcon: true,
              iconColor: Theme.of(context).iconTheme.color,
            ),
            header: TileHourlyWidget(weather),
            collapsed: const SizedBox.shrink(),
            expanded: _ExpandedWidget(weather),
          ),
        ),
      ),
    );
  }
}

class TileHourlyWidget extends ConsumerWidget {
  const TileHourlyWidget(this.weather);

  final WeatherHourly weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme styles = Theme.of(context).textTheme;

    final t = ref.watch(AppLocalization.currentTranslation);

    final Temp tempUnits = ref.watch(HourlyPageController.tempUnits);

    final String _temp =
        MetricsHelper.getTemp(weather.temp, tempUnits, withUnits: false);

    final String? _pop = MetricsHelper.withPrecision(
        MetricsHelper.getPercentage(
            weather.pop == 0.0 ? null : weather.pop, 1.0));

    // ignore: unused_local_variable
    final String? _uvi = weather.uvi?.toStringAsFixed(0);

    final String _weatherMain =
        MetricsHelper.getWeatherMainTr(weather.weatherMain, t) ?? '';

    return ListTile(
      minLeadingWidth: 0.0,
      horizontalTitleGap: 5.0,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 56.0,
            child: weather.date == null
                ? const Text('--:--')
                : Text(
                    DateFormat('HH:mm').format(weather.date ?? DateTime.now())),
          ),
          SizedBox.square(
            dimension: 50.0,
            child: FittedBox(
              child: WeatherImageIcon(weatherIcon: weather.weatherIcon),
            ),
          ),
          const SizedBox(width: 6.0),
          SizedBox(
            width: 40.0,
            child: Text.rich(
              TextSpan(
                style: styles.bodyMedium,
                children: <TextSpan>[
                  TextSpan(text: _temp),
                  TextSpan(text: tempUnits.abbr, style: styles.bodySmall),
                ],
              ),
            ),
          ),
          const SizedBox(width: 6.0),
          Expanded(
            child: Text.rich(
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              TextSpan(
                text: _weatherMain,
                style: styles.bodyMedium,
              ),
            ),
          ),
          const SizedBox(width: 6.0),
          if (_pop != null)
            Text.rich(
              TextSpan(
                style: styles.bodyMedium?.copyWith(color: Colors.blue),
                children: <TextSpan>[
                  TextSpan(text: _pop),
                  TextSpan(
                      text: '%',
                      style: styles.bodySmall?.copyWith(color: Colors.blue)),
                ],
              ),
            ),
          // const SizedBox(width: 8.0),
          // Text.rich(
          //   TextSpan(text: _uvi),
          //   style: styles.bodyMedium?.copyWith(color: Colors.orange),
          // ),
        ],
      ),
    );
  }
}

class _ExpandedWidget extends ConsumerWidget {
  const _ExpandedWidget(this.weather);

  final WeatherHourly weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(AppLocalization.currentTranslation);

    final String? _pressure = MetricsHelper.getPressure(
        weather.pressure, ref.watch(WeatherServices.pressureUnits));

    final String? _humidity = MetricsHelper.withPrecision(weather.humidity);

    final String? _visibility = MetricsHelper.withPrecision(
        MetricsHelper.getPercentage(weather.visibility, 10000.0));

    final String? _cloudiness = MetricsHelper.withPrecision(weather.cloudiness);

    final Temp tempUnits = ref.watch(HourlyPageController.tempUnits);
    final String? _dewPoint =
        MetricsHelper.getTempOrNull(weather.dewPoint, tempUnits);

    final Speed speedUnits = ref.watch(HourlyPageController.speedUnits);
    final String? _windSpeed =
        MetricsHelper.getSpeed(weather.windSpeed, speedUnits);

    final String? _uvi = weather.uvi?.toStringAsFixed(0);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text.rich(TextSpan(text: weather.weatherDescription)),
          const Divider(),
          if (_windSpeed != null)
            RowItem(AppIcons.wind, t.weather.wind, _windSpeed),
          if (_uvi != null) RowItem(AppIcons.uvi, t.weather.uvi, _uvi),
          if (_cloudiness != null)
            RowItem(
                AppIcons.cloudiness, t.weather.cloudiness, '$_cloudiness %'),
          if (_humidity != null)
            RowItem(AppIcons.humidity, t.weather.humidity, '$_humidity %'),
          if (_visibility != null)
            RowItem(
                AppIcons.visibility, t.weather.visibility, '$_visibility %'),
          if (_pressure != null)
            RowItem(AppIcons.pressure, t.weather.pressure, _pressure),
          if (_dewPoint != null)
            RowItem(AppIcons.dewPoint, t.weather.dewPoint, _dewPoint),
        ],
      ),
    );
  }
}
