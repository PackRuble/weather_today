import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/domain/controllers/app_theme/controller/app_theme_controller.dart';
import 'package:weather_today/domain/controllers/app_theme/models/design_page.dart';
import 'package:weather_today/domain/controllers/app_theme/models/models.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/weather_onecall_delegacy_nr.dart';
import 'package:weather_today/domain/services/cardoteka/settings_storage.dart';
import 'package:weather_today/ui/dialogs/app_dialogs.dart';

/// Enumerations are needed to add to the list of modified data for the
/// subsequent saving of them.
enum _SavedChanges {
  textScaleFactor,
  fontFamily,
  typography,
  scrollPhysics,
}

const double minTextScaleFactor = 0.5;
const double maxTextScaleFactor = 2.0;

/// [VisualDesignPage] page presenter.
class VisualDesignPresenter {
  const VisualDesignPresenter(this._ref);

  final Ref _ref;

  /// Instance of current class.
  static final instance = Provider.autoDispose(
    VisualDesignPresenter.new,
    name: '$VisualDesignPresenter',
  );

  /// Provider returns translation.
  static StateProvider<TranslationsRu> get tr =>
      AppLocalization.currentTranslation;

  /// Погода берется из заранее сохраненного json, который всегда доступен. (уже нет)
  static final weatherMock = FutureProvider.autoDispose<WeatherOneCall?>(
    // todo(12.08.2024): можно сделать тайл с параметрами и передать свои моковые постоянные
    //  или
    //  оставить это как есть
    (ref) async => ref.watch(WeatherOnecallDelegacyNR.i.future),
  );

  /// Apply the values when you finish editing the options.
  static final changesProvider =
      StateProvider.autoDispose((_) => <_SavedChanges>{});

  // ---------------------------------------------------------------------------
  // TextScaleFactor
  // ---------------------------------------------------------------------------

  /// Значение [textScaleFactor], отвечает за увеличение размера шрифта.
  ///
  static final textScaleFactorProvider = StateProvider.autoDispose<double>(
    (ref) => ref.watch(AppTheme.textScaleFactor),
  );

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

  /// List of visual designs.
  ///
  static final weatherDesignPages = Provider.autoDispose<List<DesignPage>>(
    (ref) => ref.watch(SettingsStorage.instance).attach(
          SettingsCards.designPages,
          (value) => ref.state = value,
          detacher: ref.onDispose,
        ),
  );

  Future<void> onReorderWeatherPage(int oldIndex, int newIndex) async {
    final pages = [..._ref.read(weatherDesignPages)];

    if (oldIndex < newIndex) {
      // ignore: parameter_assignments
      newIndex -= 1;
    }
    final item = pages.removeAt(oldIndex);
    pages.insert(newIndex, item);

    await _saveWeatherDesignPages(pages);
  }

  bool isSelectedDesign(AppVisualDesign design) => switch (design) {
        AppVisualDesign.byRuble => true,
        AppVisualDesign.byTolskaya => false,
      };

  Future<void> onChangeDesignPage(
    AppVisualDesign styleDesign,
    int designPageIndex,
  ) async {
    final pages = [..._ref.read(weatherDesignPages)];

    final designPage = pages[designPageIndex];
    pages[designPageIndex] = designPage.copyWith(
      design: styleDesign,
    );

    await _saveWeatherDesignPages(pages);
  }

  /// Set the new value to [SettingsCards.designPages].
  Future<void> _saveWeatherDesignPages(List<DesignPage> pages) async => _ref
      .read(SettingsStorage.instance)
      .set<List<DesignPage>>(SettingsCards.designPages, pages);

  // ---------------------------------------------------------------------------
  // FontFamily
  // ---------------------------------------------------------------------------

  /// List of fonts.
  List<AppFontFamily> get fontsFamily => AppFontFamily.values;

  /// Выбранный шрифт.
  static final selectedFontFamily = StateProvider.autoDispose<AppFontFamily>(
    (ref) => ref.watch(AppTheme.fontFamily),
  );

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

  /// List scrollPhysics.
  List<AppScrollPhysics> get scrollPhysics => AppScrollPhysics.values;

  /// Выбранный скролл.
  static final selectedScrollPhysic =
      StateProvider.autoDispose<AppScrollPhysics>(
    (ref) => ref.watch(AppTheme.scrollPhysics),
  );

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
  List<AppTypography> get typographyList => AppTypography.values;

  /// Выбранная Типографика.
  static final selectedTypography = StateProvider.autoDispose<AppTypography>(
    (ref) => ref.watch(AppTheme.typography),
  );

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

  StateController<Set<_SavedChanges>> get changesCR =>
      _ref.read(changesProvider.notifier);

  /// Кнопка "Назад".
  Future<bool> onWillPop(BuildContext context) async {
    if (changesCR.state.isNotEmpty) {
      final canSave = await AppDialogs.confirmSaveChanges(context);

      if (canSave) await saveAllChanges();
    }

    return true;
  }

  /// Добавить действие в [changesProvider], которое подлежит
  /// дальнейшему вызову [saveAllChanges].
  ///
  void _saveNewAction(_SavedChanges change) =>
      changesCR.update((state) => Set.of({...state, change}));

  /// Call all save functions. May be as follows:
  ///
  /// * [_saveTextScaleFactor]
  /// * [_saveFontFamily]
  /// * [_saveTypography]
  /// * [_saveScrollPhysics]
  ///
  Future<void> saveAllChanges() async {
    for (final _SavedChanges change in changesCR.state) {
      await switch (change) {
        _SavedChanges.textScaleFactor => _saveTextScaleFactor,
        _SavedChanges.fontFamily => _saveFontFamily,
        _SavedChanges.typography => _saveTypography,
        _SavedChanges.scrollPhysics => _saveScrollPhysics,
      }
          .call();
    }

    _ref.invalidate(changesProvider);
  }

  Future<void> resetToDefaultSettings() async =>
      _ref.read(AppTheme.instance).resetVisualDesignToDefaultSettings();
}
