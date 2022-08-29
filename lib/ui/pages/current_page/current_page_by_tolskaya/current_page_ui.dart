import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/const/app_info.dart';
import 'package:weather_today/core/controllers/weather_service_controllers.dart';
import 'package:weather_today/core/models/place/place_model.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/extension/string_extension.dart';
import 'package:weather_today/ui/utils/image_helper.dart';

import '../../../utils/correct_show_place.dart';
import '../current_page_controller.dart';

const double _indent = 5.0;

/// Страница с CURRENT-погодой на сейчас, дизайн ByTolskaya.
class CurrentWeatherPageByTolskaya extends ConsumerWidget {
  const CurrentWeatherPageByTolskaya(this.currently);

  final WeatherCurrent currently;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: ListView(
        physics: ref.watch(AppTheme.scrollPhysics).scrollPhysics,
        children: [
          _DateWidget(currently.date),
          _MainInfoWidget(
              weatherDescription: currently.weatherMain,
              weatherMain: currently.weatherDescription,
              weatherIcon: currently.weatherIcon,
              temp: currently.temp,
              tempFeelsLike: currently.tempFeelsLike),
          const SizedBox(height: _indent),
          // const _AlertsWidget(),
          const Divider(),
          _WindWidget(
            windSpeed: currently.windSpeed,
            windGust: currently.windGust,
            windDegree: currently.windDegree,
          ),
          const Divider(),
          _OtherInfoWidget(currently),
          const Divider(),
          _SunriseInfoWidget(
            sunrise: currently.sunrise,
            sunset: currently.sunset,
          ),

          Text(
            AppInfo.weatherService,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(fontStyle: FontStyle.italic),
          ),
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
    final TextTheme styles = Theme.of(context).textTheme;

    final Place place = ref.watch(WeatherServices.currentPlace);

    final String languageCode = Localizations.localeOf(context).languageCode;

    final String countryName =
        CorrectShowPlace.getLocalNameOrName(place, languageCode) ??
            'Ghost-town';

    final DateTime date = this.date ?? DateTime.now();

    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Text(
              DateFormat.Hm().format(date),
              style: styles.bodyMedium,
            )),
            Expanded(
                child: Center(
                    child: Text('сегодня', // todo tr
                        style: styles.titleMedium))),
            Expanded(
                child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      DateFormat.yMd().format(date),
                      style: styles.bodyMedium,
                    ))),
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
  const _MainInfoWidget(
      {required this.weatherMain,
      required this.weatherDescription,
      required this.weatherIcon,
      required this.temp,
      required this.tempFeelsLike});

  final String? weatherMain;
  final String? weatherDescription;
  final String? weatherIcon;
  final double? temp;
  final double? tempFeelsLike;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme styles = Theme.of(context).textTheme;

    final String weatherMain = this.weatherMain?.toCapitalized() ?? '';

    final String weatherDescription =
        this.weatherDescription?.toCapitalized() ?? '';

    final Temp tempUnits = ref.watch(CurrentPageController.tempUnits);

    final String temp = this.temp != null
        ? CorrectShowPlace.getTempWithSign(this.temp!, tempUnits) +
            tempUnits.abbr
        : '';

    final String tempFeelsLike = this.tempFeelsLike != null
        ? 'Ощущается как ${CorrectShowPlace.getTempWithSign(this.tempFeelsLike!, tempUnits)}${tempUnits.abbr}'
        : '';

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  weatherMain,
                  style: styles.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: SizedBox.square(
                  dimension: 75.0,
                  child: weatherIcon == null
                      ? const SizedBox.shrink()
                      : ImageHelper.getWeatherIcon(weatherIcon!),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  temp,
                  style: styles.bodyMedium,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: _indent),
        Text(
          weatherDescription,
          style: styles.bodyMedium,
        ),
        const SizedBox(height: _indent),
        Text(
          tempFeelsLike,
          style: styles.bodyMedium,
        ),
        const SizedBox(height: _indent),
      ],
    );
  }
}

// final json =
//     '[ { "sender_name": "", "event": "freezing rain, icing", "start": 1645005600, "end": 1645120800, "description": "", "tags": [ "extreme temperature value", "rain", "black ice" ] }, { "sender_name": "", "event": "гололедно - изморозевое отложение", "start": 1645005600, "end": 1645120800, "description": "местами гололед", "tags": [ "black ice" ] }, { "sender_name": "", "event": "fog", "start": 1645002000, "end": 1645034400, "description": "", "tags": [ "fog" ] }, { "sender_name": "", "event": "туман", "start": 1645002000, "end": 1645034400, "description": "местами туман", "tags": [ "fog" ] }, { "sender_name": "", "event": "wind", "start": 1645077600, "end": 1645164000, "description": "", "tags": [ "wind" ] }, { "sender_name": "", "event": "ветер", "start": 1645077600, "end": 1645164000, "description": "порывы ветра 15-20 м/с", "tags": [ "wind" ] }, { "sender_name": "", "event": "other dangers", "start": 1645034400, "end": 1645120800, "description": "", "tags": [] }, { "sender_name": "", "event": "прочие опасности", "start": 1645034400, "end": 1645120800, "description": "местами гололедица", "tags": [] } ]';

