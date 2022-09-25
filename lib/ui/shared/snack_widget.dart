import 'package:flutter/material.dart';
import 'package:weather_today/core/models/toasts_model.dart';

/// Преднастроенное всплывающее сообщение.
class CustomSnack extends SnackBar {
  CustomSnack(this.context, {required this.snack})
      : super(
            behavior: SnackBarBehavior.fixed,
            dismissDirection: DismissDirection.startToEnd,
            content: Text(snack.message,
                style: Theme.of(context).textTheme.titleMedium),
            duration: snack.duration,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            action: snack.action?.key != null
                ? SnackBarAction(
                    textColor: Theme.of(context).colorScheme.secondary,
                    label: snack.action!.key,
                    onPressed: snack.action!.value,
                  )
                : null);

  final MessageSnack snack;
  final BuildContext context;
}
