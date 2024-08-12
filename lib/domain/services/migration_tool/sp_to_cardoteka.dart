// ignore_for_file: deprecated_member_use_from_same_package

import 'package:weather_today/domain/controllers/app_theme/models/design_page.dart';
import 'package:weather_today/domain/services/cardoteka/settings_storage.dart';
import 'package:weather_today/domain/services/local_storage/interface/data_base.dart';
import 'package:weather_today/domain/services/local_storage/key_store.dart';

/// Used as an annotation to associate migrations and build number.
class _Migrate {
  const _Migrate(this.buildNumber);

  /// A number indicating the assembly in which the migration was first performed.
  final String buildNumber;
}

class MigrationTool {
  const MigrationTool({
    required this.localStorageOld,
    required this.settingsStorageNew,
  });

  final DataBase localStorageOld;
  final SettingsStorage settingsStorageNew;

  Future<void> migrate() async {
    await Future.wait([_visualDesignMigrate()]);
  }

  @_Migrate('18')
  Future<void> _visualDesignMigrate() async {
    const oldKey = DbStore.visualDesignApp;

    if (!(await localStorageOld.contains(oldKey))) return;

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