// class _AlertsWidget extends ConsumerWidget {
//   const _AlertsWidget();
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // final AsyncValue<List<WeatherAlert>> alerts =
//     //     ref.watch(AlertWidgetController.alerts);
//
//     final AsyncValue<List<WeatherAlert>> alerts =
//         AsyncValue.data((jsonDecode(json) as List).map((value) {
//       return WeatherAlert.fromJson(value as Map<String, dynamic>);
//     }).toList());
//
//     return alerts.maybeWhen(
//         orElse: () => const SizedBox.shrink(),
//         data: (List<WeatherAlert> alerts) {
//           if (alerts.isEmpty) {
//             return const SizedBox.shrink();
//           }
//
//           alerts =
//               ref.watch(AlertWidgetController.pr).handleAlertWeather(alerts);
//
//           return Column(
//             children: alerts.map((WeatherAlert alert) {
//               String date = alert.start!.day == alert.end!.day
//                   ? '${DateFormat('dd.MM').format(alert.start!)} с ${DateFormat.Hm().format(alert.start!)} по ${DateFormat.Hm().format(alert.end!)}'
//                   : 'с ${DateFormat('dd.MM').format(alert.start!)} по ${DateFormat('dd.MM').format(alert.end!)}';
//
//               return Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 2.0),
//                 child: ListTile(
//                   // contentPadding: EdgeInsets.zero,
//                   horizontalTitleGap: 0.0,
//                   minVerticalPadding: 0.0,
//                   tileColor: Colors.red.shade200,
//                   leading: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Icon(
//                         Icons.priority_high_rounded,
//                         color: Colors.black,
//                       ),
//                     ],
//                   ),
//                   title: Text(date),
//                   subtitle: Text(alert.description!),
//                 ),
//               );
//             }).toList(),
//           );
//         });
//   }
// }

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

    final String _speedUnits =
        ref.watch(CurrentPageController.speedUnits).abbrTr;

    final String? _windSide;
    if (windDegree != null) {
      _windSide = SideOfTheWorld.fromDegrees(windDegree!).nameAdjectiveTr;
    } else {
      _windSide = null;
    }

    final String? _windSpeed = (windSpeed != null)
        ? 'Ветер ${windSpeed!.toInt()} $_speedUnits${(_windSide != null) ? ', $_windSide' : ''}'
        : null;

    if (_windSpeed == null) return const SizedBox.shrink();

    final String? _windGust = (windGust != null)
        ? 'Порывы до ${windGust!.toInt()} $_speedUnits'
        : null;

    return Row(
      children: [
        const Icon(Icons.air_rounded),
        const SizedBox(width: _indent),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: _indent),
            Text(_windSpeed, style: styles.bodyMedium),
            if (_windGust != null) ...[
              const SizedBox(height: _indent),
              Text(_windGust, style: styles.bodyMedium),
            ]
          ],
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
          Text('$value $desc'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme styles = Theme.of(context).textTheme;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: buildTile(Icons.cloud_rounded,
                    '${currently.cloudiness ?? '-'}%', 'Облачность')),
            Expanded(
                child: buildTile(Icons.thermostat_rounded,
                    '${currently.pressure ?? '-'} мм.рт.ст.', '')),
          ],
        ),
        Row(
          children: [
            Expanded(
                child: buildTile(Icons.water_drop,
                    '${currently.humidity ?? '-'}%', 'Влажность')),
            Expanded(
                child: buildTile(
                    Icons.water,
                    '${(currently.visibility != null) ? currently.visibility! / 100 : ''}%',
                    'Видимость')),
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
    final TextTheme styles = Theme.of(context).textTheme;

    final String? sunrise =
        this.sunrise != null ? DateFormat.Hm().format(this.sunrise!) : null;

    final String? sunset =
        this.sunset != null ? DateFormat.Hm().format(this.sunset!) : null;

    if (sunrise == null || sunset == null) return const SizedBox.shrink();

    final Duration df = this.sunset!.difference(this.sunrise!);

    final String daylight =
        '${df.inHours} ч ${df.inMinutes - (df.inHours * 60)} мин';

    return Row(
      children: <Widget>[
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text('восход'),
                Text(sunrise),
                Icon(
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
                Text('световой'),
                Text('день'),
                Text(daylight)
              ],
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text('закат'),
                Text(sunset),
                Icon(
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
