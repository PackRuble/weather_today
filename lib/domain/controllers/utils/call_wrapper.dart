import 'dart:async';

import 'package:weather_today/utils/logger/_observers/global_logger.dart';

mixin CallWrapper {
  /// Enables logging and timeout handling.
  Future<T?> callSafely<T>(Future<T> Function() func) async {
    try {
      return func.call().timeout(const Duration(seconds: 10));
    } on TimeoutException catch (e, s) {
      logInfo('TimeoutException', e, s);
      return null;
    } catch (_) {
      rethrow;
    }
  }
}
