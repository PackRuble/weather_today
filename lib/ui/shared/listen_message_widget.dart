import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/controllers/message_controller.dart';
import '../../domain/models/toasts_model.dart';
import 'snack_widget.dart';

/// Виджет-обертка необходим, чтобы другой виджет мог слушать Toast/Snackbar.
class ListenMessageWrapper extends ConsumerWidget {
  const ListenMessageWrapper({
    required this.child,
    this.isListenSnack = true,
    this.isListenToast = true,
    super.key,
  });

  final bool isListenSnack;
  final bool isListenToast;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // слушаем наш контроллер по тостам
    if (isListenToast) {
      ref.listen<ToastController>(MessageController.toasts,
          (_, ToastController controller) async {
        final MessageToast? toast = controller.toast;
        if (toast != null) {
          await Fluttertoast.showToast(
              msg: toast.message,
              fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
              toastLength: toast.toastTime,
              gravity: toast.gravity,
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              textColor: Theme.of(context).textTheme.titleMedium?.color);
        }
      });
    }

    // слушаем наш контроллер по снэкам
    if (isListenSnack) {
      ref.listen<SnackController>(MessageController.snacks,
          (_, SnackController controller) async {
        if (controller.snack != null) {
          ScaffoldMessenger.of(context)
              .showSnackBar(CustomSnack(context, snack: controller.snack!));
        }
      });
    }

    return child;
  }
}
