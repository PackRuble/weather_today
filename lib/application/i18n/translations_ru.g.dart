///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'translations.g.dart';

// Path: <root>
typedef TranslationsRu = Translations; // ignore: unused_element

class Translations implements BaseTranslations<AppLocale, Translations> {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(
         overrides == null,
         'Set "translation_overrides: true" in order to enable this feature.',
       ),
       $meta =
           meta ??
           TranslationMetadata(
             locale: AppLocale.ru,
             overrides: overrides ?? {},
             cardinalResolver: cardinalResolver,
             ordinalResolver: ordinalResolver,
           );

  /// Metadata for the translations of <ru>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  late final Translations _root = this; // ignore: unused_field

  Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) =>
      Translations(meta: meta ?? this.$meta);

  // Translations
  late final TranslationsMainPageDRubleRu mainPageDRuble = TranslationsMainPageDRubleRu.internal(
    _root,
  );
  late final TranslationsSettingsPageRu settingsPage = TranslationsSettingsPageRu.internal(_root);
  late final TranslationsVisualDesignPageRu visualDesignPage =
      TranslationsVisualDesignPageRu.internal(_root);
  late final TranslationsThemesPageRu themesPage = TranslationsThemesPageRu.internal(_root);
  late final TranslationsSavedPlacesPageRu savedPlacesPage = TranslationsSavedPlacesPageRu.internal(
    _root,
  );
  late final TranslationsSearchBarRu searchBar = TranslationsSearchBarRu.internal(_root);
  late final TranslationsFlagsPageRu flagsPage = TranslationsFlagsPageRu.internal(_root);
  late final TranslationsSystemSettingsPageRu systemSettingsPage =
      TranslationsSystemSettingsPageRu.internal(_root);
  late final TranslationsGratitudePageRu gratitudePage = TranslationsGratitudePageRu.internal(
    _root,
  );
  late final TranslationsWeatherLangPageRu weatherLangPage = TranslationsWeatherLangPageRu.internal(
    _root,
  );
  late final TranslationsApiWeatherPageRu apiWeatherPage = TranslationsApiWeatherPageRu.internal(
    _root,
  );
  late final TranslationsIntroPageRu introPage = TranslationsIntroPageRu.internal(_root);
  late final TranslationsTermsConditionsRu termsConditions = TranslationsTermsConditionsRu.internal(
    _root,
  );
  late final TranslationsWeatherRu weather = TranslationsWeatherRu.internal(_root);
  late final TranslationsGlobalRu global = TranslationsGlobalRu.internal(_root);
  late final TranslationsDialogsRu dialogs = TranslationsDialogsRu.internal(_root);
  late final TranslationsEnumsRu enums = TranslationsEnumsRu.internal(_root);
  late final TranslationsUnitsRu units = TranslationsUnitsRu.internal(_root);
  late final TranslationsMessagesRu messages = TranslationsMessagesRu.internal(_root);
  late final TranslationsUiRu ui = TranslationsUiRu.internal(_root);
  late final TranslationsOtherRu other = TranslationsOtherRu.internal(_root);
}

// Path: mainPageDRuble
class TranslationsMainPageDRubleRu {
  TranslationsMainPageDRubleRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsMainPageDRubleMainPageRu mainPage =
      TranslationsMainPageDRubleMainPageRu.internal(_root);
  late final TranslationsMainPageDRubleHourlyPageRu hourlyPage =
      TranslationsMainPageDRubleHourlyPageRu.internal(_root);
  late final TranslationsMainPageDRubleCurrentPageRu currentPage =
      TranslationsMainPageDRubleCurrentPageRu.internal(_root);
}

// Path: settingsPage
class TranslationsSettingsPageRu {
  TranslationsSettingsPageRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsSettingsPageHeadersRu headers = TranslationsSettingsPageHeadersRu.internal(
    _root,
  );
  late final TranslationsSettingsPageSavedPlacesTileRu savedPlacesTile =
      TranslationsSettingsPageSavedPlacesTileRu.internal(_root);
  late final TranslationsSettingsPageTempTileRu tempTile =
      TranslationsSettingsPageTempTileRu.internal(_root);
  late final TranslationsSettingsPagePressureTileRu pressureTile =
      TranslationsSettingsPagePressureTileRu.internal(_root);
  late final TranslationsSettingsPageSpeedTileRu speedTile =
      TranslationsSettingsPageSpeedTileRu.internal(_root);
  late final TranslationsSettingsPageWeatherLangTileRu weatherLangTile =
      TranslationsSettingsPageWeatherLangTileRu.internal(_root);
  late final TranslationsSettingsPageUserApiTileRu userApiTile =
      TranslationsSettingsPageUserApiTileRu.internal(_root);
  late final TranslationsSettingsPageVisualDesignTileRu visualDesignTile =
      TranslationsSettingsPageVisualDesignTileRu.internal(_root);
  late final TranslationsSettingsPageThemeTileRu themeTile =
      TranslationsSettingsPageThemeTileRu.internal(_root);
  late final TranslationsSettingsPageCountryFlagsTileRu countryFlagsTile =
      TranslationsSettingsPageCountryFlagsTileRu.internal(_root);
  late final TranslationsSettingsPageHomepageTileRu homepageTile =
      TranslationsSettingsPageHomepageTileRu.internal(_root);
  late final TranslationsSettingsPageLocaleTileRu localeTile =
      TranslationsSettingsPageLocaleTileRu.internal(_root);
  late final TranslationsSettingsPageGratitudeTileRu gratitudeTile =
      TranslationsSettingsPageGratitudeTileRu.internal(_root);
  late final TranslationsSettingsPageSystemSettingsTileRu systemSettingsTile =
      TranslationsSettingsPageSystemSettingsTileRu.internal(_root);
  late final TranslationsSettingsPageAboutAppTileRu aboutAppTile =
      TranslationsSettingsPageAboutAppTileRu.internal(_root);
}

// Path: visualDesignPage
class TranslationsVisualDesignPageRu {
  TranslationsVisualDesignPageRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Визуальное оформление'
  String get appbarTitle => 'Визуальное оформление';

  late final TranslationsVisualDesignPageTipsRu tips = TranslationsVisualDesignPageTipsRu.internal(
    _root,
  );
  late final TranslationsVisualDesignPageHeadersRu headers =
      TranslationsVisualDesignPageHeadersRu.internal(_root);
}

// Path: themesPage
class TranslationsThemesPageRu {
  TranslationsThemesPageRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Цветовое решение'
  String get appbarTitle => 'Цветовое решение';

  /// ru: 'Поменять Primary и Secondary цвета'
  String get swapColorsLight => 'Поменять Primary и Secondary цвета';

  /// ru: 'Поменять Main и Container цвета'
  String get swapColorsDark => 'Поменять Main и Container цвета';

  /// ru: 'Использовать Material Design 3'
  String get useMaterial3 => 'Использовать Material Design 3';

  /// ru: 'Новые спецэффекты и цвета'
  String get useMaterial3Sub => 'Новые спецэффекты и цвета';

  /// ru: 'Цветовой режим'
  String get darkMode => 'Цветовой режим';

  /// ru: 'Режим'
  String get darkModeSub => 'Режим';

  /// ru: 'Оттенки черного'
  String get darkLevel => 'Оттенки черного';

  /// ru: 'Ослепительно черный'
  String get darkIsTrueBlack => 'Ослепительно черный';

