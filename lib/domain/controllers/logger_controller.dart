import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_today/domain/services/local_storage/key_store.dart';
import 'package:weather_today/utils/logger/all_observers.dart';
import 'package:weather_today/utils/logger/loggy_printer.dart';

/// Implementation
class AppLogsManager extends _AppLogsManager {
  static final instance = Provider<AppLogsManager>((_) => AppLogsManager());
}

/// Call async [init] before use.
class _AppLogsManager with GlobalLogger {
  _AppLogsManager();

  late final SharedPreferences _prefs;

  /// Maximum number of records stored.
  ///
  /// We must not forget that in this way of logging (via [SharedPreferences])
  /// all logs are stored in RAM.
  static const _maxCountRecords = 1000;

  void _initLogger(bool enableLogging) {
    // so we can get singleton
    Loggy('').clearListeners();

    Loggy.initLoggy(
      logPrinter: enableLogging || kDebugMode
          ? SmartPrinter(
              consolePrinter:
                  kDebugMode ? const ConsolePrinter(showColors: true) : null,
              userPrinter: UserPrinter(onNewLog: addLogRecord),
            )
          : StubPrinter(),
      logOptions: const LogOptions(
        LogLevel.all,
        stackTraceLevel: LogLevel.off,
      ),
      filters: kDebugMode
          ? [
              BlacklistFilter([DbLogger])
            ]
          : const [],
      hierarchicalLogging: false,
    );
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    _initLogger(isEnableLogging);
    l.info('Logger successfully activated');
  }

  bool get isEnableLogging =>
      _prefs.getBool(DbStore.enableLoggingApp) ??
      DbStore.enableLoggingAppDefault;

  Future<void> enableLogging() async {
    _initLogger(true);

    await _prefs.setBool(DbStore.enableLoggingApp, true);
    loggy.info('Enable logger.');
  }

  /// This action will disable logging and delete all existing logs.
  Future<void> disableLogging() async {
    _initLogger(false);

    await _prefs.setBool(DbStore.enableLoggingApp, false);
    await clearLogs();

    loggy.info('Disable logger. Clear all logs.');
  }

  /// Get all collected logs.
  List<String>? getLogs() => _prefs.getStringList(DbStore.logsApp);

  /// Add new log.
  void addLogRecord(Object? record) {
    if (record == null) return;

    if (!isEnableLogging) {
      return;
    }

    final oldRecords = getLogs() ?? [];

    // no need to wait
    unawaited(_prefs.setStringList(
      DbStore.logsApp,
      (oldRecords..insert(0, record.toString()))
          .take(_maxCountRecords)
          .toList(),
    ));
  }

  /// Clear all logs
  Future clearLogs() => _prefs.remove(DbStore.logsApp);
}
