import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/domain/controllers/app_theme/controller/app_theme_controller.dart';

import '../../application/const/app_colors.dart';

class ChangerThemeButton extends ConsumerWidget {
  const ChangerThemeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isLight = AppColors.of(context).isLight;

    return IconButton(
      onPressed: () async => ref
          .read(AppTheme.instance)
          .setThemeMode(isLight ? ThemeMode.dark : ThemeMode.light),
      icon: Icon(isLight ? Icons.light_mode_rounded : Icons.nightlight_round),
    );
  }
}
