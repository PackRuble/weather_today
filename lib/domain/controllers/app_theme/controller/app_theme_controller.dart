import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/domain/controllers/utils/state_updater.dart';
import 'package:weather_today/domain/services/local_storage/data_base_controller.dart';
import 'package:weather_today/domain/services/local_storage/interface/data_base.dart';
import 'package:weather_today/domain/services/local_storage/key_store.dart';

import '../../../../application/theme/app_theme_scheme.dart';
import '../models/models.dart';

/// Представляет контроллер темы приложения.
class AppTheme with Updater {
  const AppTheme(this.ref);

  @override
  final Ref ref;

  @override
  DataBase get db => ref.read(dbService);

  static final instance = Provider(AppTheme.new, name: '$AppTheme/instance');

  Future<void> init() async {
    await loadAndUpdate<double, double>(textScaleFactor,
        DbStore.textScaleFactor, DbStore.textScaleFactorDefault);
    await loadAndUpdate<AppScrollPhysics, int>(
        scrollPhysics,
        DbStore.scrollPhysics,
        DbStore.scrollPhysicsDefault,
        _conversionScrollPhysics);
    await loadAndUpdate<AppTypography, int>(typography, DbStore.typography,
        DbStore.typographyDefault, _conversionTypography);
    await loadAndUpdate<AppFontFamily, String>(fontFamily, DbStore.fontFamily,
        DbStore.fontFamilyDefault, _conversionFontFamily);
    await loadAndUpdate<FlexSchemeData, int>(
        currentThemeScheme,
        DbStore.themeScheme,
        DbStore.themeSchemeDefault,
        _conversionThemeScheme);
    await loadAndUpdate<ThemeMode, int>(themeMode, DbStore.themeMode,
        DbStore.themeModeDefault, _conversionThemeMode);
    await loadAndUpdate<bool, bool>(
        swapColors, DbStore.swapColorsTheme, DbStore.swapColorsThemeDefault);
    await loadAndUpdate<bool, bool>(
        swapDarkMainAndContainerColors,
        DbStore.swapDarkMainAndContainerColors,
        DbStore.swapDarkMainAndContainerColorsDefault);
    await loadAndUpdate<int, int>(
        darkLevel, DbStore.darkLevelTheme, DbStore.darkLevelThemeDefault);
    await loadAndUpdate<bool, bool>(darkIsTrueBlack, DbStore.darkIsTrueBlack,
        DbStore.darkIsTrueBlackDefault);
    await loadAndUpdate<bool, bool>(
        useMaterial3, DbStore.useMaterial3, DbStore.useMaterial3Default);
  }

  // TextScaleFactor
  // ---------------------------------------------------------------------------

  /// Текстовый масштаб в приложении.
  static final textScaleFactor = StateProvider<double>(
    (ref) => DbStore.textScaleFactorDefault,
    name: '$AppTheme/textScaleFactor',
  );

  /// Установить новый текстовый масштаб [textScaleFactor].
  Future<void> setTextScaleFactor(double value) async =>
      saveAndUpdate<double>(textScaleFactor, DbStore.textScaleFactor, value);

  // AppScrollPhysics
  // ---------------------------------------------------------------------------

  /// The type of scroll in the application.
  ///
  /// Change via [setScrollPhysics].
  ///
  static final scrollPhysics = StateProvider<AppScrollPhysics>(
    (ref) => _conversionScrollPhysics(DbStore.scrollPhysicsDefault),
    name: '$AppTheme/scrollPhysics',
  );

  static AppScrollPhysics _conversionScrollPhysics(int value) =>
      AppScrollPhysics.values[value];

  /// Set a new scroll type [scrollPhysics].
  Future<void> setScrollPhysics(AppScrollPhysics scroll) async {
    update<AppScrollPhysics>(scrollPhysics, scroll);
    await saveDb(DbStore.scrollPhysics, scroll.index);
  }

  // AppTypography
  // ---------------------------------------------------------------------------

  /// Типографика.
  ///
  /// Изменить через [setTypography].
  ///
  static final typography = StateProvider<AppTypography>(
    (ref) => _conversionTypography(DbStore.typographyDefault),
    name: '$AppTheme/typography',
  );

