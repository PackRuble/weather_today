import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:weather_today/core/services/api/api_OWM.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/core/services/local_db_service/data_base_controller.dart';
import 'package:weather_today/utils/logger/release_logger.dart';

import '../utils/logger/loggy_printer.dart';
import 'controllers/general_settings_controller.dart';
import 'controllers/localization_controller.dart';
import 'controllers/weather_service_controllers.dart';

/// Асинхронная инициализация всех сервисов приложения.
class ServiceInit {
  ServiceInit(ProviderContainer container) : _container = container;

  final ProviderContainer _container;

  /// Инициализация всех сервисов приложения.
  Future<void> init() async => _initServices();

  Future<void> _initServices() async {
    await _initLogger();
    await _initEnv();
    await _initDBService();
    await _initApiOWMService();
    await _initAppGeneralSettings();
    await _initAppTheme();
    await _initLocalization();
    await _initWeatherServices();
  }

  Future<void> _initDBService() async => _container.read(dbService).init();

  Future<void> _initAppTheme() async =>
      _container.read(AppTheme.instance).init();

  Future<void> _initAppGeneralSettings() async =>
      _container.read(AppGeneralSettings.instance).init();

  Future<void> _initWeatherServices() async =>
      _container.read(WeatherServices.instance).init();

  Future<void> _initApiOWMService() async =>
      _container.read(ApiServiceOwm.instance).init();

  Future<void> _initLogger() async {
    final _loggerManager = _container.read(loggerManager);
    await _loggerManager.init();

    logInfo('Активируем логгер');
    Loggy.initLoggy(
      logPrinter: SmartPrinter(
        consolePrinter: ConsolePrinter(showColors: true),
        userPrinter: UserPrinter(manager: _loggerManager),
      ),
      logOptions: const LogOptions(
        LogLevel.all,
        stackTraceLevel: LogLevel.off,
      ),
      // filters: [
      //   BlacklistFilter([BlacklistedLoggy]),
      // ],
    );
  }

  Future<void> _initEnv() async {
    logInfo('Загрузка переменных окружения');
    await dotenv.load();
  }

  Future<void> _initLocalization() async {
    await _container.read(AppLocalization.instance).init();
  }
}
