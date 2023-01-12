import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// All available information from package [package_info_plus]. Learn more here [PackageInfo].
enum AppInfoData {
  appName,
  packageName,
  appVersion,
  buildNumber,
  buildSignature,
  installerStore
}

/// Publicly available information about the application.
class AppInfo {
  AppInfo._();

  static const String appName = 'Weather Today';
  static const String appVersion = '<stable>';
  // static const String flutterVersion = 'Channel stable v3.3.0';
  static const String copyright = '© 2022 $author';
  static const String author = 'Ruble Pack';
  static const String mailAuthor = 'pack.ruble@gmail.com';
  static const String telegramGroup = 'https://t.me/+GFFZ8Lk1Bz5kMTEy';
  static const String license = '';
  static const String icon = 'assets/images/app_icon.png';

  /// название сервиса, который представляет погоду
  static const String weatherService = 'openweathermap.org';

  static const String attributionOpenWeather =
      'Weather data provided by OpenWeather';

  /// Get all available information from package [package_info_plus].
  static Future<String> get(AppInfoData infoData) async {
    final packageInfo = await PackageInfo.fromPlatform()
        .onError<MissingPluginException>((error, stackTrace) {
      return PackageInfo(
        appName: AppInfo.appName,
        packageName: '',
        version: AppInfo.appVersion,
        buildNumber: '',
      );
    });

    switch (infoData) {
      case AppInfoData.appName:
        // return packageInfo.appName;
        return AppInfo.appName;
      case AppInfoData.packageName:
        return packageInfo.packageName;
      case AppInfoData.appVersion:
        return packageInfo.version;
      case AppInfoData.buildNumber:
        return packageInfo.buildNumber;
      case AppInfoData.buildSignature:
        return packageInfo.buildSignature;
      case AppInfoData.installerStore:
        return packageInfo.installerStore ?? '';
    }
  }
}
