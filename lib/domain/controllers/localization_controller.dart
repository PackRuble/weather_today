import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weather_today/domain/services/local_storage/data_base_controller.dart';
import 'package:weather_today/domain/services/local_storage/interface/data_base.dart';
import 'package:weather_today/domain/services/local_storage/key_store.dart';

import '../../application/i18n/translations.g.dart';

extension RefTr on Ref {
  Translations get tr => read(AppLocalization.currentTranslation);
}

extension WidgetRefTr on WidgetRef {
  Translations get tr => watch(AppLocalization.currentTranslation);
}

/// Быстрый доступ к переменной перевода.
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of translate).
///
/// Usage:
/// [tr].someKey.anotherKey;
TranslationsRu get tr => _tr;

late TranslationsRu _tr;

/// Управление локалью всего приложения.
///
/// Сюда входит:
/// * связь с базой данных;
/// * изменение провайдеров для реактивных изменений интерфейса;
/// * любая работа с локалью;
class AppLocalization {
  AppLocalization(this._ref);

  final Ref _ref;

  DataBase get _dbService => _ref.read(dbService);

  static final instance = Provider<AppLocalization>(
    AppLocalization.new,
    name: '$AppLocalization',
  );

  /// Текущая локаль приложения.
  static final currentLocale = StateProvider((_) => AppLocale.ru);

  /// загрузить из бд локаль.
  Future<void> init() async {
    final AppLocale locale = _parseRawLocale(await _getUserStoredLocale());
    Intl.defaultLocale = locale.languageCode;
    _tr = await locale.build();
    _ref.read(currentLocale.notifier).update((_) => locale);
  }

  /// перевести сырые строки.
  AppLocale _parseRawLocale(String rawLocale) =>
      AppLocaleUtils.parse(rawLocale);

  /// Получить сырую локаль из бд.
  Future<String> _getUserStoredLocale() async =>
      _dbService.load(DbStore.appLocale, DbStore.appLocaleDefault);

  /// Текущий translation.
  static final currentTranslation = StateProvider<TranslationsRu>(
    (ref) {
      final AppLocale locale = ref.watch(currentLocale);

      Future(() async {
        _tr = await locale.build();
        ref.controller.state = _tr;
      });
      return tr;
    },
    name: '$AppLocalization/currentTranslation',
  );

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

    _ref.read(currentLocale.notifier).update((_) => locale);
    return locale;
  }

  /// Сохранение локали в бд.
  Future<void> _saveLocale(Locale locale) async =>
      _dbService.save(DbStore.appLocale, locale.languageCode);
}
