import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';
import 'package:weather_today/core/controllers/logger_controller.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';

import '../../../shared/appbar_widget.dart';
import '../../../shared/switch_tile_widget.dart';
import '../../../shared/wrapper_page.dart';

@RoutePage()
class SystemSettingsPage extends ConsumerWidget {
  const SystemSettingsPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    final theme = Theme.of(context);
    final t = ref.watch(AppLocalization.currentTranslation);

    return WrapperPage(
      child: Scaffold(
        appBar: RAppBar(t.systemSettingsPage.appbarTitle),
        body: ListView(
          physics: ref.watch(AppTheme.scrollPhysics).scrollPhysics,
          children: const [
            _EnableLogsSwitch(),
            Divider(height: 0.0, thickness: 1.0),
          ],
        ),
      ),
    );
  }
}

class _EnableLogsSwitch extends ConsumerWidget {
  const _EnableLogsSwitch({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(AppLocalization.currentTranslation);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: SwitchTileWidget(
                onChanged: (bool value) async {
                  if (value) {
                    unawaited(ref.read(loggerManager).enableLogging());
                  } else {
                    unawaited(ref.read(loggerManager).disableLogging());
                  }
                },
                title: t.systemSettingsPage.enableLogsTile.tileTitle,
                subtitle: t.systemSettingsPage.enableLogsTile.tileSub,
                value: ref.watch(loggerManager).isEnableLogging,
              ),
            ),

            // Todo: create in next release
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(Icons.forward_to_inbox_rounded),
            // ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            textAlign: TextAlign.justify,
            t.systemSettingsPage.enableLogsTile.tileContent,
          ),
        ),
      ],
    );
  }
}
