import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/core/controllers/general_settings_controller.dart';

/// Контроллер страницы [HomePage].
class HomePageController {
  HomePageController(this._ref);

  final Ref _ref;

  Reader get _reader => _ref.read;

  Reader get _refresher => _ref.refresh;

  /// экземпляр.
  static final pr = Provider<HomePageController>(
      (ref) => HomePageController(ref),
      name: '$HomePageController');

  // ---------------------------------------
  // Работа с интерфейсом

  /// Продолжительность анимации перехода на следующую страницу.
  static const Duration _durationSlide = Duration(milliseconds: 350);

  /// Контроллер [PageView].
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
  static final currentIndex = Provider<int>((ref) {
    final controller = ref.watch(pageController);

    return controller.page?.round() ?? controller.initialPage;
  });

  /// Установить новую страницу, когда мы пролистываем.
  void setIndexPageFromHandSlide(int index) => _reader(pageController)
      .animateToPage(index, duration: _durationSlide, curve: Curves.ease);

  /// Установить новую страницу, когда мы щелкаем по bottom bar.
  void setIndexPageFromBar(int index) {
    if ((_reader(currentIndex) - index).abs() == 1) {
      setIndexPageFromHandSlide(index);
      return;
    }

    _reader(pageController).jumpToPage(index);
  }
}