  /// ru: 'Энергосберегающий для OLED'
  String get darkIsTrueBlackSub => 'Энергосберегающий для OLED';
}

// Path: savedPlacesPage
class TranslationsSavedPlacesPageRu {
  TranslationsSavedPlacesPageRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsSavedPlacesPageTipsRu tips = TranslationsSavedPlacesPageTipsRu.internal(
    _root,
  );

  /// ru: 'Сохраненных местоположений не найдено.'
  String get placesNotFound => 'Сохраненных местоположений не найдено.';

  /// ru: 'Долгота'
  String get longitude => 'Долгота';

  /// ru: 'Широта'
  String get latitude => 'Широта';

  /// ru: 'Заметка...'
  String get emptyNote => 'Заметка...';
}

// Path: searchBar
class TranslationsSearchBarRu {
  TranslationsSearchBarRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Введите название места'
  String get hintTextField => 'Введите название места';

  late final TranslationsSearchBarTipsRu tips = TranslationsSearchBarTipsRu.internal(_root);
}

// Path: flagsPage
class TranslationsFlagsPageRu {
  TranslationsFlagsPageRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Флаги разных стран'
  String get appbarTitle => 'Флаги разных стран';
}

// Path: systemSettingsPage
class TranslationsSystemSettingsPageRu {
  TranslationsSystemSettingsPageRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Системные настройки'
  String get appbarTitle => 'Системные настройки';

  late final TranslationsSystemSettingsPageEnableLogsTileRu enableLogsTile =
      TranslationsSystemSettingsPageEnableLogsTileRu.internal(_root);
}

// Path: gratitudePage
class TranslationsGratitudePageRu {
  TranslationsGratitudePageRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Хочу сказать спасибо...'
  String get appbarTitle => 'Хочу сказать спасибо...';

  /// ru: ' Годом ранее я увлекся новым языком программирования Dart, попутно изучив Flutter. Для оттачивания своих навыков в субстанции нового я понял, что хочу создать простенькое (казалось мне тогда, хохо) приложение — агрегатор погоды. И вот, минуя полгода, на свет появилось приложение под названием "Weather Today — погода на каждый день". За время разработки со мной были рядом люди (и их решения), оказывающие большую помощь и поддержку. Я бесконечно благодарен своей девушке за её терпение, понимание и принятие того, что редкие вечерние часы я тратил на работу над приложением, вместо того, чтобы провести их с семьёй. Также я хотел бы отдать должное коллегам-разработчикам, кто выкладывает интересные и, немаловажно, полезные разработки. В особенности я хочу отметить команду {Dart(dart)} и {Flutter(flutter)} за прекрасную платформу для построения хороших приложений; {RemiRousselet(Remi Rousselet)} за восхитительные пакеты {Riverpod(riverpod)} и {Freezed(freezed)}; {TienDoNam(Tien Do Nam)} за прекрасный {Slang(slang)}; {RydMike(Ryd Mike)} за очаровательный пакет {FlexColorScheme(flexColorScheme)}. Я всегда открыт для общения и буду благодарен, если вы напишите пару строк о сим творении, а также поделитесь мнением о возможных функциях, которые стоит сделать. Со мной можно связаться: - email: {myEmail(pack.ruble@gmail.com)} - telegram: {tgGroup(группа Telegram)}'
  TextSpan text({
    required InlineSpanBuilder dart,
    required InlineSpanBuilder flutter,
    required InlineSpanBuilder remiRousselet,
    required InlineSpanBuilder riverpod,
    required InlineSpanBuilder freezed,
    required InlineSpanBuilder tienDoNam,
    required InlineSpanBuilder slang,
    required InlineSpanBuilder rydMike,
    required InlineSpanBuilder flexColorScheme,
    required InlineSpanBuilder myEmail,
    required InlineSpanBuilder tgGroup,
  }) => TextSpan(
    children: [
      const TextSpan(
        text:
            '  Годом ранее я увлекся новым языком программирования Dart, попутно изучив Flutter. Для оттачивания своих навыков в субстанции нового я понял, что хочу создать простенькое (казалось мне тогда, хохо) приложение — агрегатор погоды. И вот, минуя полгода, на свет появилось приложение под названием "Weather Today — погода на каждый день".\n  За время разработки со мной были рядом люди (и их решения), оказывающие большую помощь и поддержку.\n  Я бесконечно благодарен своей девушке за её терпение, понимание и принятие того, что редкие вечерние часы я тратил на работу над приложением, вместо того, чтобы провести их с семьёй.\n  Также я хотел бы отдать должное коллегам-разработчикам, кто выкладывает интересные и, немаловажно, полезные разработки. В особенности я хочу отметить команду ',
      ),
      dart('dart'),
      const TextSpan(text: ' и '),
      flutter('flutter'),
      const TextSpan(text: ' за прекрасную платформу для построения хороших приложений; '),
      remiRousselet('Remi Rousselet'),
      const TextSpan(text: ' за восхитительные пакеты '),
      riverpod('riverpod'),
      const TextSpan(text: ' и '),
      freezed('freezed'),
      const TextSpan(text: '; '),
      tienDoNam('Tien Do Nam'),
      const TextSpan(text: ' за прекрасный '),
      slang('slang'),
      const TextSpan(text: '; '),
      rydMike('Ryd Mike'),
      const TextSpan(text: ' за очаровательный пакет '),
      flexColorScheme('flexColorScheme'),
      const TextSpan(
        text:
            '.\n  Я всегда открыт для общения и буду благодарен, если вы напишите пару строк о сим творении, а также поделитесь мнением о возможных функциях, которые стоит сделать.\n  Со мной можно связаться:\n    - email: ',
      ),
      myEmail('pack.ruble@gmail.com'),
      const TextSpan(text: '\n    - telegram: '),
      tgGroup('группа Telegram'),
    ],
  );
}

// Path: weatherLangPage
class TranslationsWeatherLangPageRu {
  TranslationsWeatherLangPageRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Язык погодных условий'
  String get appbarTitle => 'Язык погодных условий';

  late final TranslationsWeatherLangPageTipsRu tips = TranslationsWeatherLangPageTipsRu.internal(
    _root,
  );
}

// Path: apiWeatherPage
class TranslationsApiWeatherPageRu {
  TranslationsApiWeatherPageRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Ваш ключ Api'
  String get appbarTitle => 'Ваш ключ Api';

  /// ru: 'Перейти на сайт openweathermap.org'
  String get goToSite => 'Перейти на сайт openweathermap.org';

  /// ru: 'Проверить актуальность'
  String get buttonCheckRelevance => 'Проверить актуальность';

  /// ru: 'Сбросить'
  String get buttonReset => 'Сбросить';

  late final TranslationsApiWeatherPageTipsRu tips = TranslationsApiWeatherPageTipsRu.internal(
    _root,
  );
  late final TranslationsApiWeatherPageDefaultApiRu defaultApi =
      TranslationsApiWeatherPageDefaultApiRu.internal(_root);
  late final TranslationsApiWeatherPageUserApiRu userApi =
      TranslationsApiWeatherPageUserApiRu.internal(_root);
  late final TranslationsApiWeatherPageTooltipsRu tooltips =
      TranslationsApiWeatherPageTooltipsRu.internal(_root);
}

// Path: introPage
class TranslationsIntroPageRu {
  TranslationsIntroPageRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'УЗНАВАЙ'
  String get tile1title => 'УЗНАВАЙ';

