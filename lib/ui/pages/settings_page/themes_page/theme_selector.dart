import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/application/const/app_insets.dart';
import 'package:weather_today/application/theme/app_theme_scheme.dart';
import 'package:weather_today/domain/controllers/app_theme/controller/app_theme_controller.dart';

/// Переключатель тем, с выпадающим списком.
class ThemeSelector extends ConsumerWidget {
  const ThemeSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Size of the theme selector with theme colors.
    const double _height = 23;
    const double _width = _height * 1.3;

    final bool isLight = Theme.of(context).brightness == Brightness.light;
    final ThemeData theme = Theme.of(context);
    final ColorScheme scheme = theme.colorScheme;

    final FlexSchemeData selected = ref.watch(AppTheme.currentThemeScheme);

    return PopupMenuButton<int>(
      padding: EdgeInsets.zero,
      onSelected: (int newTheme) async =>
          ref.read(AppTheme.instance).setThemeScheme(newTheme),
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        for (int i = 0; i < AppThemeScheme.schemes.length; i++)
          PopupMenuItem<int>(
            value: i,
            child: ListTile(
              selected: AppThemeScheme.schemes[i].name == selected.name,
              selectedColor:
                  isLight ? selected.light.primary : selected.dark.primary,
              contentPadding: EdgeInsets.zero,
              title: Text(AppThemeScheme.schemes[i].name),
              leading: SizedBox(
                width: _width * 2,
                child: FlexThemeModeOptionButton(
                  flexSchemeColor: isLight
                      ? AppThemeScheme.schemes[i].light
                      : AppThemeScheme.schemes[i].dark,
                  selected: true,
                  selectedBorder: BorderSide(
                    color: isLight
                        ? AppThemeScheme.schemes[i].light.primary
                        : AppThemeScheme.schemes[i].dark.primary,
                    width: AppInsets.outlineThickness,
                  ),
                  backgroundColor: scheme.background,
                  width: _width,
                  height: _height,
                  padding: EdgeInsets.zero,
                  borderRadius: 0,
                  optionButtonPadding: EdgeInsets.zero,
                  optionButtonMargin: EdgeInsets.zero,
                  optionButtonBorderRadius: AppInsets.cornerRadiusButton,
                ),
              ),
            ),
          )
      ],
      child: ListTile(
        title: Text('${selected.name} theme'),
        subtitle: Text(selected.description),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: _width * 2,
              child: FlexThemeModeOptionButton(
                flexSchemeColor: isLight ? selected.light : selected.dark,
                selected: true,
                selectedBorder: BorderSide(
                  color: scheme.primary,
                  width: AppInsets.outlineThickness,
                ),
                backgroundColor: scheme.background,
                width: _width,
                height: _height,
                padding: EdgeInsets.zero,
                borderRadius: 0,
                optionButtonPadding: EdgeInsets.zero,
                optionButtonMargin: EdgeInsets.zero,
                optionButtonBorderRadius: AppInsets.cornerRadiusButton,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
