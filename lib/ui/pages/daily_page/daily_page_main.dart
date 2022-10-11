import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/ui/shared/refresh_wrapper.dart';

import '../../../core/services/app_theme_service/models/models.dart';
import 'daily_page_by_ruble/daily_page_ui.dart';
import 'daily_page_controller.dart';

/// Страница с OneCall-погодой на 7 дней.
class DailyWeatherPage extends ConsumerWidget {
  const DailyWeatherPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshWrapper<List<WeatherDaily>>(
      asyncValue: ref.watch(DailyPageController.daily),
      onRefresh: () => ref.read(DailyPageController.instance).updateWeather(),
      physicsListView: ref.watch(AppTheme.scrollPhysics).scrollPhysics,
      child: (List<WeatherDaily> daily) {
        switch (ref.watch(AppTheme.visualDesign)) {
          case AppVisualDesign.byRuble:
            return DailyWeatherPageByRuble(daily);
          case AppVisualDesign.byTolskaya:
          // return DailyWeatherPageByTolskaya(daily);
          default:
            return DailyWeatherPageByRuble(daily);
        }
      },
    );
  }
}
