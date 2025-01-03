// ignore_for_file: discarded_futures

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/application/const/app_icons.dart';
import 'package:weather_today/application/const/app_info.dart';
import 'package:weather_today/application/i18n/translations_enum.dart';
import 'package:weather_today/application/navigation/routes.gr.dart';
import 'package:weather_today/domain/controllers/app_theme/controller/app_theme_controller.dart';
import 'package:weather_today/domain/controllers/general_settings_controller.dart';
import 'package:weather_today/domain/controllers/geocoding_provider_nr.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/weather_provider_nr.dart';
import 'package:weather_today/ui/dialogs/app_dialogs.dart';
import 'package:weather_today/ui/pages/settings/settings_page_presenter.dart';
import 'package:weather_today/ui/shared/settings_tile.dart';

import '../../shared/shared_widget.dart';

const double _dividerThickness = 8.0;

/// Страница настроек приложения.
class SettingsPage extends ConsumerWidget {
  const SettingsPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      children: <Widget>[
        HeaderRWidget(ref.tr.settingsPage.headers.weather),
        const _TileMyPlaceWidget(),
        const _TileTempUnitsWidget(),
        const _TileSpeedUnitsWidget(),
        const _TilePressureUnitsWidget(),
        const _TileWeatherProviderWidget(),
        const _GeocodingProviderTile(),
        const Divider(thickness: _dividerThickness),
        HeaderRWidget(ref.tr.settingsPage.headers.design),
        const _VisualDesignTileWidget(),
        const _TileThemeWidget(),
        const Divider(thickness: _dividerThickness),
        HeaderRWidget(ref.tr.settingsPage.headers.general),
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
    return TileSetting(
      leading: AppIcons.savedPlaceTile,
      title: ref.tr.settingsPage.savedPlacesTile.tileTitle,
      onTap: () => context.pushRoute(const SavedPlacesRoute()),
    );
  }
}

class _TileTempUnitsWidget extends ConsumerWidget {
  const _TileTempUnitsWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final units = ref.watch(SettingPagePresenter.tempUnits).abbr;

    return TileSetting(
      leading: AppIcons.tempUnitsTile,
      title: ref.tr.settingsPage.tempTile.tileTitle,
      subtitle: ref.tr.settingsPage.tempTile.tileSub(units: units),
      onTap: () async =>
          ref.read(SettingPagePresenter.instance).dialogSetTempUnits(context),
    );
  }
}

class _TileSpeedUnitsWidget extends ConsumerWidget {
  const _TileSpeedUnitsWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final units = ref.watch(SettingPagePresenter.speedUnits).abbrTr;

    return TileSetting(
      leading: AppIcons.speedUnitsTile,
      title: ref.tr.settingsPage.speedTile.tileTitle,
      subtitle: ref.tr.settingsPage.pressureTile.tileSub(units: units),
      onTap: () async =>
          ref.read(SettingPagePresenter.instance).dialogSetSpeedUnits(context),
    );
  }
}

class _TilePressureUnitsWidget extends ConsumerWidget {
  const _TilePressureUnitsWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final units = ref.watch(SettingPagePresenter.pressureUnits).abbrTr;

    return TileSetting(
      leading: AppIcons.pressureUnitsTile,
      title: ref.tr.settingsPage.pressureTile.tileTitle,
      subtitle: ref.tr.settingsPage.pressureTile.tileSub(units: units),
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
    final weatherProviderPR = WeatherProviderNR.i;
    final weatherProvider = ref.watch(weatherProviderPR);

    return TileSetting(
      leading: AppIcons.weatherProvider,
      title: ref.tr.ui.weatherProvider,
      subtitle: weatherProvider.website,
      onTap: () => context.pushRoute(const WeatherProviderRoute()),
    );
  }
}

class _GeocodingProviderTile extends ConsumerWidget {
  const _GeocodingProviderTile();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final geocodingProviderPR = GeocodingProviderNR.i;
    final geocodingProviderNR = ref.watch(geocodingProviderPR.notifier);
    final geocodingProvider = ref.watch(geocodingProviderPR);

    return TileSetting(
      leading: AppIcons.geocodingProvider,
      title: ref.tr.ui.geocodingProvider,
      subtitle: geocodingProvider.website,
      onTap: () async {
        final selected = await AppDialogs.selectGeocodingProvider(
          context,
          ref,
          geocodingProvider,
        );

        if (selected != null) await geocodingProviderNR.change(selected);
      },
    );
  }
}

//==============================================================================

class _VisualDesignTileWidget extends ConsumerWidget {
  const _VisualDesignTileWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TileSetting(
      leading: AppIcons.visualDesignTile,
      title: ref.tr.settingsPage.visualDesignTile.tileTitle,
      onTap: () => context.pushRoute(const VisualDesignRoute()),
    );
  }
}

class _TileThemeWidget extends ConsumerWidget {
  const _TileThemeWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schemeData = ref.watch(AppTheme.currentThemeScheme);

    return TileSetting(
      leading: AppIcons.themeTile,
      title: ref.tr.settingsPage.themeTile.tileTitle,
      subtitle: schemeData.name,
      onTap: () => context.pushRoute(const ThemeRoute()),
    );
  }
}

//==============================================================================

class _TileCountryFlagsWidget extends ConsumerWidget {
  const _TileCountryFlagsWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TileSetting(
      leading: AppIcons.countryFlagsTile,
      title: ref.tr.settingsPage.countryFlagsTile.tileTitle,
      onTap: () => context.pushRoute(const CountryFlagsRoute()),
    );
  }
}

class _TileHomepageIndexWidget extends ConsumerWidget {
  const _TileHomepageIndexWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageName = ref.watch(AppGeneralSettings.startPageIndex).nameTr;

    return TileSetting(
      leading: AppIcons.homepageTile,
      title: ref.tr.settingsPage.homepageTile.tileTitle,
      subtitle: ref.tr.settingsPage.homepageTile.tileSub(homepage: pageName),
      onTap: () async =>
          ref.read(SettingPagePresenter.instance).dialogSetHomepage(context),
    );
  }
}

class _TileLocaleAppWidget extends ConsumerWidget {
  const _TileLocaleAppWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = ref.watch(SettingPagePresenter.currentLocale).nameTr;

    return TileSetting(
      leading: AppIcons.localeTile,
      title: ref.tr.settingsPage.localeTile.tileTitle,
      subtitle: ref.tr.settingsPage.localeTile.tileSub(locale: locale),
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
    return TileSetting(
      leading: AppIcons.systemSettingsTile,
      title: ref.tr.settingsPage.systemSettingsTile.tileTitle,
      onTap: () => context.pushRoute(const SystemSettingsRoute()),
    );
  }
}

class _TileGratitudeWidget extends ConsumerWidget {
  const _TileGratitudeWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TileSetting(
      leading: AppIcons.gratitudeTile,
      title: ref.tr.settingsPage.gratitudeTile.tileTitle,
      onTap: () => context.pushRoute(const GratitudeRoute()),
    );
  }
}

class _TileAboutAppWidget extends ConsumerWidget {
  const _TileAboutAppWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TileSetting(
      leading: AppIcons.aboutAppTile,
      title: ref.tr.settingsPage.aboutAppTile.tileTitle,
      onTap: () async =>
          ref.read(SettingPagePresenter.instance).dialogAboutApp(context),
      onLongPress: () =>
          ref.read(SettingPagePresenter.instance).dialogAppDebug(context),
    );
  }
}
