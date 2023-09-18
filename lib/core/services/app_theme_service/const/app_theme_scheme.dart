import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

/// Набор константных тем для приложения.
class AppThemeScheme {
  AppThemeScheme._();

  static FlexSubThemesData get _subThemesDataLight => const FlexSubThemesData(
        useM2StyleDividerInM3: true,
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
      );

  // next: we're doing this until
  // [Unexpected Ink Splash with Material3 when navigating · Issue #119897 · flutter/flutter](https://github.com/flutter/flutter/issues/119897)
  static PageTransitionsTheme get pageTransitionsTheme {
    const builder = ZoomPageTransitionsBuilder(
      allowEnterRouteSnapshotting: false,
    );

    return const PageTransitionsTheme(
      builders: <TargetPlatform, PageTransitionsBuilder>{
        TargetPlatform.android: builder,
        TargetPlatform.windows: builder,
      },
    );
  }

  static FlexSubThemesData get _subThemesDataDark =>
      _subThemesDataLight.copyWith(
        blendOnLevel: 10,
      );

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
      subThemesData: _subThemesDataLight,
      useMaterial3ErrorColors: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: useMaterial3,
      typography: typography,
      fontFamily: fontFamily,
      pageTransitionsTheme: pageTransitionsTheme,
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
        subThemesData: _subThemesDataDark,
        useMaterial3ErrorColors: true,
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: useMaterial3,
        typography: typography,
        fontFamily: fontFamily,
        pageTransitionsTheme: pageTransitionsTheme,
      );

  static List<FlexSchemeData> schemes = FlexColor.schemesList;
}
