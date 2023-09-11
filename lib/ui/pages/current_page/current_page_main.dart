import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/core/services/app_theme_service/models/design_page.dart';
import 'package:weather_today/ui/shared/refresh_wrapper.dart';

import 'current_page_by_ruble/current_page_ui.dart';
import 'current_page_by_tolskaya/current_page_ui.dart';
import 'current_page_controller.dart';

/// Страница с CURRENT-погодой на сейчас.
class CurrentWeatherPage extends ConsumerWidget {
  const CurrentWeatherPage({super.key, required this.design});

  final AppVisualDesign design;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshWrapper<WeatherCurrent>(
      asyncValue: ref.watch(CurrentPageController.current),
      onRefresh: () async =>
          ref.read(CurrentPageController.instance).updateWeather(),
      physicsListView: ref.watch(AppTheme.scrollPhysics).scrollPhysics,
      child: (WeatherCurrent weatherCur) => switch (design) {
        AppVisualDesign.byRuble => CurrentWeatherPageByRuble(weatherCur),
        AppVisualDesign.byTolskaya => CurrentWeatherPageByTolskaya(weatherCur)
      },
    );
  }
}
