import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:weather_today/const/app_insets.dart';

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
      // tabBarStyle: FlexTabBarStyle.forBackground,
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
        // dialogBackgroundSchemeColor: SchemeColor.background,
        timePickerDialogRadius: 10.0,
        // bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primary,
        // bottomNavigationBarSelectedIconSchemeColor: SchemeColor.primary,
        // bottomNavigationBarBackgroundSchemeColor: SchemeColor.onPrimary,
        bottomNavigationBarOpacity: 0.90,
        bottomNavigationBarElevation: 8.0,
        // navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
        // navigationBarSelectedIconSchemeColor: SchemeColor.primary,
        navigationBarIndicatorOpacity: 0.19,
        // navigationBarBackgroundSchemeColor: SchemeColor.onPrimary,
        navigationBarOpacity: 0.90,
        navigationBarHeight: 60.0,
      ),
      useMaterial3ErrorColors: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: useMaterial3,
      typography: typography,
      fontFamily: fontFamily,
    );
    // final FlexColorScheme _flexSchem = FlexColorScheme.light(
    //   colors: usedTheme,
    //   surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
    //   blendLevel: 15,
    //   appBarStyle: FlexAppBarStyle.primary,
    //   appBarOpacity: 0.70,
    //   appBarElevation: 2.0,
    //   swapColors: swapColors,
    //   subThemesData: const FlexSubThemesData(
    //     blendOnLevel: 20,
    //     toggleButtonsRadius: 8.0,
    //     unselectedToggleIsColored: true,
    //     inputDecoratorRadius: 8.0,
    //     fabUseShape: false,
    //     cardRadius: 8.0,
    //     popupMenuOpacity: 0.90,
    //     dialogRadius: 18.0,
    //     timePickerDialogRadius: 18.0,
    //     dialogBackgroundSchemeColor: SchemeColor.surfaceVariant,
    //     bottomNavigationBarBackgroundSchemeColor: SchemeColor.background,
    //   ),
    //   useMaterial3ErrorColors: true,
    //   visualDensity: FlexColorScheme.comfortablePlatformDensity,
    //   useMaterial3: useMaterial3,
    //   fontFamily: fontFamily,
    //   typography: typography,
    // );

    final ColorScheme _colorScheme = _flexScheme.toScheme;

    _flexScheme.toTheme.iconTheme.copyWith(color: _flexScheme.secondary);

    return _flexScheme.copyWith();

    // return _flexScheme.toTheme.copyWith(
    //   elevatedButtonTheme: elevatedButtonTheme(_colorScheme),
    //   outlinedButtonTheme:
    //       outlinedButtonTheme(_colorScheme, const Color(0x1F000000)),
    //   listTileTheme: listTileTheme(_colorScheme),
    //   textButtonTheme: textButtonTheme,
    //   toggleButtonsTheme: toggleButtonsTheme(_colorScheme),
    //   iconTheme: iconTheme(_colorScheme),
    // );
  }

  // static SnackBarThemeData snackBarTheme(ColorScheme scheme) =>
  //     SnackBarThemeData(
  //
  //     );

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
  }) {
    final FlexColorScheme _flexScheme = FlexColorScheme.dark(
      colors: usedTheme.light.defaultError
          .toDark(darkLevel, swapDarkMainAndContainerColors),
      // colors:
      //     usedTheme.toDark(darkLevel, swapDarkMainAndContainerColors),
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 10,
      appBarStyle: FlexAppBarStyle.background,
      appBarOpacity: 0.90,
      appBarElevation: 8.0,
      swapColors: swapColors,
      darkIsTrueBlack: darkIsTrueBlack,
      // tabBarStyle: FlexTabBarStyle.forBackground,
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
        // dialogBackgroundSchemeColor: SchemeColor.background,
        // appBarBackgroundSchemeColor: SchemeColor.onPrimary,
        // bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.primary,
        // bottomNavigationBarSelectedIconSchemeColor: SchemeColor.primary,
        // bottomNavigationBarBackgroundSchemeColor: SchemeColor.onPrimary,
        bottomNavigationBarOpacity: 0.90,
        bottomNavigationBarElevation: 8.0,
        // navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
        // navigationBarSelectedIconSchemeColor: SchemeColor.primary,
        navigationBarIndicatorOpacity: 0.19,
        // navigationBarBackgroundSchemeColor: SchemeColor.onPrimary,
        navigationBarOpacity: 0.90,
        navigationBarHeight: 60.0,
      ),
      useMaterial3ErrorColors: true,
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      useMaterial3: true, //useMaterial3,
      typography: typography,
      fontFamily: fontFamily,
      // To use the playground font, add GoogleFonts package and uncomment
      // fontFamily: GoogleFonts.notoSans().fontFamily,
    );
    // final FlexColorScheme _flexScheme1 = FlexColorScheme.dark(
    //   colors: usedTheme.toDark(darkLevel),
    //   surfaceMode: FlexSurfaceMode.highScaffoldLevelSurface,
    //   blendLevel: 7,
    //   appBarStyle: FlexAppBarStyle.primary,
    //   appBarOpacity: 0.80,
    //   swapColors: swapColors,
    //   darkIsTrueBlack: darkIsTrueBlack,
    //   subThemesData: const FlexSubThemesData(
    //     dialogBackgroundSchemeColor: SchemeColor.surfaceVariant,
    //     interactionEffects: true,
    //     useFlutterDefaults: false,
    //     blendOnColors: true,
    //     blendOnLevel: 30,
    //     toggleButtonsRadius: 8.0,
    //     unselectedToggleIsColored: true,
    //     inputDecoratorRadius: 8.0,
    //     fabUseShape: false,
    //     cardRadius: 8.0,
    //     popupMenuOpacity: 0.90,
    //     dialogRadius: 18.0,
    //     timePickerDialogRadius: 18.0,
    //     bottomNavigationBarBackgroundSchemeColor: SchemeColor.background,
    //   ),
    //   useMaterial3ErrorColors: true,
    //   visualDensity: FlexColorScheme.comfortablePlatformDensity,
    //   //todo splash color не соответствует цветовой схеме на старых устройствах
    //   useMaterial3: useMaterial3,
    //   fontFamily: fontFamily,
    //   typography: typography,
    // );

    final ColorScheme _colorScheme = _flexScheme.toScheme;

    return _flexScheme;

    // return _flexScheme.toTheme.copyWith(
    //   elevatedButtonTheme: elevatedButtonTheme(_colorScheme),
    //   outlinedButtonTheme: outlinedButtonTheme(
    //     _colorScheme,
    //     const Color(0x1FFFFFFF),
    //   ),
    //   listTileTheme: listTileTheme(_colorScheme),
    //   textButtonTheme: textButtonTheme,
    //   toggleButtonsTheme: toggleButtonsTheme(_colorScheme),
    //   iconTheme: iconTheme(_colorScheme),
    // );
  }

  static ElevatedButtonThemeData elevatedButtonTheme(ColorScheme scheme) =>
      ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              // primary: scheme.primary,
              // onPrimary: ThemeData.estimateBrightnessForColor(scheme.primary) ==
              //         Brightness.dark
              //     ? Colors.white
              //     : Colors.black,
              // minimumSize: minButtonSize,
              // shape: const StadiumBorder(),
              // padding: roundButtonPadding,
              // elevation: 0,
              ));

  static OutlinedButtonThemeData outlinedButtonTheme(
          ColorScheme scheme, Color disabledColor) =>
      OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
        minimumSize: minButtonSize,
        shape: const StadiumBorder(),
        padding: roundButtonPadding,
      ).copyWith(side: MaterialStateProperty.resolveWith<BorderSide?>(
              (Set<MaterialState> states) {
        if (states.contains(MaterialState.disabled)) {
          return BorderSide(
            // color: disabledColor,
            width: 0.5,
          );
        }
        if (states.contains(MaterialState.error)) {
          return BorderSide(
            // color: scheme.error,
            width: AppInsets.outlineThickness,
          );
        }
        return BorderSide(
          // color: scheme.primary,
          width: AppInsets.outlineThickness,
        );
      })));

  static TextButtonThemeData get textButtonTheme => TextButtonThemeData(
          style: TextButton.styleFrom(
        minimumSize: minButtonSize,
        shape: const StadiumBorder(),
        padding: roundButtonPadding,
      ));

  static const EdgeInsets roundButtonPadding = EdgeInsets.symmetric(
    horizontal: 16.0,
    vertical: 4.0,
  );

  static const Size minButtonSize = Size(88, 36);

  /// ToggleButtons theme
  static ToggleButtonsThemeData toggleButtonsTheme(ColorScheme colorScheme) =>
      ToggleButtonsThemeData(
        // selectedColor: colorScheme.onPrimary,
        // color: colorScheme.primary.withOpacity(0.85),
        // fillColor: colorScheme.primary.withOpacity(0.85),
        // hoverColor: colorScheme.primary.withOpacity(0.2),
        // focusColor: colorScheme.primary.withOpacity(0.3),
        borderWidth: AppInsets.outlineThickness,
        // borderColor: colorScheme.primary,
        // selectedBorderColor: colorScheme.primary,
        borderRadius: BorderRadius.circular(AppInsets.cornerRadiusButton),
      );

  /// ToggleButtons theme
  static IconThemeData iconTheme(ColorScheme colorScheme) => IconThemeData(
      // opacity: 0.95,
      // color: colorScheme.error,
      );

  /// ListTile theme
  static ListTileThemeData listTileTheme(ColorScheme colorScheme) =>
      ListTileThemeData(
          // selectedColor: colorScheme.onPrimaryContainer.withOpacity(0.85),
          // iconColor: colorScheme.onPrimaryContainer,
          // textColor: colorScheme.onPrimaryContainer,

          // selectedTileColor: ,
          // tileColor: ,

          // color: colorScheme.primary.withOpacity(0.85),
          // fillColor: colorScheme.primary.withOpacity(0.85),
          // hoverColor: colorScheme.primary.withOpacity(0.2),
          // focusColor: colorScheme.primary.withOpacity(0.3),
          // borderWidth: AppInsets.outlineThickness,
          // borderColor: colorScheme.primary,
          // selectedBorderColor: colorScheme.primary,
          // borderRadius: BorderRadius.circular(AppInsets.cornerRadius),
          );

  static List<FlexSchemeData> schemes = FlexColor.schemesList;
}
