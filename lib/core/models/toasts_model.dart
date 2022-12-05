import 'package:fluttertoast/fluttertoast.dart';

/// Уведомление без действия.
class MessageToast {
  MessageToast({
    required this.message,
    this.toastTime = Toast.LENGTH_SHORT,
    this.gravity = ToastGravity.BOTTOM,
  });

  /// Сообщение.
  final String message;

  /// Длительность уведомления. Доступно 1 и 5 секунд.
  final Toast toastTime;

  /// Место появления уведомления.
  final ToastGravity? gravity;

  @override
  String toString() => 'Toast: [ $message ]';
}

/// Уведомление с действиями.
class MessageSnack {
  const MessageSnack({
    required this.message,
    this.duration = const Duration(seconds: 5),
    this.action,
  });

  /// Сообщение.
  final String message;

  /// Длительность уведомления.
  final Duration duration;

  /// Действие.
  final MapEntry<String, Function()>? action;

  @override
  String toString() => 'Snack: [ $message ]';
}
