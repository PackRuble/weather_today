// ignore_for_file: file_names

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/ui/pages/hourly/charts_widget/chart_model.dart';

import '../hourly_page_presenter.dart';

/// The controller this [HourlyPageByRuble].
class HourlyPageByRublePresenter {
  const HourlyPageByRublePresenter(this._ref);

  // ignore: unused_field
  final Ref _ref;

  /// Instance of current class.
  static final instance = Provider.autoDispose(
    HourlyPageByRublePresenter.new,
    name: '$HourlyPageByRublePresenter',
  );

  /// Hourly weather data instance.
  static final hourly = Provider<List<WeatherHourly>?>(
    (ref) => ref.watch(HourlyPagePresenter.hourly).valueOrNull,
  );

  /// Basic weather chart.
  static final chartMainForecast = Provider<ChartModel>(
    (ref) => ChartModel.forecast(ref.watch(hourly) ?? []),
  );

  /// Wind chart.
  static final chartWind =
      Provider<ChartModel>((ref) => ChartModel.wind(ref.watch(hourly) ?? []));

  /// Precipitation chart.
  static final chartPop =
      Provider<ChartModel>((ref) => ChartModel.pop(ref.watch(hourly) ?? []));

  /// Graph of other parameters.
  static final chartCloudsParam =
      Provider<ChartModel>((ref) => ChartModel.clouds(ref.watch(hourly) ?? []));
}
