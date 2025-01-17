import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/application/const/app_icons.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/weather_provider_nr.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';
import 'package:weather_today/extension/string_extension.dart';
import 'package:weather_today/ui/utils/image_helper.dart';

import '../../../shared/attribution_weather_widget.dart';
import '../../../utils/metrics_helper.dart';
import '../current_page_presenter.dart';

const double _indent = 5.0;

/// Страница с CURRENT-погодой на сейчас, дизайн ByTolskaya.
class CurrentWeatherPageByTolskaya extends ConsumerWidget {
  const CurrentWeatherPageByTolskaya(this.currently);

  final WeatherCurrent currently;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 6.0),
      child: ListView(
        children: [
          _DateWidget(currently.date),
          _MainInfoWidget(
            weatherBrief: currently.weatherMain,
            weatherCode: currently.weatherConditionCode!,
            weatherDesc: currently.weatherDescription,
            weatherIcon: currently.weatherIcon,
            temp: currently.temp,
            tempFeelsLike: currently.tempFeelsLike,
          ),
          const Divider(),
          _WindWidget(
            windSpeed: currently.windSpeed,
            windGust: currently.windGust,
            windDegree: currently.windDegree,
          ),
          const Divider(),
          _OtherInfoWidget(currently),
          if (currently.sunrise != null || currently.sunset != null) ...[
            const Divider(),
            _SunriseInfoWidget(
              sunrise: currently.sunrise,
              sunset: currently.sunset,
            ),
          ],
          const AttributionWeatherWidget(alignment: Alignment.center),
        ],
      ),
    );
  }
}

class _DateWidget extends ConsumerWidget {
  const _DateWidget(
    this.date,
  );
  final DateTime? date;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = Theme.of(context).textTheme;
    final t = ref.watch(AppLocalization.currentTranslation);

    final place = ref.watch(WeatherServices.currentPlace);

    final languageCode = Localizations.localeOf(context).languageCode;

    final countryName =
        MetricsHelper.getLocalNameOrName(place, languageCode) ?? 'Ghost-town';

    final date = this.date ?? DateTime.now();

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                DateFormat.Hm().format(date),
                style: styles.bodyMedium,
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  t.global.time.today.toLowerCase(),
                  style: styles.titleMedium,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  DateFormat.yMd().format(date),
                  style: styles.bodyMedium,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: _indent),
        Text(countryName, style: styles.bodyMedium),
        const SizedBox(height: _indent),
      ],
    );
  }
}

class _MainInfoWidget extends ConsumerWidget {
  const _MainInfoWidget({
    required this.weatherCode,
    required this.weatherBrief,
    required this.weatherDesc,
    required this.weatherIcon,
    required this.temp,
    required this.tempFeelsLike,
  });

  final int weatherCode;
  final String? weatherBrief;
  final String? weatherDesc;
  final String? weatherIcon;
  final double? temp;
  final double? tempFeelsLike;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final styles = Theme.of(context).textTheme;

    final t = ref.watch(CurrentPagePresenter.tr);

    final _brief = MetricsHelper.weatherBriefTrByCode(
          weatherCode: weatherCode,
          provider: ref.watch(WeatherProviderNR.i),
          tr: tr,
        ) ??
        weatherBrief ??
        '';

    final _weatherDesc = MetricsHelper.weatherDescTrByCode(
          weatherCode: weatherCode,
          provider: ref.watch(WeatherProviderNR.i),
          tr: tr,
        ) ??
        weatherDesc?.toCapitalized();

