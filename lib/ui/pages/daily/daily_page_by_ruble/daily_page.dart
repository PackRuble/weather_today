// ignore_for_file: unused_element

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/application/const/app_icons.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/weather_provider_nr.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';
import 'package:weather_today/extension/double_extension.dart';
import 'package:weather_today/extension/string_extension.dart';
import 'package:weather_today/ui/shared/attribution_weather_widget.dart';
import 'package:weather_today/ui/shared/expandable_custom.dart';
import 'package:weather_today/ui/shared/shared_widget.dart';
import 'package:weather_today/utils/logger/all_observers.dart';

import '../../../utils/image_helper.dart';
import '../../../utils/metrics_helper.dart';
import '../daily_page_presenter.dart';

const Widget _divider = Divider(height: 0.0, thickness: 1.0);

/// 7-day weather page.
class DailyWeatherPageByRuble extends ConsumerWidget {
  const DailyWeatherPageByRuble(this.daily);

  final List<WeatherDaily> daily;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      separatorBuilder: (_, index) =>
          index + 1 == daily.length ? const SizedBox.shrink() : _divider,
      itemBuilder: (context, index) {
        final day = daily[index];

        return Column(
          children: <Widget>[
            if (index == 0) const _AlertsListWidget(),
            ExpPanel(
              hasIcon: false,
              header: TileDailyWidget(day),
              expanded: _ExpandedWidget(day),
            ),
            if (index + 1 == daily.length) const AttributionWeatherWidget(),
          ],
        );
      },
      itemCount: daily.length,
    );
  }
}

class _AlertsListWidget extends ConsumerWidget {
  const _AlertsListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(DailyPagePresenter.alerts).maybeWhen(
        skipLoadingOnReload: true,
        skipLoadingOnRefresh: false,
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
    final tileColor = theme.colorScheme.secondary.withOpacity(.4);

    final t = ref.watch(DailyPagePresenter.tr);

    final date = alert.start!.day == alert.end!.day
        ? t.global.time.dateFromToWithNbsp(
            date: DateFormat.MMMMd().format(alert.start!).replaceAll(' ', ' '),
            timeStart: DateFormat.H().format(alert.start!),
            timeEnd: DateFormat.H().format(alert.end!),
          )
        : t.global.time.fromToWithNbsp(
            timeStart:
                DateFormat.MMMMd().format(alert.start!).replaceAll(' ', ' '),
            timeEnd: DateFormat.MMMMd().format(alert.end!).replaceAll(' ', ' '),
          );

    final description = alert.description;

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
                  style: theme.textTheme.labelLarge,
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
      tileColor: tileColor,
    );
  }
}

class TileDailyWidget extends ConsumerWidget {
  const TileDailyWidget(this.weather);

  final WeatherDaily weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final styles = theme.textTheme;
    final t = ref.watch(AppLocalization.currentTranslation);

    final WeatherDaily(
      weatherConditionCode: weatherCode,
      weatherDescription: desc,
      weatherMain: brief,
    ) = weather;

    final _brief = MetricsHelper.weatherBriefTrByCode(
          weatherCode: weatherCode!,
          provider: ref.watch(WeatherProviderNR.i),
          tr: tr,
        ) ??
        brief;

    final _desc = MetricsHelper.weatherDescTrByCode(
          weatherCode: weatherCode,
          provider: ref.watch(WeatherProviderNR.i),
          tr: tr,
        ) ??
        desc;

    final tempUnits = ref.watch(DailyPagePresenter.tempUnits);
    final _tempUnits = MetricsHelper.getTempUnits(tempUnits);
    final _tempMin =
        MetricsHelper.getTemp(weather.tempMin, tempUnits, withUnits: false);
    final _tempMax =
        MetricsHelper.getTemp(weather.tempMax, tempUnits, withUnits: false);

    final _pop = MetricsHelper.withPrecision(MetricsHelper.getPercentage(
        weather.pop == 0.0 ? null : weather.pop, 1.0));

