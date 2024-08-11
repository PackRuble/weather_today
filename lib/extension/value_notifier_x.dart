import 'package:flutter/foundation.dart';

extension ValueNotifierX<T> on ValueNotifier<T> {
  // ignore: use_setters_to_change_properties
  void set(T newValue) => value = newValue;

  void update(T Function(T value) callback) => value = callback(value);

  VoidCallback addListenerV(ValueSetter<T> listener) {
    // ignore: prefer_function_declarations_over_variables
    final callback = () => listener.call(value);
    addListener(callback);
    return () => removeListener(callback);
  }
}
