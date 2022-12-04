import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';

import 'theme_button.dart';

/// Кастомный AppBar для всех экранов приложения.
class RAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const RAppBar(
    this.title, {
    this.actions,
    this.addThemeButton = true,
    Key? key,
  }) : super(key: key);

  final String title;
  final List<Widget>? actions;

  final bool addThemeButton;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    // bug нельзя даже изменить цвет иконок, когда [useMaterial3=true], ждем исправления:
    // https://github.com/flutter/flutter/issues/110878

    // А пока что [useMaterial3=false] для appbar
    final bool isDark = Brightness.dark == theme.brightness;

    final FlexColorScheme nowFlexTheme =
        ref.watch(AppTheme.usingThemeNow(isDark)).copyWith(
              useMaterial3: false,
            );

    return Theme(
      data: nowFlexTheme.toTheme,
      child: AppBar(
        titleSpacing: 0.0,
        backgroundColor:
            theme.appBarTheme.backgroundColor, // remove, when fix _bug
        // actionsIconTheme: IconThemeData(color: Colors.blue),
        title: Text(
          title,
          overflow: TextOverflow.fade,
        ),
        actions: [
          if (addThemeButton) const ChangerThemeButton(),
          if (actions != null) ...actions!,
        ],
      ),
    );
  }
}
