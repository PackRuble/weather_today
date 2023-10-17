import 'package:weather_today/domain/controllers/app_theme/models/design_page.dart';
import 'package:weather_today/domain/services/cardoteka/settings_storage.dart';
import 'package:weather_today/domain/services/local_storage/interface/data_base.dart';
import 'package:weather_today/domain/services/local_storage/key_store.dart';

class MigrationTool {
  const MigrationTool({
    required this.localStorageOld,
    required this.settingsStorageNew,
    required this.buildNumber,
  });

  final DataBase localStorageOld;
  final SettingsStorage settingsStorageNew;
  final int buildNumber;

  static const int buildNumberMigration18 = 18;

  Future<void> migrate() async {
    if (buildNumber >= buildNumberMigration18) {
      await Future.wait([_visualDesignMigrate()]);
    }
  }

  Future<void> _visualDesignMigrate() async {
    const oldKey = DbStore.visualDesignApp;

    if (await localStorageOld.contains(oldKey)) {
      final visualDesignAppStored = await localStorageOld.load(
        oldKey,
        DbStore.visualDesignAppDefault,
      );

      final design = switch (visualDesignAppStored) {
        0 => AppVisualDesign.byRuble,
        1 => AppVisualDesign.byTolskaya,
        _ => AppVisualDesign.byRuble,
      };

      final pagesNew = [
        DesignPage(page: WeatherPage.hourly, design: design),
        DesignPage(page: WeatherPage.currently, design: design),
        DesignPage(page: WeatherPage.daily, design: design),
      ];

      await settingsStorageNew.set<List<DesignPage>>(
        SettingsCards.designPages,
        pagesNew,
      );

      await localStorageOld.clearKey(oldKey);
    }
  }
}
