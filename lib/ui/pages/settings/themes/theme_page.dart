// ignore_for_file: discarded_futures

import 'dart:collection';

import 'package:auto_route/annotations.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/domain/controllers/app_theme/controller/app_theme_controller.dart';
import 'package:weather_today/ui/pages/settings/themes/theme_page_presenter.dart';
import 'package:weather_today/ui/shared/reset_button.dart';
import 'package:weather_today/ui/shared/theme_button.dart';

import '../../../shared/appbar_widget.dart';
import 'theme_selector.dart';

const double _inset = 2.0;

/// Страница показывает различные настройки цветовой темы.
@RoutePage()
class ThemePage extends ConsumerWidget {
  const ThemePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(ThemePagePresenter.tr);

    final ThemeData currentTheme = Theme.of(context);

    final ThemeData testedDarkLevelTheme = ref
        .watch(
          AppTheme.darkThemeTestedDarkLevel(
            ref.watch(ThemePagePresenter.darkLevel),
          ),
        )
        .toTheme;

    return Theme(
      data: currentTheme.brightness == Brightness.light
          ? currentTheme
          : testedDarkLevelTheme,
      child: Scaffold(
        appBar: AppBarCustom(
          t.themesPage.appbarTitle,
          actions: LinkedHashMap.of({
            ActionButton.reset: ResetButton(
              onConfirm:
                  ref.read(ThemePagePresenter.instance).resetToDefaultSettings,
            ),
            ActionButton.themeMode: const ChangerThemeButton(),
          }),
        ),
        body: ListView(
          children: const [
            Divider(),
            ShowThemeColors(),
            Divider(),
            ThemeSelector(),
            _SwapColorsThemeWidget(),
            _UseMaterial3Widget(),
            Divider(),
            _DarkModeTileWidget(),
            _SwapComputeDarkWidget(),
            _DarkLevelWidget(),
            _SwapTrueBlackWidget(),
          ],
        ),
      ),
    );
  }
}

class _SwapColorsThemeWidget extends ConsumerWidget {
  const _SwapColorsThemeWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(ThemePagePresenter.tr);

    final bool isSwapColors = ref.watch(AppTheme.swapColors);

    return SwitchListTile(
      value: isSwapColors,
      title: Text(t.themesPage.swapColorsLight),
      onChanged: (bool value) =>
          ref.read(AppTheme.instance).toggleSwapColors(value),
    );
  }
}

class _UseMaterial3Widget extends ConsumerWidget {
  const _UseMaterial3Widget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(ThemePagePresenter.tr);

    final bool useMaterial3 = ref.watch(AppTheme.useMaterial3);

    return SwitchListTile(
      value: useMaterial3,
      title: Text(t.themesPage.useMaterial3),
      subtitle: Text(t.themesPage.useMaterial3Sub),
      onChanged: (bool value) =>
          ref.read(AppTheme.instance).toggleUseMaterial3(value),
    );
  }
}

class _SwapComputeDarkWidget extends ConsumerWidget {
  const _SwapComputeDarkWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(ThemePagePresenter.tr);

    final bool isLight = Brightness.light == Theme.of(context).brightness;
    final bool swapDark = ref.watch(AppTheme.swapDarkMainAndContainerColors);

    return isLight
        ? const SizedBox.shrink()
        : SwitchListTile(
            value: swapDark,
            title: Text(t.themesPage.swapColorsDark),
            onChanged: (bool value) =>
                ref.read(AppTheme.instance).toggleDarkSwapColors(value),
          );
  }
}

class _DarkLevelWidget extends ConsumerWidget {
  const _DarkLevelWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(ThemePagePresenter.tr);

    final bool isLight = Brightness.light == Theme.of(context).brightness;
    final int darkLevel = ref.watch(ThemePagePresenter.darkLevel);

    return isLight
        ? const SizedBox.shrink()
        : ListTile(
            title: Text(t.themesPage.darkLevel),
            subtitle: Slider(
              value: darkLevel.toDouble(),
              divisions: 100,
              min: 0.0,
              max: 100,
              onChangeEnd: (double value) =>
                  ref.read(AppTheme.instance).setDarkLevel(value.toInt()),
              onChanged: (double value) => ref
                  .read(ThemePagePresenter.darkLevel.notifier)
                  .update((_) => value.toInt()),
            ),
            trailing: SizedBox(
              width: 50.0,
              child: Text(
                '$darkLevel%',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          );
  }
}

class _SwapTrueBlackWidget extends ConsumerWidget {
  const _SwapTrueBlackWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(ThemePagePresenter.tr);

