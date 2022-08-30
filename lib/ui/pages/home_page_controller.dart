import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/core/controllers/general_settings_controller.dart';

/// Контроллер страницы [HomePage].
class HomePageController {
  HomePageController(this._ref);

  final Ref _ref;

  Reader get _reader => _ref.read;

  Reader get _refresher => _ref.refresh;

  /// Прогружаем погоду.
  // static final initWeathers = FutureProvider.autoDispose<bool>((ref) async {
  //   // await ref.watch(weatherCurrent.future);
  //   // await ref.watch(weatherOneCall.future);
  //   ref.watch(weatherOneCallController);
  //   ref.watch(weatherCurrentController);
  //
  //   return true;
  // });

  // /// Умный обновлятор погоды.
  // static final smartWeather = FutureProvider<WeatherOneCall?>((ref) async {
  //   final WeatherCurrent? current = await ref.watch(weatherCurrent.future);
  //
  //   return (await ref.watch(weatherOneCall.future))
  //       ?.copyWith(null, current: current);
  // });

  /// экземпляр.
  static final pr =
      Provider<HomePageController>((ref) => HomePageController(ref));

  // ---------------------------------------
  // Работа с интерфейсом

  /// Продолжительность анимации перехода на следующую страницу.
  static const Duration _durationSlide = Duration(milliseconds: 350);

  /// Текущая открытая страница.
  ///
  /// Возможны следующие значения:
  /// * 0 - страница настроек;
  /// * 1 - страница почасовой погоды;
  /// * 2 - страница текущей погоды;
  /// * 3 - страница прогнозов погоды на ближайшие дни (на 7 дней);
  ///
  /// !! Только считываем при запуске, в отслеживании нет нужды.
  static final pageController = ChangeNotifierProvider<PageController>((ref) {
    final int index = ref.read(AppGeneralSettings.startPageIndex).index;

    return PageController(initialPage: index);
  });

  /// Получить текущую страницу.
  int get currentIndex {
    final controller = _reader(pageController);

    return controller.page?.toInt() ?? controller.initialPage;
  }

  /// Установить новую страницу, когда мы пролистываем.
  void setIndexPageFromHandSlide(int index) => _reader(pageController)
      .animateToPage(index, duration: _durationSlide, curve: Curves.ease);

  /// Установить новую страницу, когда мы щелкаем bottombar.
  void setIndexPageFromBar(int index) {
    if ((currentIndex - index).abs() == 1) {
      setIndexPageFromHandSlide(index);
      return;
    }

    _reader(pageController).jumpToPage(index);
  }
}
