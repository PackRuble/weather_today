import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/domain/controllers/utils/state_updater.dart';
import 'package:weather_today/domain/services/local_storage/data_base_controller.dart';
import 'package:weather_today/domain/services/local_storage/interface/data_base.dart';
import 'package:weather_today/domain/services/local_storage/key_store.dart';

/// Стартовая страница приложения.
enum HomepageIndex { settings, hourly, today, daily }

/// Представляет контроллер общих настроек приложения.
///
/// Запустить [init] при использовании класса.
class AppGeneralSettings with Updater {
  AppGeneralSettings(this.ref);

  @override
  final Ref ref;

  @override
  DataBase get db => ref.read(dbService);

  Future<void> init() async {
    await loadAndUpdate<HomepageIndex, int>(
        startPageIndex,
        DbStore.startPageIndex,
        DbStore.startPageIndexDefault,
        _conversionStartPageIndex);

    await loadAndUpdate<bool, bool>(
        showIntro, DbStore.showIntro, DbStore.showIntroDefault);

    await loadAndUpdate<bool, bool>(
        isAcceptedTermsConditions,
        DbStore.isAcceptedTermsConditions,
        DbStore.isAcceptedTermsConditionsDefault);
  }

  /// Access to an instance of a class.
  static final instance = Provider(
    AppGeneralSettings.new,
    name: '$AppGeneralSettings',
  );

  // Стартовая страница при запуске приложения.
  // ===========================================================================

  /// Выбранная страница при старте приложения.
  static final startPageIndex = StateProvider<HomepageIndex>(
    (ref) => _conversionStartPageIndex(DbStore.startPageIndexDefault),
    name: '$AppGeneralSettings/startPageIndex',
  );

  static HomepageIndex _conversionStartPageIndex(int value) =>
      HomepageIndex.values[value];

  /// Установить новую стартовую страницу при загрузке [startPageIndex].
  Future<void> setStartPageIndex(HomepageIndex value) async {
    update<HomepageIndex>(startPageIndex, value);
    await saveDb<int>(DbStore.startPageIndex, value.index);
  }

  // ===========================================================================

  /// Показать интро? Обычно необходимо показать при первом запуске.
  static final showIntro = StateProvider<bool>(
    (ref) => DbStore.showIntroDefault,
    name: '$AppGeneralSettings/showIntro',
  );

  Future<void> setIsIntro(bool value, [bool isNotify = true]) async {
    if (!isNotify) return saveDb<bool>(DbStore.showIntro, value);
    await saveAndUpdate<bool>(showIntro, DbStore.showIntro, value);
  }

  // ===========================================================================

  /// Приняты ли условия использования данного приложения.
  static final isAcceptedTermsConditions = StateProvider<bool>(
    (ref) => DbStore.isAcceptedTermsConditionsDefault,
    name: '$AppGeneralSettings/isAcceptedTermsConditions',
  );

  Future<void> setAcceptedTermsConditions(bool value) async {
    await saveAndUpdate<bool>(
        isAcceptedTermsConditions, DbStore.isAcceptedTermsConditions, value);
  }
}
