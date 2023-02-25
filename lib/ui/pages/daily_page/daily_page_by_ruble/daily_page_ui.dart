import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/const/app_icons.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';
import 'package:weather_today/core/controllers/weather_service_controllers.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/extension/double_extension.dart';
import 'package:weather_today/ui/shared/attribution_weather_widget.dart';
import 'package:weather_today/ui/shared/shared_widget.dart';

import '../../../shared/alerts_wrapper.dart';
import '../../../utils/image_helper.dart';
import '../../../utils/metrics_helper.dart';
import '../daily_page_controller.dart';

/// Страница погоды на 7 дней.
class DailyWeatherPageByRuble extends ConsumerWidget {
  const DailyWeatherPageByRuble(this.daily);

  final List<WeatherDaily> daily;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const Widget divider = Divider(height: 4.0, thickness: 1.0);

    return ListView.separated(
      physics: ref.watch(AppTheme.scrollPhysics).scrollPhysics,
      itemBuilder: (BuildContext context, int index) {
        if (index + 1 == daily.length) {
          return const AttributionWeatherWidget();
        }

        List<Widget> content = [];

        if (index == 0) {
          content = [...content, const _AlertsListWidget()];
        }

        content = [...content, _GroupExpansionWidget(daily[index])];

        return Column(children: content);
      },
      separatorBuilder: (_, int index) {
        if (index + 2 == daily.length) {
          return const SizedBox.shrink();
        }
        return divider;
      },
      itemCount: daily.length,
    );
  }
}

class _AlertsListWidget extends ConsumerWidget {
  const _AlertsListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertsWrapper(
      asyncAlerts: ref.watch(DailyPageController.alerts),
      data: (List<WeatherAlert> alerts) {
        if (alerts.isEmpty) return const SizedBox.shrink();

        return Column(
          children: [
            for (final alert in alerts) ...[
              _AlertTileWidget(alert),
              const Divider(height: 0.0),
            ]
          ],
        );
      },
    );
  }
}

class _AlertTileWidget extends ConsumerWidget {
  const _AlertTileWidget(this.alert);

  final WeatherAlert alert;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final t = ref.watch(DailyPageController.tr);

    final String date = alert.start!.day == alert.end!.day
        ? t.global.time.timeFromTimeSToTimeEnl(
            time: DateFormat('dd.MM').format(alert.start!),
            timeStart: DateFormat.H().format(alert.start!),
            timeEnd: DateFormat.H().format(alert.end!))
        : t.global.time.fromTimeToTimeNl(
            timeStart: DateFormat('dd.MM').format(alert.start!),
            timeEnd: DateFormat('dd.MM').format(alert.end!));

    // coldfix Когда-нибудь я узнаю, как решать эти проблемы с переполнением
    //  в leading и trailing в ListTile
    return ListTile(
      leading: UnconstrainedBox(
        alignment: Alignment.topCenter,
        constrainedAxis: Axis.horizontal,
        child: SizedBox(
          width: 90.0,
          child: Text(date, textAlign: TextAlign.center),
        ),
      ),
      title: Text(alert.event!),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (alert.description != null) Text(alert.description!),
          if (alert.senderName != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  alert.senderName!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontSize: 10,
                  ),
                ),
              ],
            ),
        ],
      ),
      horizontalTitleGap: 8.0,
      contentPadding: const EdgeInsets.only(right: 8.0),
      tileColor: Theme.of(context).colorScheme.error.withOpacity(0.2),
    );
  }
}

class _GroupExpansionWidget extends ConsumerWidget {
  const _GroupExpansionWidget(this.daily);

  final WeatherDaily daily;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        child: ExpandablePanel(
          theme: const ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapHeaderToExpand: true,
            tapBodyToExpand: false,
            tapBodyToCollapse: false,
            hasIcon: false,
          ),
          header: TileDailyWidget(daily),
          collapsed: const SizedBox.shrink(),
          expanded: _ExpandedWidget(daily),
        ),
      ),
    );
  }
}

/// Заголовок раскрывающегося тайла.
class TileDailyWidget extends ConsumerWidget {
  const TileDailyWidget(this.weather);

  final WeatherDaily weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final t = ref.watch(AppLocalization.currentTranslation);

    final TextTheme styles = theme.textTheme;