    final speedUnits = ref.watch(DailyPagePresenter.speedUnits);
    final _windSpeed = MetricsHelper.getSpeed(weather.windSpeed, speedUnits,
        withUnits: false, precision: 0);
    final _speedUnits = MetricsHelper.getSpeedUnits(speedUnits);

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
      subtitle: Text(_desc ?? _brief ?? ''),
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

const Widget _hDivider = Divider(height: 8.0, thickness: 1.0);
const Widget _vDivider = VerticalDivider(
  indent: 4.0,
  endIndent: 4.0,
  thickness: 1.0,
  width: 20.0,
);

/// Information in an expanding box. All weather characteristics are here.
class _ExpandedWidget extends ConsumerWidget with UiLoggy {
  const _ExpandedWidget(this.weather);

  final WeatherDaily weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    loggy.debug('build only Expanded');

    final WeatherDaily(
      :dewPoint,
      :rain,
      :sunset,
      :sunrise,
      :cloudiness,
      :humidity,
      :moonPhase,
      :moonset,
      :moonrise,
      :pressure,
      :uvi,
      :snow,
      :summary,
      :tempMorning,
      :tempMax,
      :tempMin,
      :tempDay,
      :tempEvening,
      :tempNight,
      :tempFeelsLikeMorning,
      :tempFeelsLikeDay,
      :tempFeelsLikeEvening,
      :tempFeelsLikeNight,
    ) = weather;

    final t = ref.watch(AppLocalization.currentTranslation);

    final tempUnits = ref.watch(DailyPagePresenter.tempUnits);

    String getTemp(double? value) => MetricsHelper.getTemp(
          value,
          tempUnits,
          withUnits: false,
        );

    final pressureUnits = ref.watch(WeatherServices.pressureUnits);
    final _pressure = MetricsHelper.getPressure(
      pressure,
      pressureUnits,
      withUnits: false,
      precision: 0,
    );
    final _pressureUnits = MetricsHelper.getPressureUnits(pressureUnits);