  /// ru: 'Сверхточная погода на 48 часов и актуальная на 7 дней. Не попадай под дождь – ведь есть предупреждения о погоде'
  String get tile1subtitle =>
      'Сверхточная погода на 48 часов и актуальная на 7 дней. Не попадай под дождь – ведь есть предупреждения о погоде';

  /// ru: 'ИЗМЕРЯЙ'
  String get tile2title => 'ИЗМЕРЯЙ';

  /// ru: 'Используй удобные для СЕБЯ единицы измерения температуры, скорости и давления'
  String get tile2subtitle =>
      'Используй удобные для СЕБЯ единицы измерения температуры, скорости и давления';

  /// ru: 'СОХРАНЯЙ'
  String get tile3title => 'СОХРАНЯЙ';

  /// ru: 'Любимые местоположения всегда под рукой. Какая погода сегодня в Лондоне?'
  String get tile3subtitle =>
      'Любимые местоположения всегда под рукой. Какая погода сегодня в Лондоне?';

  /// ru: 'ВИЗУАЛИЗИРУЙ'
  String get tile4title => 'ВИЗУАЛИЗИРУЙ';

  /// ru: 'Красочные цветовые темы позаботятся о плохом настроении в пасмурную погоду. Есть ночная тема'
  String get tile4subtitle =>
      'Красочные цветовые темы позаботятся о плохом настроении в пасмурную погоду. Есть ночная тема';

  /// ru: 'Назад'
  String get previousButton => 'Назад';

  /// ru: 'Далее'
  String get nextButton => 'Далее';

  /// ru: 'Готово'
  String get doneButton => 'Готово';
}

// Path: termsConditions
class TranslationsTermsConditionsRu {
  TranslationsTermsConditionsRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Ознакомьтесь и согласитесь со всеми юридическими документами для использования данного приложения.'
  String get informationForAction =>
      'Ознакомьтесь и согласитесь со всеми юридическими документами для использования данного приложения.';

  /// ru: 'Политика конфиденциальности'
  String get privacyPolicy => 'Политика конфиденциальности';

  /// ru: 'Положения и условия'
  String get termsAndConditions => 'Положения и условия';

  /// ru: 'Условия использования приложения'
  String get termsUseApp => 'Условия использования приложения';

  /// ru: 'После нажатия кнопки "Принять" вы подтверждаете, что ознакомились и согласны со всем вышеуказанным'
  String get confirmationWithTheAbove =>
      'После нажатия кнопки "${_root.termsConditions.buttonAccept}" вы подтверждаете, что ознакомились и согласны со всем вышеуказанным';

  /// ru: 'Отклонить и выйти'
  String get buttonCancel => 'Отклонить и выйти';

  /// ru: 'Принять'
  String get buttonAccept => 'Принять';
}

// Path: weather
class TranslationsWeatherRu {
  TranslationsWeatherRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  Map<String, String> get owmConditionsBriefByName => {
    'thunderstorm': 'Гроза',
    'drizzle': 'Морось',
    'rain': 'Дождь',
    'snow': 'Снег',
    'mist': 'Туман',
    'smoke': 'Дым',
    'haze': 'Дымка',
    'dust': 'Пыльно',
    'fog': 'Мгла',
    'sand': 'Песок',
    'ash': 'Пепел',
    'squall': 'Шквал',
    'tornado': 'Торнадо',
    'clear': 'Ясно',
    'clouds': 'Пасмурно',
  };
  Map<String, String> get omConditionsBrief => {
    'code0': 'Ясно',
    'code1': 'Ясно',
    'code2': 'Облачно',
    'code3': 'Пасмурно',
    'code45': 'Туман',
    'code48': 'Туман',
    'code51': 'Морось',
    'code53': 'Морось',
    'code55': 'Морось',
    'code56': 'Ледяная морось',
    'code57': 'Ледяная морось',
    'code61': 'Дождь',
    'code63': 'Дождь',
    'code65': 'Ливень',
    'code66': 'Ледяной дождь',
    'code67': 'Ледяной дождь',
    'code71': 'Снегопад',
    'code73': 'Снегопад',
    'code75': 'Снегопад',
    'code77': 'Крупинки снега',
    'code80': 'Ливень',
    'code81': 'Ливень',
    'code82': 'Ливень',
    'code85': 'Ливень со снегом',
    'code86': 'Ливень со снегом',
    'code95': 'Гроза',
    'code96': 'Гроза с градом',
    'code99': 'Гроза с градом',
  };
  Map<String, String> get omConditionsDesc => {
    'code0': 'Чистое небо',
    'code1': 'В основном ясно',
    'code2': 'Переменная облачность',
    'code3': 'Пасмурно',
    'code45': 'Туман',
    'code48': 'Откладывание инейного тумана',
    'code51': 'Легкая морось',
    'code53': 'Умеренная морось',
    'code55': 'Сильная морось',
    'code56': 'Лёгкая ледяная морось',
    'code57': 'Плотная ледяная морось',
    'code61': 'Небольшой дождь',
    'code63': 'Умеренный дождь',
    'code65': 'Ливень',
    'code66': 'Легкий ледяной дождь',
    'code67': 'Сильный ледяной дождь',
    'code71': 'Небольшой снегопад',
    'code73': 'Умеренный снегопад',
    'code75': 'Сильный снегопад',
    'code77': 'Крупинки снега',
    'code80': 'Небольшой ливень',
    'code81': 'Умеренные ливневые дожди',
    'code82': 'Сильные ливневые дожди',
    'code85': 'Небольшой ливень со снегом',
    'code86': 'Сильные ливни со снегом',
    'code95': 'Гроза',
    'code96': 'Гроза с небольшим градом',
    'code99': 'Гроза с сильным градом',
  };

  /// ru: 'На горизонте спокойно'
  String get quietlyOnTheHorizon => 'На горизонте спокойно';

  /// ru: 'Данные не предоставлены'
  String get noDataProvided => 'Данные не предоставлены';

  /// ru: 'Показатели'
  String get indicators => 'Показатели';

  /// ru: 'Минимум'
  String get minimum => 'Минимум';

  /// ru: 'Максимум'
  String get maximum => 'Максимум';

  /// ru: 'Реальная'
  String get real => 'Реальная';

  /// ru: 'Ощущается'
  String get feels => 'Ощущается';

  /// ru: 'Ощущается как'
  String get feelsLikeAs => 'Ощущается как';

  /// ru: 'Актуально на'
  String get currentAsOf => 'Актуально на';

  /// ru: 'Восход и закат'
  String get riseAndSet => 'Восход и закат';

  /// ru: 'Восходы и закаты'
  String get riseAndSetPl => 'Восходы и закаты';

  /// ru: 'Солнце'
  String get sun => 'Солнце';

  /// ru: 'Луна'
  String get moon => 'Луна';

  /// ru: 'Восход'
  String get rise => 'Восход';

  /// ru: 'Закат'
  String get set => 'Закат';

  /// ru: 'Восход солнца'
  String get sunrise => 'Восход солнца';

  /// ru: 'Закат солнца'
  String get sunset => 'Закат солнца';

  /// ru: 'Восход луны'
  String get moonrise => 'Восход луны';

  /// ru: 'Закат луны'
  String get moonset => 'Закат луны';

  /// ru: 'Фаза луны'
  String get moonPhase => 'Фаза луны';

  /// ru: 'солнце уже зашло'
  String get sunAlreadySet => 'солнце уже зашло';

