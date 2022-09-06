import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/const/app_info.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/ui/pages/hourly_page/charts_widget/chart_main_forecast.dart';
import 'package:weather_today/ui/pages/hourly_page/charts_widget/chart_other_params_widget.dart';
import 'package:weather_today/ui/pages/hourly_page/charts_widget/chart_pop_widget.dart';
import 'package:weather_today/ui/pages/hourly_page/charts_widget/chart_wind_widget.dart';

import '../hourly_page_controller.dart';

class HourlyPageByRuble extends ConsumerWidget {
  const HourlyPageByRuble(this.hourly);

  final List<WeatherHourly> hourly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme styles = Theme.of(context).textTheme;

    return ListView(
      physics: ref.watch(AppTheme.scrollPhysics).scrollPhysics,
      children: [
        _DateWidget(hourly.first.date),
        const ChartForecastWidget(),
        const Divider(height: 5.0),
        const ChartPopWidget(),
        const Divider(height: 5.0),
        const ChartWindWidget(),
        const Divider(height: 5.0),
        const ChartOtherWidget(),
        Padding(
          padding: const EdgeInsets.only(right: 8.0, top: 5.0, bottom: 5.0),
          child: Text(
            AppInfo.weatherService,
            textAlign: TextAlign.end,
            style: styles.bodySmall?.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
      ],
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
                TextSpan(text: t.mainPageDRuble.hourlyPage.currentAsOf),
                if (actualData != null)
                  TextSpan(
                      text:
                          ' ${DateFormat.MMMd().add_Hm().format(actualData!)}',
                      style: styles.bodyMedium
                          ?.copyWith(fontStyle: FontStyle.italic)),
              ],
            ),
          ),
          Text(
            DateFormat.MMMd().add_Hm().format(DateTime.now()),
            style: styles.bodyMedium?.copyWith(
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