  static AppTypography _conversionTypography(int value) =>
      AppTypography.values[value];

  /// Установить новую Типографику [typography].
  Future<void> setTypography(AppTypography typo) async {
    update<AppTypography>(typography, typo);
    await saveDb(DbStore.typography, typo.index);
  }

  // ---------------------------------------------------------------------------
  // AppFontFamily
  // ---------------------------------------------------------------------------

  /// Семейство шрифтов.
  ///
  /// Изменять через [setFontFamily].
  ///
  static final fontFamily = StateProvider<AppFontFamily>(
    (ref) => _conversionFontFamily(DbStore.fontFamilyDefault),
    name: '$AppTheme/fontFamily',
  );

  static AppFontFamily _conversionFontFamily(String value) =>
      AppFontFamily.getFontFamily(value);

  /// Установить новое семейство шрифтов [fontFamily].
  Future<void> setFontFamily(AppFontFamily font) async {
    update<AppFontFamily>(fontFamily, font);
    await saveDb<String>(DbStore.fontFamily, font.fontFamily);
  }

  // Цветовая тема приложения
  // ---------------------------------------------------------------------------

  static final currentThemeScheme = StateProvider<FlexSchemeData>(
    (ref) => _conversionThemeScheme(DbStore.themeSchemeDefault),
    name: '$AppTheme/currentThemeScheme',
  );

  static FlexSchemeData _conversionThemeScheme(int index) =>
      AppThemeScheme.schemes[index];

  /// Установить новую цветовую схему приложения.
  Future<void> setThemeScheme(int index) async {
    update<FlexSchemeData>(currentThemeScheme, _conversionThemeScheme(index));
    await saveDb(DbStore.themeScheme, index);
  }

  // Цветовая тема приложения
  // ---------------------------------------------------------------------------

  /// Светлый/темный/системный режим приложения.
  static final themeMode = StateProvider<ThemeMode>(
    (ref) => _conversionThemeMode(DbStore.themeModeDefault),
    name: '$AppTheme/themeMode',
  );

  static ThemeMode _conversionThemeMode(int index) => ThemeMode.values[index];

  /// Переключатель системной/светлой/темной темы.
  Future<void> setThemeMode(ThemeMode mode) async {
    update<ThemeMode>(themeMode, mode);
    await saveDb(DbStore.themeMode, mode.index);
  }

  // Swap primary and secondary
  // ---------------------------------------------------------------------------

  /// Swap primary and secondary, and their container colors.
  static final swapColors = StateProvider<bool>(
    (ref) => DbStore.swapColorsThemeDefault,
    name: '$AppTheme/swapColors',
  );

  /// Swap primary and secondary, and their container colors.
  Future<void> toggleSwapColors(bool swap) async =>
      saveAndUpdate<bool>(swapColors, DbStore.swapColorsTheme, swap);

  // Computed dark swaps main and container.
  // ---------------------------------------------------------------------------

  /// Computed dark swaps main and container.
  static final swapDarkMainAndContainerColors = StateProvider<bool>(
    (ref) => DbStore.swapDarkMainAndContainerColorsDefault,
    name: '$AppTheme/swapDarkMainAndContainerColors',
  );

  Future<void> toggleDarkSwapColors(bool swap) async => saveAndUpdate<bool>(
      swapDarkMainAndContainerColors,
      DbStore.swapDarkMainAndContainerColors,
      swap);

  // Оттенки черного.
  // ---------------------------------------------------------------------------

  /// Оттенки черного.
  static final darkLevel = StateProvider<int>(
    (ref) => DbStore.darkLevelThemeDefault,
    name: '$AppTheme/darkLevel',
  );

  /// Установить степень насыщенности 0-100%.
  Future<void> setDarkLevel(int value) async =>
      saveAndUpdate<int>(darkLevel, DbStore.darkLevelTheme, value);

  // Настоящий черный цвет.
  // ---------------------------------------------------------------------------

