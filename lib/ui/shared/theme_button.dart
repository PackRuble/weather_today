import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';

import '../../const/app_colors.dart';

class ChangerThemeButton extends ConsumerWidget {
  const ChangerThemeButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = AppColors.of(context).isLight;

    return IconButton(
      onPressed: () => ref
          .read(AppTheme.instance)
          .setThemeMode(isLight ? ThemeMode.dark : ThemeMode.light),
      icon: Icon(isLight ? Icons.light_mode_rounded : Icons.nightlight_round),
    );
  }
}
