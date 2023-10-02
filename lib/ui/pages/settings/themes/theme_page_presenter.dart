import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/domain/controllers/app_theme/controller/app_theme_controller.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';

class ThemePagePresenter {
  const ThemePagePresenter(this._ref);

  // ignore: unused_field
  final Ref _ref;

  /// Instance of current class.
  static final instance = Provider.autoDispose(
    ThemePagePresenter.new,
    name: '$ThemePagePresenter',
  );

  /// Provider returns translation.
  static StateProvider<TranslationsRu> get tr =>
      AppLocalization.currentTranslation;

  static StateProvider<int> get darkLevel => AppTheme.darkLevel;

  Future<void> resetToDefaultSettings() async =>
      _ref.read(AppTheme.instance).resetThemeToDefaultSettings();
}