  /// Настоящий черный цвет.
  static final darkIsTrueBlack = StateProvider<bool>(
    (ref) => DbStore.darkIsTrueBlackDefault,
    name: '$AppTheme/darkIsTrueBlack',
  );

  Future<void> toggleDarkIsTrueBlack(bool value) async =>
      saveAndUpdate<bool>(darkIsTrueBlack, DbStore.darkIsTrueBlack, value);

  // Material Design 3.
  // ---------------------------------------------------------------------------

  /// Новшества в цветах и спецэффектах Material Design 3.
  static final useMaterial3 = StateProvider<bool>(
    (ref) => DbStore.useMaterial3Default,
    name: '$AppTheme/useMaterial3',
  );

  Future<void> toggleUseMaterial3(bool value) async =>
      saveAndUpdate<bool>(useMaterial3, DbStore.useMaterial3, value);

  // Theme
  // ---------------------------------------------------------------------------

  /// Текущая используемая тема исходя из ThemeMode.
  ///
  /// isDark получаем исходя из Brightness.dark == Theme.of(context).brightness.
  static final usingThemeNow =
      Provider.autoDispose.family<FlexColorScheme, bool>(
    (ref, bool isDark) => isDark ? ref.watch(darkTheme) : ref.watch(lightTheme),
    name: '$AppTheme/usingThemeNow',
  );

  // Светлая и темная темы.
  // ---------------------------------------------------------------------------

  /// Текущая светлая тема приложения.
  static final lightTheme = Provider<FlexColorScheme>((ref) {
    return AppThemeScheme.light(
      usedTheme: ref.watch(currentThemeScheme),
      swapColors: ref.watch(swapColors),
      useMaterial3: ref.watch(useMaterial3),
      typography: ref.watch(typography).typography,
      fontFamily: ref.watch(fontFamily).fontFamily,
    );
  });

  /// Текущая темная тема приложения.
  static final darkTheme = Provider<FlexColorScheme>((ref) {
    return AppThemeScheme.dark(
      usedTheme: ref.watch(currentThemeScheme),
      swapColors: ref.watch(swapColors),
      swapDarkMainAndContainerColors: ref.watch(swapDarkMainAndContainerColors),
      useMaterial3: ref.watch(useMaterial3),
      darkIsTrueBlack: ref.watch(darkIsTrueBlack),
      darkLevel: ref.watch(darkLevel),
      typography: ref.watch(typography).typography,
      fontFamily: ref.watch(fontFamily).fontFamily,
    );
  });

  /// Отдельная тема для определения darkLevel.
  ///
  /// Используется как обходной путь для установки darkLevel.
  static final darkThemeTestedDarkLevel =
      Provider.autoDispose.family<FlexColorScheme, int>((ref, darkLevel) {
    return AppThemeScheme.dark(
      usedTheme: ref.watch(currentThemeScheme),
      swapColors: ref.watch(swapColors),
      swapDarkMainAndContainerColors: ref.watch(swapDarkMainAndContainerColors),
      useMaterial3: ref.watch(useMaterial3),
      darkIsTrueBlack: ref.watch(darkIsTrueBlack),
      darkLevel: darkLevel,
      typography: ref.watch(typography).typography,
      fontFamily: ref.watch(fontFamily).fontFamily,
    );
  });

  Future<void> resetThemeToDefaultSettings() async {
    await Future.wait([
      db.clearKey(DbStore.themeScheme),
      db.clearKey(DbStore.themeMode),
      db.clearKey(DbStore.swapColorsTheme),
      db.clearKey(DbStore.swapDarkMainAndContainerColors),
      db.clearKey(DbStore.darkLevelTheme),
      db.clearKey(DbStore.darkIsTrueBlack),
      db.clearKey(DbStore.useMaterial3),
    ]);

    await init();
  }

  Future<void> resetVisualDesignToDefaultSettings() async {
    await Future.wait([
      db.clearKey(DbStore.textScaleFactor),
      db.clearKey(DbStore.scrollPhysics),
      db.clearKey(DbStore.typography),
      db.clearKey(DbStore.fontFamily),
    ]);

    await init();
  }
}
