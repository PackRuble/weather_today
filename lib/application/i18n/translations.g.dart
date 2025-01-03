/// Generated file. Do not edit.
///
/// Source: assets/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 752 (376 per locale)
///
/// Built on 2025-01-03 at 09:03 UTC

// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

import 'translations_en.g.dart' deferred as l_en;
part 'translations_ru.g.dart';

/// Supported locales.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.ru) // set locale
/// - Locale locale = AppLocale.ru.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.ru) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
  ru(languageCode: 'ru'),
  en(languageCode: 'en');

  const AppLocale({
    required this.languageCode,
    this.scriptCode, // ignore: unused_element
    this.countryCode, // ignore: unused_element
  });

  @override
  final String languageCode;
  @override
  final String? scriptCode;
  @override
  final String? countryCode;

  @override
  Future<Translations> build({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
  }) async {
    switch (this) {
      case AppLocale.ru:
        return TranslationsRu(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.en:
        await l_en.loadLibrary();
        return l_en.TranslationsEn(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
    }
  }

  @override
  Translations buildSync({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
  }) {
    switch (this) {
      case AppLocale.ru:
        return TranslationsRu(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.en:
        return l_en.TranslationsEn(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
    }
  }
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
  AppLocaleUtils._()
      : super(
          baseLocale: AppLocale.ru,
          locales: AppLocale.values,
        );

  static final instance = AppLocaleUtils._();

  // static aliases (checkout base methods for documentation)
  static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
  static AppLocale parseLocaleParts(
          {required String languageCode,
          String? scriptCode,
          String? countryCode}) =>
      instance.parseLocaleParts(
          languageCode: languageCode,
          scriptCode: scriptCode,
          countryCode: countryCode);
  static AppLocale findDeviceLocale() => instance.findDeviceLocale();
  static List<Locale> get supportedLocales => instance.supportedLocales;
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}
