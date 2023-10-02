import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/domain/controllers/app_theme/models/design_page.dart';
import 'package:weather_today/ui/shared/refresh_wrapper.dart';

import 'current_page_by_ruble/current_page.dart';
import 'current_page_by_tolskaya/current_page.dart';
import 'current_page_presenter.dart';

/// Page with CURRENT weather for now.
class CurrentWeatherPage extends ConsumerWidget {
  const CurrentWeatherPage({super.key, required this.design});

  final AppVisualDesign design;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return RefreshWrapper<WeatherCurrent>(
      asyncValue: ref.watch(CurrentPagePresenter.current),
      onRefresh: () async =>
          ref.read(CurrentPagePresenter.instance).updateWeather(),
      child: (WeatherCurrent weatherCur) => switch (design) {
        AppVisualDesign.byRuble => CurrentWeatherPageByRuble(weatherCur),
        AppVisualDesign.byTolskaya => CurrentWeatherPageByTolskaya(weatherCur)
      },
    );
  }
}
