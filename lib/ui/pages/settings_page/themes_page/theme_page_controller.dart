import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';

class ThemePageController {
  ThemePageController(this._ref);

  final Ref _ref;

  Reader get _reader => _ref.read;

  Reader get _refresh => _ref.refresh;

  static final cr =
      Provider<ThemePageController>((ref) => ThemePageController(ref));

  static final darkLevel =
      StateProvider.autoDispose<int>((ref) => ref.watch(AppTheme.darkLevel));
}
