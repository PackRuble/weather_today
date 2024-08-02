import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/application/const/app_icons.dart';
import 'package:weather_today/application/navigation/routes.gr.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';
import 'package:weather_today/ui/shared/appbar_widget.dart';
import 'package:weather_today/ui/shared/settings_tile.dart';

@RoutePage()
class WeatherProviderPage extends ConsumerWidget {
  const WeatherProviderPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBarCustom(
        // todo(02.08.2024): tr
        'Погодный провайдер',
      ),
      body: ListView(
        children: const [
          _TileWeatherLanguageWidget(),
          _TileUserApiWidget(),
          Divider(),
        ],
      ),
    );
  }
}

class _TileWeatherLanguageWidget extends ConsumerWidget {
  const _TileWeatherLanguageWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(AppLocalization.currentTranslation);

    final langName = ref.watch(WeatherServices.currentLanguage).name;

    return TileSetting(
      leading: AppIcons.weatherLangTile,
      title: t.settingsPage.weatherLangTile.tileTitle,
      subtitle: langName,
      onTap: () async => context.router.push(const WeatherLanguageRoute()),
    );
  }
}

class _TileUserApiWidget extends ConsumerWidget {
  const _TileUserApiWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(AppLocalization.currentTranslation);

    return TileSetting(
      leading: AppIcons.apiTile,
      title: t.settingsPage.userApiTile.tileTitle,
      onTap: () async => context.router.push(const UserApiRoute()),
    );
  }
}
