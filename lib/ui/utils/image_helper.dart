import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:loggy/loggy.dart';

/// Менеджер получения всех изображений в приложении.
class ImageHelper {
  ImageHelper._();

  /// Получить иконку погоды по её коду.
  static Image getWeatherIcon(String weatherIcon) => Image.asset(
        'assets/weather_icons/$weatherIcon.png',
        package: 'open_weather_api',
        errorBuilder: (_, e, s) =>
            _errorBuilder(_, e, s, 'weatherIcon *$weatherIcon*'),
      );

  /// Получить изображение флага из пакета.
  ///
  /// Обычно, если флаг не предоставляется, параметр flag - пустая строка.
  /// Иначе, смотрим логи.
  static Image getFlagIcon(String flag) => Image.asset(
        'icons/flags/png/${flag.toLowerCase()}.png',
        package: 'country_icons',
        errorBuilder: (_, e, s) => _errorBuilder(
            _, e, s, flag.isNotEmpty ? 'Flag-code *$flag*' : null),
      );

  static Widget _errorBuilder(
      _, Object error, StackTrace? stackTrace, String? message) {
    if (message != null) logWarning(message, error);
    return Transform.scale(scale: 2.0, child: const Text('🗾'));
  }
}
