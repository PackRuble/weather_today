import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/const/app_icons.dart';
import 'package:weather_today/const/app_info.dart';
import 'package:weather_today/core/controllers/weather_service_controllers.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/extension/string_extension.dart';
import 'package:weather_today/ui/feature/alerts_widget_feature/alerts_widget.dart';
import 'package:weather_today/ui/pages/current_page/current_page_controller.dart';
import 'package:weather_today/ui/utils/image_helper.dart';

import '../../../shared/rowtile_table_widget.dart';
import '../../../shared/shared_widget.dart';
import '../../../utils/metrics_helper.dart';

/// Страница с CURRENT-погодой, дизайн ByRuble.
class CurrentWeatherPageByRuble extends ConsumerWidget {
  const CurrentWeatherPageByRuble(this.currently);

  final WeatherCurrent currently;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(CurrentPageController.tr);

    return ListView(
      physics: ref.watch(AppTheme.scrollPhysics).scrollPhysics,
      children: [
        const _DateWidget(),
        const _MainInfoWidget(),
        const _MainDescriptionWidget(),
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Text(
            AppInfo.weatherService,
            textAlign: TextAlign.end,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const Divider(thickness: 1.0),
        _TitleWidget(t.mainPageDRuble.currentPage.headers.sun),
        _CustomPadding(child: const _SunriseInfoWidget()),
        const Divider(thickness: 1.0),
        _TitleWidget(t.mainPageDRuble.currentPage.headers.wind),
        _CustomPadding(child: const _WindWidget()),
        const Divider(thickness: 1.0),
        _TitleWidget(t.mainPageDRuble.currentPage.headers.clouds),
        _CustomPadding(child: const CloudinessWidget()),
        const Divider(thickness: 1.0),
        _TitleWidget(t.mainPageDRuble.currentPage.headers.more),
        _CustomPadding(child: const _ExtendedInfoWidget()),
        const Divider(thickness: 1.0),
        _TitleWidget(t.mainPageDRuble.currentPage.headers.alerts),
        _CustomPadding(child: const _AlertsWeatherWidget()),
        // const Divider(thickness: 3.0),
      ],
    );
  }

  Padding _CustomPadding({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: child,
    );
  }
}

class _TitleWidget extends ConsumerWidget {
  const _TitleWidget(
    this.title, {
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HeaderRWidget(
      title,
      // fontStyle: FontStyle.italic,
    );
  }
}

// todo edit time
class _DateWidget extends ConsumerWidget {
  const _DateWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme styles = Theme.of(context).textTheme;

    final t = ref.watch(CurrentPageController.tr);

    final DateTime? _date =
        ref.watch(CurrentPageController.current).value!.date;

    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),
      child: Text.rich(
        TextSpan(
          style: styles.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
          children: <TextSpan>[
            TextSpan(text: '${t.mainPageDRuble.currentPage.currentAsOf} '),
            _date != null
                ? TextSpan(text: DateFormat('EEE, d MMMM, HH:mm').format(_date))
                : const TextSpan(text: '–')
          ],
        ),
      ),
    );
  }
}

class _MainInfoWidget extends ConsumerWidget {
  const _MainInfoWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme styles = Theme.of(context).textTheme;

    final t = ref.watch(CurrentPageController.tr);

    final WeatherCurrent weather =
        ref.watch(CurrentPageController.current).value!;

