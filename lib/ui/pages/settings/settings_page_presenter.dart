import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/application/const/app_icons.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/application/i18n/translations_enum.dart';
import 'package:weather_today/application/navigation/routes.gr.dart';
import 'package:weather_today/domain/controllers/general_settings_controller.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';
import 'package:weather_today/domain/services/local_storage/key_store.dart';
import 'package:weather_today/ui/dialogs/app_dialogs.dart';

import '../../shared/dialogs_widget.dart';

/// [SettingsPage] presenter.
class SettingPagePresenter {
  SettingPagePresenter(this._ref);

  final Ref _ref;

  /// Instance of current class.
  static final instance = Provider.autoDispose(
    SettingPagePresenter.new,
    name: '$SettingPagePresenter',
  );

  //============================================================================
  // current weather language

  /// {@macro weather_settings.weather_language}
  static StateProvider<WeatherLanguage> get currentLanguage =>
      WeatherServices.currentLanguage;

  //============================================================================
  // Temperature units

  /// Units of temperature measurement.
  static StateProvider<Temp> get tempUnits => WeatherServices.tempUnits;

  /// Диалог - Выбрать единицы измерения температуры.
  Future<void> dialogSetTempUnits(BuildContext context) async {
    final Temp units = _ref.read(tempUnits);
    final Temp? _newUnits = await showChoosingDialog<Temp>(
      context,
      icon: const Icon(AppIcons.tempUnitsTile),
      title: _ref.tr.settingsPage.tempTile.dialogTitle,
      subTitle: _ref.tr.settingsPage.tempTile.dialogSub,
      listDialogOption: List.generate(Temp.values.length, (int index) {
        final Temp item = Temp.values[index];
        return DialogOption<Temp>(
            groupValue: units, title: item.fullNameTr, value: item);
      }),
    );

    if (_newUnits != null) {
      await _ref.read(WeatherServices.instance).setTempUnits(_newUnits);
    }
  }

  //============================================================================
  // Pressure units

  static StateProvider<Pressure> get pressureUnits =>
      WeatherServices.pressureUnits;

  /// Диалог - Выбрать единицы измерения давления.
  Future<void> dialogSetPressureUnits(BuildContext context) async {
    final Pressure units = _ref.read(pressureUnits);
    final Pressure? _newUnits = await showChoosingDialog<Pressure>(
      context,
      icon: const Icon(AppIcons.pressure),
      title: _ref.tr.settingsPage.pressureTile.dialogTitle,
      subTitle: _ref.tr.settingsPage.pressureTile.dialogSub,
      listDialogOption: List.generate(Pressure.values.length, (int index) {
        final Pressure item = Pressure.values[index];
        return DialogOption<Pressure>(
            groupValue: units, title: item.nameTr, value: item);
      }),
    );

    if (_newUnits != null) {
      await _ref.read(WeatherServices.instance).setPressureUnits(_newUnits);
    }
  }

  //============================================================================
  // speed units

  /// Units of velocity measurement.
  static StateProvider<Speed> get speedUnits => WeatherServices.speedUnits;

  /// Диалог - Выбрать единицы измерения скорости.
  Future<void> dialogSetSpeedUnits(BuildContext context) async {
    final Speed units = _ref.read(speedUnits);

    final Speed? _newUnits = await showChoosingDialog<Speed>(
      context,
      icon: const Icon(AppIcons.speedUnitsTile),
      title: _ref.tr.settingsPage.speedTile.dialogTitle,
      subTitle: _ref.tr.settingsPage.speedTile.dialogSub,
      listDialogOption: List.generate(Speed.values.length, (int index) {
        final Speed item = Speed.values[index];
        return DialogOption<Speed>(
            groupValue: units, title: item.abbrTr, value: item);
      }),
    );

    if (_newUnits != null) {
      await _ref.read(WeatherServices.instance).setSpeedUnits(_newUnits);
    }
  }

  //============================================================================
  // locale

  /// Current locale.
  static StateProvider<AppLocale> get currentLocale =>
      AppLocalization.currentLocale;

  /// Диалог - Установить новую locale.
  Future<void> dialogSetLocale(BuildContext context) async {
    final AppLocale locale = _ref.read(currentLocale);

    final AppLocale? _newLocale = await showChoosingDialog<AppLocale>(
      context,
      icon: const Icon(AppIcons.localeTile),
      title: _ref.tr.settingsPage.localeTile.dialogTitle,
      subTitle: _ref.tr.settingsPage.localeTile.dialogSub,
      listDialogOption: List.generate(AppLocale.values.length, (int index) {
        final AppLocale item = AppLocale.values[index];
        return DialogOption<AppLocale>(
            groupValue: locale, title: item.nameTr, value: item);
      }),
    );

    if (_newLocale != null) {
      await _ref.read(AppLocalization.instance).setLocale(_newLocale);
    }
  }

  //============================================================================
  // Homepage index

  static StateProvider<HomepageIndex> get startPageIndex =>
      AppGeneralSettings.startPageIndex;

  /// Диалог - Выбрать стартовую страницу.
  Future<void> dialogSetHomepage(BuildContext context) async {
    final page = _ref.read(startPageIndex);

    final _newPage = await showChoosingDialog<HomepageIndex>(
      context,
      icon: const Icon(AppIcons.homepageTile),
      title: _ref.tr.settingsPage.homepageTile.dialogTitle,
      subTitle: _ref.tr.settingsPage.homepageTile.dialogSub,
      listDialogOption: List.generate(HomepageIndex.values.length, (int index) {
        final HomepageIndex item = HomepageIndex.values[index];
        return DialogOption<HomepageIndex>(
            groupValue: page, title: item.nameTr, value: item);
      }),
    );

    if (_newPage != null) {
      await _ref.read(AppGeneralSettings.instance).setStartPageIndex(_newPage);
    }
  }

  /// Диалог - О приложении.
  Future<void> dialogAboutApp(BuildContext context) async =>
      AppDialogs.aboutApp(context);

  Future<void> dialogAppDebug(BuildContext context) async {
    await showSwitchedDialog(
      // ignore: use_build_context_synchronously
      context,
      title: 'Debug menu',
      listDialogOption: [
        DialogSwitch(
          title: 'Show intro again',
          subtitle: 'Turn on and restart to see the effect',
          value: await _ref
              .read(AppGeneralSettings.instance)
              // ignore: invalid_use_of_protected_member
              .loadDb(DbStore.showIntro, DbStore.showIntroDefault),
          onChanged: (bool value) {
            _ref.read(AppGeneralSettings.instance).setIsIntro(value, false);
          },
        ),
        DialogTile(
          title: 'Open logs screen',
          subtitle: 'You can see all the logs the application collects',
          onTap: () => context.router.push(const LogsRoute()),
        )
      ],
    );
  }
}