    return Column(
      children: [
        const Divider(height: 0.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _Title(t.weather.precipitation),
              if ((rain == 0.0 && snow == 0.0) ||
                  (rain == null && snow == null))
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(t.mainPageDRuble.hourlyPage.pop.noPopExpected),
                )
              else
                _TitleContent(
                  left: [
                    _OneTile(
                      t.weather.rain.toCapitalize,
                      rain.toStringMaybe(fixed: 1),
                      // единицы верные, проверял в OM
                      'mm',
                    ),
                  ],
                  right: [
                    if (snow != 0.0)
                      _OneTile(
                        t.weather.snow.toCapitalize,
                        snow.toStringMaybe(fixed: 1),
                        // единицы верные, проверял в OM
                        'cm',
                      ),
                  ],
                ),
              _hDivider,
              _Title(t.weather.riseAndSetPl),
              Builder(
                builder: (context) {
                  final left = [
                    if (sunrise != null)
                      _OneTile(
                        t.weather.sunrise,
                        DateFormat.Hm().format(sunrise),
                      ),
                  ];
                  final right = [
                    if (moonrise != null)
                      _OneTile(
                        t.weather.moonrise,
                        DateFormat.Hm().format(moonrise),
                      ),
                    if (moonset != null)
                      _OneTile(
                        t.weather.moonset,
                        DateFormat.Hm().format(moonset),
                      ),
                    if (moonPhase != null)
                      _OneTile(
                        t.weather.moonPhase,
                        moonPhase.toString(),
                      ),
                  ];

                  if (sunset != null) {
                    final sunsetTile = _OneTile(
                      t.weather.sunset,
                      DateFormat.Hm().format(sunset),
                    );

                    moonrise == null && moonPhase == null && moonPhase == null
                        ? right.add(sunsetTile)
                        : left.add(sunsetTile);
                  }

                  return _TitleContent(
                    left: left,
                    right: right,
                  );
                },
              ),
              _hDivider,
              _Title(t.weather.temp),
              _TitleContent(
                left: [
                  _OneTile(t.weather.minimum, getTemp(tempMin), tempUnits.abbr)
                ],
                right: [
                  _OneTile(t.weather.maximum, getTemp(tempMax), tempUnits.abbr)
                ],
              ),
              _hDivider,
              _TitleContent(
                left: [
                  if (tempMorning != null ||
                      tempDay != null ||
                      tempEvening != null ||
                      tempNight != null)
                    _OneTile(t.weather.real),
                  if (tempMorning != null)
                    _OneTile(t.weather.atMorning, getTemp(tempMorning),
                        tempUnits.abbr),
                  if (tempDay != null)
                    _OneTile(t.weather.atDay, getTemp(tempDay), tempUnits.abbr),
                  if (tempEvening != null)
                    _OneTile(t.weather.atEvening, getTemp(tempEvening),
                        tempUnits.abbr),
                  if (tempNight != null)
                    _OneTile(
                      t.weather.atNight,
                      getTemp(tempNight),
                      tempUnits.abbr,
                    ),
                ],
                right: [
                  if (tempFeelsLikeMorning != null ||
                      tempFeelsLikeDay != null ||
                      tempFeelsLikeEvening != null ||
                      tempFeelsLikeNight != null)
                    _OneTile(t.weather.feels),
                  if (tempFeelsLikeMorning != null)
                    _OneTile(
                      t.weather.atMorning,
                      getTemp(tempFeelsLikeMorning),
                      tempUnits.abbr,
                    ),
                  if (tempFeelsLikeDay != null)
                    _OneTile(
                      t.weather.atDay,
                      getTemp(tempFeelsLikeDay),
                      tempUnits.abbr,
                    ),
                  if (tempFeelsLikeEvening != null)
                    _OneTile(
                      t.weather.atEvening,
                      getTemp(tempFeelsLikeEvening),
                      tempUnits.abbr,
                    ),
                  if (tempFeelsLikeNight != null)
                    _OneTile(
                      t.weather.atNight,
                      getTemp(tempFeelsLikeNight),
                      tempUnits.abbr,
                    ),
                ],
              ),
              if (tempMorning != null ||
                  tempDay != null ||
                  tempEvening != null ||
                  tempNight != null ||
                  tempFeelsLikeMorning != null ||
                  tempFeelsLikeDay != null ||
                  tempFeelsLikeEvening != null ||
                  tempFeelsLikeNight != null)
                _hDivider,
              _Title(t.weather.indicators),
              _TitleContent(
                left: [
                  if (_pressure != null)
                    _OneTile(
                      t.weather.pressure,
                      _pressure,
                      ' $_pressureUnits',
                      true,
                    ),
                  if (cloudiness != null)
                    _OneTile(
                      t.weather.cloudiness,
                      cloudiness.toStringMaybe(),
                      '%',
                    ),
                  if (uvi != null) _OneTile(t.weather.uvi, uvi.toStringMaybe()),
                ],
                right: [
                  if (humidity != null)
                    _OneTile(t.weather.humidity, humidity.toStringMaybe(), '%'),
                  if (dewPoint != null)
                    _OneTile(
                      t.weather.dewPoint,
                      getTemp(dewPoint),
                      tempUnits.abbr,
                    ),
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
    required this.left,
    required this.right,
  });

  final List<Widget> left;
  final List<Widget> right;

  /// The height of one tile with a weather indicator.
  static const double _minHeightRowTile = 24.0;

  @override
  Widget build(BuildContext context) => left.isEmpty || right.isEmpty
      ? Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [...left, ...right],
              ),
            ),
            const SizedBox(width: 18.0),
            const Spacer(),
          ],
        )
      : Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: left,
              ),
            ),
            SizedBox(
              height: _minHeightRowTile * min(left.length, right.length),
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
