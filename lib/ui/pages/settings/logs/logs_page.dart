import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/domain/controllers/logger_controller.dart';
import 'package:weather_today/utils/logger/all_observers.dart';

import '../../../shared/appbar_widget.dart';
import '../system_settings/system_page.dart' show EnableLogsSwitch;

@RoutePage()
class LogsPage extends ConsumerWidget with UiLoggy {
  const LogsPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logDebug('build');

    final theme = Theme.of(context);

    final logsManager = ref.watch(AppLogsManager.instance);

    return Scaffold(
      appBar: const AppBarCustom('Logs'),
      body: StatefulBuilder(builder: (context, setState) {
        final logs = logsManager.getLogs()?.reversed.toList() ?? [];
        return Column(
          children: [
            // coldfix: пока что костыль, так как логи не реактивны
            EnableLogsSwitch(onChange: () => setState(() {})),
            const Divider(height: 0.0, thickness: 1.0),
            logs.isEmpty
                ? const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(child: Text('There are no logs')),
                  )
                : Expanded(
                    child: SelectionArea(
                      child: ListView.separated(
                        itemCount: logs.length,
                        padding: const EdgeInsets.all(8.0),
                        itemBuilder: (BuildContext _, int index) {
                          return Row(
                            children: [
                              Text(
                                index.toString(),
                                style: theme.textTheme.titleMedium,
                              ),
                              const SizedBox(width: 10),
                              Flexible(child: Text(logs[index])),
                            ],
                          );
                        },
                        separatorBuilder: (_, __) => const Divider(),
                      ),
                    ),
                  ),
          ],
        );
      }),
    );
  }
}
