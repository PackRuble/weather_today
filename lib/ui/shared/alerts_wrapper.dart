import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';

import '../utils/metrics_helper.dart';

/// Позволяет легко обработать [WeatherAlert].
///
/// Чем удобно?
/// * проверка данных каждого [WeatherAlert]. Подробнее [MetricsHelper.getCorrectAlert]
/// * удобное получение данных и обработка ошибок.
class AlertsWrapper extends StatelessWidget {
  const AlertsWrapper({
    required this.asyncAlerts,
    required this.data,
    this.valueIsEmpty,
    // this.valueIsError,
    super.key,
  });

  final AsyncValue<List<WeatherAlert>?> asyncAlerts;

  /// Show this widget if [AsyncValue.data] = isEmpty or null.
  final Widget? valueIsEmpty;

  /// Отображается данный виджет, если [AsyncValue.error].
  // final Widget? valueIsError;

  /// Отображается данный виджет, если AsyncValue.data имеет данные.
  final Widget Function(List<WeatherAlert> alerts) data;

  @override
  Widget build(BuildContext context) {
    return asyncAlerts.maybeWhen(
        data: (List<WeatherAlert>? alerts) {
          if (alerts?.isEmpty ?? true) {
            return valueIsEmpty ?? const SizedBox.shrink();
          }

          alerts = MetricsHelper.getCorrectAlert(alerts!);

          return data(alerts);
        },
        orElse: () =>
            // valueIsError ??
            const SizedBox.shrink());
  }
}
