import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/core/services/app_theme_service/models/design_page.dart';
import 'package:weather_today/ui/shared/refresh_wrapper.dart';

import 'daily_page_by_ruble/daily_page_ui.dart';
import 'daily_page_controller.dart';

/// Страница с OneCall-погодой на 7 дней.
class DailyWeatherPage extends ConsumerWidget {
  const DailyWeatherPage({super.key, required this.design});

  final AppVisualDesign design;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshWrapper<List<WeatherDaily>>(
      asyncValue: ref.watch(DailyPageController.daily),
      onRefresh: () async =>
          ref.read(DailyPageController.instance).updateWeather(),
      child: (List<WeatherDaily> daily) => switch (design) {
        AppVisualDesign.byRuble => DailyWeatherPageByRuble(daily),
        _ => DailyWeatherPageByRuble(daily)
      },
    );
  }
}
