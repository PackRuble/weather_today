import 'package:flutter/material.dart';

class AppColors {
  AppColors.of(this.context);

  final BuildContext context;

  ThemeData get theme => Theme.of(context);

  ColorScheme get scheme => Theme.of(context).colorScheme;

  bool get isLight => theme.brightness == Brightness.light;

  // ===========================================================================
  // card colors

  Color get cardBorderColor => scheme.primaryContainer;

  Color get cardSelectedBorder =>
      isLight ? theme.primaryColorDark : scheme.primaryContainer;

  Color get cardColor => theme.cardColor;

  Color get cardSelectedColor =>
      isLight ? theme.primaryColorLight : theme.primaryColorDark;

  // ===========================================================================
  // chip colors

  Color get chipBorderColor => cardBorderColor;

  Color get chipColor => cardColor;

  Color get chipSelectedColor => cardSelectedColor;

  // ===========================================================================
  // tips colors

  Color get tipBackgroundColor => theme.dividerColor;

  Color get tipBorderColor => scheme.onSecondaryContainer;

  // ===========================================================================
  // appbar colors

  // Color get backgroundAppBar =>
  //     isLight ? theme.primaryColorLight : theme.primaryColorLight;

  /// Цвет акцента (progress indicator and etc.)
  Color get accentColorSearchbar => scheme.primary;

  /// Цвет выпадающей card.
  Color get backgroundColorSearchbar => theme.scaffoldBackgroundColor;

  /// Цвет тени.
  Color get shadowColorSearchbar => scheme.shadow;

  Color get borderColorSearchbar => scheme.primaryContainer.withOpacity(0.75);
}
