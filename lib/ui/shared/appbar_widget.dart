import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
        if (addThemeButton) const ChangerThemeButton(),
        if (actions != null) ...actions!,
      ],
    );
  }
}
