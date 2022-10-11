import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_today/const/key_store.dart';
import 'package:weather_today/core/services/local_db_service/data_base_controller.dart';
import 'package:weather_today/core/services/local_db_service/interface/i_data_base.dart';

import '../../i18n/translations.g.dart';

/// Быстрый доступ к переменной перевода.
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of translate).
///
/// Usage:
/// t.someKey.anotherKey;
late TranslationsRu tr;

/// Управление локалью всего приложения.
///
/// Сюда входит:
/// * связь с базой данных;
/// * изменение провайдеров для реактивных изменений интерфейса;
/// * любая работа с локалью;
class AppLocalization {
  AppLocalization(this.ref);

  final Ref ref;

  IDataBase get _dbService => ref.read(dbService);

  static final instance = Provider<AppLocalization>(AppLocalization.new);

  // static TranslationsRu get _t => AppLocale.ru.build();
  // static set _t(TranslationsRu translationsRu) => translationsRu;

  /// Текущая локаль приложения.
  static final currentLocale = StateProvider<AppLocale>((ref) => AppLocale.ru);

  /// загрузить из бд локаль.
  Future<void> init() async {
    final AppLocale locale = _parseRawLocale(await _getUserStoredLocale());
    Intl.defaultLocale = locale.languageCode;
    tr = locale.build();
    ref.read(currentLocale.notifier).update((_) => locale);
  }

  /// перевести сырые строки.
  AppLocale _parseRawLocale(String rawLocale) =>
      AppLocaleUtils.parse(rawLocale);

  /// Получить сырую локаль из бд.
  Future<String> _getUserStoredLocale() async =>
      _dbService.load(DbStore.appLocale, DbStore.appLocaleDefault);

  /// Текущий translation.
  static final currentTranslation = StateProvider<TranslationsRu>((ref) {
    final AppLocale locale = ref.watch(currentLocale);
    // ignore: join_return_with_assignment
    tr = locale.build(); // we need to assign
    return tr;
  });

  /// Получить перевод по локали.
  @Deprecated('Устарело в связи с аналогичным методом [AppLocale.build()]')
  static TranslationsRu getTranslation(AppLocale locale) {
    switch (locale) {
      case AppLocale.ru:
        return AppLocale.ru.build();
      case AppLocale.en:
        return AppLocale.en.build();
    }
  }

  /// Текущая локаль девайса.
  AppLocale get deviceLocale => AppLocaleUtils.findDeviceLocale();

  /// Список поддерживаемых локалей.
  List<Locale> get supportedLocales =>
      AppLocale.values.map((locale) => locale.flutterLocale).toList();

  List<LocalizationsDelegate> get localizationsDelegates =>
      GlobalMaterialLocalizations.delegates;

  /// Установить новую локаль. (с сохранением в бд)
  Future<AppLocale> setLocale(AppLocale locale) async {
    unawaited(_saveLocale(locale.flutterLocale));
    Intl.defaultLocale = locale.languageCode;

    ref.read(currentLocale.notifier).update((_) => locale);
    return locale;
  }

  /// Сохранение локали в бд.
  Future<void> _saveLocale(Locale locale) async =>
      _dbService.save(DbStore.appLocale, locale.languageCode);
}
