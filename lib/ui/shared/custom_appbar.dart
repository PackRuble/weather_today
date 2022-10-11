import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/const/app_colors.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';

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
    final bool isLight = AppColors.of(context).isLight;

    final Widget themeButton = IconButton(
      onPressed: () => ref
          .read(AppTheme.instance)
          .setThemeMode(isLight ? ThemeMode.dark : ThemeMode.light),
      icon: Icon(isLight ? Icons.light_mode_rounded : Icons.nightlight_round),
    );

    // bug нельзя даже изменить цвет иконок, ждем исправления:
    // https://github.com/flutter/flutter/issues/110878
    return AppBar(
      titleSpacing: 0.0,
      // actionsIconTheme: IconThemeData(color: Colors.blue),
      title: Text(
        title,
        overflow: TextOverflow.fade,
      ),
      actions: [
        if (addThemeButton) themeButton,
        if (actions != null) ...actions!,
      ],
    );
  }
}