  /// ru: 'Световой день'
  String get daylightHours => 'Световой день';

  /// ru: 'Световой день'
  String get daylightHoursNl => 'Световой\nдень';

  /// ru: 'Утром'
  String get atMorning => 'Утром';

  /// ru: 'Днём'
  String get atDay => 'Днём';

  /// ru: 'Вечером'
  String get atEvening => 'Вечером';

  /// ru: 'Ночью'
  String get atNight => 'Ночью';

  /// ru: 'Утро'
  String get morning => 'Утро';

  /// ru: 'День'
  String get day => 'День';

  /// ru: 'Вечер'
  String get evening => 'Вечер';

  /// ru: 'Ночь'
  String get night => 'Ночь';

  /// ru: 'Давление'
  String get pressure => 'Давление';

  /// ru: 'Влажность'
  String get humidity => 'Влажность';

  /// ru: 'Точка росы'
  String get dewPoint => 'Точка росы';

  /// ru: 'Облачность'
  String get cloudiness => 'Облачность';

  /// ru: 'Видимость'
  String get visibility => 'Видимость';

  /// ru: 'УФ'
  String get uvi => 'УФ';

  /// ru: 'Дождь'
  String get rain => 'Дождь';

  /// ru: 'Снег'
  String get snow => 'Снег';

  /// ru: 'Вероятность осадков'
  String get pop => 'Вероятность осадков';

  /// ru: 'Осадки'
  String get precipitation => 'Осадки';

  /// ru: 'Описание'
  String get description => 'Описание';

  /// ru: 'Сторона света'
  String get sideOfTheWorld => 'Сторона света';

  /// ru: 'Скорость'
  String get speed => 'Скорость';

  /// ru: 'Ветер'
  String get wind => 'Ветер';

  /// ru: 'Скорость ветра'
  String get windSpeed => 'Скорость ветра';

  /// ru: 'Порывы ветра'
  String get windGust => 'Порывы ветра';

  /// ru: 'Порыв'
  String get gust => 'Порыв';

  /// ru: 'Порывы'
  String get gusts => 'Порывы';

  /// ru: 'Порывы до'
  String get gustUp => 'Порывы до';

  /// ru: 'Направление ветра'
  String get windSide => 'Направление ветра';

  /// ru: 'Градус'
  String get degree => 'Градус';

  /// ru: 'Градусы'
  String get degrees => 'Градусы';

  /// ru: 'Температура'
  String get temp => 'Температура';

  /// ru: 'Температура утром'
  String get tempMorning => 'Температура утром';

  /// ru: 'Температура днём'
  String get tempDay => 'Температура днём';

  /// ru: 'Температура вечером'
  String get tempEvening => 'Температура вечером';

  /// ru: 'Температура ночью'
  String get tempNight => 'Температура ночью';

  /// ru: 'Минимальная дневная температура'
  String get tempMin => 'Минимальная дневная температура';

  /// ru: 'Максимальная дневная температура'
  String get tempMax => 'Максимальная дневная температура';
}

// Path: global
class TranslationsGlobalRu {
  TranslationsGlobalRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsGlobalTimeRu time = TranslationsGlobalTimeRu.internal(_root);
}

// Path: dialogs
class TranslationsDialogsRu {
  TranslationsDialogsRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsDialogsMessagesRu messages = TranslationsDialogsMessagesRu.internal(_root);
  late final TranslationsDialogsTitlesRu titles = TranslationsDialogsTitlesRu.internal(_root);
  late final TranslationsDialogsButtonsRu buttons = TranslationsDialogsButtonsRu.internal(_root);
  late final TranslationsDialogsPlaceSearchInfoRu placeSearchInfo =
      TranslationsDialogsPlaceSearchInfoRu.internal(_root);
  late final TranslationsDialogsConfirmDelPlaceRu confirmDelPlace =
      TranslationsDialogsConfirmDelPlaceRu.internal(_root);
  late final TranslationsDialogsSeeFlagRu seeFlag = TranslationsDialogsSeeFlagRu.internal(_root);
  late final TranslationsDialogsConfirmDelUserApikeyRu confirmDelUserApikey =
      TranslationsDialogsConfirmDelUserApikeyRu.internal(_root);
  late final TranslationsDialogsConfirmSaveChangesRu confirmSaveChanges =
      TranslationsDialogsConfirmSaveChangesRu.internal(_root);
  late final TranslationsDialogsConfirmResetSettingsRu confirmResetSettings =
      TranslationsDialogsConfirmResetSettingsRu.internal(_root);
  late final TranslationsDialogsMakeNoteRu makeNote = TranslationsDialogsMakeNoteRu.internal(_root);
}

// Path: enums
class TranslationsEnumsRu {
  TranslationsEnumsRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsEnumsHomepageRu homepage = TranslationsEnumsHomepageRu.internal(_root);
}

// Path: units
class TranslationsUnitsRu {
  TranslationsUnitsRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsUnitsTempRu temp = TranslationsUnitsTempRu.internal(_root);
  late final TranslationsUnitsSpeedRu speed = TranslationsUnitsSpeedRu.internal(_root);
  late final TranslationsUnitsPressureRu pressure = TranslationsUnitsPressureRu.internal(_root);
  late final TranslationsUnitsSideOfTheWorldRu sideOfTheWorld =
      TranslationsUnitsSideOfTheWorldRu.internal(_root);
}

// Path: messages
class TranslationsMessagesRu {
  TranslationsMessagesRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Нажмите, чтобы увидеть'
  String get clickToSee => 'Нажмите, чтобы увидеть';

  /// ru: 'Погодные данные актуальны'
  String get weatherDataIsActual => 'Погодные данные актуальны';

  /// ru: 'Выбранный параметр будет сразу применён'
  String get selectedParamWillBeApplied => 'Выбранный параметр будет сразу применён';
}

// Path: ui
class TranslationsUiRu {
  TranslationsUiRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Дополнительные настройки'
  String get advancedSettings => 'Дополнительные настройки';

  /// ru: 'Используется'
  String get used => 'Используется';

  /// ru: 'Выбрать погодного провайдера'
  String get selectWeatherProvider => 'Выбрать погодного провайдера';

  /// ru: 'Выберите погодный дизайн для страницы'
  String get chooseWeatherDesignForPage => 'Выберите погодный дизайн для страницы';

  /// ru: 'Провайдер геокодирования'
  String get geocodingProvider => 'Провайдер геокодирования';

  /// ru: 'Погодный провайдер'
  String get weatherProvider => 'Погодный провайдер';
}

// Path: other
class TranslationsOtherRu {
  TranslationsOtherRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Выберите версию'
  String get selectVersion => 'Выберите версию';

  /// ru: 'Версия'
  String get version => 'Версия';
}

// Path: mainPageDRuble.mainPage
class TranslationsMainPageDRubleMainPageRu {
  TranslationsMainPageDRubleMainPageRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsMainPageDRubleMainPageBottomBarRu bottomBar =
      TranslationsMainPageDRubleMainPageBottomBarRu.internal(_root);
}

