import 'package:loggy/loggy.dart';

mixin DbLoggy implements LoggyType {
  @override
  Loggy<DbLoggy> get loggy => Loggy<DbLoggy>('DB Log');
}

// Loggy get dbLoggy => Loggy<GlobalLoggy>('DB Log');
//
// final logDebug = _globalLoggy.;
