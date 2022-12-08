import 'package:flutter/material.dart';

/// Авторский дизайн некоторых элементов главных страниц.
enum AppVisualDesign {
  byRuble,
  byTolskaya,
}

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

  Typography get typography {
    switch (index) {
      case 0:
        return Typography.material2014();
      case 1:
        return Typography.material2018();
      case 2:
        return Typography.material2021();
      default:
        return Typography.material2021();
    }
  }

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
