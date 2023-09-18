import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/const/app_colors.dart';
import 'package:weather_today/const/app_icons.dart';
import 'package:weather_today/const/app_insets.dart';
import 'package:weather_today/utils/logger/all_observers.dart';

import '../../../shared/appbar_widget.dart';
import '../../../shared/tips_widget.dart';
import 'weather_language_page_controller.dart';

/// Страница для выбора языка запроса некоторых параметров сервиса погоды.
@RoutePage()
class WeatherLanguagePage extends ConsumerWidget with UiLoggy {
  const WeatherLanguagePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    loggy.debug('build');

    final t = ref.watch(WeatherLanguagePageController.tr);

    return Scaffold(
      appBar: RAppBar(t.weatherLangPage.appbarTitle),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppInsets.allPadding),
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  if (index == 0)
                    TipRWidget(
                      padding:
                          const EdgeInsets.only(bottom: AppInsets.allPadding),
                      text: Text(
                          '${AppSmiles.set} ${t.weatherLangPage.tips.info}'),
                    ),
                  _TileWidget(WeatherLanguage.values[index]),
                ],
              );
            },
            itemCount: WeatherLanguage.values.length,
          ),
        ),
      ),
    );
  }
}

class _TileWidget extends ConsumerWidget {
  const _TileWidget(this.lang);

  final WeatherLanguage lang;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final WeatherLanguage current =
        ref.watch(WeatherLanguagePageController.currentLanguage);

    final bool isCurrent = current == lang;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor:
                AppColors.of(context).theme.textTheme.bodyMedium?.color,
            backgroundColor: isCurrent
                ? AppColors.of(context).cardSelectedColor
                : AppColors.of(context).cardColor,
            side: BorderSide(
              color: isCurrent
                  ? AppColors.of(context).cardSelectedBorder
                  : AppColors.of(context).cardBorderColor,
            ),
          ),
          onPressed: () async => ref
              .read(WeatherLanguagePageController.instance)
              .setWeatherLanguage(lang),
          child: Text(lang.name),
        ),
      ),
    );
  }
}
