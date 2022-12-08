import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/core/controllers/general_settings_controller.dart';
import 'package:weather_today/ui/shared/wrapper_page.dart';

import '../../const/app_dialogs.dart';

class AcceptedLicenseWidget extends ConsumerStatefulWidget {
  const AcceptedLicenseWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<AcceptedLicenseWidget> createState() =>
      _AcceptedLicenseWidgetState();
}

class _AcceptedLicenseWidgetState extends ConsumerState<AcceptedLicenseWidget> {
  @override
  void initState() {
    super.initState();

    /// Показать диалог принятия условий использования приложения.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AppDialogs.acceptedTermsInfo(context).then((isAccept) async {
        if (isAccept) {
          await ref
              .read(AppGeneralSettings.instance)
              .setAcceptedTermsConditions(true);
        } else {
          // иначе выйти из приложения
          exit(1);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const WrapperPage(
      child: Scaffold(),
    );
  }
}
