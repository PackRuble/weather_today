// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/ui/pages/hourly/charts_widget/chart_main_forecast.dart';
import 'package:weather_today/ui/pages/hourly/charts_widget/chart_other_params_widget.dart';
import 'package:weather_today/ui/pages/hourly/charts_widget/chart_pop_widget.dart';
import 'package:weather_today/ui/pages/hourly/charts_widget/chart_wind_widget.dart';

import '../../../shared/attribution_weather_widget.dart';
import '../hourly_page_presenter.dart';

class HourlyPageByRuble extends ConsumerWidget {
  const HourlyPageByRuble(this.hourly);

  final List<WeatherHourly> hourly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    final TextTheme styles = Theme.of(context).textTheme;

    const Divider _divider = Divider(height: 6.0, thickness: 1.0);

    return ListView(
      children: [
        _DateWidget(hourly.first.date),
        const ChartForecastWidget(),
        _divider,
        const ChartPopWidget(),
        _divider,
        const ChartWindWidget(),
        _divider,
        const ChartOtherWidget(),
        const AttributionWeatherWidget(padding: EdgeInsets.all(8.0)),
      ],
    );
  }
}

class _DateWidget extends ConsumerWidget {
  const _DateWidget(this.actualData);

  final DateTime? actualData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(HourlyPagePresenter.tr);

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
