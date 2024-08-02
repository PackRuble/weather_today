// ignore_for_file: discarded_futures

import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/application/const/app_icons.dart';
import 'package:weather_today/application/const/app_info.dart';
import 'package:weather_today/application/i18n/translations_enum.dart';
import 'package:weather_today/application/navigation/routes.gr.dart';
import 'package:weather_today/domain/controllers/app_theme/controller/app_theme_controller.dart';
import 'package:weather_today/domain/controllers/general_settings_controller.dart';
import 'package:weather_today/domain/controllers/weather_provider_nr.dart';
import 'package:weather_today/ui/pages/settings/settings_page_presenter.dart';
import 'package:weather_today/ui/shared/settings_tile.dart';

import '../../shared/shared_widget.dart';
import 'weather_provider/weather_provider_page.dart';

const double _dividerThickness = 8.0;

/// Страница настроек приложения.
class SettingsPage extends ConsumerWidget {
  const SettingsPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(SettingPagePresenter.tr);

    return ListView(
      children: <Widget>[
        HeaderRWidget(t.settingsPage.headers.weather),
        const _TileMyPlaceWidget(),
        const _TileTempUnitsWidget(),
        const _TileSpeedUnitsWidget(),
        const _TilePressureUnitsWidget(),
        const _TileWeatherProviderWidget(),
        const Divider(thickness: _dividerThickness),
        HeaderRWidget(t.settingsPage.headers.design),
        const _VisualDesignTileWidget(),
        const _TileThemeWidget(),
        const Divider(thickness: _dividerThickness),
        HeaderRWidget(t.settingsPage.headers.general),
        const _TileCountryFlagsWidget(),
        const _TileHomepageIndexWidget(),
        const _TileLocaleAppWidget(),
        // todo: убрано. Ожидается полная реализация логирования
        // const _SystemSettingsWidget(),
        const _TileGratitudeWidget(),
        const _TileAboutAppWidget(),
      ],
    );
  }
}

class _TileMyPlaceWidget extends ConsumerWidget {
  const _TileMyPlaceWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(SettingPagePresenter.tr);

    return TileSetting(
      leading: AppIcons.savedPlaceTile,
      title: t.settingsPage.savedPlacesTile.tileTitle,
      onTap: () => context.router.push(const SavedPlacesRoute()),
    );
  }
}

class _TileTempUnitsWidget extends ConsumerWidget {
  const _TileTempUnitsWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(SettingPagePresenter.tr);

    final String units = ref.watch(SettingPagePresenter.tempUnits).abbr;

    return TileSetting(
      leading: AppIcons.tempUnitsTile,
      title: t.settingsPage.tempTile.tileTitle,
      subtitle: t.settingsPage.tempTile.tileSub(units: units),
      onTap: () async =>
          ref.read(SettingPagePresenter.instance).dialogSetTempUnits(context),
    );
  }
}

class _TileSpeedUnitsWidget extends ConsumerWidget {
  const _TileSpeedUnitsWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(SettingPagePresenter.tr);

    final String units = ref.watch(SettingPagePresenter.speedUnits).abbrTr;

    return TileSetting(
      leading: AppIcons.speedUnitsTile,
      title: t.settingsPage.speedTile.tileTitle,
      subtitle: t.settingsPage.pressureTile.tileSub(units: units),
      onTap: () async =>
          ref.read(SettingPagePresenter.instance).dialogSetSpeedUnits(context),
    );
  }
}

class _TilePressureUnitsWidget extends ConsumerWidget {
  const _TilePressureUnitsWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(SettingPagePresenter.tr);

    final String units = ref.watch(SettingPagePresenter.pressureUnits).abbrTr;

    return TileSetting(
      leading: AppIcons.pressureUnitsTile,
      title: t.settingsPage.pressureTile.tileTitle,
      subtitle: t.settingsPage.pressureTile.tileSub(units: units),
      onTap: () async => ref
          .read(SettingPagePresenter.instance)
          .dialogSetPressureUnits(context),
    );
  }
}

class _TileWeatherProviderWidget extends ConsumerWidget {
  const _TileWeatherProviderWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(SettingPagePresenter.tr);

