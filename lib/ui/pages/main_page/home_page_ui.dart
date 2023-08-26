import 'package:auto_route/annotations.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/const/app_colors.dart';
import 'package:weather_today/const/app_icons.dart';
import 'package:weather_today/const/app_insets.dart';
import 'package:weather_today/core/controllers/general_settings_controller.dart';
import 'package:weather_today/core/controllers/global_key.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';

import '../../shared/all_terms_widget.dart';
import '../../shared/listen_message_widget.dart';
import '../../shared/wrap_body_with_search_bar.dart';
import '../../shared/wrapper_page.dart';
import '../current_page/current_page_main.dart';
import '../daily_page/daily_page_main.dart';
import '../hourly_page/hourly_page_main.dart';
import '../intro_page/intro_page.dart';
import '../settings_page/settings_page_ui.dart';
import 'home_page_controller.dart';

/// Главная страница приложения. Содержит 4 вкладки.
@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool showIntro = ref.watch(AppGeneralSettings.showIntro);
    final bool isAcceptedTerms =
        ref.watch(AppGeneralSettings.isAcceptedTermsConditions);

    if (showIntro) {
      return const WrapperPage(child: IntroPage());
    }

    if (!isAcceptedTerms) {
      return const WrapperPage(
        child: Scaffold(
          body: SafeArea(
            child: TermsConditionsWidget(),
          ),
        ),
      );
    }

    return WrapperPage(
      child: Scaffold(
        key: materialKeyProvider,
        bottomNavigationBar: const _BottomBarWidget(),
        resizeToAvoidBottomInset: false,
        // этим занимается сама панель-поиск
        extendBodyBehindAppBar: false,
        extendBody: false,
        body: const WrapperBodyWithFSBar(
          body: ListenMessageWrapper(child: _BodyWidget()),
        ),
      ),
    );
  }
}

class _BodyWidget extends ConsumerWidget {
  const _BodyWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageView(
      physics: ref.watch(AppTheme.scrollPhysics).scrollPhysics,
      controller: ref.watch(HomePageController.pageController),
      children: const [
        SettingsPage(),
        HourlyWeatherPage(),
        CurrentWeatherPage(),
        DailyWeatherPage(),
      ],
    );
  }
}

class _BottomBarWidget extends ConsumerWidget {
  const _BottomBarWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final t = ref.watch(AppLocalization.currentTranslation);

    return BottomAppBar(
      padding: EdgeInsets.zero,
      height: AppInsets.heightBottomBar,
      color: theme.colorScheme.background.darken(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const BottomIcon(
            index: 0,
          ),
          Expanded(
            child: BottomIcon(
              label: t.mainPageDRuble.mainPage.bottomBar.hourly,
              index: 1,
            ),
          ),
          Expanded(
            child: BottomIcon(
              label: t.mainPageDRuble.mainPage.bottomBar.today,
              index: 2,
            ),
          ),
          Expanded(
            child: BottomIcon(
              label: t.mainPageDRuble.mainPage.bottomBar.daily,
              index: 3,
            ),
          ),
        ],
      ),
    );
  }
}

class BottomIcon extends ConsumerWidget {
  const BottomIcon({super.key, this.label, required this.index});

  final String? label;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return TextButton(
      onPressed: () =>
          ref.read(HomePageController.instance).setIndexPageWhenClick(index),
      style: theme.textButtonTheme.style?.copyWith(
        padding: const MaterialStatePropertyAll(EdgeInsets.zero),
        minimumSize: const MaterialStatePropertyAll(Size.fromWidth(48.0)),
        shape: const MaterialStatePropertyAll(LinearBorder.none),
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
