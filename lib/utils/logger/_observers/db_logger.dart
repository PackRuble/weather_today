import 'package:loggy/loggy.dart';

mixin DbLogger implements LoggyType {
  @override
  Loggy<DbLogger> get loggy => Loggy<DbLogger>('[Database]');
}
