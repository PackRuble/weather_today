import 'package:flutter/material.dart';

import '../dialogs/app_dialogs.dart';

class ResetButton extends StatelessWidget {
  const ResetButton({
    super.key,
    this.withAlert = true,
    required this.onConfirm,
    this.onCancel,
    this.customDialog,
  }) : assert(!(!withAlert && customDialog != null),
            'You specified a $customDialog, but it will not be shown');

  final bool withAlert;
  final Future<bool> Function(BuildContext context)? customDialog;
  final dynamic Function()? onCancel;
  final void Function() onConfirm;

  @override
  Widget build(BuildContext context) => IconButton(
        onPressed: () async {
          if (withAlert) {
            final bool isConfirm = await (customDialog != null
                ? customDialog!.call(context)
                : AppDialogs.confirmResetSettings(context));

            isConfirm == true ? onConfirm.call() : onCancel?.call();
          } else {
            onConfirm.call();
          }
        },
        icon: const Icon(Icons.settings_backup_restore_rounded),
      );
}
