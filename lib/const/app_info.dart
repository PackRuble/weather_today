/// Общедоступная информация о приложении.
class AppInfo {
  AppInfo._();

  static const String appName = 'Weather Today';
  static const String version = '2.26.112+17';
  static const String flutterVersion = 'Channel stable v3.3.0';
  static const String copyright = '© 2022 $author';
  static const String author = 'Ruble Pack';
  static const String mailAuthor = 'pack.ruble@gmail.com';
  static const String license = 'BSD 3-Clause License';
  static const String icon = 'assets/images/app_icon.png';

  static const double maxBodyWidth = 1000;

  /// название сервиса, который представляет погоду
  static const String weatherService = 'openweathermap.org';

  static const String attributionOpenWeather =
      'Weather data provided by OpenWeather';
}
