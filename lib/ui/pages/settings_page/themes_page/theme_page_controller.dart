import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/i18n/translations.g.dart';

class ThemePageController {
  ThemePageController(this._ref);

  final Ref _ref;

  static final instance = Provider(ThemePageController.new);

  /// Провайдер возвращает translate.
  static final tr = Provider.autoDispose<TranslationsRu>(
      (ref) => ref.watch(AppLocalization.currentTranslation));

  static final darkLevel =
      StateProvider.autoDispose<int>((ref) => ref.watch(AppTheme.darkLevel));
}
