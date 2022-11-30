import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/const/app_icons.dart';
import 'package:weather_today/const/app_insets.dart';
import 'package:weather_today/core/controllers/general_settings_controller.dart';
import 'package:weather_today/core/controllers/global_key.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';

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
class HomePage extends ConsumerWidget {
  const HomePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool showIntro = ref.watch(AppGeneralSettings.showIntro);

    if (true ?? showIntro) {
      return const WrapperPage(child: IntroPage());
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
      onPageChanged: (int index) => ref
          .read(HomePageController.instance)
          .setIndexPageFromHandSlide(index),
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
    final TextTheme theme = Theme.of(context).textTheme;

    final t = ref.watch(AppLocalization.currentTranslation);

    // получаем текущий индекс
    final int curIndex = ref.watch(HomePageController.currentIndex);

    final double textScaleFactor = ref.watch(AppTheme.textScaleFactor);

    final double? sFontSize = theme.labelLarge?.fontSize;
    final double? unsFontSize = theme.labelMedium?.fontSize;

    return SizedBox(
      //coldfix OverflowBox
      height: AppInsets.heightBottomBar,
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: curIndex,
        selectedLabelStyle: theme.labelLarge?.copyWith(
            fontSize: (sFontSize == null) ? null : sFontSize * textScaleFactor),
        unselectedLabelStyle: theme.labelMedium?.copyWith(
            fontSize:
                (unsFontSize == null) ? null : unsFontSize * textScaleFactor),
        onTap: (int index) =>
            ref.read(HomePageController.instance).setIndexPageFromBar(index),
        items: [
          BottomNavigationBarItem(
              tooltip: t.mainPageDRuble.mainPage.bottomBar.settings,
              icon: const Icon(AppIcons.settingsIcon),
              label: ''),
          BottomNavigationBarItem(
              icon: const SizedBox.shrink(),
              label: t.mainPageDRuble.mainPage.bottomBar.hourly),
          BottomNavigationBarItem(
              icon: const SizedBox.shrink(),
              label: t.mainPageDRuble.mainPage.bottomBar.today),
          BottomNavigationBarItem(
              icon: const SizedBox.shrink(),
              label: t.mainPageDRuble.mainPage.bottomBar.daily),
        ],
      ),
    );
  }
}
