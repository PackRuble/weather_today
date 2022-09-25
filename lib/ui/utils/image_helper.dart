import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:loggy/loggy.dart';

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
        'assets/weather_icons/$weatherIcon.png',
        package: 'open_weather_api',
        filterQuality: FilterQuality.high,
        errorBuilder: (_, e, s) {
          logWarning('*$weatherIcon* not found assets weatherIcon');
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(onError),
          );
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
