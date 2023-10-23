// ignore_for_file: noop_primitive_operations

import 'package:loggy/loggy.dart' show Loggy, LoggyType;

mixin UiLoggy implements LoggyType {
  @override
  Loggy<UiLoggy> get loggy => Loggy<UiLoggy>('[UI]<${runtimeType.toString()}>');
}
