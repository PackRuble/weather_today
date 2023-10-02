import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/domain/controllers/app_theme/models/design_page.dart';
import 'package:weather_today/ui/shared/refresh_wrapper.dart';

import 'hourly_page_by_ruble/hourly_page.dart';
import 'hourly_page_by_tolskaya/hourly_page.dart';
import 'hourly_page_presenter.dart';

/// Страница с OneCall-погодой, почасовая на 2 дня.
class HourlyWeatherPage extends ConsumerWidget {
  const HourlyWeatherPage({super.key, required this.design});

  final AppVisualDesign design;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshWrapper<List<WeatherHourly>>(
      asyncValue: ref.watch(HourlyPagePresenter.hourly),
      onRefresh: () async =>
          ref.read(HourlyPagePresenter.instance).updateWeather(),
      child: (List<WeatherHourly> hourly) => switch (design) {
        AppVisualDesign.byRuble => HourlyPageByRuble(hourly),
        AppVisualDesign.byTolskaya => HourlyPageByTolskaya(hourly)
      },
    );
  }
}