// Path: mainPageDRuble.hourlyPage
class TranslationsMainPageDRubleHourlyPageRu {
  TranslationsMainPageDRubleHourlyPageRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsMainPageDRubleHourlyPageForecastRu forecast =
      TranslationsMainPageDRubleHourlyPageForecastRu.internal(_root);
  late final TranslationsMainPageDRubleHourlyPagePopRu pop =
      TranslationsMainPageDRubleHourlyPagePopRu.internal(_root);
  late final TranslationsMainPageDRubleHourlyPageWindRu wind =
      TranslationsMainPageDRubleHourlyPageWindRu.internal(_root);
  late final TranslationsMainPageDRubleHourlyPageMoreRu more =
      TranslationsMainPageDRubleHourlyPageMoreRu.internal(_root);
}

// Path: mainPageDRuble.currentPage
class TranslationsMainPageDRubleCurrentPageRu {
  TranslationsMainPageDRubleCurrentPageRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Восход'
  String get sunrise => 'Восход';

  /// ru: 'Закат'
  String get sunset => 'Закат';

  /// ru: 'Продолжительность дня'
  String get dayLength => 'Продолжительность дня';

  /// ru: 'Время до захода'
  String get timeBeforeSunset => 'Время до захода';

  /// ru: 'солнце уже зашло'
  String get sunAlreadySet => 'солнце уже зашло';

  /// ru: 'Порывы до'
  String get windGust => 'Порывы до';

  late final TranslationsMainPageDRubleCurrentPageHeadersRu headers =
      TranslationsMainPageDRubleCurrentPageHeadersRu.internal(_root);
}

// Path: settingsPage.headers
class TranslationsSettingsPageHeadersRu {
  TranslationsSettingsPageHeadersRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Погода'
  String get weather => 'Погода';

  /// ru: 'Дизайн'
  String get design => 'Дизайн';

  /// ru: 'Общее'
  String get general => 'Общее';
}

// Path: settingsPage.savedPlacesTile
class TranslationsSettingsPageSavedPlacesTileRu {
  TranslationsSettingsPageSavedPlacesTileRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Мои места'
  String get tileTitle => 'Мои места';
}

// Path: settingsPage.tempTile
class TranslationsSettingsPageTempTileRu {
  TranslationsSettingsPageTempTileRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Единицы измерения температуры'
  String get tileTitle => 'Единицы измерения температуры';

  /// ru: '{units}'
  String tileSub({required Object units}) => '${units}';

  /// ru: 'Единицы измерения температуры'
  String get dialogTitle => 'Единицы измерения температуры';

  /// ru: 'Выбранный параметр будет применен во всех измерениях.'
  String get dialogSub => 'Выбранный параметр будет применен во всех измерениях.';
}

// Path: settingsPage.pressureTile
class TranslationsSettingsPagePressureTileRu {
  TranslationsSettingsPagePressureTileRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Единицы измерения давления'
  String get tileTitle => 'Единицы измерения давления';

  /// ru: '{units}'
  String tileSub({required Object units}) => '${units}';

  /// ru: 'Единицы измерения давления'
  String get dialogTitle => 'Единицы измерения давления';

  /// ru: 'Выбранный параметр будет применен во всех измерениях.'
  String get dialogSub => 'Выбранный параметр будет применен во всех измерениях.';
}

// Path: settingsPage.speedTile
class TranslationsSettingsPageSpeedTileRu {
  TranslationsSettingsPageSpeedTileRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Единицы измерения скорости'
  String get tileTitle => 'Единицы измерения скорости';

  /// ru: '{units}'
  String tileSub({required Object units}) => '${units}';

  /// ru: 'Единицы измерения скорости'
  String get dialogTitle => 'Единицы измерения скорости';

  /// ru: 'Выбранный параметр будет применен во всех измерениях.'
  String get dialogSub => 'Выбранный параметр будет применен во всех измерениях.';
}

// Path: settingsPage.weatherLangTile
class TranslationsSettingsPageWeatherLangTileRu {
  TranslationsSettingsPageWeatherLangTileRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Язык погодных условий'
  String get tileTitle => 'Язык погодных условий';
}

// Path: settingsPage.userApiTile
class TranslationsSettingsPageUserApiTileRu {
  TranslationsSettingsPageUserApiTileRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Пользовательское Api'
  String get tileTitle => 'Пользовательское Api';
}

// Path: settingsPage.visualDesignTile
class TranslationsSettingsPageVisualDesignTileRu {
  TranslationsSettingsPageVisualDesignTileRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Визуальное оформление'
  String get tileTitle => 'Визуальное оформление';
}

// Path: settingsPage.themeTile
class TranslationsSettingsPageThemeTileRu {
  TranslationsSettingsPageThemeTileRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Цветовое решение'
  String get tileTitle => 'Цветовое решение';
}

// Path: settingsPage.countryFlagsTile
class TranslationsSettingsPageCountryFlagsTileRu {
  TranslationsSettingsPageCountryFlagsTileRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Флаги разных стран'
  String get tileTitle => 'Флаги разных стран';
}

// Path: settingsPage.homepageTile
class TranslationsSettingsPageHomepageTileRu {
  TranslationsSettingsPageHomepageTileRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Стартовая страница'
  String get tileTitle => 'Стартовая страница';

  /// ru: '{homepage}'
  String tileSub({required Object homepage}) => '${homepage}';

  /// ru: 'Стартовая страница'
  String get dialogTitle => 'Стартовая страница';

  /// ru: 'Нужная страница откроется сразу при запуске приложения.'
  String get dialogSub => 'Нужная страница откроется сразу при запуске приложения.';
}

// Path: settingsPage.localeTile
class TranslationsSettingsPageLocaleTileRu {
  TranslationsSettingsPageLocaleTileRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Язык приложения'
  String get tileTitle => 'Язык приложения';

  /// ru: '{locale}'
  String tileSub({required Object locale}) => '${locale}';

  /// ru: 'Язык приложения'
  String get dialogTitle => 'Язык приложения';

  /// ru: 'Выбранный язык будет применен ко всему приложению.'
  String get dialogSub => 'Выбранный язык будет применен ко всему приложению.';
}

// Path: settingsPage.gratitudeTile
class TranslationsSettingsPageGratitudeTileRu {
  TranslationsSettingsPageGratitudeTileRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Благодарности'
  String get tileTitle => 'Благодарности';
}

// Path: settingsPage.systemSettingsTile
class TranslationsSettingsPageSystemSettingsTileRu {
  TranslationsSettingsPageSystemSettingsTileRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Системные настройки'
  String get tileTitle => 'Системные настройки';
}

// Path: settingsPage.aboutAppTile
class TranslationsSettingsPageAboutAppTileRu {
  TranslationsSettingsPageAboutAppTileRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'О приложении'
  String get tileTitle => 'О приложении';
}

// Path: visualDesignPage.tips
class TranslationsVisualDesignPageTipsRu {
  TranslationsVisualDesignPageTipsRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Удерживайте тайл, чтобы увидеть дизайн'
  String get info => 'Удерживайте тайл, чтобы увидеть дизайн';
}

// Path: visualDesignPage.headers
class TranslationsVisualDesignPageHeadersRu {
  TranslationsVisualDesignPageHeadersRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Оформление погодных страниц'
  String get design => 'Оформление погодных страниц';

  /// ru: 'Размер шрифта'
  String get fontSize => 'Размер шрифта';

  /// ru: 'Скролл'
  String get scroll => 'Скролл';

  /// ru: 'Типографика'
  String get typography => 'Типографика';

  /// ru: 'Шрифт'
  String get font => 'Шрифт';
}

// Path: savedPlacesPage.tips
class TranslationsSavedPlacesPageTipsRu {
  TranslationsSavedPlacesPageTipsRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Нажмите, чтобы узнать больше.'
  String get clickToMore => 'Нажмите, чтобы узнать больше.';