    final bool isLight = Brightness.light == Theme.of(context).brightness;
    final bool darkIsTrueBlack = ref.watch(AppTheme.darkIsTrueBlack);

    return isLight
        ? const SizedBox.shrink()
        : SwitchListTile(
            value: darkIsTrueBlack,
            title: Text(t.themesPage.darkIsTrueBlack),
            subtitle: Text(t.themesPage.darkIsTrueBlackSub),
            onChanged: (bool value) =>
                ref.read(AppTheme.instance).toggleDarkIsTrueBlack(value),
          );
  }
}

class ShowThemeColors extends StatelessWidget {
  const ShowThemeColors();

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: _inset),
      child: Column(
        children: [
          Row(
            children: [
              ThemeCard(
                label: 'Primary',
                color: colorScheme.primary,
                textColor: colorScheme.onPrimary,
              ),
              ThemeCard(
                label: 'Primary Container',
                color: colorScheme.primaryContainer,
                textColor: colorScheme.onPrimaryContainer,
              ),
              ThemeCard(
                label: 'Tertiary',
                color: colorScheme.tertiary,
                textColor: colorScheme.onTertiary,
              ),
              ThemeCard(
                label: 'Tertiary Container',
                color: colorScheme.tertiaryContainer,
                textColor: colorScheme.onTertiaryContainer,
              ),
            ],
          ),
          Row(
            children: [
              ThemeCard(
                label: 'Secondary',
                color: colorScheme.secondary,
                textColor: colorScheme.onSecondary,
              ),
              ThemeCard(
                label: 'Secondary Container',
                color: colorScheme.secondaryContainer,
                textColor: colorScheme.onSecondaryContainer,
              ),
              ThemeCard(
                label: 'Error',
                color: colorScheme.error,
                textColor: colorScheme.onError,
              ),
              ThemeCard(
                label: 'Error Container',
                color: colorScheme.errorContainer,
                textColor: colorScheme.onErrorContainer,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ThemeCard extends StatelessWidget {
  const ThemeCard({
    required this.label,
    required this.color,
    required this.textColor,
  });

  final String label;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorName = ColorTools.nameThatColor(color);

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(_inset),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.16,
          child: Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: BorderSide(
                color: theme.colorScheme.onPrimaryContainer,
              ),
            ),
            elevation: 0,
            color: color,
            child: Padding(
              padding: const EdgeInsets.all(_inset),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Spacer(),
                  Center(
                    child: Text(
                      label,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: textColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    textAlign: TextAlign.end,
                    colorName,
                    style: theme.textTheme.bodySmall?.copyWith(
                      fontSize: 8,
                      fontStyle: FontStyle.italic,
                      overflow: TextOverflow.fade,
                      shadows: <Shadow>[
                        Shadow(
                          offset: const Offset(0.4, 0.4),
                          blurRadius: 1.0,
                          color: textColor.onColor,
                        ),
                      ],
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DarkModeTileWidget extends ConsumerWidget {
  const _DarkModeTileWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(ThemePagePresenter.tr);

    final ThemeMode themeMode = ref.watch(AppTheme.themeMode);

    return ListTile(
      trailing: ThemeModeSwitch(
        themeMode: themeMode,
        onChanged: (ThemeMode value) =>
            ref.read(AppTheme.instance).setThemeMode(value),
      ),
      title: Text(t.themesPage.darkMode),
      subtitle: Text('${t.themesPage.darkModeSub} ${themeMode.name}'),
    );
  }
}

class ThemeModeSwitch extends StatelessWidget {
  const ThemeModeSwitch({
    required this.themeMode,
    required this.onChanged,
  });

  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onChanged;

  @override
  Widget build(BuildContext context) {
    final List<bool> isSelected = <bool>[
      themeMode == ThemeMode.light,
      themeMode == ThemeMode.system,
      themeMode == ThemeMode.dark,
    ];
    return ToggleButtons(
      isSelected: isSelected,
      onPressed: (int newIndex) {
        if (newIndex == 0) {
          onChanged(ThemeMode.light);
        } else if (newIndex == 1) {
          onChanged(ThemeMode.system);
        } else {
          onChanged(ThemeMode.dark);
        }
      },
      children: const <Widget>[
        Icon(Icons.wb_sunny_rounded),
        Icon(Icons.phone_iphone_rounded),
        Icon(Icons.dark_mode_rounded),
      ],
    );
  }
}
