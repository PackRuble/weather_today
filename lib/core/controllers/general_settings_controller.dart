import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/const/key_store.dart';
import 'package:weather_today/core/services/local_db_service/data_base_controller.dart';
import 'package:weather_today/core/services/local_db_service/interface/i_data_base.dart';
import 'package:weather_today/utils/state_updater.dart';

import '../../ui/pages/main_page/model/homepage_index_model.dart';

/// Представляет контроллер общих настроек приложения.
///
/// Запустить [init] при использовании класса.
class AppGeneralSettings with Updater {
  AppGeneralSettings(this.ref);

  @override
  final Ref ref;

  @override
  IDataBase get db => ref.read(dbService);

  Future<void> init() async {
    await loadAndUpdate<HomepageIndex, int>(
        startPageIndex,
        DbStore.startPageIndex,
        DbStore.startPageIndexDefault,
        _conversionStartPageIndex);

    await loadAndUpdate<bool, bool>(
        showIntro, DbStore.showIntro, DbStore.showIntroDefault);
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
      (ref) => _conversionStartPageIndex(DbStore.startPageIndexDefault));

  static HomepageIndex _conversionStartPageIndex(int value) =>
      HomepageIndex.values[value];

  /// Установить новую стартовую страницу при загрузке [startPageIndex].
  Future<void> setStartPageIndex(HomepageIndex value) async {
    update<HomepageIndex>(startPageIndex, value);
    await saveDb<int>(DbStore.startPageIndex, value.index);
  }

  // ===========================================================================

  /// Показать интро? Обычно необходимо показать при первом запуске.
  static final showIntro =
      StateProvider<bool>((ref) => DbStore.showIntroDefault);

  Future<void> setIsIntro(bool value) async {
    await saveAndUpdate<bool>(showIntro, DbStore.showIntro, value);
  }
}
