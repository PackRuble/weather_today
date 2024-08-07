import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/application/const/app_icons.dart';
import 'package:weather_today/domain/controllers/weather_provider_nr.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';
import 'package:weather_today/extension/string_extension.dart';
import 'package:weather_today/ui/pages/current/current_page_presenter.dart';
import 'package:weather_today/ui/shared/attribution_weather_widget.dart';
import 'package:weather_today/ui/utils/image_helper.dart';

import '../../../shared/rowtile_table_widget.dart';
import '../../../shared/shared_widget.dart';
import '../../../utils/metrics_helper.dart';

const double _inset = 14.0;

/// Страница с CURRENT-погодой, дизайн ByRuble.
class CurrentWeatherPageByRuble extends ConsumerWidget {
  const CurrentWeatherPageByRuble(this.currently);

  final WeatherCurrent currently;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(CurrentPagePresenter.tr);

    final WeatherCurrent(:sunrise, :sunset) = currently;

    const divider = Divider(thickness: 1.0);

    return ListView(
      children: [
        const _DateWidget(),
        const _MainInfoWidget(),
        const _WeatherDescriptionTile(),
        const AttributionWeatherWidget(
          padding:
              EdgeInsets.only(left: 8.0, right: 8.0, top: 0.0, bottom: 4.0),
          withIcon: false,
        ),
        divider,
        _TitleWidget(t.mainPageDRuble.currentPage.headers.wind),
        _customPadding(child: const _WindWidget()),
        divider,
        if (sunrise != null || sunset != null) ...[
          _TitleWidget(t.mainPageDRuble.currentPage.headers.sun),
          _customPadding(child: const _SunriseInfoWidget()),
          divider,
        ],
        _TitleWidget(t.mainPageDRuble.currentPage.headers.clouds),
        _customPadding(child: const CloudinessWidget()),
        divider,
        _TitleWidget(t.mainPageDRuble.currentPage.headers.more),
        _customPadding(child: const _ExtendedInfoWidget()),
      ],
    );
  }

  Padding _customPadding({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.all(_inset),
      child: child,
    );
  }
}

class _TitleWidget extends ConsumerWidget {
  const _TitleWidget(
    this.title, {
    // ignore: unused_element
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return HeaderRWidget(
      title,
      padding: const EdgeInsets.only(left: _inset, top: _inset),
    );
  }
}

// todo edit time
class _DateWidget extends ConsumerWidget {
  const _DateWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme styles = Theme.of(context).textTheme;

    final t = ref.watch(CurrentPagePresenter.tr);

    final DateTime? _date = ref.watch(CurrentPagePresenter.current).value!.date;

    return Padding(
      padding: const EdgeInsets.only(top: 10.0, right: 15.0, left: 15.0),
      child: Text.rich(
        TextSpan(
          style: styles.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
          children: <TextSpan>[
            TextSpan(text: '${t.weather.currentAsOf} '),
            _date != null
                ? TextSpan(text: DateFormat('EEE, d MMMM, HH:mm').format(_date))
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
    final theme = Theme.of(context);
    final styles = theme.textTheme;

    final t = ref.watch(CurrentPagePresenter.tr);

    final weather = ref.watch(CurrentPagePresenter.current).requireValue!;
    final WeatherCurrent(
      weatherMain: brief,
      weatherConditionCode: weatherCode,
    ) = weather;

    final Temp tempUnits = ref.watch(CurrentPagePresenter.tempUnits);
    final _temp = MetricsHelper.getTemp(
      weather.temp,
      tempUnits,
      withUnits: false,
    );
    final _tempUnits = MetricsHelper.getTempUnits(tempUnits);
    final _tempFeelsLike = MetricsHelper.getTemp(
      weather.tempFeelsLike,
      tempUnits,
      withUnits: false,
    );

    final _brief = MetricsHelper.weatherBriefTrByCode(
          weatherCode: weatherCode!,
          provider: ref.watch(WeatherProviderNR.i),
          tr: t,
        ) ??
        brief ??
        r'¯\_(ツ)_/¯';

    final tempWidget = Text.rich(
      TextSpan(
        style: styles.bodyMedium?.copyWith(fontSize: 72.0),
        children: <TextSpan>[
          TextSpan(text: _temp),
          TextSpan(
            text: _tempUnits,
            style: styles.bodyMedium?.copyWith(fontSize: 60.0),
          ),
        ],
      ),
    );

    final tempFeelLikesWidget = Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        style: styles.bodyMedium,
        children: [
          TextSpan(text: t.weather.feelsLikeAs),
          TextSpan(
            text: ' $_tempFeelsLike$_tempUnits',
            style: styles.titleMedium,
          ),
        ],
      ),
    );

    const _height1block = 150.0;
    const _inset = 10.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(width: _inset),
        Flexible(
          child: Column(
            children: [
              SizedBox.square(
                dimension: _height1block,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: tempWidget,
                ),
              ),
              tempFeelLikesWidget,
            ],
          ),
        ),
        const SizedBox(width: _inset),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox.square(
                dimension: _height1block,
                child: FittedBox(
                  child: WeatherImageIcon(weatherIcon: weather.weatherIcon),
                ),
              ),
              Text(
                _brief,
                style: styles.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(width: _inset),
      ],
    );
  }
}

