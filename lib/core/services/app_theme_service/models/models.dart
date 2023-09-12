import 'package:flutter/material.dart';

/// Семейство шрифтов.
enum AppFontFamily {
  anonymousPro('Anonymous Pro'),
  caveat('Caveat'),
  lobster('Lobster'),
  marckScript('Marck Script'),
  merriweather('Merriweather'),
  montserrat('Montserrat'),
  neucha('Neucha'),
  notoSans('Noto Sans'),
  notoSansMono('Noto Sans Mono'),
  notoSerif('Noto Serif'),
  openSans('Open Sans'),
  oswald('Oswald'),
  pacifico('Pacifico'),
  raleway('Raleway');

  const AppFontFamily(this.fontFamily);

  final String fontFamily;

  static AppFontFamily getFontFamily(String fontFamily) =>
      AppFontFamily.values.firstWhere((font) => font.fontFamily == fontFamily);
}

enum AppTypography {
  material2014,
  material2018,
  material2021;

  Typography get typography => switch (index) {
        0 => Typography.material2014(),
        1 => Typography.material2018(),
        2 => Typography.material2021(),
        _ => Typography.material2021()
      };

  String toCamelCaseToWords() =>
      '${name.substring(0, 1).toUpperCase()}${name.substring(1, 8)} ${name.substring(8)}';
}

/// Физика скролла.
///
/// Значения:
/// 0 - BouncingScrollPhysics. Аналогичный эффект используется на iOS.
/// 1 - ClampingScrollPhysics. По умолчанию используется на Android.
enum AppScrollPhysics {
  bouncingScrollPhysics(
      BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics())),
  clampingScrollPhysics(
      ClampingScrollPhysics(parent: AlwaysScrollableScrollPhysics()));

  const AppScrollPhysics(this.scrollPhysics);

  final ScrollPhysics scrollPhysics;
}
