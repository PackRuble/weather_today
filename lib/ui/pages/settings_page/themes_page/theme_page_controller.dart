import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/i18n/translations.g.dart';

class ThemePageController {
  ThemePageController(this._ref);

  final Ref _ref;

  Reader get _reader => _ref.read;

  Reader get _refresh => _ref.refresh;

  static final cr =
      Provider<ThemePageController>((ref) => ThemePageController(ref));

  /// Провайдер возвращает translate.
  static final tr = Provider.autoDispose<TranslationsRu>(
      (ref) => ref.watch(AppLocalization.currentTranslation));

  static final darkLevel =
      StateProvider.autoDispose<int>((ref) => ref.watch(AppTheme.darkLevel));
}
