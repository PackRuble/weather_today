import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:weather_today/core/controllers/general_settings_controller.dart';

const double _heightImage = 150.0;

// tod перевести
final List<Slide> slides = [
  Slide(
    title: 'УЗНАВАЙ',
    description:
        'Сверхточная погода на 48 часов и актуальная на 7 дней. Не попадай под дождь - ведь есть предупреждения о погоде',
    pathImage: 'assets/images/intro/learn.png',
    heightImage: _heightImage,
    backgroundColor: Colors.purple,
  ),
  Slide(
    title: 'ИЗМЕРЯЙ',
    description:
        'Используй удобные ДЛЯ СЕБЯ единицы измерения температуры, скорости и давления',
    pathImage: 'assets/images/intro/measure.png',
    heightImage: _heightImage,
    backgroundColor: Colors.orange,
  ),
  Slide(
    title: 'СОХРАНЯЙ',
    description:
        'Любимые местоположения всегда под рукой. Какая погода сегодня в Лондоне?',
    pathImage: 'assets/images/intro/visual.png',
    heightImage: _heightImage,
    backgroundColor: Colors.indigo,
  ),
  Slide(
    title: 'ВИЗУАЛИЗИРУЙ',
    description:
        'Красочные цветовые темы позаботятся о плохом настроении в пасмурную погоду. Есть ночная тема',
    pathImage: 'assets/images/intro/save.png',
    heightImage: _heightImage,
    backgroundColor: Colors.green,
  ),
];

class IntroPage extends ConsumerWidget {
  const IntroPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ThemeData theme = Theme.of(context);

    return IntroSlider(
      renderNextBtn: UnconstrainedBox(
        child: Icon(Icons.arrow_circle_right_rounded,
            size: 48.0, color: theme.colorScheme.primary),
      ),
      renderDoneBtn: UnconstrainedBox(
          child: Icon(Icons.check_circle_rounded,
              size: 48.0, color: theme.colorScheme.primary)),
      onDonePress: () => ref.watch(AppGeneralSettings.pr).setIsIntro(false),
      showPrevBtn: false,
      showSkipBtn: false,
      // colorDot: theme.primaryColor,
      colorActiveDot: theme.primaryColor,
      slides: slides,
      sizeDot: 14.0,
    );
  }
}
