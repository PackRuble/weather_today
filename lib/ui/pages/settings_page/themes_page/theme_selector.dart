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
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;

    return PopupMenuButton<int>(
      tooltip: '',
      padding: EdgeInsets.zero,
      onSelected: (int newTheme) async =>
          ref.read(AppTheme.instance).setThemeScheme(newTheme),
      itemBuilder: (BuildContext context) => <PopupMenuItem<int>>[
        for (final (index, item) in AppThemeScheme.schemes.indexed)
          PopupMenuItem<int>(
            value: index,
            child: Consumer(
              builder: (context, ref, _) {
                final FlexSchemeData selected =
                    ref.watch(AppTheme.currentThemeScheme);

                return ListTile(
                  selected: item.name == selected.name,
                  selectedColor:
                      isLight ? selected.light.primary : selected.dark.primary,
                  contentPadding: EdgeInsets.zero,
                  title: Text(item.name),
                  leading: ColorBox(item),
                );
              },
            ),
          )
      ],
      child: Consumer(
        builder: (context, ref, _) {
          final FlexSchemeData selected =
              ref.watch(AppTheme.currentThemeScheme);

          return ListTile(
            title: Text('${selected.name} theme'),
            subtitle: Text(selected.description),
            trailing: IgnorePointer(
              child: ColorBox(selected),
            ),
          );
        },
      ),
    );
  }
}

class ColorBox extends ConsumerWidget {
  const ColorBox(this.flexScheme, {super.key});

  final FlexSchemeData flexScheme;

  // Size of the theme selector with theme colors.
  static const double _height = 23;
  static const double _width = _height * 1.3;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);
    final bool isLight = theme.brightness == Brightness.light;
    final ColorScheme scheme = theme.colorScheme;

    return SizedBox(
      width: _width * 2,
      child: Center(
        child: FlexThemeModeOptionButton(
          flexSchemeColor: isLight ? flexScheme.light : flexScheme.dark,
          selected: true,
          selectedBorder: BorderSide(
            color: theme.colorScheme.primary,
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
    );
  }
}
