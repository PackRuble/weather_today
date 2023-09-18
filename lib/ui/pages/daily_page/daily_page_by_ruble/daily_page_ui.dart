// ignore_for_file: unused_element

import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/const/app_icons.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';
import 'package:weather_today/core/controllers/weather_service_controllers.dart';
import 'package:weather_today/extension/double_extension.dart';
import 'package:weather_today/ui/shared/attribution_weather_widget.dart';
import 'package:weather_today/ui/shared/shared_widget.dart';
import 'package:weather_today/utils/logger/all_observers.dart';

import '../../../utils/image_helper.dart';
import '../../../utils/metrics_helper.dart';
import '../daily_page_controller.dart';

const Widget _divider = Divider(height: 0.0, thickness: 1.0);

/// Страница погоды на 7 дней.
class DailyWeatherPageByRuble extends ConsumerWidget {
  const DailyWeatherPageByRuble(this.daily);

  final List<WeatherDaily> daily;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
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
        return _divider;
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
    return ref.watch(DailyPageController.alerts).maybeWhen(
        data: (List<WeatherAlert>? alerts) {
          if (alerts?.isEmpty ?? true) {
            return const SizedBox.shrink();
          }

          alerts = MetricsHelper.getCorrectAlert(alerts!);

          return Column(
            children: [
              for (final alert in alerts) ...[
                _AlertTileWidget(alert),
                _divider,
              ]
            ],
          );
        },
        orElse: () => const SizedBox.shrink());
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
            time: DateFormat.MMMMd().format(alert.start!).replaceAll(' ', ' '),
            timeStart: DateFormat.H().format(alert.start!),
            timeEnd: DateFormat.H().format(alert.end!),
          )
        : t.global.time.fromTimeToTime(
            // todo: rename fromDateToDate
            timeStart:
                DateFormat.MMMMd().format(alert.start!).replaceAll(' ', ' '),
            timeEnd: DateFormat.MMMMd().format(alert.end!).replaceAll(' ', ' '),
          );

    final String? description = alert.description;

    return ListTile(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                child: Text(
                  date,
                  style: theme.textTheme.labelLarge?.copyWith(
                    color: theme.colorScheme.onSecondary,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          Text(alert.event ?? ''),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (description != null)
            HookConsumer(
              key: ValueKey(description),
              builder: (context, _, child) {
                const maxLength = 128;
                final isNeedCrop = description.length > maxLength;
                final showFullDescriptionState = useState(!isNeedCrop);

                final showFullDescription = showFullDescriptionState.value;

                return InkWell(
                    splashFactory:
                        InkSparkle.constantTurbulenceSeedSplashFactory,
                    onTap: isNeedCrop
                        ? () => showFullDescriptionState.value =
                            !showFullDescription
                        : null,
                    child: isNeedCrop && !showFullDescription
                        ? Text('${description.substring(0, maxLength)}…')
                        : Text(description));
              },
            ),
          if (alert.senderName != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  alert.senderName!,
                  style: theme.textTheme.bodySmall?.copyWith(fontSize: 10),
                ),
              ],
            ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      tileColor: theme.colorScheme.secondary.withOpacity(.4),
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
          builder: (_, collapsed, expanded) => Expandable(
            collapsed: collapsed,
            expanded: expanded,
          ),
          // optimized! will be build only at the time of expansion
          expanded: _ExpandedWidget(daily),
        ),
      ),
    );
  }
}

class Expandable extends StatelessWidget {
  const Expandable({
    Key? key,
    required this.expanded,
    required this.collapsed,
  }) : super(key: key);

  final Widget collapsed;
  final Widget expanded;

