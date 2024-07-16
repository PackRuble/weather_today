import 'dart:ui' show ImageFilter;

import 'package:flutter/material.dart';
import 'package:weather_today/utils/logger/all_observers.dart';

/// Менеджер получения всех изображений в приложении.
///
/// Удобен тем, что имеет обработку ошибок.
class ImageHelper {
  ImageHelper._();

  /// Получить изображение флага из пакета.
  ///
  /// [onError] - если произошла ошибка загрузки.
  static Widget getFlagIcon(String? flag, [String onError = '🗾']) =>
      Image.asset(
        'icons/flags/png1000px/${flag?.toLowerCase()}.png',
        package: 'country_icons',
        filterQuality: FilterQuality.medium,
        errorBuilder: (_, e, s) {
          logWarning('*$flag* not found assets flag');
          return Padding(
            padding: const EdgeInsets.all(2.0),
            child: Transform.scale(scale: 2.0, child: Text(onError)),
          );
        },
      );
}

class ImagePaths {
  const ImagePaths._();

  static String root = 'assets/images';
  static String icons = 'assets/icons';

  static String iconApp = '$icons/icon.png';
  static String iconAppDev = '$icons/icon_dev.png';
}

/// Получить иконку погоды по её коду.
class WeatherImageIcon extends StatelessWidget {
  const WeatherImageIcon({
    super.key,
    required this.weatherIcon,
  });

  final String? weatherIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Widget getImage(bool isBackground) => Image.asset(
          'assets/weather_icons/$weatherIcon.png',
          // ImagePathWeather.getPathWeatherIcon('weatherIcon' ?? ''),
          // package: ImagePathWeather.packageName,
          color: isBackground ? theme.primaryColorDark : null,
          filterQuality: FilterQuality.high,
          errorBuilder: (_, e, s) {
            // bug: await fix https://github.com/flutter/flutter/issues/107416
            logWarning('$e: *$weatherIcon* not found assets weatherIcon');

            // coldfix: осталась полоска сверху на главной странице
            return Transform.scale(
              filterQuality: FilterQuality.low,
              scale: 0.5,
              child: Image.asset(
                filterQuality: FilterQuality.high,
                'assets/images/rainbow.png',
              ),
            );
          },
        );

    return Stack(
      children: [
        Opacity(
          opacity: 0.6,
          child: Transform.scale(
            filterQuality: FilterQuality.low,
            origin: const Offset(-48, -48),
            scale: 1.1,
            child: getImage(true),
          ),
        ),
        ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
            child: getImage(false),
          ),
        ),
      ],
    );
  }
}