    final tempUnits = ref.watch(CurrentPagePresenter.tempUnits);
    final _temp = MetricsHelper.getTemp(
      temp,
      tempUnits,
      withUnits: false,
      withSign: true,
    );
    final _tempUnits = MetricsHelper.getTempUnits(tempUnits);
    final _tempFeelsLike = MetricsHelper.getTemp(
      tempFeelsLike,
      tempUnits,
      withUnits: false,
      withSign: true,
    );

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  _brief,
                  style: styles.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: SizedBox.square(
                  dimension: 75.0,
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: WeatherImageIcon(weatherIcon: weatherIcon),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: SizedBox(
                  width: 150.0,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text.rich(
                      TextSpan(
                        style: styles.bodyMedium?.copyWith(fontSize: 36.0),
                        children: <TextSpan>[
                          TextSpan(text: _temp),
                          TextSpan(
                            text: _tempUnits,
                            style: styles.bodyMedium?.copyWith(fontSize: 28.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: _indent),
        if (_weatherDesc != null) Text(_weatherDesc, style: styles.bodyMedium),
        const SizedBox(height: _indent),
        Text.rich(
          TextSpan(
            style: styles.bodyMedium,
            children: <TextSpan>[
              TextSpan(text: t.weather.feelsLikeAs),
              TextSpan(text: ' $_tempFeelsLike', style: styles.bodyLarge),
              TextSpan(text: _tempUnits),
            ],
          ),
        ),
        const SizedBox(height: _indent),
      ],
    );
  }
}

class _WindWidget extends ConsumerWidget {
  const _WindWidget({
    required this.windSpeed,
    required this.windGust,
    required this.windDegree,
  });
  final double? windSpeed;
  final double? windGust;
  final double? windDegree;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme styles = Theme.of(context).textTheme;

    final t = ref.watch(CurrentPagePresenter.tr);

    if (windSpeed == null) return const SizedBox.shrink();

    final Speed speedUnits = ref.watch(CurrentPagePresenter.speedUnits);
    String? _windSpeed = MetricsHelper.getSpeed(windSpeed, speedUnits);
    _windSpeed = '${t.weather.wind} $_windSpeed';

    final String? _windSide =
        MetricsHelper.getSideOfTheWorldAdjective(windDegree);
    if (_windSide != null) {
      _windSpeed += ', $_windSide';
    }

    final String? _windGust = (windGust != null &&
            windSpeed != null &&
            windGust! > windSpeed!)
        ? '${t.weather.gustUp} ${MetricsHelper.getSpeed(windGust, speedUnits)}'
        : null;

    return Row(
      children: [
        const SizedBox(width: _indent),
        const Icon(AppIcons.wind),
        const SizedBox(width: _indent),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: _indent),
              Text(_windSpeed, style: styles.bodyMedium),
              if (_windGust != null) ...[
                const SizedBox(height: _indent),
                Text(_windGust, style: styles.bodyMedium),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _OtherInfoWidget extends ConsumerWidget {
  const _OtherInfoWidget(this.currently);

  final WeatherCurrent currently;

  Widget buildTile(IconData icon, String value, String desc) {
    return Padding(
      padding: const EdgeInsets.only(top: _indent),
      child: Row(
        children: [
          const SizedBox(width: _indent),
          Icon(icon),
          const SizedBox(width: _indent),
          Flexible(child: Text('$value $desc')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    final TextTheme styles = Theme.of(context).textTheme;

    final t = ref.watch(CurrentPagePresenter.tr);

    final Pressure pressureUnits = ref.watch(WeatherServices.pressureUnits);
    final String _pressure = MetricsHelper.getPressure(
      currently.pressure,
      pressureUnits,
      withFiller: true,
    )!;

    final String _humidity =
        MetricsHelper.withPrecision(currently.humidity, withFiller: true)!;

    final String _visibility = MetricsHelper.withPrecision(
      MetricsHelper.getPercentage(currently.visibility, 10000.0),
      withFiller: true,
    )!;

    final String _cloudiness =
        MetricsHelper.withPrecision(100.0, withFiller: true)!;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: buildTile(
                Icons.cloud_rounded,
                '$_cloudiness%',
                t.weather.cloudiness,
              ),
            ),
            Expanded(child: buildTile(AppIcons.pressure, _pressure, '')),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: buildTile(
                Icons.water_drop,
                '$_humidity%',
                t.weather.humidity,
              ),
            ),
            Expanded(
              child: buildTile(
                Icons.water,
                '$_visibility%',
                t.weather.visibility,
              ),
            ),
          ],
        ),
        const SizedBox(height: _indent),
      ],
    );
  }
}

class _SunriseInfoWidget extends ConsumerWidget {
  const _SunriseInfoWidget({
    required this.sunrise,
    required this.sunset,
  });

  final DateTime? sunrise;
  final DateTime? sunset;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    final styles = Theme.of(context).textTheme;

    final t = ref.watch(CurrentPagePresenter.tr);

    String _sunrise = '–';
    String _sunset = '–';
    String _dayLength = '–';

    if (sunrise != null && sunset != null) {
      final diff = sunset!.difference(sunrise!);

      if (diff.inHours == 0) {
        _dayLength = t.global.time.m(
          minute: diff.inMinutes - (diff.inHours * 60),
        );
      } else {
        _dayLength = t.global.time.hm(
          hour: diff.inHours,
          minute: diff.inMinutes - (diff.inHours * 60),
        );
      }

      _sunrise = DateFormat.Hm().format(sunrise!);

      _sunset = DateFormat.Hm().format(sunset!);
    }

    return Row(
      children: <Widget>[
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text(t.weather.rise),
                Text(_sunrise),
                const Icon(
                  Icons.wb_twilight_rounded,
                  color: Colors.yellow,
                  size: 50.0,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Column(
              children: <Widget>[
                Text(
                  t.weather.daylightHoursNl,
                  textAlign: TextAlign.center,
                ),
                Text(_dayLength),
              ],
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text(t.weather.set),
                Text(_sunset),
                const Icon(
                  Icons.wb_twilight_rounded,
                  color: Colors.orange,
                  size: 50.0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