  /// ru: 'Удерживайте, чтобы установить.'
  String get holdToSet => 'Удерживайте, чтобы установить.';
}

// Path: searchBar.tips
class TranslationsSearchBarTipsRu {
  TranslationsSearchBarTipsRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Кликните, чтобы выбрать место.'
  String get clickToSet => 'Кликните, чтобы выбрать место.';

  /// ru: 'Удерживайте, чтобы сохранить/удалить место.'
  String get holdToAction => 'Удерживайте, чтобы сохранить/удалить место.';

  /// ru: 'Нет сохраненых мест.'
  String get notSavedPlaces => 'Нет сохраненых мест.';

  /// ru: 'Показаны сохраненные места.'
  String get showSavedPlaces => 'Показаны сохраненные места.';

  /// ru: 'Нет найденных мест.'
  String get notFoundedPlaces => 'Нет найденных мест.';

  /// ru: 'Показаны найденные места.'
  String get showFoundedPlaces => 'Показаны найденные места.';

  /// ru: 'Произошла ошибка'
  String get searchError => 'Произошла ошибка';
}

// Path: systemSettingsPage.enableLogsTile
class TranslationsSystemSettingsPageEnableLogsTileRu {
  TranslationsSystemSettingsPageEnableLogsTileRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Включить логирование'
  String get tileTitle => 'Включить логирование';

  /// ru: 'Ваши данные - только ваши'
  String get tileSub => 'Ваши данные - только ваши';

  /// ru: 'При включении данной опции будут собираться данные (логи) об использовании приложения. Однако, они не отправляются автоматически НИКОГДА. Их можно отправить только вручную. Выключение данной опции также удалит все логи.'
  String get tileContent =>
      'При включении данной опции будут собираться данные (логи) об использовании приложения. Однако, они не отправляются автоматически НИКОГДА. Их можно отправить только вручную. Выключение данной опции также удалит все логи.';
}

// Path: weatherLangPage.tips
class TranslationsWeatherLangPageTipsRu {
  TranslationsWeatherLangPageTipsRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Некоторые погодные условия будут предоставляться на выбранном языке.'
  String get info => 'Некоторые погодные условия будут предоставляться на выбранном языке.';
}

// Path: apiWeatherPage.tips
class TranslationsApiWeatherPageTipsRu {
  TranslationsApiWeatherPageTipsRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Чтобы делать запросы чаще, нужно иметь свой ключик Api.'
  String get info => 'Чтобы делать запросы чаще, нужно иметь свой ключик Api.';

  /// ru: 'Он бесплатный, получить его можно по ссылке ниже.'
  String get free => 'Он бесплатный, получить его можно по ссылке ниже.';
}

// Path: apiWeatherPage.defaultApi
class TranslationsApiWeatherPageDefaultApiRu {
  TranslationsApiWeatherPageDefaultApiRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Используется ключ разработчика'
  String get usingApi => 'Используется ключ разработчика';

  /// ru: 'Количество вызовов ограничено тарифом разработчика'
  String get numbOfCalls => 'Количество вызовов ограничено тарифом разработчика';

  /// ru: 'Введите Api...'
  String get fieldTip => 'Введите Api...';

  /// ru: 'Количество запросов: Сегодня – раз в {currentInSeconds} секунд Почасовая, 7 дней – раз в {onecallInHours} часа'
  String countCalls({required Object currentInSeconds, required Object onecallInHours}) =>
      'Количество запросов:\n${_root.enums.homepage.today} – раз в ${currentInSeconds} секунд\n${_root.enums.homepage.hourly}, ${_root.enums.homepage.daily} – раз в ${onecallInHours} часа';
}

// Path: apiWeatherPage.userApi
class TranslationsApiWeatherPageUserApiRu {
  TranslationsApiWeatherPageUserApiRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Используется Ваш ключ'
  String get usingApi => 'Используется Ваш ключ';

  /// ru: 'Количество вызовов ограничено Вашим тарифом WeatherOpenApi'
  String get numbOfCalls => 'Количество вызовов ограничено Вашим тарифом WeatherOpenApi';

  /// ru: 'Используется...'
  String get fieldTip => 'Используется...';

  /// ru: 'Количество запросов ограничено Вашим тарифом'
  String get countCalls => 'Количество запросов ограничено Вашим тарифом';
}

// Path: apiWeatherPage.tooltips
class TranslationsApiWeatherPageTooltipsRu {
  TranslationsApiWeatherPageTooltipsRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Удалить Api-ключ'
  String get delApiKey => 'Удалить Api-ключ';

  /// ru: 'Проверить Api-ключ'
  String get checkApiKey => 'Проверить Api-ключ';

  /// ru: 'Вставить из буфера обмена'
  String get clipboardButton => 'Вставить из буфера обмена';

  /// ru: 'Ожидаем...'
  String get awaiting => 'Ожидаем...';

  /// ru: 'Установить'
  String get set => 'Установить';
}

// Path: global.time
class TranslationsGlobalTimeRu {
  TranslationsGlobalTimeRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Позавчера'
  String get dayBeforeYesterday => 'Позавчера';

  /// ru: 'Вчера'
  String get yesterday => 'Вчера';

  /// ru: 'Сегодня'
  String get today => 'Сегодня';

  /// ru: 'Завтра'
  String get tomorrow => 'Завтра';

  /// ru: 'Послезавтра'
  String get dayAfterTomorrow => 'Послезавтра';

  /// ru: '{hour} ч {minute} мин'
  String hm({required Object hour, required Object minute}) => '${hour} ч ${minute} мин';

  /// ru: '{minute} мин'
  String m({required Object minute}) => '${minute} мин';

  /// ru: '{date} с {time_start} по {time_end}'
  String dateFromToWithNbsp({
    required Object date,
    required Object timeStart,
    required Object timeEnd,
  }) => '${date} с ${timeStart} по ${timeEnd}';

  /// ru: '{date} с {time_start} по {time_end}'
  String dateFromToWithNbspNewline({
    required Object date,
    required Object timeStart,
    required Object timeEnd,
  }) => '${date} \nс ${timeStart} по ${timeEnd}';

  /// ru: 'с {time_start} по {time_end}'
  String fromToWithNbsp({required Object timeStart, required Object timeEnd}) =>
      'с ${timeStart} по ${timeEnd}';

  /// ru: 'с {time_start} по {time_end}'
  String fromToWithNbspNewline({required Object timeStart, required Object timeEnd}) =>
      'с ${timeStart} \nпо ${timeEnd}';
}

// Path: dialogs.messages
class TranslationsDialogsMessagesRu {
  TranslationsDialogsMessagesRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Отсутствует подключение к интернету или сервис погоды не доступен'
  String get socketException => 'Отсутствует подключение к интернету или сервис погоды не доступен';

  /// ru: 'Api ключ погоды установлен!'
  String get apiKeyWeatherSetTrue => 'Api ключ погоды установлен!';

  /// ru: 'Неудачная установка Api ключа...'
  String get apiKeyWeatherSetFalse => 'Неудачная установка Api ключа...';

  /// ru: 'Api ключ активен!'
  String get apiKeyOWMVerificationSuccess => 'Api ключ активен!';

  /// ru: 'Api ключ недействителен!'
  String get apiKeyOWMVerificationFail => 'Api ключ недействителен!';

