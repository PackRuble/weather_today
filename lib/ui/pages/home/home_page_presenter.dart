import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/domain/controllers/app_theme/models/design_page.dart';
import 'package:weather_today/domain/controllers/general_settings_controller.dart';
import 'package:weather_today/domain/services/cardoteka/settings_storage.dart';
import 'package:weather_today/utils/logger/all_observers.dart';

/// [HomePage] page presenter.
class HomePageController {
  const HomePageController(this._ref);

  final Ref _ref;

  /// Instance of current class.
  static final instance = Provider(
    HomePageController.new,
    name: '$HomePageController',
  );

  /// List of visual designs.
  ///
  static final designPages = Provider.autoDispose<List<DesignPage>>(
    (ref) => ref.watch(SettingsStorage.instance).attach(
          SettingsCards.designPages,
          (value) => ref.state = value,
          detacher: ref.onDispose,
        ),
  );

  // ---------------------------------------
  // Working with the interface

  /// Duration of the transition animation to the next page.
  static const Duration _durationSlide = Duration(milliseconds: 350);

  /// Controller [PageView].
  static final pageController = ChangeNotifierProvider<PageController>((ref) {
    // Считываем при запуске, в отслеживании нет нужды.
    final int index = ref.read(AppGeneralSettings.startPageIndex).index;

    return PageController(initialPage: index);
  });

  /// Текущая открытая страница.
  ///
  /// Возможны следующие значения [index]:
  /// * 0 - страница настроек;
  /// * 1 - страница почасовой погоды;
  /// * 2 - страница текущей погоды;
  /// * 3 - страница прогнозов погоды на ближайшие дни (на 7 дней);
  static final currentIndex = Provider<int>(
    (ref) {
      final index = ref.watch(
        pageController.select(
          (controller) => controller.page?.round() ?? controller.initialPage,
        ),
      );

      // ignore: deprecated_member_use
      ref.listenSelf(
        (previous, next) => _notifyObservers(previous ?? index, next),
      );

      return index;
    },
    name: '$HomePageController/currentIndex',
  );

  /// Установить новую страницу, когда мы щелкаем по bottom bar.
  void setIndexPageWhenClick(int index) {
    final controller = _ref.read(pageController);
    if ((_ref.read(currentIndex) - index).abs() == 1) {
      // ignore: discarded_futures
      controller.animateToPage(
        index,
        duration: _durationSlide,
        curve: Curves.ease,
      );
    } else {
      controller.jumpToPage(index);
    }
  }

  /// Логгируем передвижения по вкладкам.
  ///
  /// Внутри [getRoute] создается [TabPageRoute] с нужными данными, для удовлетворения нужд
  /// логгера.
  static void _notifyObservers(int previousIndex, int nextIndex) {
    TabPageRoute getRoute(int index) {
      return TabPageRoute(
        routeInfo: RouteMatch(
          segments: const [],
          stringMatch: '',
          key: const ValueKey(''),
          config: AutoRoute(
            page: EmptyShellRoute(
              switch (index) {
                0 => 'SettingsTab',
                1 => 'HourlyTab',
                2 => 'CurrentlyTab',
                3 => 'DailyTab',
                _ => throw "Wrong page index. Try again."
              },
            ),
          ),
        ),
        index: index,
      );
    }

    NavigationObserver().didChangeTabRoute(
      getRoute(previousIndex),
      getRoute(nextIndex),
    );
  }
}
