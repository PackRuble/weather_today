import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_today/const/key_store.dart';

final loggerManager = Provider<AppLogsManager>((ref) => AppLogsManager());

/// Call async [init] before use.
class AppLogsManager {
  AppLogsManager();

  late final SharedPreferences _prefs;

  /// Максимальное количество хранимых записей.
  static const _maxCountRecords = 1000;

  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  bool get isEnableLogging =>
      _prefs.getBool(DbStore.enableLoggingApp) ??
      DbStore.enableLoggingAppDefault;

  void enableLogging() => _prefs.setBool(DbStore.enableLoggingApp, true);

  /// Это действие также очистит логи.
  void disableLogging() {
    _prefs.setBool(DbStore.enableLoggingApp, false);
    clearLogs();
  }

  /// Получить все собранные логи.
  List<String>? getLogs() => _prefs.getStringList(DbStore.logsApp);

  /// Добавить новый лог.
  void addLogRecord(String record) {
    if (!isEnableLogging) {
      return;
    }

    final oldRecords = getLogs() ?? [];

    // нет нужды ожидать
    _prefs.setStringList(
      DbStore.logsApp,
      (oldRecords..insert(0, record)).take(_maxCountRecords).toList(),
    );
  }

  /// Очистить все логи
  Future clearLogs() => _prefs.remove(DbStore.logsApp);
}
