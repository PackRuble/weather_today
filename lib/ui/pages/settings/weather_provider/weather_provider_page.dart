import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/application/const/app_icons.dart';
import 'package:weather_today/application/const/app_info.dart';
import 'package:weather_today/application/navigation/routes.gr.dart';
import 'package:weather_today/data/weather_base/models.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/owm_controller.dart';
import 'package:weather_today/domain/controllers/weather_provider_nr.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';
import 'package:weather_today/ui/shared/appbar_widget.dart';
import 'package:weather_today/ui/shared/dialogs_widget.dart';
import 'package:weather_today/ui/shared/settings_tile.dart';
import 'package:weather_today/ui/shared/shared_widget.dart';

@RoutePage()
class WeatherProviderPage extends ConsumerWidget {
  const WeatherProviderPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherProviderPR = WeatherProviderNR.i;
    final weatherProvider = ref.watch(weatherProviderPR);

    return Scaffold(
      appBar: AppBarCustom(
        ref.tr.ui.weatherProvider,
      ),
      body: ListView(
        children: [
          const _SelectWeatherProviderTile(),
          const Divider(height: 0),
          if (weatherProvider case WeatherProvider.openWeatherMap) ...[
            HeaderRWidget(ref.tr.ui.advancedSettings),
            const _TileWeatherLanguageWidget(),
            const _TileUserApiWidget(),
          ]
        ],
      ),
    );
  }
}

class _SelectWeatherProviderTile extends ConsumerWidget {
  const _SelectWeatherProviderTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(AppLocalization.currentTranslation);

    final weatherProviderPR = WeatherProviderNR.i;
    final weatherProviderNR = ref.watch(weatherProviderPR.notifier);
    final weatherProvider = ref.watch(weatherProviderPR);

    return TileSetting(
      leading: AppIcons.weatherProvider,
      title: ref.tr.ui.selectWeatherProvider,
      subtitle: '${ref.tr.ui.used}: ${weatherProvider.website}',
      onTap: () async {
        final selected = await showChoosingDialog<WeatherProvider>(
          context,
          icon: const Icon(AppIcons.pressure),
          title: ref.tr.ui.weatherProvider,
          subTitle: ref.tr.messages.selectedParamWillBeApplied,
          listDialogOption: [
            for (final provider in WeatherProvider.values)
              DialogOption<WeatherProvider>(
                groupValue: weatherProvider,
                title: provider.website,
                value: provider,
              ),
          ],
        );

        if (selected != null) await weatherProviderNR.change(selected);
      },
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
    final isUsingCustomKeyApi = ref.watch(OWMController.isUserApiKey);

    return TileSetting(
      leading: AppIcons.apiTile,
      title: t.settingsPage.userApiTile.tileTitle,
      subtitle: isUsingCustomKeyApi
          ? t.apiWeatherPage.userApi.usingApi
          : t.apiWeatherPage.defaultApi.usingApi,
      onTap: () async => context.router.push(const UserApiRoute()),
    );
  }
}
