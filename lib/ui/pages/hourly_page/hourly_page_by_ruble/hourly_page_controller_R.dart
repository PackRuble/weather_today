// ignore_for_file: file_names

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/ui/pages/hourly_page/charts_widget/chart_model.dart';

import '../hourly_page_controller.dart';

/// The controller this [HourlyPageByRuble].
class HPByRubleCtrl {
  HPByRubleCtrl(this._ref);

  final Ref _ref;

  /// экземпляр.
  static final instance = Provider.autoDispose(HPByRubleCtrl.new);

  /// экземпляр данных почасовой погоды.
  static final hourly = Provider<List<WeatherHourly>?>(
      (ref) => ref.watch(HourlyPageController.hourly).value);

  /// График основной погоды.
  static final chartMainForecast = Provider<ChartModel<WeatherHourly>>((ref) {
    final List<WeatherHourly>? data = ref.watch(hourly);

    return ChartModel<WeatherHourly>.forecast(data ?? []);
  });

  /// График ветра.
  static final chartWind = Provider<ChartModel<WeatherHourly>>((ref) {
    final List<WeatherHourly>? data = ref.watch(hourly);

    return ChartModel<WeatherHourly>.wind(data ?? []);
  });

  /// График осадков.
  static final chartPop = Provider<ChartModel<WeatherHourly>>((ref) {
    final List<WeatherHourly>? data = ref.watch(hourly);

    return ChartModel<WeatherHourly>.pop(data ?? []);
  });

  /// График других параметров.
  static final chartCloudsParam = Provider<ChartModel<WeatherHourly>>((ref) {
    final List<WeatherHourly>? data = ref.watch(hourly);

    return ChartModel<WeatherHourly>.clouds(data ?? []);
  });
}