class _WeatherDescriptionTile extends ConsumerWidget {
  const _WeatherDescriptionTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = Theme.of(context).textTheme;
    final tr = ref.watch(CurrentPagePresenter.tr);

    final WeatherCurrent(
      weatherDescription: desc,
      weatherMain: brief,
      weatherConditionCode: weatherCode,
    ) = ref.watch(CurrentPagePresenter.current).requireValue!;

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

    if (_desc == null || _brief?.toLowerCase() == _desc.toLowerCase()) {
      return const SizedBox(height: 6);
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          _desc.toCapitalized(),
          textAlign: TextAlign.center,
          style: styles.bodyMedium,
        ),
      ),
    );
  }
}

class _SunriseInfoWidget extends ConsumerWidget {
  const _SunriseInfoWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(CurrentPagePresenter.tr);

    final wCur = ref.watch(CurrentPagePresenter.current).value!;

    final sunriseD = wCur.sunrise;
    final sunsetD = wCur.sunset;

    String sunrise = '${t.mainPageDRuble.currentPage.sunrise} – ';
    String sunset = '${t.mainPageDRuble.currentPage.sunset} – ';
    String dayLength = '${t.mainPageDRuble.currentPage.dayLength} – ';
    String timeBeforeSunset =
        '${t.mainPageDRuble.currentPage.timeBeforeSunset} – ';

    if (sunriseD != null && sunsetD != null) {
      final diff = sunsetD.difference(sunriseD);

      if (diff.inHours == 0) {
        dayLength += t.global.time.m(
          minute: diff.inMinutes - (diff.inHours * 60),
        );
      } else {
        dayLength += t.global.time.hm(
          hour: diff.inHours,
          minute: diff.inMinutes - (diff.inHours * 60),
        );
      }

      final diffSunset = sunsetD.difference(wCur.date ?? DateTime.now());

      if (diffSunset.isNegative) {
        timeBeforeSunset += t.weather.sunAlreadySet;
      } else {
        timeBeforeSunset += t.global.time.hm(
          hour: diffSunset.inHours,
          minute: diffSunset.inMinutes - (diffSunset.inHours * 60),
        );
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
            Expanded(child: Text(sunrise)),
            Expanded(child: Text(sunset)),
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
    final styles = Theme.of(context).textTheme;
    final t = ref.watch(CurrentPagePresenter.tr);

    final weather = ref.watch(CurrentPagePresenter.current).value!;

    final windDegreeAngle =
        MetricsHelper.fromRadiansToDegrees(weather.windDegree ?? 0);

    final speedUnits = ref.watch(CurrentPagePresenter.speedUnits);
    final _windSpeed = MetricsHelper.getSpeed(weather.windSpeed, speedUnits,
        withUnits: false, withFiller: true)!;
    final _speedUnits = MetricsHelper.getSpeedUnits(speedUnits);

    final _windSide =
        MetricsHelper.getSideOfTheWorldAdjective(weather.windDegree);

    final _windGust = (weather.windGust != null &&
            weather.windSpeed != null &&
            weather.windGust! > weather.windSpeed!)
        ? MetricsHelper.getSpeed(weather.windGust, speedUnits, withUnits: false)
        : null;

    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Flexible(
          flex: 1,
          child: Transform.rotate(
            filterQuality: FilterQuality.high,
            angle: windDegreeAngle,
            child: const FittedBox(
              fit: BoxFit.scaleDown,
              child: Icon(AppIcons.directWind, size: 70),
            ),
          ),
        ),
        const SizedBox(width: 8.0),
        Flexible(
          flex: 3,
          child: Column(
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
                      TextSpan(text: t.weather.gustUp),
                      TextSpan(text: ' $_windGust', style: styles.bodyLarge),
                      TextSpan(text: ' $_speedUnits'),
                    ],
                  ),
                )
            ],
          ),
        ),
      ],
    );
  }
}

class CloudinessWidget extends ConsumerWidget {
  const CloudinessWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double? cloudiness =
        ref.watch(CurrentPagePresenter.current).value!.cloudiness;

    if (cloudiness == null) return const SizedBox.shrink();

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(10, (int index) {
        return Flexible(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: cloudiness >= index * 10
                  ? const Icon(Icons.cloud, color: Colors.lightBlueAccent)
                  : const Icon(Icons.cloud_outlined,
                      color: Colors.lightBlueAccent),
            ),
          ),
        );
      }),
    );
  }
}

class _ExtendedInfoWidget extends ConsumerWidget {
  const _ExtendedInfoWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(CurrentPagePresenter.tr);

    final WeatherCurrent weather =
        ref.watch(CurrentPagePresenter.current).value!;

    final String? _pressure = MetricsHelper.getPressure(
        weather.pressure, ref.watch(WeatherServices.pressureUnits));

    final String? _humidity = MetricsHelper.withPrecision(weather.humidity);

    final String? _visibility = MetricsHelper.withPrecision(
        MetricsHelper.getPercentage(weather.visibility, 10000.0));

    return Column(
      children: [
        if (_humidity != null)
          RowItem(AppIcons.humidity, t.weather.humidity, '$_humidity %'),
        if (_pressure != null)
          RowItem(AppIcons.pressure, t.weather.pressure, _pressure),
        if (_visibility != null)
          RowItem(AppIcons.visibility, t.weather.visibility, '$_visibility %'),
      ],
    );
  }
}
