import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/application/const/app_icons.dart';
import 'package:weather_today/application/const/app_insets.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/weather_provider_nr.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';
import 'package:weather_today/extension/string_extension.dart';
import 'package:weather_today/ui/pages/hourly/hourly_page_presenter.dart';
import 'package:weather_today/ui/shared/expandable_custom.dart';
import 'package:weather_today/ui/utils/image_helper.dart';

import '../../../shared/attribution_weather_widget.dart';
import '../../../shared/rowtile_table_widget.dart';
import '../../../utils/metrics_helper.dart';

class HourlyPageByTolskaya extends ConsumerWidget {
  const HourlyPageByTolskaya(this.hourly);

  final List<WeatherHourly> hourly;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = Theme.of(context).textTheme;

    return ListView.separated(
      itemCount: hourly.length,
      separatorBuilder: (BuildContext context, int index) {
        if (hourly[index].date?.hour == 23 && index + 1 != hourly.length - 1) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  DateFormat.MMMMEEEEd().format(
                    hourly[index].date?.add(const Duration(days: 1)) ??
                        DateTime.now(),
                  ),
                  style: styles.titleSmall,
                ),
              ),
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
      },
    );
  }
}

class _DateWidget extends ConsumerWidget {
  const _DateWidget(this.actualData);

  final DateTime? actualData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(HourlyPagePresenter.tr);

    final styles = Theme.of(context).textTheme;

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
    final theme = Theme.of(context);

    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppInsets.cornerRadiusCard),
        side: BorderSide(
          color: theme.primaryColor,
        ),
      ),
      child: ExpPanel(
        hasIcon: true,
        header: TileHourlyWidget(weather),
        expanded: _ExpandedWidget(weather),
      ),
    );
  }
}

class TileHourlyWidget extends ConsumerWidget {
  const TileHourlyWidget(this.weather);

  final WeatherHourly weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = Theme.of(context).textTheme;

    final tempUnits = ref.watch(HourlyPagePresenter.tempUnits);

    final _temp =
        MetricsHelper.getTemp(weather.temp, tempUnits, withUnits: false);

    final _pop = MetricsHelper.withPrecision(
      MetricsHelper.getPercentage(
        weather.pop == 0.0 ? null : weather.pop,
        1.0,
      ),
    );

    // final uvi = weather.uvi?.toStringAsFixed(0);

    final _brief = MetricsHelper.weatherBriefTrByCode(
          weatherCode: weather.weatherConditionCode!,
          provider: ref.watch(WeatherProviderNR.i),
          tr: tr,
        ) ??
        '';

    return ListTile(
      minVerticalPadding: 0.0,
      minLeadingWidth: 0.0,
      horizontalTitleGap: 16.0,
      contentPadding: const EdgeInsets.only(right: 0.0, left: 8.0),
      leading: Text(
        weather.date == null
            ? '––:––'
            : DateFormat('HH:mm').format(weather.date!),
        style: styles.labelLarge,
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
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
                text: _brief,
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
                    style: styles.bodySmall?.copyWith(color: Colors.blue),
                  ),
                ],
              ),
            ),
          const SizedBox(width: 8.0),
          // Text.rich(
          //   TextSpan(text: uvi),
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

    final WeatherHourly(
      :pressure,
      :humidity,
      :visibility,
      :cloudiness,
      :dewPoint,
      weatherConditionCode: weatherCode,
      weatherDescription: weatherDesc,
      :windSpeed,
    ) = weather;

    final _weatherDesc = MetricsHelper.weatherDescTrByCode(
          weatherCode: weatherCode!,
          provider: ref.watch(WeatherProviderNR.i),
          tr: tr,
        ) ??
        weatherDesc?.toCapitalize;

    final _pressure = MetricsHelper.getPressure(
      pressure,
      ref.watch(WeatherServices.pressureUnits),
    );

    final _humidity = MetricsHelper.withPrecision(humidity);

    final _visibility = MetricsHelper.withPrecision(
      MetricsHelper.getPercentage(visibility, 10000.0),
    );

    final _cloudiness = MetricsHelper.withPrecision(cloudiness);

    final tempUnits = ref.watch(HourlyPagePresenter.tempUnits);
    final _dewPoint = MetricsHelper.getTempOrNull(dewPoint, tempUnits);

    final speedUnits = ref.watch(HourlyPagePresenter.speedUnits);
    final _windSpeed = MetricsHelper.getSpeed(windSpeed, speedUnits);

    final _uvi = weather.uvi?.toStringAsFixed(0);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_weatherDesc != null) ...[
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text.rich(TextSpan(text: _weatherDesc)),
            ),
            const Divider(),
          ],
          if (_windSpeed != null)
            RowItem(AppIcons.wind, t.weather.wind, _windSpeed),
          if (_uvi != null) RowItem(AppIcons.uvi, t.weather.uvi, _uvi),
          if (_cloudiness != null)
            RowItem(
              AppIcons.cloudiness,
              t.weather.cloudiness,
              '$_cloudiness %',
            ),
          if (_humidity != null)
            RowItem(AppIcons.humidity, t.weather.humidity, '$_humidity %'),
          if (_visibility != null)
            RowItem(
              AppIcons.visibility,
              t.weather.visibility,
              '$_visibility %',
            ),
          if (_pressure != null)
            RowItem(AppIcons.pressure, t.weather.pressure, _pressure),
          if (_dewPoint != null)
            RowItem(AppIcons.dewPoint, t.weather.dewPoint, _dewPoint),
        ],
      ),
    );
  }
}
