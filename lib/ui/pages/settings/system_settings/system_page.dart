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
      appBar: AppBarCustom(t.systemSettingsPage.appbarTitle),
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
    super.key,
    this.onChange,
  });

  final VoidCallback? onChange;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(AppLocalization.currentTranslation);

    final appLogsPR = AppLogsManager.i;
    final appLogsNR = ref.watch(appLogsPR.notifier);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: SwitchTileWidget(
                onChanged: (bool value) async {
                  await Future.value(
                    value
                        ? appLogsNR.enableLogging()
                        : appLogsNR.disableLogging(),
                  );

                  onChange?.call();
                },
                title: t.systemSettingsPage.enableLogsTile.tileTitle,
                subtitle: t.systemSettingsPage.enableLogsTile.tileSub,
                value: appLogsNR.isEnableUserLogs,
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
          padding: const EdgeInsets.all(8.0).copyWith(bottom: 0.0),
          child: Text(
            textAlign: TextAlign.justify,
            t.systemSettingsPage.enableLogsTile.tileContent,
          ),
        ),
      ],
    );
  }
}
