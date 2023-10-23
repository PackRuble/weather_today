import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/domain/controllers/app_theme/models/design_page.dart';
import 'package:weather_today/ui/shared/refresh_wrapper.dart';

import 'daily_page_by_ruble/daily_page.dart';
import 'daily_page_presenter.dart';

/// Page with OneCall-weather for 7 days.
class DailyWeatherPage extends ConsumerWidget {
  const DailyWeatherPage({super.key, required this.design});

  final AppVisualDesign design;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshWrapper<List<WeatherDaily>>(
      asyncValue: ref.watch(DailyPagePresenter.daily),
      onRefresh: () async =>
          ref.read(DailyPagePresenter.instance).updateWeather(),
      child: (BuildContext context, List<WeatherDaily> daily) =>
          switch (design) {
        AppVisualDesign.byRuble => DailyWeatherPageByRuble(daily),
        _ => DailyWeatherPageByRuble(daily)
      },
    );
  }
}
