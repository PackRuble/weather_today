import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/const/app_colors.dart';
import 'package:weather_today/const/app_icons.dart';
import 'package:weather_today/const/app_insets.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';

import '../../../shared/custom_appbar.dart';
import '../../../shared/tips_widget.dart';
import 'weather_language_page_controller.dart';

/// Страница для выбора языка запроса некоторых параметров сервиса погоды.
class WeatherLanguagePage extends ConsumerWidget with UiLoggy {
  const WeatherLanguagePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    loggy.info('build');

    return Scaffold(
      appBar: RAppBar('Язык погодных условий'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppInsets.allPadding),
          child: ListView.separated(
            physics: ref.watch(AppTheme.scrollPhysics).scrollPhysics,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                height: 5.0,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  if (index == 0)
                    const TipRWidget(
                      padding: EdgeInsets.only(bottom: AppInsets.allPadding),
                      text: Text('${AppSmiles.set} ' +
                          'Некоторые погодные условия будут предоставляться на выбранном языке.'),
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

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          onPrimary: AppColors.of(context).theme.textTheme.bodyMedium?.color,
          primary: isCurrent
              ? AppColors.of(context).cardSelectedColor
              : AppColors.of(context).cardColor,
          side: BorderSide(
            color: isCurrent
                ? AppColors.of(context).cardSelectedBorder
                : AppColors.of(context).cardBorderColor,
          ),
        ),
        onPressed: () async =>
            ref.read(WeatherLanguagePageController.pr).setWeatherLanguage(lang),
        child: Text(lang.name),
      ),
    );

    return OutlinedButton(
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color?>((_) {
        return current == lang
            ? Theme.of(context).colorScheme.onPrimaryContainer
            : null;
      }), backgroundColor: MaterialStateProperty.resolveWith<Color?>((_) {
        return current == lang
            ? Theme.of(context).colorScheme.primaryContainer
            : null;
      })),
      onPressed: () {
        ref.read(WeatherLanguagePageController.pr).setWeatherLanguage(lang);
        // context.router.pop();
      },
      child: Center(
        child: Text(lang.name),
      ),
    );
  }
}
