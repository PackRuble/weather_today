import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/application/const/app_icons.dart';
import 'package:weather_today/application/const/app_insets.dart';
import 'package:weather_today/domain/controllers/app_theme/controller/app_theme_controller.dart';
import 'package:weather_today/domain/controllers/app_theme/models/design_page.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/extension/enum_extension.dart';
import 'package:weather_today/ui/pages/home/home_page_presenter.dart';
import 'package:weather_today/ui/pages/settings/visual_design/visual_design_page_presenter.dart';

import 'dialogs_widget.dart';

class BottomBarWidget extends ConsumerWidget {
  const BottomBarWidget({super.key, this.mockTap});

  final void Function(DesignPage page)? mockTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final t = ref.watch(AppLocalization.currentTranslation);
    final bottomBarTr = t.mainPageDRuble.mainPage.bottomBar;

    String getLabel(WeatherPage page) => switch (page) {
          WeatherPage.hourly => bottomBarTr.hourly,
          WeatherPage.currently => bottomBarTr.today,
          WeatherPage.daily => bottomBarTr.daily,
        };

    final designs = ref.watch(HomePageController.designPages);
    final homePageCR = ref.watch(HomePageController.instance);

    final buttons = [
      for (final (index, designPage) in designs.indexed)
        Expanded(
          child: BottomIcon(
            label: getLabel(designPage.page),
            index: index + 1,
            onTap: () => mockTap != null
                ? mockTap!.call(designPage)
                : homePageCR.setIndexPageWhenClick(index + 1),
            onLongPress: designPage.page != WeatherPage.daily
                ? () async {
                    final result = await showChoosingDesign(
                      context,
                      getLabel(designPage.page),
                      designPage: designPage,
                    );

                    if (result != null) {
                      await ref
                          .read(VisualDesignPresenter.instance)
                          .onChangeDesignPage(
                            result,
                            index,
                          );
                    }
                  }
                : null,
          ),
        ),
    ];

    return BottomAppBar(
      padding: EdgeInsets.zero,
      height: AppInsets.heightBottomBar,
      color: colorScheme.surface.blend(colorScheme.primary, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          BottomIcon(
            index: 0,
            onTap: mockTap == null
                ? () => homePageCR.setIndexPageWhenClick(0)
                : null,
            onLongPress: null,
          ),
          ...buttons,
        ],
      ),
    );
  }
}

class BottomIcon extends ConsumerWidget {
  const BottomIcon({
    super.key,
    this.label,
    required this.index,
    this.onTap,
    this.onLongPress,
  });

  final String? label;
  final int index;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return TextButton(
      onLongPress: onLongPress,
      onPressed: onTap,
      style: theme.textButtonTheme.style?.copyWith(
        padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        minimumSize: const WidgetStatePropertyAll(Size.fromWidth(48.0)),
        shape: const WidgetStatePropertyAll(LinearBorder.none),
        splashFactory: theme.splashFactory,
      ),
      child: Consumer(
        builder: (context, ref, _) {
          final TextTheme textTheme = theme.textTheme;

          final int currentIndex = ref.watch(HomePageController.currentIndex);
          final double textScaleFactor = ref.watch(AppTheme.textScaleFactor);

          final themeNavBar = theme.bottomNavigationBarTheme;

          final selectedColor = themeNavBar.selectedItemColor;
          final unselectedColor = themeNavBar.unselectedItemColor;

          final selectedStyle = textTheme.labelLarge?.copyWith(
            fontSize: (themeNavBar.selectedLabelStyle?.fontSize ?? 14) *
                textScaleFactor,
            color: selectedColor,
          );
          final unselectedStyle = textTheme.labelMedium?.copyWith(
            fontSize: (themeNavBar.unselectedLabelStyle?.fontSize ?? 12) *
                textScaleFactor,
            color: unselectedColor,
          );

          return label == null
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Icon(
                    AppIcons.settingsIcon,
                    size: index == currentIndex ? 27.0 : 24.0,
                    color:
                        index == currentIndex ? selectedColor : unselectedColor,
                  ),
                )
              : Text(
                  label!,
                  overflow: TextOverflow.ellipsis,
                  style:
                      index == currentIndex ? selectedStyle : unselectedStyle,
                );
        },
      ),
    );
  }
}

Future<AppVisualDesign?> showChoosingDesign(
  BuildContext context,
  String label, {
  required DesignPage designPage,
}) async =>
    await showChoosingDialog<AppVisualDesign>(
      context,
      // todo(04.08.2024): tr
      title: 'Выберите стиль для\n$label',
      listDialogOption: [
        for (final d in AppVisualDesign.values)
          DialogOption(
            groupValue: designPage.design,
            title: d.toWords(),
            value: d,
          ),
      ],
    );
