import 'dart:io' show Platform;

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';

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
    final tr = ref.watch(AppLocalization.currentTranslation);
    final scaffold = ScaffoldMessenger.of(context);

    // слушаем наш контроллер по тостам
    if (isListenToast) {
      ref.listen<ToastController>(MessageController.toasts,
          (_, ToastController controller) async {
        final MessageToast? toast = controller.toast;
        if (toast != null) {
          if (Platform.isAndroid || Platform.isIOS || kIsWeb) {
            await Fluttertoast.showToast(
                msg: toast.message,
                fontSize: Theme.of(context).textTheme.titleMedium?.fontSize,
                toastLength: toast.toastTime,
                gravity: toast.gravity,
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                textColor: Theme.of(context).textTheme.titleMedium?.color);
          } else {
            scaffold.showSnackBar(CustomSnack(
              context,
              snack: MessageSnack(message: toast.message),
            ));
          }
        }
      });
    }

    // слушаем наш контроллер по снэкам
    if (isListenSnack) {
      ref.listen<SnackController>(
        MessageController.snacks,
        (_, SnackController controller) async {
          if (controller.snack == null) return;

          final snack = CustomSnack(
            context,
            snack: controller.snack!,
          );

          scaffold.showSnackBar(snack);
        },
      );
    }

    return child;
  }
}

class ErrorInfoDialog extends ConsumerWidget {
  const ErrorInfoDialog(this.message, {super.key});

  final String message;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Dialog.fullscreen(
      backgroundColor: theme.scaffoldBackgroundColor,
      child: Column(
        children: [
          AppBar(
            leading: const CloseButton(),
            title: const Text('Oops... screen'),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(8.0),
              child: Text(message),
            ),
          ),
        ],
      ),
    );
  }
}
