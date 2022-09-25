import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/const/app_info.dart';

/// Виджет-плашка поставщика погоды.
class LabelWeatherWidget extends ConsumerWidget {
  const LabelWeatherWidget({
    this.padding = const EdgeInsets.only(right: 8.0, top: 5.0, bottom: 5.0),
    this.alignment = Alignment.centerRight,
  });

  final Alignment alignment;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const String nameService = AppInfo.weatherService;

    return Padding(
      padding: padding,
      child: Align(
        alignment: alignment,
        child: Text(
          nameService,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontStyle: FontStyle.italic),
        ),
      ),
    );
    ;
  }
}
