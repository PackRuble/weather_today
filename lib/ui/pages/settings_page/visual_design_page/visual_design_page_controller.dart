import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/core/services/app_theme_service/models/models.dart';
import 'package:weather_today/i18n/translations.g.dart';
import 'package:weather_today/ui/const/app_dialogs.dart';

/// Перечисления нужны для добавления в список измененных данных для
/// последующего сохранения их.
enum _SavedChanges {
  visualDesign,
  textScaleFactor,
  fontFamily,
  typography,
  scrollPhysics,
}

const double minTextScaleFactor = 0.5;
const double maxTextScaleFactor = 2.0;

/// Контроллер [VisualDesignPage].
class VisualDPageController {
  VisualDPageController(this._ref);

  final Ref _ref;

  /// экземпляр [VisualDPageController].
  static final instance = Provider.autoDispose(
    VisualDPageController.new,
    name: '$VisualDPageController',
  );

  /// Провайдер возвращает translate.
  static final tr = Provider.autoDispose<TranslationsRu>(
      (ref) => ref.watch(AppLocalization.currentTranslation));

  /// Погода берется из заранее сохраненного json, который всегда доступен.
  static final weatherMock = FutureProvider.autoDispose<WeatherOneCall>(
      (ref) async => TestWeatherJson.getOneCallWeatherToTest());

  /// Применить значения по завершению редактирования опций.
  ///
  static final changesProvider =
      StateProvider.autoDispose<Set<_SavedChanges>>((ref) => {});

  // ---------------------------------------------------------------------------
  // TextScaleFactor
  // ---------------------------------------------------------------------------

  /// Значение [textScaleFactor], отвечает за увеличение размера шрифта.
  ///
  static final textScaleFactorProvider = StateProvider.autoDispose<double>(
      (ref) => ref.watch(AppTheme.textScaleFactor));

  /// Установить новое значение [textScaleFactorProvider].
  void setTextScaleFactor(double newValue) {
    _ref.read(textScaleFactorProvider.notifier).state = newValue;
    _saveNewAction(_SavedChanges.textScaleFactor);
  }

  /// Сохранить параметр увеличения шрифта.
  Future<void> _saveTextScaleFactor() async => _ref
      .read(AppTheme.instance)
      .setTextScaleFactor(_ref.read(textScaleFactorProvider));

  // ---------------------------------------------------------------------------
  // VisualDesign
  // ---------------------------------------------------------------------------

  /// Список визуальных дизайнов.
  ///
  static final visualDesignsProvider =
      Provider.autoDispose<List<AppVisualDesign>>(
          (ref) => AppVisualDesign.values);

  /// Выбранный визульный дизайн.
  ///
  static final selectedDesignProvider =
      StateProvider.autoDispose<AppVisualDesign>(
          (ref) => ref.watch(AppTheme.visualDesign));

  /// Установить новое значение [textScaleFactorProvider].
  void setVisualDesign(AppVisualDesign design) {
    _ref.read(selectedDesignProvider.notifier).state = design;
    _saveNewAction(_SavedChanges.visualDesign);
  }

  /// Сохранить визуальный дизайн.
  Future<void> _saveVisualDesign() async => _ref
      .read(AppTheme.instance)
      .setVisualDesign(_ref.read(selectedDesignProvider));

  // ---------------------------------------------------------------------------
  // FontFamily
  // ---------------------------------------------------------------------------

  /// Список шрифтов.
  static final fontsFamilyProvider =
      Provider.autoDispose<List<AppFontFamily>>((ref) => AppFontFamily.values);

  /// Выбранный шрифт.
  static final selectedFontFamily = StateProvider.autoDispose<AppFontFamily>(
      (ref) => ref.watch(AppTheme.fontFamily));

  /// Установить новое значение [selectedFontFamily].
  void setFontFamily(AppFontFamily font) {
    _ref.read(selectedFontFamily.notifier).state = font;
    _saveNewAction(_SavedChanges.fontFamily);
  }

  /// Сохранить шрифт.
  Future<void> _saveFontFamily() async =>
      _ref.read(AppTheme.instance).setFontFamily(_ref.read(selectedFontFamily));

  // ---------------------------------------------------------------------------
  // ScrollPhysics
  // ---------------------------------------------------------------------------

  /// Список scrollPhysics.
  static final scrollPhysicsProvider =
      Provider.autoDispose<List<AppScrollPhysics>>(
          (ref) => AppScrollPhysics.values);

  /// Выбранный скролл.
  static final selectedScrollPhysic =
      StateProvider.autoDispose<AppScrollPhysics>(
          (ref) => ref.watch(AppTheme.scrollPhysics));

  /// Установить новое значение [selectedScrollPhysic].
  void setScrollPhysic(AppScrollPhysics scrollPhysic) {
    _ref.read(selectedScrollPhysic.notifier).state = scrollPhysic;
    _saveNewAction(_SavedChanges.scrollPhysics);
  }

  /// Сохранить скролл.
  Future<void> _saveScrollPhysics() async => _ref
      .read(AppTheme.instance)
      .setScrollPhysics(_ref.read(selectedScrollPhysic));

  // ---------------------------------------------------------------------------
  // Typography
  // ---------------------------------------------------------------------------

  /// Список Типографик.
  static final typographyList =
      Provider.autoDispose<List<AppTypography>>((ref) => AppTypography.values);

  /// Выбранная Типографика.
  static final selectedTypography = StateProvider.autoDispose<AppTypography>(
      (ref) => ref.watch(AppTheme.typography));

  /// Установить новое значение [selectedTypography].
  void setTypography(AppTypography typography) {
    _ref.read(selectedTypography.notifier).state = typography;
    _saveNewAction(_SavedChanges.typography);
  }

  /// Сохранить [selectedTypography].
  Future<void> _saveTypography() async =>
      _ref.read(AppTheme.instance).setTypography(_ref.read(selectedTypography));

  // ---------------------------------------------------------------------------
  // Main
  // ---------------------------------------------------------------------------

  /// Кнопка "Назад".
  Future<bool> onWillPop(BuildContext context) async {
    if (_ref.read(changesProvider.notifier).state.isNotEmpty) {
      final bool isSave = await AppDialogs.confirmSaveChanges(context);

      if (isSave) {
        await saveAllChanges(); // сохранить и выйти
      }
    }

    return true;
  }

  /// Добавить действие в [changesProvider], которое подлежит
  /// дальнейшему вызову [saveAllChanges].
  ///
  void _saveNewAction(_SavedChanges change) => _ref
      .read(changesProvider.notifier)
      .update((state) => Set.of({...state, change}));

  /// Вызвать все функции сохранения. Могут быть следующими:
  ///
  /// * [_saveVisualDesign]
  /// * [_saveTextScaleFactor]
  /// * [_saveFontFamily]
  /// * [_saveTypography]
  /// * [_saveScrollPhysics]
  ///
  Future<void> saveAllChanges() async {
    for (final _SavedChanges change
        in _ref.read(changesProvider.notifier).state) {
      switch (change) {
        case _SavedChanges.visualDesign:
          await _saveVisualDesign();
          break;
        case _SavedChanges.textScaleFactor:
          await _saveTextScaleFactor();
          break;
        case _SavedChanges.fontFamily:
          await _saveFontFamily();
          break;
        case _SavedChanges.typography:
          await _saveTypography();
          break;
        case _SavedChanges.scrollPhysics:
          await _saveScrollPhysics();
          break;
      }
    }

    _ref.refresh(changesProvider);
  }
}