  @override
  Widget build(BuildContext context) {
    final controller = ExpandableController.of(context);
    final theme = ExpandableThemeData.of(context);

    return ClipRect(
      child: AnimatedSize(
        duration: theme.animationDuration!,
        curve: theme.sizeCurve!,
        child: AnimatedSwitcher(
          duration: theme.animationDuration!,
          switchInCurve: Interval(
              theme.collapsedFadeStart, theme.collapsedFadeEnd,
              curve: theme.fadeCurve!),
          switchOutCurve: Interval(
              theme.expandedFadeStart, theme.expandedFadeEnd,
              curve: theme.fadeCurve!),
          layoutBuilder: (currentChild, previousChildren) => Stack(
            clipBehavior: Clip.none,
            alignment: theme.alignment!,
            children: <Widget>[
              ...previousChildren,
              if (currentChild != null) currentChild,
            ],
          ),
          child: controller!.expanded ? expanded : collapsed,
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
    final String _tempMin =
        MetricsHelper.getTemp(weather.tempMin, tempUnits, withUnits: false);
    final String _tempMax =
        MetricsHelper.getTemp(weather.tempMax, tempUnits, withUnits: false);

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
                child: WeatherImageIcon(weatherIcon: weather.weatherIcon),
              ),
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
class _ExpandedWidget extends ConsumerWidget with UiLoggy {
  const _ExpandedWidget(this.weather);

  final WeatherDaily weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    loggy.debug('build');

    final t = ref.watch(AppLocalization.currentTranslation);

    final Temp tempUnits = ref.watch(DailyPageController.tempUnits);

    String getTemp(double? value) => MetricsHelper.getTemp(
          value,
          tempUnits,
          withUnits: false,
        );

    final Pressure pressureUnits = ref.watch(WeatherServices.pressureUnits);
    final String? _pressure = MetricsHelper.getPressure(
      weather.pressure,
      pressureUnits,
      withUnits: false,
      precision: 0,
    );
    final String _pressureUnits = MetricsHelper.getPressureUnits(pressureUnits);

    return Column(
      children: [
        const Divider(height: 0.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _Title(t.weather.riseAndSetPl),
              _TitleContent(
                height: _minHeightRowTile * 3,
                left: [
                  _OneTile(t.weather.sunrise,
                      DateFormat.Hm().format(weather.sunrise!)),
                  _OneTile(t.weather.sunset,
                      DateFormat.Hm().format(weather.sunset!)),
                ],
                right: [
                  _OneTile(t.weather.moonrise,
                      DateFormat.Hm().format(weather.moonrise!)),
                  _OneTile(t.weather.moonset,
                      DateFormat.Hm().format(weather.moonset!)),
                  _OneTile(t.weather.moonPhase, weather.moonPhase.toString()),
                ],
              ),
              _hDivider,
              _Title(t.weather.temp),
              _TitleContent(
                height: _minHeightRowTile * 1,
                left: [
                  _OneTile(t.weather.minimum, getTemp(weather.tempMin),
                      tempUnits.abbr)
                ],
                right: [
                  _OneTile(t.weather.maximum, getTemp(weather.tempMax),
                      tempUnits.abbr)
                ],
              ),
              _hDivider,
              _TitleContent(
                height: _minHeightRowTile * 5,
                left: [
                  _OneTile(t.weather.real),
                  _OneTile(t.weather.atMorning, getTemp(weather.tempMorning),
                      tempUnits.abbr),
                  _OneTile(t.weather.atDay, getTemp(weather.tempDay),
                      tempUnits.abbr),
                  _OneTile(t.weather.atEvening, getTemp(weather.tempEvening),
                      tempUnits.abbr),
                  _OneTile(t.weather.atNight, getTemp(weather.tempNight),
                      tempUnits.abbr),
                ],
                right: [
                  _OneTile(t.weather.feels),
                  _OneTile(t.weather.atMorning,
                      getTemp(weather.tempFeelsLikeMorning), tempUnits.abbr),
                  _OneTile(t.weather.atDay, getTemp(weather.tempFeelsLikeDay),
                      tempUnits.abbr),
                  _OneTile(t.weather.atEvening,
                      getTemp(weather.tempFeelsLikeEvening), tempUnits.abbr),
                  _OneTile(t.weather.atNight,
                      getTemp(weather.tempFeelsLikeNight), tempUnits.abbr),
                ],
              ),
              _hDivider,
              _Title(t.weather.indicators),
              _TitleContent(
                height: _minHeightRowTile * 3,
                left: [
                  if (_pressure != null)
                    _OneTile(t.weather.pressure, _pressure, ' $_pressureUnits',
                        true),
                  _OneTile(t.weather.cloudiness,
                      weather.cloudiness.toStringMaybe(), '%'),
                  _OneTile(t.weather.uvi, weather.uvi.toStringMaybe()),
                ],
                right: [
                  _OneTile(t.weather.humidity, weather.humidity.toStringMaybe(),
                      '%'),
                  _OneTile(t.weather.dewPoint, getTemp(weather.dewPoint),
                      tempUnits.abbr),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _OneTile extends StatelessWidget {
  const _OneTile(
    this.title, [
    this.value,
    this.unit,
    this.isExpandedUnit = false,
  ]);

  final String title;
  final String? value;
  final String? unit;
  final bool isExpandedUnit;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final valueWithUnitWidget = Text.rich(
      textAlign: TextAlign.end,
      TextSpan(
        style: textTheme.labelLarge,
        children: <TextSpan>[
          TextSpan(text: value),
          TextSpan(
            text: unit,
            style: textTheme.labelMedium,
          ),
        ],
      ),
    );

    // todo: решить проблему с значением давления
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          fit: isExpandedUnit ? FlexFit.loose : FlexFit.tight,
          child: Text(
            title,
            style: textTheme.labelLarge,
          ),
        ),
        if (isExpandedUnit) ...[
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 4),
              child: valueWithUnitWidget,
            ),
          ),
        ] else
          valueWithUnitWidget
      ],
    );
  }
}

class _TitleContent extends StatelessWidget {
  const _TitleContent({
    super.key,
    required this.height,
    required this.left,
    required this.right,
  });

  final double height;
  final List<Widget> left;
  final List<Widget> right;

  @override
  Widget build(BuildContext context) => Row(
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
class _Title extends StatelessWidget {
  const _Title(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) => Align(
        alignment: Alignment.centerLeft,
        child: HeaderRWidget(
          title,
          padding: const EdgeInsets.all(4.0),
        ),
      );
}
