import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_today/const/app_colors.dart';

/// Виджет-плашка поставщика погоды.
class AttributionWeatherWidget extends StatelessWidget {
  const AttributionWeatherWidget({
    this.padding = const EdgeInsets.all(5.0),
    this.alignment = Alignment.centerRight,
  });

  final Alignment alignment;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final isLight = AppColors.of(context).isLight;

    const String nameService = 'Weather data provided by ';
    final Uri urlService = Uri.parse('https://openweathermap.org/');

    final textStyle =
        Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 10);

    return Align(
      alignment: alignment,
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(
              isLight
                  ? 'assets/images/attribution/owm/openweather_master_logo.png'
                  : 'assets/images/attribution/owm/openweather_negative_logo.png',
              width: 40,
            ),
            Flexible(
              child: Text.rich(
                textAlign: TextAlign.center,
                const TextSpan(text: nameService),
                style: textStyle,
              ),
            ),
            InkWell(
              onTap: () =>
                  launchUrl(urlService, mode: LaunchMode.externalApplication),
              child: Text(
                'OpenWeather',
                style: textStyle?.copyWith(
                    decoration: TextDecoration.underline, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
