import 'dart:collection';

import 'package:flutter/material.dart';

import 'theme_button.dart';

enum ActionButton { themeMode, reset, slot1, slot2, slot3 }

/// Custom AppBar for all application screens.
class AppBarCustom extends StatelessWidget implements PreferredSizeWidget {
  const AppBarCustom(
    this.title, {
    this.actions,
    Key? key,
  }) : super(key: key);

  final String title;

  /// Determine the order in which the widgets will be arranged. Use free
  /// slots [ActionButton.slot1] to define your own widgets.
  /// Default - [LinkedHashMap.of({ActionButton.themeMode: const ChangerThemeButton()})]
  final LinkedHashMap<ActionButton, Widget>? actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final actions = this.actions ??
        LinkedHashMap.of({ActionButton.themeMode: const ChangerThemeButton()});

    final actionsWidget = <Widget>[
      for (final MapEntry(value: widget) in actions.entries) widget
    ];

    return AppBar(
      titleSpacing: 0.0,
      leadingWidth: 40,
      title: Text(
        title,
        overflow: TextOverflow.fade,
      ),
      titleTextStyle: theme.textTheme.headlineSmall?.copyWith(
        fontSize: 20,
        color: theme.appBarTheme.foregroundColor,
      ),
      leading: IconButton(
        onPressed: () async => Navigator.maybePop(context),
        icon: const BackButtonIcon(),
      ),
      actions: actionsWidget,
    );
  }
}