    final Temp tempUnits = ref.watch(CurrentPageController.tempUnits);
    final String _temp = MetricsHelper.getTemp(weather.temp, tempUnits,
        withUnits: false, withFiller: true)!;
    final String _tempUnits = MetricsHelper.getTempUnits(tempUnits);
    final String _tempFeelsLike = MetricsHelper.getTemp(
        weather.tempFeelsLike, tempUnits,
        withUnits: false, withFiller: true)!;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 130.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 150.0,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text.rich(
                    TextSpan(
                      style: styles.bodyMedium?.copyWith(fontSize: 72.0),
                      children: <TextSpan>[
                        TextSpan(text: _temp),
                        TextSpan(
                            text: _tempUnits,
                            style: styles.bodyMedium?.copyWith(fontSize: 60.0)),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 150.0,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: ImageHelper.getWeatherIcon(weather.weatherIcon),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 150.0,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text.rich(
                  TextSpan(
                    style: styles.bodyMedium,
                    children: <TextSpan>[
                      TextSpan(text: t.mainPageDRuble.currentPage.feelsTemp),
                      TextSpan(
                          text: ' $_tempFeelsLike', style: styles.bodyLarge),
                      TextSpan(text: _tempUnits)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 150.0,
              child: Text(
                weather.weatherMain?.toCapitalized() ?? r'¯\_(ツ)_/¯',
                style: styles.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MainDescriptionWidget extends ConsumerWidget {
  const _MainDescriptionWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme styles = Theme.of(context).textTheme;

    final String? description =
        ref.watch(CurrentPageController.current).value!.weatherDescription;

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          description?.toCapitalized() ?? r'٩(｡•́‿•̀｡)۶',
          textAlign: TextAlign.center,
          style: styles.bodyMedium,
        ),
      ),
    );
  }
}

// todo edit time
class _SunriseInfoWidget extends ConsumerWidget {
  const _SunriseInfoWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(CurrentPageController.tr);

    final WeatherCurrent wCur = ref.watch(CurrentPageController.current).value!;

    final DateTime? sunriseD = wCur.sunrise;
    final DateTime? sunsetD = wCur.sunset;

    String sunrise = '${t.mainPageDRuble.currentPage.sunrise} - ';
    String sunset = '${t.mainPageDRuble.currentPage.sunset} - ';
    String dayLength = '${t.mainPageDRuble.currentPage.dayLength} - ';
    String timeBeforeSunset =
        '${t.mainPageDRuble.currentPage.timeBeforeSunset} - ';

    if (sunriseD != null && sunsetD != null) {
      final Duration diff = sunsetD.difference(sunriseD);

      if (diff.inHours == 0) {
        dayLength += t.mainPageDRuble.currentPage
            .timeToMinute(minute: diff.inMinutes - (diff.inHours * 60));
      } else {
        dayLength += t.mainPageDRuble.currentPage.timeToHourMinute(
            hour: diff.inHours, minute: diff.inMinutes - (diff.inHours * 60));
      }

      final Duration diffSunset =
          sunsetD.difference(wCur.date ?? DateTime.now());

      if (diffSunset.isNegative) {
        timeBeforeSunset += t.mainPageDRuble.currentPage.timeBeforeSunset;
      } else {
        timeBeforeSunset += t.mainPageDRuble.currentPage.timeToHourMinute(
            hour: diffSunset.inHours,
            minute: diffSunset.inMinutes - (diffSunset.inHours * 60));
      }
      sunrise += DateFormat.Hm().format(sunriseD);

      sunset += DateFormat.Hm().format(sunsetD);
    } else {
      sunrise += '–';
      sunset += '–';
      dayLength += '–';
      timeBeforeSunset += '–';
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(sunrise),
            ),
            Expanded(
              child: Text(sunset),
            ),
          ],
        ),
        const SizedBox(height: 10.0),
        Text(dayLength),
        const SizedBox(height: 10.0),
        Text(timeBeforeSunset),
      ],
    );
  }
}

class _WindWidget extends ConsumerWidget {
  const _WindWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(CurrentPageController.tr);

    final WeatherCurrent weather =
        ref.watch(CurrentPageController.current).value!;

    final double windDegreeAngle =
        MetricsHelper.fromRadiansToDegrees(weather.windDegree ?? 0);

    final Speed speedUnits = ref.watch(CurrentPageController.speedUnits);
    final String _windSpeed = MetricsHelper.getSpeed(
        weather.windSpeed, speedUnits,
        withUnits: false, withFiller: true)!;
    final String _speedUnits = MetricsHelper.getSpeedUnits(speedUnits);

