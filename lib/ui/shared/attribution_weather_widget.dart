import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_today/application/const/app_colors.dart';
import 'package:weather_today/domain/controllers/weather_provider_nr.dart';
import 'package:weather_today/domain/weather/models.dart';

extension on WeatherProvider {
  Uri get website => switch (this) {
        WeatherProvider.openWeatherMap =>
          Uri.parse('https://openweathermap.org/'),
        WeatherProvider.openMeteo => Uri.parse('https://open-meteo.com/'),
      };

  String logoAsset([bool forDark = false]) => switch (this) {
        WeatherProvider.openWeatherMap =>
          'assets/images/attribution/owm/openweather_${forDark ? 'negative' : 'master'}_logo.png',
        WeatherProvider.openMeteo =>
          'assets/images/attribution/open-meteo/openmeteo_logo.png',
      };

  String get nameService => switch (this) {
        WeatherProvider.openWeatherMap => 'OpenWeather',
        WeatherProvider.openMeteo => 'Open-Meteo',
      };
}

/// Weather provider attribution widget.
class AttributionWeatherWidget extends ConsumerWidget {
  const AttributionWeatherWidget({
    this.padding = const EdgeInsets.all(5.0),
    this.alignment = Alignment.centerRight,
  });

  final Alignment alignment;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle =
        Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10);

    final isLight = AppColors.of(context).isLight;

    final weatherProvider = ref.watch(WeatherProviderNR.i);
    return Align(
      alignment: alignment,
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              child: Text.rich(
                textAlign: TextAlign.center,
                const TextSpan(text: 'Weather data provided by '),
                style: textStyle,
              ),
            ),
            Image.asset(
              weatherProvider.logoAsset(!isLight),
              height: 20,
            ),
            const SizedBox(width: 4),
            InkWell(
              onTap: () async {
                final url = weatherProvider.website;

                await launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                );
              },
              child: Text(
                weatherProvider.nameService,
                style: textStyle?.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.blue,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
