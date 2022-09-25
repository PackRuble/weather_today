import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:weather_today/core/services/api/api_OWM.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/core/services/local_db_service/data_base_controller.dart';

import '../utils/logger/loggy_printer.dart';
import 'controllers/general_settings_controller.dart';
import 'controllers/localization_controller.dart';
import 'controllers/weather_service_controllers.dart';

class ServiceInit {
  ServiceInit(ProviderContainer container) {
    _container = container;
  }

  late final ProviderContainer _container;

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

  Future<void> _initAppTheme() async => _container.read(AppTheme.pr).init();

  Future<void> _initAppGeneralSettings() async =>
      _container.read(AppGeneralSettings.pr).init();

  Future<void> _initWeatherServices() async =>
      _container.read(WeatherServices.pr).init();

  Future<void> _initApiOWMService() async =>
      _container.read(ApiServiceOwm.pr).init();

  Future<void> _initLogger() async {
    logInfo('Активируем логгер');
    Loggy.initLoggy(
      logPrinter: const CustomPrinter(),
      logOptions: const LogOptions(
        LogLevel.all,
        stackTraceLevel: LogLevel.off,
      ),
      // filters: [
      //   BlacklistFilter([BlacklistedLoggy]),
      // ],
    );
  }

  /// Загрузка переменных окружения.
  Future<void> _initEnv() async {
    logInfo('Загрузка переменных окружения');
    await dotenv.load();
  }

  /// Загрузка переменных окружения.
  Future<void> _initLocalization() async {
    await _container.read(AppLocalization.pr).init();
  }
}
