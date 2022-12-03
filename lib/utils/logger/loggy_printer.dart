import 'package:flutter/foundation.dart';
import 'package:loggy/loggy.dart';
import 'package:weather_today/core/services/local_db_service/interface/i_data_base.dart';
import 'package:weather_today/utils/logger/release_logger.dart';

class SmartPrinter extends LoggyPrinter {
  SmartPrinter({
    required this.consolePrinter,
    required this.userPrinter,
  });

  final ConsolePrinter consolePrinter;
  final UserPrinter userPrinter;

  @override
  void onLog(LogRecord record) {
    if (kDebugMode || kProfileMode) {
      consolePrinter.onLog(record);
    }

    userPrinter.onLog(record);
  }
}

class UserPrinter extends LoggyPrinter {
  UserPrinter({required this.manager});

  AppLogsManager manager;

  @override
  void onLog(LogRecord record) {
    final result = StringBuffer();

    result.write('${record.time}: ');
    result.write(record.toString());

    if (record.error != null) {
      result.write('\n${record.error}');
    }

    if (record.stackTrace != null) {
      result.write('\n${record.stackTrace}');
    }

    manager.addLogRecord(result.toString());
  }
}

/// Format log and add emoji to represent the color.
///
/// [showColors] - default:false
/// This uses ANSI escape characters and it will be visible only in terminal.
/// IDE-s mostly don't support them and you will only end up with log that has
/// weird prefix and suffix.
///
/// Format:
/// *EMOJI* *TIME* *LOG PRIORITY*  *LOGGER NAME* - *CLASS NAME* - *LOG MESSAGE*
class ConsolePrinter extends LoggyPrinter {
  ConsolePrinter({
    this.showColors,
    this.db,
  }) : super();

  IDataBase? db;

  final bool? showColors;

  bool get _colorize => showColors ?? false;

  static final _levelColors = {
    LogLevel.debug:
        AnsiColor(foregroundColor: AnsiColor.grey(0.5), italic: true),
    LogLevel.info: AnsiColor(foregroundColor: 35),
    LogLevel.warning: AnsiColor(foregroundColor: 214),
    LogLevel.error: AnsiColor(foregroundColor: 196),
  };

  static final _levelPrefixes = {
    LogLevel.debug: '🐛 ',
    LogLevel.info: '👻 ',
    LogLevel.warning: '⚠️',
    LogLevel.error: '‼️',
  };

  static const _defaultPrefix = '🤔 ';

  @override
  void onLog(LogRecord record) {
    final _time = record.time.toIso8601String().split('T')[1];
    final _callerFrame =
        record.callerFrame == null ? '-' : '(${record.callerFrame?.location})';
    final _logLevel = record.level
        .toString()
        .replaceAll('Level.', '')
        .toUpperCase()
        .padRight(8);

    final _color =
        _colorize ? levelColor(record.level) ?? AnsiColor() : AnsiColor();
    final _prefix = levelPrefix(record.level) ?? _defaultPrefix;

    print(_color(
        '$_prefix$_time $_logLevel ${record.loggerName} $_callerFrame ${record.message}'));

    if (record.error != null) {
      print(record.error);
    }

    if (record.stackTrace != null) {
      print(record.stackTrace);
    }
  }

  String? levelPrefix(LogLevel level) {
    return _levelPrefixes[level];
  }

  AnsiColor? levelColor(LogLevel level) {
    return _levelColors[level];
  }
}
