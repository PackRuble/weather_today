import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/logger_controller.dart';

import '../../../shared/appbar_widget.dart';
import '../../../shared/switch_tile_widget.dart';

@RoutePage()
class SystemSettingsPage extends ConsumerWidget {
  const SystemSettingsPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    final theme = Theme.of(context);
    final t = ref.watch(AppLocalization.currentTranslation);

    return Scaffold(
      appBar: RAppBar(t.systemSettingsPage.appbarTitle),
      body: ListView(
        children: const [
          EnableLogsSwitch(),
          Divider(height: 0.0, thickness: 1.0),
        ],
      ),
    );
  }
}

class EnableLogsSwitch extends ConsumerWidget {
  const EnableLogsSwitch({
    Key? key,
    this.onChange,
  }) : super(key: key);

  final VoidCallback? onChange;

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

                  onChange?.call();
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
