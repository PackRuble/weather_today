import 'package:loggy/loggy.dart' show Loggy, LoggyType;

mixin NotifierLogger implements LoggyType {
  @override
  Loggy<NotifierLogger> get loggy => Loggy<NotifierLogger>('[$runtimeType]');

  Loggy<NotifierLogger> get l => loggy;
}

mixin GlobalLogger implements LoggyType {
  @override
  Loggy<GlobalLogger> get loggy => Loggy<GlobalLogger>('[$runtimeType]');

  Loggy<GlobalLogger> get l => loggy;
}

Loggy<GlobalLogger> get _globalLoggy => Loggy<GlobalLogger>('[Global Logger]');

final logDebug = _globalLoggy.debug;
final logInfo = _globalLoggy.info;
final logWarning = _globalLoggy.warning;
final logError = _globalLoggy.error;