    final weatherProviderPR = WeatherProviderNR.i;
    final weatherProviderNR = ref.watch(weatherProviderPR.notifier);
    final weatherProvider = ref.watch(weatherProviderPR);

    return TileSetting(
      leading: AppIcons.weatherProvider,
      // todo(02.08.2024): tr
      title: 'Погодный провайдер',
      subtitle: weatherProvider.website,
      onTap: () => context.router.push(const WeatherProviderRoute()),
    );
  }
}

//==============================================================================

class _VisualDesignTileWidget extends ConsumerWidget {
  const _VisualDesignTileWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(SettingPagePresenter.tr);

    return TileSetting(
      leading: AppIcons.visualDesignTile,
      title: t.settingsPage.visualDesignTile.tileTitle,
      onTap: () => context.router.push(const VisualDesignRoute()),
    );
  }
}

class _TileThemeWidget extends ConsumerWidget {
  const _TileThemeWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(SettingPagePresenter.tr);

    final FlexSchemeData schemeData = ref.watch(AppTheme.currentThemeScheme);

    return TileSetting(
      leading: AppIcons.themeTile,
      title: t.settingsPage.themeTile.tileTitle,
      subtitle: schemeData.name,
      onTap: () => context.router.push(const ThemeRoute()),
    );
  }
}

//==============================================================================

class _TileCountryFlagsWidget extends ConsumerWidget {
  const _TileCountryFlagsWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(SettingPagePresenter.tr);

    return TileSetting(
      leading: AppIcons.countryFlagsTile,
      title: t.settingsPage.countryFlagsTile.tileTitle,
      onTap: () => context.router.push(const CountryFlagsRoute()),
    );
  }
}

class _TileHomepageIndexWidget extends ConsumerWidget {
  const _TileHomepageIndexWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(SettingPagePresenter.tr);

    final String pageName = ref.watch(AppGeneralSettings.startPageIndex).nameTr;

    return TileSetting(
      leading: AppIcons.homepageTile,
      title: t.settingsPage.homepageTile.tileTitle,
      subtitle: t.settingsPage.homepageTile.tileSub(homepage: pageName),
      onTap: () async =>
          ref.read(SettingPagePresenter.instance).dialogSetHomepage(context),
    );
  }
}

class _TileLocaleAppWidget extends ConsumerWidget {
  const _TileLocaleAppWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(SettingPagePresenter.tr);

    final locale = ref.watch(SettingPagePresenter.currentLocale).nameTr;

    return TileSetting(
      leading: AppIcons.localeTile,
      title: t.settingsPage.localeTile.tileTitle,
      subtitle: t.settingsPage.localeTile.tileSub(locale: locale),
      onTap: () async =>
          ref.read(SettingPagePresenter.instance).dialogSetLocale(context),
    );
  }
}

// ignore: unused_element
class _SystemSettingsWidget extends ConsumerWidget {
  const _SystemSettingsWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(SettingPagePresenter.tr);

    return TileSetting(
      leading: AppIcons.systemSettingsTile,
      title: t.settingsPage.systemSettingsTile.tileTitle,
      onTap: () => context.router.push(const SystemSettingsRoute()),
    );
  }
}

class _TileGratitudeWidget extends ConsumerWidget {
  const _TileGratitudeWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(SettingPagePresenter.tr);

    return TileSetting(
      leading: AppIcons.gratitudeTile,
      title: t.settingsPage.gratitudeTile.tileTitle,
      onTap: () => context.router.push(const GratitudeRoute()),
    );
  }
}

class _TileAboutAppWidget extends ConsumerWidget {
  const _TileAboutAppWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(SettingPagePresenter.tr);

    return TileSetting(
      leading: AppIcons.aboutAppTile,
      title: t.settingsPage.aboutAppTile.tileTitle,
      onTap: () async =>
          ref.read(SettingPagePresenter.instance).dialogAboutApp(context),
      onLongPress: () =>
          ref.read(SettingPagePresenter.instance).dialogAppDebug(context),
    );
  }
}
