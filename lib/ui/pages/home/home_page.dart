import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/domain/controllers/app_theme/models/design_page.dart';
import 'package:weather_today/domain/controllers/general_settings_controller.dart';
import 'package:weather_today/domain/controllers/global_key.dart';
import 'package:weather_today/ui/shared/bottom_bar.dart';

import '../../shared/all_terms_widget.dart';
import '../../shared/listen_message_widget.dart';
import '../../shared/wrap_body_with_search_bar.dart';
import '../current/current_page_main.dart';
import '../daily/daily_page_main.dart';
import '../hourly/hourly_page_main.dart';
import '../intro/intro_page.dart';
import '../settings/settings_page.dart';
import 'home_page_presenter.dart';

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
      return const IntroPage();
    }

    if (!isAcceptedTerms) {
      return const Scaffold(
        body: SafeArea(child: TermsConditionsWidget()),
      );
    }

    return Scaffold(
      key: materialKeyProvider,
      bottomNavigationBar: const BottomBarWidget(),
      resizeToAvoidBottomInset: false,
      // этим занимается сама панель-поиск
      extendBodyBehindAppBar: false,
      extendBody: false,
      body: const WrapperBodyWithFSBar(
        body: ListenMessageWrapper(child: _BodyWidget()),
      ),
    );
  }
}

class _BodyWidget extends ConsumerWidget {
  const _BodyWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final designPages = ref
        .watch(HomePageController.designPages)
        .map((e) => switch (e.page) {
              WeatherPage.hourly => HourlyWeatherPage(design: e.design),
              WeatherPage.currently => CurrentWeatherPage(design: e.design),
              WeatherPage.daily => DailyWeatherPage(design: e.design),
            })
        .toList();

    return PageView(
      controller: ref.watch(HomePageController.pageController),
      children: [const SettingsPage(), ...designPages],
    );
  }
}
