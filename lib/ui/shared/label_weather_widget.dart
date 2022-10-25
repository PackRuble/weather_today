import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Виджет-плашка поставщика погоды.
class LabelWeatherWidget extends StatelessWidget {
  const LabelWeatherWidget({
    this.padding = const EdgeInsets.all(5.0),
    this.alignment = Alignment.centerRight,
  });

  final Alignment alignment;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    const String nameService = 'Weather data provided by ';
    final Uri urlService = Uri.parse('https://openweathermap.org/');

    final textStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: padding,
      // child: SizedBox(
      //   height: 30.0,
      child: Align(
        alignment: alignment,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Text.rich(const TextSpan(text: nameService), style: textStyle),
                InkWell(
                  onTap: () => launchUrl(urlService,
                      mode: LaunchMode.externalApplication),
                  child: Text(
                    'OpenWeather',
                    style: textStyle?.copyWith(
                        decoration: TextDecoration.underline,
                        color: Colors.blue),
                  ),
                ),
              ],
            ),
            // Image.asset(
            //     'assets/images/attribution/owm/openweather_master_logo.png'),
          ],
        ),
      ),
      // ),
    );
  }
}
