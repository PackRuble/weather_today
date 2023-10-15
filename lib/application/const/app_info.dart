import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:weather_today/ui/utils/image_helper.dart';

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
  const AppInfo._();

  static const String appName = 'Weather Today';
  static const String appVersion =
      '<stable>'; // there's no other way to get the version
  static const String copyright = '© 2022-2023 $author';
  static const String author = 'Ruble Pack';
  static const String mailAuthor = 'pack.ruble@gmail.com';
  static const String telegramGroup = 'https://t.me/+GFFZ8Lk1Bz5kMTEy';

  static Future<String> get iconAppPath async =>
      await isDevApp ? ImagePaths.iconAppDev : ImagePaths.iconApp;

  static Future<bool> get isDevApp async {
    final version = await get(AppInfoData.appVersion);
    // пока что pre-версия это и есть dev-версия
    return version.contains('pre') || version.contains('dev');
  }

  /// the name of the service that presents the weather
  static const String weatherService = 'openweathermap.org';

  static const String attributionOpenWeather =
      'Weather data provided by OpenWeather';

  static Future<int> get buildNumber async =>
      int.parse(await get(AppInfoData.buildNumber));

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
        // because 'packageInfo.appName' returned 'weather_today';
        return AppInfo.appName + (await isDevApp ? ' [Dev]' : '');
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
