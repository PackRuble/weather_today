import 'package:loggy/loggy.dart' show LoggyType, Loggy;

mixin GlobalLogger implements LoggyType {
  @override
  Loggy<GlobalLogger> get loggy =>
      Loggy<GlobalLogger>('[Global - $runtimeType]');
}

Loggy<GlobalLogger> get _globalLoggy => Loggy<GlobalLogger>('[Global Logger]');

final logDebug = _globalLoggy.debug;
final logInfo = _globalLoggy.info;
final logWarning = _globalLoggy.warning;
final logError = _globalLoggy.error;
