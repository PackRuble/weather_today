import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// Набор константных тем для приложения.
class AppThemeScheme {
  AppThemeScheme._();

  /// Returns the light theme based on properties passed to it.
  static FlexColorScheme light({
    required FlexSchemeData usedTheme,
    required bool swapColors,
    required bool useMaterial3,
    required Typography typography,
    required String fontFamily,
  }) {
    final FlexColorScheme _flexScheme = FlexColorScheme.light(
      colors: usedTheme.light,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 10,
      appBarOpacity: 0.85,
      appBarElevation: 6.0,
      swapColors: swapColors,
      appBarStyle: FlexAppBarStyle.primary,
      subThemesData: const FlexSubThemesData(
        blendOnLevel: 20,
        defaultRadius: 8.0,
        bottomSheetRadius: 8.0,
        textButtonRadius: 10.0,
        elevatedButtonRadius: 10.0,
        outlinedButtonRadius: 10.0,
        toggleButtonsRadius: 10.0,
        unselectedToggleIsColored: true,
        inputDecoratorRadius: 12.0,
        fabRadius: 10.0,
        chipSchemeColor: SchemeColor.primary,
        chipRadius: 10.0,
        cardRadius: 8.0,
        popupMenuOpacity: 0.90,
        popupMenuRadius: 10.0,
        dialogRadius: 10.0,
        timePickerDialogRadius: 10.0,
        bottomNavigationBarOpacity: 0.90,
        bottomNavigationBarElevation: 8.0,
        navigationBarIndicatorOpacity: 0.19,
        navigationBarOpacity: 0.90,
        navigationBarHeight: 60.0,
      ),
      useMaterial3ErrorColors: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: useMaterial3,
      typography: typography,
      fontFamily: fontFamily,
    );

    // ignore: unused_local_variable
    final ColorScheme _colorScheme = _flexScheme.toScheme;

    // _flexScheme.toTheme.iconTheme.copyWith(color: _flexScheme.secondary);

    return _flexScheme.copyWith();
  }

  /// Returns the dark theme based on properties passed to it.
  static FlexColorScheme dark({
    required FlexSchemeData usedTheme,
    required bool swapColors, // замена цветов Primary and Secondary
    required bool
        swapDarkMainAndContainerColors, // замена Main Colors на их Container
    required int darkLevel, // Насыщенность серого
    required bool darkIsTrueBlack, // Настоящий черный
    required bool useMaterial3, // Некоторые спецэффекты Material Design 3
    required Typography typography,
    required String fontFamily,
  }) =>
      FlexColorScheme.dark(
        colors: usedTheme.light.defaultError
            .toDark(darkLevel, swapDarkMainAndContainerColors),
        surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
        blendLevel: 10,
        appBarOpacity: 0.90,
        appBarElevation: 8.0,
        swapColors: swapColors,
        darkIsTrueBlack: darkIsTrueBlack,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          defaultRadius: 8.0,
          bottomSheetRadius: 8.0,
          textButtonRadius: 10.0,
          elevatedButtonRadius: 10.0,
          outlinedButtonRadius: 10.0,
          toggleButtonsRadius: 10.0,
          unselectedToggleIsColored: true,
          inputDecoratorRadius: 12.0,
          fabRadius: 10.0,
          chipSchemeColor: SchemeColor.primary,
          chipRadius: 10.0,
          cardRadius: 8.0,
          popupMenuOpacity: 0.90,
          popupMenuRadius: 10.0,
          dialogRadius: 10.0,
          timePickerDialogRadius: 10.0,
          bottomNavigationBarOpacity: 0.90,
          bottomNavigationBarElevation: 8.0,
          navigationBarIndicatorOpacity: 0.19,
          navigationBarOpacity: 0.90,
          navigationBarHeight: 60.0,
        ),
        useMaterial3ErrorColors: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true, //useMaterial3,
        typography: typography,
        fontFamily: fontFamily,
      );

  static List<FlexSchemeData> schemes = FlexColor.schemesList;
}
