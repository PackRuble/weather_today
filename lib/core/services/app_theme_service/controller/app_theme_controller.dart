import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/const/key_store.dart';
import 'package:weather_today/core/services/local_db_service/data_base_controller.dart';
import 'package:weather_today/core/services/local_db_service/interface/i_data_base.dart';
import 'package:weather_today/utils/state_updater.dart';

import '../const/app_theme_scheme.dart';
import '../models/models.dart';

/// Представляет контроллер темы приложения.
class AppTheme with Updater {
  AppTheme(this.ref);

  @override
  final Ref ref;

  @override
  IDataBase get db => ref.read(dbService);

  static final instance = Provider(AppTheme.new);

  Future<void> init() async {
    await loadAndUpdate<AppVisualDesign, int>(
        visualDesign,
        DbStore.visualDesignApp,
        DbStore.visualDesignAppDefault,
        _conversionVisualDesign);
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

  // AppVisualDesign
  // ---------------------------------------------------------------------------

  /// Тема оформления главных страниц с погодой.
  static final visualDesign = StateProvider<AppVisualDesign>((ref) {
    return _conversionVisualDesign(DbStore.visualDesignAppDefault);
  });

  static AppVisualDesign _conversionVisualDesign(int value) =>
      AppVisualDesign.values[value];

  /// Установить новое визуальное оформление [visualDesign].
  Future<void> setVisualDesign(AppVisualDesign design) async {
    update<AppVisualDesign>(visualDesign, design);
    await saveDb(DbStore.visualDesignApp, design.index);
  }

  // TextScaleFactor
  // ---------------------------------------------------------------------------

  /// Текстовый масштаб в приложении.
  static final textScaleFactor =
      StateProvider<double>((ref) => DbStore.textScaleFactorDefault);

  /// Установить новый текстовый масштаб [textScaleFactor].
  Future<void> setTextScaleFactor(double value) async =>
      saveAndUpdate<double>(textScaleFactor, DbStore.textScaleFactor, value);

  // AppScrollPhysics
  // ---------------------------------------------------------------------------

  /// Тип скролла в приложении.
  ///
  /// Изменить через [setScrollPhysics].
  ///
  static final scrollPhysics = StateProvider<AppScrollPhysics>(
      (ref) => _conversionScrollPhysics(DbStore.scrollPhysicsDefault));

  static AppScrollPhysics _conversionScrollPhysics(int value) =>
      AppScrollPhysics.values[value];

  /// Установить новый тип скролла [scrollPhysics].
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
      (ref) => _conversionTypography(DbStore.typographyDefault));

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
      (ref) => _conversionFontFamily(DbStore.fontFamilyDefault));

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
      (ref) => _conversionThemeScheme(DbStore.themeSchemeDefault));

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
      (ref) => _conversionThemeMode(DbStore.themeModeDefault));

  static ThemeMode _conversionThemeMode(int index) => ThemeMode.values[index];

  /// Переключатель системной/светлой/темной темы.
  Future<void> setThemeMode(ThemeMode mode) async {
    update<ThemeMode>(themeMode, mode);
    await saveDb(DbStore.themeMode, mode.index);
  }

  // Swap primary and secondary
  // ---------------------------------------------------------------------------

  /// Swap primary and secondary, and their container colors.
  static final swapColors =
      StateProvider<bool>((ref) => DbStore.swapColorsThemeDefault);

  /// Swap primary and secondary, and their container colors.
  void toggleSwapColors(bool swap) =>
      saveAndUpdate<bool>(swapColors, DbStore.swapColorsTheme, swap);

  // Computed dark swaps main and container.
  // ---------------------------------------------------------------------------

  /// Computed dark swaps main and container.
  static final swapDarkMainAndContainerColors = StateProvider<bool>(
      (ref) => DbStore.swapDarkMainAndContainerColorsDefault);

  void toggleDarkSwapColors(bool swap) => saveAndUpdate<bool>(
      swapDarkMainAndContainerColors,
      DbStore.swapDarkMainAndContainerColors,
      swap);

  // Оттенки черного.
  // ---------------------------------------------------------------------------

  /// Оттенки черного.
  static final darkLevel =
      StateProvider<int>((ref) => DbStore.darkLevelThemeDefault);

  /// Установить степень насыщенности 0-100%.
  void setDarkLevel(int value) =>
      saveAndUpdate<int>(darkLevel, DbStore.darkLevelTheme, value);

  // Настоящий черный цвет.
  // ---------------------------------------------------------------------------

  /// Настоящий черный цвет.
  static final darkIsTrueBlack =
      StateProvider<bool>((ref) => DbStore.darkIsTrueBlackDefault);

  void toggleDarkIsTrueBlack(bool value) =>
      saveAndUpdate<bool>(darkIsTrueBlack, DbStore.darkIsTrueBlack, value);

  // Material Design 3.
  // ---------------------------------------------------------------------------

  /// Новшества в цветах и спецэффектах Material Design 3.
  static final useMaterial3 =
      StateProvider<bool>((ref) => DbStore.useMaterial3Default);

  void toggleUseMaterial3(bool value) =>
      saveAndUpdate<bool>(useMaterial3, DbStore.useMaterial3, value);

  // Theme
  // ---------------------------------------------------------------------------

  /// Текущая используемая тема исходя из ThemeMode.
  ///
  /// isDark получаем исходя из Brightness.dark == Theme.of(context).brightness.
  static final usingThemeNow = Provider.autoDispose
      .family<FlexColorScheme, bool>((ref, bool isDark) =>
          isDark ? ref.watch(darkTheme) : ref.watch(lightTheme));

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
}