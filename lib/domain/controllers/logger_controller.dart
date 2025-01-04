import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_today/domain/services/cardoteka/settings_storage.dart';
import 'package:weather_today/utils/logger/all_observers.dart';
import 'package:weather_today/utils/logger/loggy_printer.dart';

class AppLogsManager extends AsyncNotifier<void> with NotifierLogger {
  static final i = AsyncNotifierProvider<AppLogsManager, void>(
    AppLogsManager.new,
    name: '$AppLogsManager',
  );

  /// Maximum number of records stored.
  ///
  /// We must not forget that in this way of logging (via [SharedPreferences])
  /// all logs are stored in RAM.
  static const _maxCountRecords = 500;

  static const _maxCountErrorRecords = 10;

  late SettingsStorage _storage;

  @override
  Future<void> build() async {
    _storage = ref.watch(SettingsStorage.instance);
    _initLogger(isEnableUserLogs);
    l.info('Logger successfully activated');
  }

  void _initLogger(bool enableLogging) {
    // so we can get singleton
    Loggy('').clearListeners();

    Loggy.initLoggy(
      logPrinter: enableLogging || kDebugMode
          ? SmartPrinter(
              consolePrinter:
                  kDebugMode ? const ConsolePrinter(showColors: true) : null,
              userPrinter: UserPrinter(onNewLog: addLogRecord),
              errorPrinter: ErrorPrinter(onErrorLog: addErrorLogRecord),
            )
          : ErrorPrinter(onErrorLog: addErrorLogRecord),
      logOptions: const LogOptions(
        LogLevel.all,
        stackTraceLevel: LogLevel.off,
      ),
      filters: kDebugMode
          ? [
              BlacklistFilter([DbLogger]),
            ]
          : const [],
      hierarchicalLogging: false,
    );
  }

  bool get isEnableUserLogs => _storage.get(SettingsCards.enableUserLogs);

  Future<void> enableLogging() async {
    _initLogger(true);

    await _storage.set(SettingsCards.enableUserLogs, true);
    loggy.info('Enable logger.');
  }

  /// This action will disable logging and delete all existing logs.
  Future<void> disableLogging() async {
    _initLogger(false);

    await _storage.set(SettingsCards.enableUserLogs, false);
    clearLogs();

    loggy.info('Disable logger. Clear all logs.');
  }

  /// Get all collected logs.
  List<String> getLogs() => _storage.get(SettingsCards.userLogs).toList();

  /// Get all error logs.
  List<String> getErrorLogs() => _storage.get(SettingsCards.errorLogs).toList();

  /// Add new log.
  void addLogRecord(Object? record) {
    if (record == null) return;
    if (!isEnableUserLogs) return;

    final oldRecords = getLogs();

    // no need to wait
    unawaited(
      _storage.set<List<String>>(
        SettingsCards.userLogs,
        oldRecords.take(_maxCountRecords - 1).toList()..insert(0, '$record'),
      ),
    );
  }

  /// Add new error log.
  void addErrorLogRecord(Object? record) {
    if (record == null) return;

    final oldErrorRecords = getErrorLogs();

    unawaited(
      _storage.set<List<String>>(
        SettingsCards.errorLogs,
        oldErrorRecords.take(_maxCountErrorRecords - 1).toList()
          ..insert(0, '$record'),
      ),
    );
  }

  /// Clear all logs
  void clearLogs() {
    _storage.remove(SettingsCards.errorLogs);
    _storage.remove(SettingsCards.userLogs);
  }
}
