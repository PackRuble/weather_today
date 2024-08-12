import 'package:flutter/foundation.dart';
import 'package:loggy/loggy.dart';
import 'package:weather_today/application/const/app_utils.dart';

// ignore_for_file: avoid_print

/// A printer that doesn't do anything
class StubPrinter extends LoggyPrinter {
  @override
  void onLog(_) {}
}

class SmartPrinter extends LoggyPrinter {
  const SmartPrinter({
    required this.consolePrinter,
    required this.userPrinter,
  });

  /// Designed to output messages to the console.
  ///
  /// For detailed information, see [ConsolePrinter.onLog].
  final ConsolePrinter? consolePrinter;

  /// Designed to save messages for the user.
  ///
  /// For detailed information, see [UserPrinter.onLog].
  final UserPrinter? userPrinter;

  @override
  void onLog(LogRecord record) {
    consolePrinter?.onLog(record);
    userPrinter?.onLog(record);
  }
}

class UserPrinter extends LoggyPrinter {
  const UserPrinter({required this.onNewLog});

  final void Function(Object? record) onNewLog;

  /// (!) Skips all entries at level [LogLevel.debug].
  @override
  void onLog(LogRecord record) {
    if (record.level == LogLevel.debug) return;

    final buffer = StringBuffer();

    buffer.write('${record.time}: ');
    buffer.write(record.toString());

    if (record.error != null) buffer.write('\n${record.error}');
    if (record.stackTrace != null) buffer.write('\n${record.stackTrace}');

    onNewLog.call(kDebugMode ? buffer : AppUtils.clearSecrets(buffer));
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
  const ConsolePrinter({
    this.showColors = false,
  }) : super();

  final bool showColors;

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
        showColors ? levelColor(record.level) ?? AnsiColor() : AnsiColor();
    final _prefix = levelPrefix(record.level) ?? _defaultPrefix;

    final buffer = StringBuffer();
    buffer.write(
      _color.call(
        '$_prefix$_time '
        '$_logLevel '
        '${record.loggerName} '
        '$_callerFrame '
        '${record.message}',
      ),
    );

    if (record.error != null) buffer.write('\n${record.error}');
    if (record.stackTrace != null) buffer.write('\n${record.stackTrace}');

    print(kDebugMode ? buffer : AppUtils.clearSecrets(buffer));
  }

  String? levelPrefix(LogLevel level) {
    return _levelPrefixes[level];
  }

  AnsiColor? levelColor(LogLevel level) {
    return _levelColors[level];
  }
}
