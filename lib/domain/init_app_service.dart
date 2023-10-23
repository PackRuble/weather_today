import 'package:cardoteka/cardoteka.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/application/const/app_info.dart';
import 'package:weather_today/domain/controllers/app_theme/controller/app_theme_controller.dart';
import 'package:weather_today/domain/controllers/logger_controller.dart';
import 'package:weather_today/domain/controllers/owm_controller.dart';
import 'package:weather_today/domain/services/local_storage/data_base_controller.dart';

import 'controllers/general_settings_controller.dart';
import 'controllers/localization_controller.dart';
import 'controllers/weather_service_controllers.dart';
import 'services/cardoteka/settings_storage.dart';
import 'services/migration_tool/sp_to_cardoteka.dart';

/// Асинхронная инициализация всех сервисов приложения.
class ServiceInit {
  ServiceInit(ProviderContainer container) : _container = container;

  final ProviderContainer _container;

  /// Инициализация всех сервисов приложения.
  Future<void> init() async => _initServices();

  Future<void> _initServices() async {
    await _initLogger();
    // local storage
    await _initDBService();
    await _initCardoteka();
    await _initMigrationTool();
    // ---
    await _initApiOWMService();
    await _initAppGeneralSettings();
    await _initAppTheme();
    await _initLocalization();
    await _initWeatherServices();
  }

  Future<void> _initDBService() async => _container.read(dbService).init();

  Future<void> _initCardoteka() async => Cardoteka.init();

  Future<void> _initMigrationTool() async {
    await MigrationTool(
      localStorageOld: _container.read(dbService),
      settingsStorageNew: _container.read(SettingsStorage.instance),
      buildNumber: await AppInfo.buildNumber,
    ).migrate();
  }

  Future<void> _initAppTheme() async =>
      _container.read(AppTheme.instance).init();

  Future<void> _initAppGeneralSettings() async =>
      _container.read(AppGeneralSettings.instance).init();

  Future<void> _initWeatherServices() async =>
      _container.read(WeatherServices.instance).init();

  Future<void> _initApiOWMService() async =>
      _container.read(OWMController.instance).init();

  Future<void> _initLogger() async {
    final _loggerManager = _container.read(AppLogsManager.instance);
    await _loggerManager.init();
  }

  Future<void> _initLocalization() async {
    await _container.read(AppLocalization.instance).init();
  }
}