  /// ru: 'Сейчас недоступно...'
  String get weatherUpdateFail => 'Сейчас недоступно...';
}

// Path: dialogs.titles
class TranslationsDialogsTitlesRu {
  TranslationsDialogsTitlesRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Предупреждение'
  String get warning => 'Предупреждение';

  /// ru: 'Информация'
  String get info => 'Информация';
}

// Path: dialogs.buttons
class TranslationsDialogsButtonsRu {
  TranslationsDialogsButtonsRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Ок'
  String get ok => 'Ок';

  /// ru: 'Понятно'
  String get okay => 'Понятно';

  /// ru: 'Узнать'
  String get know => 'Узнать';

  /// ru: 'Сохранить'
  String get save => 'Сохранить';

  /// ru: 'Сбросить'
  String get reset => 'Сбросить';

  /// ru: 'Отмена'
  String get cancel => 'Отмена';
}

// Path: dialogs.placeSearchInfo
class TranslationsDialogsPlaceSearchInfoRu {
  TranslationsDialogsPlaceSearchInfoRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'А вы знали, что...'
  String get title => 'А вы знали, что...';

  /// ru: 'Есть несколько способов найти местоположение'
  String get subtitle => 'Есть несколько способов найти местоположение';

  /// ru: '1 способ – по названию города. Например:'
  String get way1 => '1 способ – по названию города. Например:';

  /// ru: 'Москва'
  String get city => 'Москва';

  /// ru: '2 способ – по координатам, вот так:'
  String get way2 => '2 способ – по координатам, вот так:';

  /// ru: '55.75199, 37.61773'
  String get coord => '55.75199, 37.61773';
}

// Path: dialogs.confirmDelPlace
class TranslationsDialogsConfirmDelPlaceRu {
  TranslationsDialogsConfirmDelPlaceRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Удалить местоположение?'
  String get subtitle => 'Удалить местоположение?';

  /// ru: 'Местоположение будет удалено из списка сохранённых'
  String get content => 'Местоположение будет удалено из списка сохранённых';
}

// Path: dialogs.seeFlag
class TranslationsDialogsSeeFlagRu {
  TranslationsDialogsSeeFlagRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Вы можете увидеть полное наименование страны и её флаг'
  String get subtitle => 'Вы можете увидеть полное наименование страны и её флаг';
}

// Path: dialogs.confirmDelUserApikey
class TranslationsDialogsConfirmDelUserApikeyRu {
  TranslationsDialogsConfirmDelUserApikeyRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Ваш пользовательский ключ api будет удален'
  String get subtitle => 'Ваш пользовательский ключ api будет удален';
}

// Path: dialogs.confirmSaveChanges
class TranslationsDialogsConfirmSaveChangesRu {
  TranslationsDialogsConfirmSaveChangesRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Сохранить изменения?'
  String get subtitle => 'Сохранить изменения?';
}

// Path: dialogs.confirmResetSettings
class TranslationsDialogsConfirmResetSettingsRu {
  TranslationsDialogsConfirmResetSettingsRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Сбросить настройки?'
  String get subtitle => 'Сбросить настройки?';

  /// ru: 'Настройки этой страницы будут сброшены.'
  String get content => 'Настройки этой страницы будут сброшены.';
}

// Path: dialogs.makeNote
class TranslationsDialogsMakeNoteRu {
  TranslationsDialogsMakeNoteRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Заметка'
  String get title => 'Заметка';

  /// ru: 'Ваша заметка об этом местоположении'
  String get subtitle => 'Ваша заметка об этом местоположении';
}

// Path: enums.homepage
class TranslationsEnumsHomepageRu {
  TranslationsEnumsHomepageRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Настройки'
  String get settings => 'Настройки';

  /// ru: 'Почасовая'
  String get hourly => 'Почасовая';

  /// ru: 'Сегодня'
  String get today => 'Сегодня';

  /// ru: '7 дней'
  String get daily => '7 дней';
}

// Path: units.temp
class TranslationsUnitsTempRu {
  TranslationsUnitsTempRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsUnitsTempFullNameRu fullName = TranslationsUnitsTempFullNameRu.internal(
    _root,
  );
}

// Path: units.speed
class TranslationsUnitsSpeedRu {
  TranslationsUnitsSpeedRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsUnitsSpeedAbbrRu abbr = TranslationsUnitsSpeedAbbrRu.internal(_root);
}

// Path: units.pressure
class TranslationsUnitsPressureRu {
  TranslationsUnitsPressureRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsUnitsPressureAbbrRu abbr = TranslationsUnitsPressureAbbrRu.internal(_root);
  late final TranslationsUnitsPressureNameRu name = TranslationsUnitsPressureNameRu.internal(_root);
}

// Path: units.sideOfTheWorld
class TranslationsUnitsSideOfTheWorldRu {
  TranslationsUnitsSideOfTheWorldRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsUnitsSideOfTheWorldAbbrRu abbr =
      TranslationsUnitsSideOfTheWorldAbbrRu.internal(_root);
  late final TranslationsUnitsSideOfTheWorldNameAdjRu nameAdj =
      TranslationsUnitsSideOfTheWorldNameAdjRu.internal(_root);
  late final TranslationsUnitsSideOfTheWorldNameRu name =
      TranslationsUnitsSideOfTheWorldNameRu.internal(_root);
}

// Path: mainPageDRuble.mainPage.bottomBar
class TranslationsMainPageDRubleMainPageBottomBarRu {
  TranslationsMainPageDRubleMainPageBottomBarRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Настройки'
  String get settings => 'Настройки';

  /// ru: 'Почасовая'
  String get hourly => 'Почасовая';

  /// ru: 'Сегодня'
  String get today => 'Сегодня';

  /// ru: '7 дней'
  String get daily => '7 дней';
}

// Path: mainPageDRuble.hourlyPage.forecast
class TranslationsMainPageDRubleHourlyPageForecastRu {
  TranslationsMainPageDRubleHourlyPageForecastRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Погода'
  String get title => 'Погода';

  /// ru: 'УФ'
  String get uvi => 'УФ';

  late final TranslationsMainPageDRubleHourlyPageForecastLegendRu legend =
      TranslationsMainPageDRubleHourlyPageForecastLegendRu.internal(_root);
}

// Path: mainPageDRuble.hourlyPage.pop
class TranslationsMainPageDRubleHourlyPagePopRu {
  TranslationsMainPageDRubleHourlyPagePopRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Осадки'
  String get title => 'Осадки';

  /// ru: 'Общий объем осадков'
  String get subtitle => 'Общий объем осадков';

  /// ru: 'Осадки не ожидаются'
  String get noPopExpected => 'Осадки не ожидаются';

  /// ru: 'Осадки с {startDate} по {endDate} не ожидаются'
  String popExpected({required Object startDate, required Object endDate}) =>
      'Осадки с ${startDate} по ${endDate} не ожидаются';

  /// ru: 'мм'
  String get units => 'мм';

  late final TranslationsMainPageDRubleHourlyPagePopLegendRu legend =
      TranslationsMainPageDRubleHourlyPagePopLegendRu.internal(_root);
}

// Path: mainPageDRuble.hourlyPage.wind
class TranslationsMainPageDRubleHourlyPageWindRu {
  TranslationsMainPageDRubleHourlyPageWindRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Ветер'
  String get title => 'Ветер';

  /// ru: 'Максимальный ветер'
  String get subtitle => 'Максимальный ветер';

