import 'package:flutter/foundation.dart';

extension ValueNotifierX<T> on ValueNotifier<T> {
  // ignore: use_setters_to_change_properties
  void set(T newValue) => value = newValue;
}
