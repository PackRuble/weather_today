import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/domain/controllers/app_theme/controller/app_theme_controller.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';

class ThemePageController {
  ThemePageController(this._ref);

  // ignore: unused_field
  final Ref _ref;

  static final instance = Provider(ThemePageController.new);

  /// Провайдер возвращает translate.
  static final tr = Provider.autoDispose<TranslationsRu>(
      (ref) => ref.watch(AppLocalization.currentTranslation));

  static final darkLevel =
      StateProvider.autoDispose<int>((ref) => ref.watch(AppTheme.darkLevel));
}
