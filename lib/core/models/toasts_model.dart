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

  // @override
  // bool operator ==(dynamic other) {
  //   // coldfix иначе, мы не сможем показывать одни и те же уведомления дважды
  //   // и не будет запускаться ребилдинг виджетов
  //   return false;
  //   return identical(this, other) ||
  //       (other.runtimeType == runtimeType &&
  //           other is MessageToast &&
  //           const DeepCollectionEquality().equals(other.message, message));
  // }

  // @override
  // int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() => 'Toast - $message';
// MessageToast copyWith({
//   String? message,
//   Toast? toastTime,
//   ToastGravity? gravity,
// }) =>
//     MessageToast(
//       message: message ?? this.message,
//       toastTime: toastTime ?? this.toastTime,
//       gravity: gravity ?? this.gravity,
//     );
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

  // @override
  // bool operator ==(dynamic other) => false;

  // @override
  // int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() => 'Snack - $message';
}
