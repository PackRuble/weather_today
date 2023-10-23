// ignore_for_file: discarded_futures

import 'package:auto_route/auto_route.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/application/const/app_icons.dart';
import 'package:weather_today/application/i18n/translations_enum.dart';
import 'package:weather_today/application/navigation/routes.gr.dart';
import 'package:weather_today/domain/controllers/app_theme/controller/app_theme_controller.dart';
import 'package:weather_today/domain/controllers/general_settings_controller.dart';
import 'package:weather_today/ui/pages/settings/settings_page_presenter.dart';

import '../../shared/shared_widget.dart';

const double _indent = 16.0;
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
        const _TileWeatherLanguageWidget(),
        const _TileUserApiWidget(),
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

class _TileSetting extends StatelessWidget {
  const _TileSetting({
    // ignore: unused_element
    super.key,
    required this.leading,
    required this.title,
    this.subtitle,
    // ignore: unused_element
    this.trailing,
    required this.onTap,
    this.onLongPress,
  });

  final IconData leading;
  final String title;
  final String? subtitle;
  final IconData? trailing;
  final Function() onTap;
  final Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: _indent),
      horizontalTitleGap: 16.0,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Icon>[
          Icon(
            leading,
            color: IconTheme.of(context).color,
          )
        ],
      ),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            trailing ?? Icons.chevron_right,
            color: IconTheme.of(context).color,
          ),
        ],
      ),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}

class _TileMyPlaceWidget extends ConsumerWidget {
  const _TileMyPlaceWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(SettingPagePresenter.tr);

    return _TileSetting(
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

    return _TileSetting(
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

    return _TileSetting(
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

    return _TileSetting(
      leading: AppIcons.pressureUnitsTile,
      title: t.settingsPage.pressureTile.tileTitle,
      subtitle: t.settingsPage.pressureTile.tileSub(units: units),
      onTap: () async => ref
          .read(SettingPagePresenter.instance)
          .dialogSetPressureUnits(context),
    );
  }
}

class _TileWeatherLanguageWidget extends ConsumerWidget {
  const _TileWeatherLanguageWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(SettingPagePresenter.tr);

    final langName = ref.watch(SettingPagePresenter.currentLanguage).name;

    return _TileSetting(
      leading: AppIcons.weatherLangTile,
      title: t.settingsPage.weatherLangTile.tileTitle,
      subtitle: langName,
      onTap: () => context.router.push(const WeatherLanguageRoute()),
    );
  }
}

class _TileUserApiWidget extends ConsumerWidget {
  const _TileUserApiWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(SettingPagePresenter.tr);

    return _TileSetting(
      leading: AppIcons.apiTile,
      title: t.settingsPage.userApiTile.tileTitle,
      onTap: () => context.router.push(const UserApiRoute()),
    );
  }
}

//==============================================================================

class _VisualDesignTileWidget extends ConsumerWidget {
  const _VisualDesignTileWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(SettingPagePresenter.tr);

    return _TileSetting(
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

    return _TileSetting(
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

    return _TileSetting(
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

    return _TileSetting(
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

    return _TileSetting(
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

    return _TileSetting(
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

    return _TileSetting(
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

    return _TileSetting(
      leading: AppIcons.aboutAppTile,
      title: t.settingsPage.aboutAppTile.tileTitle,
      onTap: () async =>
          ref.read(SettingPagePresenter.instance).dialogAboutApp(context),
      onLongPress: () =>
          ref.read(SettingPagePresenter.instance).dialogAppDebug(context),
    );
  }
}
