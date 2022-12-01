import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_animation/weather_animation.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';
import 'package:weather_today/i18n/translations.g.dart';

class IntroTile {
  final String title;
  final String subtitle;
  final WeatherScene scene;

  IntroTile(this.title, this.subtitle, this.scene);
}

/// Class represent controller.
class IntroPageController {
  IntroPageController(this._ref);

  final Ref _ref;

  /// Instance of class [IntroPageController].
  static final instance = Provider.autoDispose(
    IntroPageController.new,
    name: '$IntroPageController',
  );

  /// Instance of class [TranslationsRu].
  static final tr = Provider.autoDispose<TranslationsRu>(
    (ref) => ref.watch(AppLocalization.currentTranslation),
    name: '${instance.name} - translate',
  );

  /// Instance of class [TranslationsRu].
  static final introTiles = Provider.autoDispose<List<IntroTile>>(
    (ref) => _getIntroTiles(ref.watch(tr)),
    name: '${instance.name} - slides',
  );

  static List<IntroTile> _getIntroTiles(TranslationsRu t) {
    return [
      IntroTile(t.introPage.tile1title, t.introPage.tile1subtitle,
          WeatherScene.sunset),
      IntroTile(t.introPage.tile2title, t.introPage.tile2subtitle,
          WeatherScene.snowfall),
      IntroTile(t.introPage.tile3title, t.introPage.tile3subtitle,
          WeatherScene.frosty),
      IntroTile(t.introPage.tile4title, t.introPage.tile4subtitle,
          WeatherScene.stormy),
    ];
  }
}