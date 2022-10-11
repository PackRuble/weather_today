import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/core/services/app_theme_service/models/models.dart';
import 'package:weather_today/ui/shared/refresh_wrapper.dart';

import 'hourly_page_by_ruble/hourly_page_ui_R.dart';
import 'hourly_page_by_tolskaya/hourly_page_ui.dart';
import 'hourly_page_controller.dart';

/// Страница с OneCall-погодой, почасовая на 2 дня.
class HourlyWeatherPage extends ConsumerWidget {
  const HourlyWeatherPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshWrapper<List<WeatherHourly>>(
      asyncValue: ref.watch(HourlyPageController.hourly),
      onRefresh: () => ref.read(HourlyPageController.instance).updateWeather(),
      physicsListView: ref.watch(AppTheme.scrollPhysics).scrollPhysics,
      child: (List<WeatherHourly> hourly) {
        switch (ref.watch(AppTheme.visualDesign)) {
          case AppVisualDesign.byRuble:
            return HourlyPageByRuble(hourly);
          case AppVisualDesign.byTolskaya:
            return HourlyPageByTolskaya(hourly);
        }
      },
    );
  }
}
