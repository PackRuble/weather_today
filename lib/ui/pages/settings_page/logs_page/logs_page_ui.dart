import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/utils/logger/release_logger.dart';

import '../../../shared/custom_appbar.dart';
import '../../../shared/wrapper_page.dart';

class LogsPage extends ConsumerWidget with UiLoggy {
  const LogsPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    logInfo('build');

    final theme = Theme.of(context);

    final logsManager = ref.watch(loggerManager);

    final logs = logsManager.getLogs()?.reversed.toList() ?? [];

    return WrapperPage(
      child: Scaffold(
        appBar: const RAppBar('Logs'),
        body: logs.isEmpty
            ? const Center(child: Text('There are no logs'))
            : SelectionArea(
                child: ListView.separated(
                  itemCount: logs.length,
                  padding: const EdgeInsets.all(8.0),
                  physics: ref.watch(AppTheme.scrollPhysics).scrollPhysics,
                  itemBuilder: (BuildContext _, int index) {
                    return Row(
                      children: [
                        Text(
                          index.toString(),
                          style: theme.textTheme.titleMedium,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                            child: Text(
                          logs[index],
                        )),
                      ],
                    );
                  },
                  separatorBuilder: (_, __) {
                    return const Divider();
                  },
                ),
              ),
      ),
    );
  }
}
