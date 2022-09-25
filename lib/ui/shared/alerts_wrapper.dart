import 'package:weather_today/shared_libs.dart';

import '../utils/metrics_helper.dart';

/// Позволяет легко обработать [WeatherAlert].
///
/// Чем удобно?
/// * проверка данных каждого [WeatherAlert]. Подробнее [MetricsHelper.getCorrectAlert()]
/// * удобное получение данных и обработка ошибок.
class AlertsWrapper extends ConsumerWidget {
  const AlertsWrapper({
    required this.asyncAlerts,
    required this.data,
    required this.valueIsEmpty,
    this.valueIsError,
    Key? key,
  }) : super(key: key);

  final AsyncValue<List<WeatherAlert>> asyncAlerts;

  /// Отображается данный виджет, если AsyncValue.data = [].
  final Widget valueIsEmpty;

  /// Отображается данный виджет, если AsyncValue.data = [].
  final Widget? valueIsError;

  /// Отображается данный виджет, если AsyncValue.data имеет данные.
  final Widget Function(List<WeatherAlert> alerts) data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return asyncAlerts.maybeWhen(
        data: (List<WeatherAlert> alerts) {
          alerts = MetricsHelper.getCorrectAlert(alerts);
          if (alerts.isEmpty) {
            return valueIsEmpty;
          }

          return data(alerts);
        },
        orElse: () => valueIsError ?? const SizedBox.shrink());
  }
}