  /// ru: 'м/с'
  String get units => 'м/с';

  /// ru: 'Ожидается штиль'
  String get noWindExpected => 'Ожидается штиль';

  /// ru: 'С {startDate} по {endDate} штиль'
  String windExpected({required Object startDate, required Object endDate}) =>
      'С ${startDate} по ${endDate} штиль';

  late final TranslationsMainPageDRubleHourlyPageWindLegendRu legend =
      TranslationsMainPageDRubleHourlyPageWindLegendRu.internal(_root);
}

// Path: mainPageDRuble.hourlyPage.more
class TranslationsMainPageDRubleHourlyPageMoreRu {
  TranslationsMainPageDRubleHourlyPageMoreRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Ещё'
  String get title => 'Ещё';

  /// ru: 'мм рт. ст.'
  String get unitsRight => 'мм\nрт.\nст.';

  /// ru: 'Нет других данных'
  String get noData => 'Нет других данных';

  late final TranslationsMainPageDRubleHourlyPageMoreLegendRu legend =
      TranslationsMainPageDRubleHourlyPageMoreLegendRu.internal(_root);
}

// Path: mainPageDRuble.currentPage.headers
class TranslationsMainPageDRubleCurrentPageHeadersRu {
  TranslationsMainPageDRubleCurrentPageHeadersRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Восход и закат'
  String get sun => 'Восход и закат';

  /// ru: 'Ветер'
  String get wind => 'Ветер';

  /// ru: 'Облачность'
  String get clouds => 'Облачность';

  /// ru: 'Показатели'
  String get more => 'Показатели';

  /// ru: 'Предупреждения'
  String get alerts => 'Предупреждения';
}

// Path: units.temp.fullName
class TranslationsUnitsTempFullNameRu {
  TranslationsUnitsTempFullNameRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'По шкале Цельсия'
  String get celsius => 'По шкале Цельсия';

  /// ru: 'По шкале Кельвина'
  String get kelvin => 'По шкале Кельвина';

  /// ru: 'По шкале Фаренгейта'
  String get fahrenheit => 'По шкале Фаренгейта';
}

// Path: units.speed.abbr
class TranslationsUnitsSpeedAbbrRu {
  TranslationsUnitsSpeedAbbrRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'м/с'
  String get ms => 'м/с';

  /// ru: 'миль/ч'
  String get mph => 'миль/ч';

  /// ru: 'км/ч'
  String get kph => 'км/ч';
}

// Path: units.pressure.abbr
class TranslationsUnitsPressureAbbrRu {
  TranslationsUnitsPressureAbbrRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'гПа'
  String get hectoPa => 'гПа';

  /// ru: 'мБар'
  String get mbar => 'мБар';

  /// ru: 'мм рт. ст.'
  String get mmHg => 'мм рт. ст.';

  /// ru: 'кПа'
  String get kPa => 'кПа';

  /// ru: 'атм'
  String get atm => 'атм';

  /// ru: 'дюйм рт. ст.'
  String get inHg => 'дюйм рт. ст.';
}

// Path: units.pressure.name
class TranslationsUnitsPressureNameRu {
  TranslationsUnitsPressureNameRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'ГектоПаскали'
  String get hectoPa => 'ГектоПаскали';

  /// ru: 'МиллиБары'
  String get mbar => 'МиллиБары';

  /// ru: 'Миллиметры ртутного столба'
  String get mmHg => 'Миллиметры ртутного столба';

  /// ru: 'КилоПаскали'
  String get kPa => 'КилоПаскали';

  /// ru: 'Атмосферы'
  String get atm => 'Атмосферы';

  /// ru: 'Дюймы ртутного столба'
  String get inHg => 'Дюймы ртутного столба';
}

// Path: units.sideOfTheWorld.abbr
class TranslationsUnitsSideOfTheWorldAbbrRu {
  TranslationsUnitsSideOfTheWorldAbbrRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'С'
  String get north => 'С';

  /// ru: 'СВ'
  String get northEast => 'СВ';

  /// ru: 'В'
  String get east => 'В';

  /// ru: 'ЮВ'
  String get southEast => 'ЮВ';

  /// ru: 'Ю'
  String get south => 'Ю';

  /// ru: 'ЮЗ'
  String get southWest => 'ЮЗ';

  /// ru: 'З'
  String get west => 'З';

  /// ru: 'СЗ'
  String get northWest => 'СЗ';
}

// Path: units.sideOfTheWorld.nameAdj
class TranslationsUnitsSideOfTheWorldNameAdjRu {
  TranslationsUnitsSideOfTheWorldNameAdjRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Северный'
  String get north => 'Северный';

  /// ru: 'Северо-Восточный'
  String get northEast => 'Северо-Восточный';

  /// ru: 'Восточный'
  String get east => 'Восточный';

  /// ru: 'Юго-Восточный'
  String get southEast => 'Юго-Восточный';

  /// ru: 'Южный'
  String get south => 'Южный';

  /// ru: 'Юго-Западный'
  String get southWest => 'Юго-Западный';

  /// ru: 'Западный'
  String get west => 'Западный';

  /// ru: 'Северо-Западный'
  String get northWest => 'Северо-Западный';
}

// Path: units.sideOfTheWorld.name
class TranslationsUnitsSideOfTheWorldNameRu {
  TranslationsUnitsSideOfTheWorldNameRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'Север'
  String get north => 'Север';

  /// ru: 'Северо-Восток'
  String get northEast => 'Северо-Восток';

  /// ru: 'Восток'
  String get east => 'Восток';

  /// ru: 'Юго-Восток'
  String get southEast => 'Юго-Восток';

  /// ru: 'Юг'
  String get south => 'Юг';

  /// ru: 'Юго-Запад'
  String get southWest => 'Юго-Запад';

  /// ru: 'Запад'
  String get west => 'Запад';

  /// ru: 'Северо-Запад'
  String get northWest => 'Северо-Запад';
}

// Path: mainPageDRuble.hourlyPage.forecast.legend
class TranslationsMainPageDRubleHourlyPageForecastLegendRu {
  TranslationsMainPageDRubleHourlyPageForecastLegendRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'реальная'
  String get realTemp => 'реальная';

  /// ru: 'ощущается'
  String get feelTemp => 'ощущается';

  /// ru: 'точка росы'
  String get dewPoint => 'точка росы';
}

// Path: mainPageDRuble.hourlyPage.pop.legend
class TranslationsMainPageDRubleHourlyPagePopLegendRu {
  TranslationsMainPageDRubleHourlyPagePopLegendRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'дождь'
  String get rain => 'дождь';

  /// ru: 'снег'
  String get snow => 'снег';
}

// Path: mainPageDRuble.hourlyPage.wind.legend
class TranslationsMainPageDRubleHourlyPageWindLegendRu {
  TranslationsMainPageDRubleHourlyPageWindLegendRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'ветер'
  String get wind => 'ветер';

  /// ru: 'порывы'
  String get gust => 'порывы';
}

// Path: mainPageDRuble.hourlyPage.more.legend
class TranslationsMainPageDRubleHourlyPageMoreLegendRu {
  TranslationsMainPageDRubleHourlyPageMoreLegendRu.internal(this._root);

  final Translations _root; // ignore: unused_field

  // Translations

  /// ru: 'облачность'
  String get clouds => 'облачность';

  /// ru: 'влажность'
  String get humidity => 'влажность';

  /// ru: 'давление'
  String get pressure => 'давление';
}