    final String? _windSide =
        MetricsHelper.getSideOfTheWorldAdjective(weather.windDegree);

    String? _windGust = (weather.windGust != null &&
            weather.windSpeed != null &&
            weather.windGust! > weather.windSpeed!)
        ? MetricsHelper.getSpeed(weather.windGust, speedUnits, withUnits: false)
        : null;

    if (_windGust == _windSpeed) {
      _windGust = null;
    }

    final TextTheme styles = Theme.of(context).textTheme;

    return Row(
      children: [
        SizedBox(
          height: 70.0,
          width: 70.0,
          child: FittedBox(
            child: Transform.rotate(
              angle: windDegreeAngle,
              child: const Icon(AppIcons.directWind),
            ),
          ),
        ),
        const Spacer(flex: 1),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                style: styles.bodyMedium,
                children: <TextSpan>[
                  TextSpan(text: _windSpeed, style: styles.headlineSmall),
                  TextSpan(text: ' $_speedUnits'),
                  if (_windSide != null) ...[
                    const TextSpan(text: ', '),
                    TextSpan(text: _windSide, style: styles.bodyLarge),
                  ],
                ],
              ),
            ),
            if (_windGust != null)
              Text.rich(
                TextSpan(
                  style: styles.bodyMedium,
                  children: <TextSpan>[
                    TextSpan(text: t.mainPageDRuble.currentPage.windGust),
                    TextSpan(text: ' $_windGust', style: styles.bodyLarge),
                    TextSpan(text: ' $_speedUnits'),
                  ],
                ),
              )
          ],
        ),
        const Spacer(flex: 5),
      ],
    );
  }
}

class CloudinessWidget extends ConsumerWidget {
  const CloudinessWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double? cloudiness =
        ref.watch(CurrentPageController.current).value!.cloudiness;

    if (cloudiness == null) return const SizedBox.shrink();

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(10, (int index) {
        if (cloudiness >= index * 10) {
          return const Icon(Icons.cloud, color: Colors.lightBlueAccent);
        } else {
          return const Icon(Icons.cloud_outlined,
              color: Colors.lightBlueAccent);
        }
      }),
    );
  }
}

// class CloudinessWidget extends ConsumerWidget {
//   const CloudinessWidget();
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final double? cloudiness =
//         ref.watch(CurrentPageController.current).value!.cloudiness;
//
//     if (cloudiness == null) return const SizedBox.shrink();
//
//     return ListTile(
//       horizontalTitleGap: 0.0,
//       minVerticalPadding: 0.0,
//       onTap: () {},
//       leading: const Icon(Icons.cloud),
//       title: Text('$cloudiness % неба покрыто облаками'),
//     );
//   }
// }

class _ExtendedInfoWidget extends ConsumerWidget {
  const _ExtendedInfoWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(CurrentPageController.tr);

    final WeatherCurrent weather =
        ref.watch(CurrentPageController.current).value!;

    final String? _pressure = MetricsHelper.getPressure(
        weather.pressure, ref.watch(WeatherServices.pressureUnits));

    final String? _humidity = MetricsHelper.withPrecision(weather.humidity);

    final String? _visibility = MetricsHelper.withPrecision(
        MetricsHelper.getPercentage(weather.visibility, 10000.0));

    return Column(
      children: [
        if (_humidity != null)
          RowItem(AppIcons.humidity, t.weatherArg.humidity, '$_humidity %'),
        if (_pressure != null)
          RowItem(AppIcons.pressure, t.weatherArg.pressure, _pressure),
        if (_visibility != null)
          RowItem(
              AppIcons.visibility, t.weatherArg.visibility, '$_visibility %'),
      ],
    );
  }
}

class _AlertsWeatherWidget extends ConsumerWidget {
  const _AlertsWeatherWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        AlertsWidget(),
      ],
    );
  }
}
