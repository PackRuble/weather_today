import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/const/app_icons.dart';
import 'package:weather_today/core/controllers/general_settings_controller.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';
import 'package:weather_today/core/controllers/weather_service_controllers.dart';
import 'package:weather_today/i18n/translations.g.dart';
import 'package:weather_today/i18n/translations_enum.dart';
import 'package:weather_today/ui/const/app_dialogs.dart';

import '../../shared/dialogs_widget.dart';
import '../main_page/model/homepage_index_model.dart';

/// Контроллер страницы настроек.
class SettingPageController {
  SettingPageController(this._reader);

  final Reader _reader;

  /// экземпляр.
  static final pr = Provider.autoDispose<SettingPageController>(
      (ref) => SettingPageController(ref.read));

  /// Провайдер возвращает translate.
  static final tr = Provider.autoDispose<TranslationsRu>(
      (ref) => ref.watch(AppLocalize.currentTranslation));

  //============================================================================
  // текущий язык погодных условий

  /// {@macro weather_settings.weather_language}
  static final currentLanguage = Provider.autoDispose<WeatherLanguage>(
      (ref) => ref.watch(WeatherServices.currentLanguage));

  //============================================================================
  // Единицы измерения температуры

  static final tempUnits =
      Provider.autoDispose<Temp>((ref) => ref.watch(WeatherServices.tempUnits));

  /// Диалог - Выбрать единицы измерения температуры.
  Future<void> dialogSetTempUnits(BuildContext context) async {
    final t = _reader(tr);

    final Temp units = _reader(tempUnits);
    final Temp? _newUnits = await showChoosingDialog<Temp>(
      context,
      icon: const Icon(AppIcons.tempUnitsTile),
      title: t.settingsPage.tempTile.dialogTitle,
      subTitle: t.settingsPage.tempTile.dialogSub,
      listDialogOption: List.generate(Temp.values.length, (int index) {
        final Temp item = Temp.values[index];
        return DialogOption<Temp>(
            groupValue: units, title: item.fullNameTr, value: item);
      }),
    );

    if (_newUnits != null) {
      await _reader(WeatherServices.pr).setTempUnits(_newUnits);
    }
  }

  //============================================================================
  // Единицы измерения давления

  static final pressureUnits = Provider.autoDispose<Pressure>(
      (ref) => ref.watch(WeatherServices.pressureUnits));

  /// Диалог - Выбрать единицы измерения давления.
  Future<void> dialogSetPressureUnits(BuildContext context) async {
    final t = _reader(tr);

    final Pressure units = _reader(pressureUnits);
    final Pressure? _newUnits = await showChoosingDialog<Pressure>(
      context,
      icon: const Icon(AppIcons.pressure),
      title: t.settingsPage.pressureTile.dialogTitle,
      subTitle: t.settingsPage.pressureTile.dialogSub,
      listDialogOption: List.generate(Pressure.values.length, (int index) {
        final Pressure item = Pressure.values[index];
        return DialogOption<Pressure>(
            groupValue: units, title: item.nameTr, value: item);
      }),
    );

    if (_newUnits != null) {
      await _reader(WeatherServices.pr).setPressureUnits(_newUnits);
    }
  }

  //============================================================================
  // speed units

  static final speedUnits = Provider.autoDispose<Speed>(
      (ref) => ref.watch(WeatherServices.speedUnits));

  /// Диалог - Выбрать единицы измерения скорости.
  Future<void> dialogSetSpeedUnits(BuildContext context) async {
    final t = _reader(tr);

    final Speed units = _reader(speedUnits);

    final Speed? _newUnits = await showChoosingDialog<Speed>(
      context,
      icon: const Icon(AppIcons.speedUnitsTile),
      title: t.settingsPage.speedTile.dialogTitle,
      subTitle: t.settingsPage.speedTile.dialogSub,
      listDialogOption: List.generate(Speed.values.length, (int index) {
        final Speed item = Speed.values[index];
        return DialogOption<Speed>(
            groupValue: units, title: item.abbrTr, value: item);
      }),
    );

    if (_newUnits != null) {
      await _reader(WeatherServices.pr).setSpeedUnits(_newUnits);
    }
  }

  //============================================================================
  // locale

  /// текущая локаль
  static final currentLocale = Provider.autoDispose<AppLocale>(
      (ref) => ref.watch(AppLocalize.currentLocale));

  /// Диалог - Установить новую locale.
  Future<void> dialogSetLocale(BuildContext context) async {
    final t = _reader(tr);

    final AppLocale locale = _reader(currentLocale);

    final AppLocale? _newLocale = await showChoosingDialog<AppLocale>(
      context,
      icon: const Icon(AppIcons.localeTile),
      title: t.settingsPage.localeTile.dialogTitle,
      subTitle: t.settingsPage.localeTile.dialogSub,
      listDialogOption: List.generate(AppLocale.values.length, (int index) {
        final AppLocale item = AppLocale.values[index];
        return DialogOption<AppLocale>(
            groupValue: locale, title: item.nameTr, value: item);
      }),
    );

    if (_newLocale != null) {
      await _reader(AppLocalize.pr).setLocale(_newLocale);
    }
  }

  //============================================================================
  // Homepage index

  static final startPageIndex = Provider.autoDispose<HomepageIndex>(
      (ref) => ref.watch(AppGeneralSettings.startPageIndex));

  /// Диалог - Выбрать стартовую страницу.
  Future<void> dialogSetHomepage(BuildContext context) async {
    final t = _reader(tr);

    final HomepageIndex page = _reader(startPageIndex);

    final HomepageIndex? _newPage = await showChoosingDialog<HomepageIndex>(
      context,
      icon: const Icon(AppIcons.homepageTile),
      title: t.settingsPage.homepageTile.dialogTitle,
      subTitle: t.settingsPage.homepageTile.dialogSub,
      listDialogOption: List.generate(HomepageIndex.values.length, (int index) {
        final HomepageIndex item = HomepageIndex.values[index];
        return DialogOption<HomepageIndex>(
            groupValue: page, title: item.nameTr, value: item);
      }),
    );

    if (_newPage != null) {
      await _reader(AppGeneralSettings.pr).setStartPageIndex(_newPage);
    }
  }

  /// Диалог - Об приложении.
  Future<void> dialogAboutApp(BuildContext context) async =>
      AppDialogs.aboutApp(context);
}