    final Temp tempUnits = ref.watch(DailyPageController.tempUnits);
    final String _tempUnits = MetricsHelper.getTempUnits(tempUnits);
    final String _tempMin = MetricsHelper.getTemp(weather.tempMin, tempUnits,
        withUnits: false, withFiller: true)!;
    final String _tempMax = MetricsHelper.getTemp(weather.tempMax, tempUnits,
        withUnits: false, withFiller: true)!;

    final String? _pop = MetricsHelper.withPrecision(
        MetricsHelper.getPercentage(
            weather.pop == 0.0 ? null : weather.pop, 1.0));

    final Speed speedUnits = ref.watch(DailyPageController.speedUnits);
    final String? _windSpeed = MetricsHelper.getSpeed(
        weather.windSpeed, speedUnits,
        withUnits: false, precision: 0);
    final String _speedUnits = MetricsHelper.getSpeedUnits(speedUnits);

    return ListTile(
      minLeadingWidth: 0.0,
      horizontalTitleGap: 5.0,
      leading: SizedBox(
        width: 50.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Transform.rotate(
              angle:
                  MetricsHelper.fromRadiansToDegrees(weather.windDegree ?? 0),
              child: Icon(AppIcons.directWind,
                  color: theme.iconTheme.color, size: 28.0),
            ),
            const SizedBox(height: 3.0),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text.rich(
                TextSpan(
                  style: styles.bodyMedium,
                  children: <TextSpan>[
                    // TextSpan(text: _windSpeed),
                    TextSpan(text: _windSpeed),
                    TextSpan(text: ' $_speedUnits', style: styles.bodySmall),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      title: weather.date?.day == DateTime.now().day
          ? Text(t.global.time.today.toLowerCase())
          : Text(DateFormat.MMMEd().format(weather.date ?? DateTime.now())),
      subtitle: Text('${weather.weatherDescription}'),
      trailing: Row(
        // mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text.rich(
              TextSpan(
                style: styles.bodyMedium?.copyWith(color: Colors.blue),
                children: <TextSpan>[
                  if (_pop != null) ...[
                    TextSpan(text: _pop),
                    TextSpan(
                        text: '%',
                        style: styles.bodySmall?.copyWith(color: Colors.blue)),
                  ]
                ],
              ),
            ),
          ),
          Flexible(
            child: SizedBox.square(
              dimension: 60.0,
              child: FittedBox(
                  fit: BoxFit.contain,
                  child: ImageHelper.getWeatherIcon(weather.weatherIcon)),
            ),
          ),
          Flexible(
            flex: 0,
            child: SizedOverflowBox(
              size: const Size(40.0, 0.0),
              alignment: Alignment.centerRight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text.rich(
                    TextSpan(
                      style: styles.bodyMedium,
                      children: <TextSpan>[
                        TextSpan(text: _tempMax),
                        TextSpan(text: _tempUnits, style: styles.bodySmall),
                      ],
                    ),
                    textAlign: TextAlign.right,
                  ),
                  const SizedBox(height: 2.0),
                  Text.rich(
                    TextSpan(
                      style: styles.bodyMedium,
                      children: <TextSpan>[
                        TextSpan(text: _tempMin),
                        TextSpan(text: _tempUnits, style: styles.bodySmall),
                      ],
                    ),
                    overflow: TextOverflow.visible,
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Высота одного тайла с показателем погоды.
const double _minHeightRowTile = 24.0;
const Widget _hDivider = Divider(height: 8.0, thickness: 1.0);
const Widget _vDivider = VerticalDivider(
  indent: 4.0,
  endIndent: 4.0,
  thickness: 1.0,
  width: 20.0,
);

/// Информация в расширяющемся боксе. Все погодные характеристики здесь.
class _ExpandedWidget extends ConsumerWidget {
  const _ExpandedWidget(this.weather);

  final WeatherDaily weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme stylesText = Theme.of(context).textTheme;
    final t = ref.watch(AppLocalization.currentTranslation);

    final Temp tempUnits = ref.watch(DailyPageController.tempUnits);

    String getTemp(double? value) => MetricsHelper.getTemp(value, tempUnits,
        withUnits: false, withFiller: true)!;

    final Pressure pressureUnits = ref.watch(WeatherServices.pressureUnits);
    final String? _pressure = MetricsHelper.getPressure(
        weather.pressure, pressureUnits,
        withUnits: false, precision: 0);
    final String _pressureUnits = MetricsHelper.getPressureUnits(pressureUnits);

    /// Одна тайл-строка.
    Widget _buildTile(String title, [String? value, String? unit]) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title,
              overflow: TextOverflow.fade,
              style: stylesText.labelLarge,
            ),
          ),
          const SizedBox(width: 2.0),
          Text.rich(
            textAlign: TextAlign.end,
            TextSpan(
              style: stylesText.labelLarge,
              children: <TextSpan>[
                TextSpan(text: value),
                TextSpan(
                  text: unit,
                  style: stylesText.labelMedium,
                ),
              ],
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        const Divider(height: 0.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildTitleRow(t.weather.riseAndSetPl),
              _buildRow(
                height: _minHeightRowTile * 3,
                left: [
                  _buildTile(t.weather.sunrise,
                      DateFormat.Hm().format(weather.sunrise!)),
                  _buildTile(t.weather.sunset,
                      DateFormat.Hm().format(weather.sunset!)),
                ],
                right: [
                  _buildTile(t.weather.moonrise,
                      DateFormat.Hm().format(weather.moonrise!)),
                  _buildTile(t.weather.moonset,
                      DateFormat.Hm().format(weather.moonset!)),
                  _buildTile(t.weather.moonPhase, weather.moonPhase.toString()),
                ],
              ),
              _hDivider,
              _buildTitleRow(t.weather.temp),
              _buildRow(
                height: _minHeightRowTile * 1,
                left: [
                  _buildTile(t.weather.minimum, getTemp(weather.tempMin),
                      tempUnits.abbr)
                ],
                right: [
                  _buildTile(t.weather.maximum, getTemp(weather.tempMax),
                      tempUnits.abbr)
                ],
              ),
              _hDivider,
              _buildRow(
                height: _minHeightRowTile * 5,
                left: [
                  _buildTile(t.weather.real),
                  _buildTile(t.weather.atMorning, getTemp(weather.tempMorning),
                      tempUnits.abbr),
                  _buildTile(t.weather.atDay, getTemp(weather.tempDay),
                      tempUnits.abbr),
                  _buildTile(t.weather.atEvening, getTemp(weather.tempEvening),
                      tempUnits.abbr),
                  _buildTile(t.weather.atNight, getTemp(weather.tempNight),
                      tempUnits.abbr),
                ],
                right: [
                  _buildTile(t.weather.feels),
                  _buildTile(t.weather.atMorning,
                      getTemp(weather.tempFeelsLikeMorning), tempUnits.abbr),
                  _buildTile(t.weather.atDay, getTemp(weather.tempFeelsLikeDay),
                      tempUnits.abbr),
                  _buildTile(t.weather.atEvening,
                      getTemp(weather.tempFeelsLikeEvening), tempUnits.abbr),
                  _buildTile(t.weather.atNight,
                      getTemp(weather.tempFeelsLikeNight), tempUnits.abbr),
                ],
              ),
              _hDivider,
              _buildTitleRow(t.weather.indicators),
              _buildRow(
                height: _minHeightRowTile * 3,
                left: [
                  if (_pressure != null)
                    _buildTile(
                        t.weather.pressure, _pressure, ' $_pressureUnits'),
                  _buildTile(t.weather.cloudiness,
                      weather.cloudiness.toStringMaybe(), '%'),
                  _buildTile(t.weather.uvi, weather.uvi.toStringMaybe()),
                ],
                right: [
                  _buildTile(t.weather.humidity,
                      weather.humidity.toStringMaybe(), '%'),
                  _buildTile(t.weather.dewPoint, getTemp(weather.dewPoint),
                      tempUnits.abbr),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRow(
      {required double height,
      required List<Widget> left,
      required List<Widget> right}) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: left,
          ),
        ),
        SizedBox(
          height: height,
          child: _vDivider,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: right,
          ),
        ),
      ],
    );
  }

  /// Заголовок показателей.
  Widget _buildTitleRow(String title) => Align(
        alignment: Alignment.centerLeft,
        child: HeaderRWidget(
          title,
          padding: const EdgeInsets.all(4.0),
        ),
      );
}
