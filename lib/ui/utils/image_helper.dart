import 'package:flutter/material.dart';
import 'package:loggy/loggy.dart';
import 'package:weather_pack/weather_pack.dart';

/// Менеджер получения всех изображений в приложении.
///
/// Удобен тем, что имеет обработку ошибок.
class ImageHelper {
  ImageHelper._();

  /// Получить иконку погоды по её коду.
  ///
  /// [onError] - если произошла ошибка загрузки.
  static Widget getWeatherIcon(String? weatherIcon, [String onError = '🌈']) =>
      Image.asset(
        'assets/weather_icons/@4/$weatherIcon.png',
        // ImagePathWeather.getPathWeatherIcon('weatherIcon' ?? ''),
        package: ImagePathWeather.packageName,
        filterQuality: FilterQuality.high,
        errorBuilder: (_, e, s) {
          // bug: await fix https://github.com/flutter/flutter/issues/107416
          logWarning('*$weatherIcon* not found assets weatherIcon');

          return Text(onError);
        },
      );

  /// Получить изображение флага из пакета.
  ///
  /// [onError] - если произошла ошибка загрузки.
  static Widget getFlagIcon(String? flag, [String onError = '🗾']) =>
      Image.asset(
        'icons/flags/png/${flag?.toLowerCase()}.png',
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
  static String root = 'assets/images';
  static String icons = 'assets/icons';

  static String iconAbout = '$icons/icon.png';
}
