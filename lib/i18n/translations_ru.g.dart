part of 'translations.g.dart';

// Path: <root>
class TranslationsRu implements BaseTranslations<AppLocale, TranslationsRu> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  );

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, TranslationsRu> $meta;

	late final TranslationsRu _root = this; // ignore: unused_field

	// Translations
	late final TranslationsMainPageDRubleRu mainPageDRuble = TranslationsMainPageDRubleRu._(_root);
	late final TranslationsSettingsPageRu settingsPage = TranslationsSettingsPageRu._(_root);
	late final TranslationsVisualDesignPageRu visualDesignPage = TranslationsVisualDesignPageRu._(_root);
	late final TranslationsThemesPageRu themesPage = TranslationsThemesPageRu._(_root);
	late final TranslationsSavedPlacesPageRu savedPlacesPage = TranslationsSavedPlacesPageRu._(_root);
	late final TranslationsSearchBarRu searchBar = TranslationsSearchBarRu._(_root);
	late final TranslationsFlagsPageRu flagsPage = TranslationsFlagsPageRu._(_root);
	late final TranslationsSystemSettingsPageRu systemSettingsPage = TranslationsSystemSettingsPageRu._(_root);
	late final TranslationsGratitudePageRu gratitudePage = TranslationsGratitudePageRu._(_root);
	late final TranslationsWeatherLangPageRu weatherLangPage = TranslationsWeatherLangPageRu._(_root);
	late final TranslationsApiWeatherPageRu apiWeatherPage = TranslationsApiWeatherPageRu._(_root);
	late final TranslationsIntroPageRu introPage = TranslationsIntroPageRu._(_root);
	late final TranslationsTermsConditionsRu termsConditions = TranslationsTermsConditionsRu._(_root);
	late final TranslationsWeatherRu weather = TranslationsWeatherRu._(_root);
	late final TranslationsGlobalRu global = TranslationsGlobalRu._(_root);
	late final TranslationsDialogsRu dialogs = TranslationsDialogsRu._(_root);
	late final TranslationsEnumsRu enums = TranslationsEnumsRu._(_root);
	late final TranslationsUnitsRu units = TranslationsUnitsRu._(_root);
}

// Path: mainPageDRuble
class TranslationsMainPageDRubleRu {
	TranslationsMainPageDRubleRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	late final TranslationsMainPageDRubleMainPageRu mainPage = TranslationsMainPageDRubleMainPageRu._(_root);
	late final TranslationsMainPageDRubleHourlyPageRu hourlyPage = TranslationsMainPageDRubleHourlyPageRu._(_root);
	late final TranslationsMainPageDRubleCurrentPageRu currentPage = TranslationsMainPageDRubleCurrentPageRu._(_root);
}

// Path: settingsPage
class TranslationsSettingsPageRu {
	TranslationsSettingsPageRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	late final TranslationsSettingsPageHeadersRu headers = TranslationsSettingsPageHeadersRu._(_root);
	late final TranslationsSettingsPageSavedPlacesTileRu savedPlacesTile = TranslationsSettingsPageSavedPlacesTileRu._(_root);
	late final TranslationsSettingsPageTempTileRu tempTile = TranslationsSettingsPageTempTileRu._(_root);
	late final TranslationsSettingsPagePressureTileRu pressureTile = TranslationsSettingsPagePressureTileRu._(_root);
	late final TranslationsSettingsPageSpeedTileRu speedTile = TranslationsSettingsPageSpeedTileRu._(_root);
	late final TranslationsSettingsPageWeatherLangTileRu weatherLangTile = TranslationsSettingsPageWeatherLangTileRu._(_root);
	late final TranslationsSettingsPageUserApiTileRu userApiTile = TranslationsSettingsPageUserApiTileRu._(_root);
	late final TranslationsSettingsPageVisualDesignTileRu visualDesignTile = TranslationsSettingsPageVisualDesignTileRu._(_root);
	late final TranslationsSettingsPageThemeTileRu themeTile = TranslationsSettingsPageThemeTileRu._(_root);
	late final TranslationsSettingsPageCountryFlagsTileRu countryFlagsTile = TranslationsSettingsPageCountryFlagsTileRu._(_root);
	late final TranslationsSettingsPageHomepageTileRu homepageTile = TranslationsSettingsPageHomepageTileRu._(_root);
	late final TranslationsSettingsPageLocaleTileRu localeTile = TranslationsSettingsPageLocaleTileRu._(_root);
	late final TranslationsSettingsPageGratitudeTileRu gratitudeTile = TranslationsSettingsPageGratitudeTileRu._(_root);
	late final TranslationsSettingsPageSystemSettingsTileRu systemSettingsTile = TranslationsSettingsPageSystemSettingsTileRu._(_root);
	late final TranslationsSettingsPageAboutAppTileRu aboutAppTile = TranslationsSettingsPageAboutAppTileRu._(_root);
}

// Path: visualDesignPage
class TranslationsVisualDesignPageRu {
	TranslationsVisualDesignPageRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get appbarTitle => 'Визуальное оформление';
	late final TranslationsVisualDesignPageHeadersRu headers = TranslationsVisualDesignPageHeadersRu._(_root);
}

// Path: themesPage
class TranslationsThemesPageRu {
	TranslationsThemesPageRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get appbarTitle => 'Цветовое решение';
	String get swapColorsLight => 'Поменять Primary и Secondary цвета';
	String get swapColorsDark => 'Поменять Main и Container цвета';
	String get useMaterial3 => 'Использовать Material Design 3';
	String get useMaterial3Sub => 'Новые спецэффекты и цвета';
	String get darkMode => 'Цветовой режим';
	String get darkModeSub => 'Режим';
	String get darkLevel => 'Оттенки черного';
	String get darkIsTrueBlack => 'Ослепительно черный';
	String get darkIsTrueBlackSub => 'Энергосберегающий для OLED';
}

// Path: savedPlacesPage
class TranslationsSavedPlacesPageRu {
	TranslationsSavedPlacesPageRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	late final TranslationsSavedPlacesPageTipsRu tips = TranslationsSavedPlacesPageTipsRu._(_root);
	String get placesNotFound => 'Сохраненных местоположений не найдено.';
	String get longitude => 'Долгота';
	String get latitude => 'Широта';
	String get emptyNote => 'Заметка...';
}

// Path: searchBar
class TranslationsSearchBarRu {
	TranslationsSearchBarRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get hintTextField => 'Введите название места';
	late final TranslationsSearchBarTipsRu tips = TranslationsSearchBarTipsRu._(_root);
}

// Path: flagsPage
class TranslationsFlagsPageRu {
	TranslationsFlagsPageRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get appbarTitle => 'Флаги разных стран';
}

// Path: systemSettingsPage
class TranslationsSystemSettingsPageRu {
	TranslationsSystemSettingsPageRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get appbarTitle => 'Системные настройки';
	late final TranslationsSystemSettingsPageEnableLogsTileRu enableLogsTile = TranslationsSystemSettingsPageEnableLogsTileRu._(_root);
}

// Path: gratitudePage
class TranslationsGratitudePageRu {
	TranslationsGratitudePageRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get appbarTitle => 'Хочу сказать спасибо...';
	TextSpan text({required InlineSpanBuilder dart, required InlineSpanBuilder flutter, required InlineSpanBuilder remiRousselet, required InlineSpanBuilder riverpod, required InlineSpanBuilder freezed, required InlineSpanBuilder tienDoNam, required InlineSpanBuilder slang, required InlineSpanBuilder rydMike, required InlineSpanBuilder flexColorScheme, required InlineSpanBuilder myEmail, required InlineSpanBuilder tgGroup}) => TextSpan(children: [
		const TextSpan(text: '  Годом ранее я увлекся новым языком программирования dart, попутно изучив flutter. Для оттачивания своих навыков в субстанции нового я понял, что хочу создать простенькое (казалось мне тогда, хохо) приложение – агрегатор погоды. И вот, минуя полгода, на свет появилось приложение под названием – \'Weather Today\' – погода на каждый день.\n  За время разработки со мной были рядом люди (и их решения), оказывающие большую помощь и поддержку.\n  Я бесконечно благодарен своей девушке за её терпение, понимание и принятие того, что редкие вечерние часы я тратил на работу над приложением, вместо того, чтобы провести их с семьёй.\n  Также я хотел бы отдать должное коллегам-разработчикам, кто выкладывает интересные и, немаловажно, полезные разработки. В особенности я хочу отметить команду '),
		dart('dart'),
		const TextSpan(text: ' и '),
		flutter('flutter'),
		const TextSpan(text: ' за прекрасную платформу для построения поистине крутых приложений; '),
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
		const TextSpan(text: '.\n  Я всегда открыт для общения и буду благодарен, если, попользовавшись данным приложением, вы напишите пару строк о его практичности и компетентности, а также поделитесь мнением о возможных функциях, которые стоило бы сделать.\n  Со мной можно связаться:\n    - email: '),
		myEmail('pack.ruble@gmail.com'),
		const TextSpan(text: '\n    - telegram: '),
		tgGroup('группа Telegram'),
	]);
}

// Path: weatherLangPage
class TranslationsWeatherLangPageRu {
	TranslationsWeatherLangPageRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get appbarTitle => 'Язык погодных условий';
	late final TranslationsWeatherLangPageTipsRu tips = TranslationsWeatherLangPageTipsRu._(_root);
}

// Path: apiWeatherPage
class TranslationsApiWeatherPageRu {
	TranslationsApiWeatherPageRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get appbarTitle => 'Ваш ключ Api';
	String get goToSite => 'Перейти на сайт openweathermap.org';
	late final TranslationsApiWeatherPageTipsRu tips = TranslationsApiWeatherPageTipsRu._(_root);
	late final TranslationsApiWeatherPageDefaultApiRu defaultApi = TranslationsApiWeatherPageDefaultApiRu._(_root);
	late final TranslationsApiWeatherPageUserApiRu userApi = TranslationsApiWeatherPageUserApiRu._(_root);
	late final TranslationsApiWeatherPageTooltipsRu tooltips = TranslationsApiWeatherPageTooltipsRu._(_root);
}

// Path: introPage
class TranslationsIntroPageRu {
	TranslationsIntroPageRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get tile1title => 'УЗНАВАЙ';
	String get tile1subtitle => 'Сверхточная погода на 48 часов и актуальная на 7 дней. Не попадай под дождь - ведь есть предупреждения о погоде';
	String get tile2title => 'ИЗМЕРЯЙ';
	String get tile2subtitle => 'Используй удобные для СЕБЯ единицы измерения температуры, скорости и давления';
	String get tile3title => 'СОХРАНЯЙ';
	String get tile3subtitle => 'Любимые местоположения всегда под рукой. Какая погода сегодня в Лондоне?';
	String get tile4title => 'ВИЗУАЛИЗИРУЙ';
	String get tile4subtitle => 'Красочные цветовые темы позаботятся о плохом настроении в пасмурную погоду. Есть ночная тема';
	String get previousButton => 'Назад';
	String get nextButton => 'Далее';
	String get doneButton => 'Готово';
}

// Path: termsConditions
class TranslationsTermsConditionsRu {
	TranslationsTermsConditionsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get informationForAction => 'Ознакомьтесь и согласитесь со всеми юридическими документами для использования данного приложения.';
	String get privacyPolicy => 'Политика конфиденциальности';
	String get termsAndConditions => 'Положения и условия';
	String get termsUseApp => 'Условия использования приложения';
	String get confirmationWithTheAbove => 'После нажатия кнопки "${_root.termsConditions.buttonAccept}" вы подтверждаете, что ознакомились и согласны со всем вышеуказанным';
	String get buttonCancel => 'Отклонить и выйти';
	String get buttonAccept => 'Принять';
}

// Path: weather
class TranslationsWeatherRu {
	TranslationsWeatherRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	Map<String, String> get condition => {
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
	String get quietlyOnTheHorizon => 'На горизонте спокойно';
	String get noDataProvided => 'Данные не предоставлены';
	String get indicators => 'Показатели';
	String get minimum => 'Минимум';
	String get maximum => 'Максимум';
	String get real => 'Реальная';
	String get feels => 'Ощущается';
	String get feelsLikeAs => 'Ощущается как';
	String get currentAsOf => 'Актуально на';
	String get riseAndSet => 'Восход и закат';
	String get riseAndSetPl => 'Восходы и закаты';
	String get sun => 'Солнце';
	String get moon => 'Луна';
	String get rise => 'Восход';
	String get set => 'Закат';
	String get sunrise => 'Восход солнца';
	String get sunset => 'Закат солнца';
	String get moonrise => 'Восход луны';
	String get moonset => 'Закат луны';
	String get moonPhase => 'Фаза луны';
	String get sunAlreadySet => 'солнце уже зашло';
	String get daylightHours => 'Световой день';
	String get daylightHoursNl => 'Световой\nдень';
	String get atMorning => 'Утром';
	String get atDay => 'Днём';
	String get atEvening => 'Вечером';
	String get atNight => 'Ночью';
	String get morning => 'Утро';
	String get day => 'День';
	String get evening => 'Вечер';
	String get night => 'Ночь';
	String get pressure => 'Давление';
	String get humidity => 'Влажность';
	String get dewPoint => 'Точка росы';
	String get cloudiness => 'Облачность';
	String get visibility => 'Видимость';
	String get uvi => 'УФ';
	String get rain => 'Дождь';
	String get snow => 'Снег';
	String get pop => 'Вероятность осадков';
	String get precipitation => 'Осадки';
	String get description => 'Описание';
	String get sideOfTheWorld => 'Сторона света';
	String get speed => 'Скорость';
	String get wind => 'Ветер';
	String get windSpeed => 'Скорость ветра';
	String get windGust => 'Порывы ветра';
	String get gust => 'Порыв';
	String get gusts => 'Порывы';
	String get gustUp => 'Порывы до';
	String get windSide => 'Направление ветра';
	String get degree => 'Градус';
	String get degrees => 'Градусы';
	String get temp => 'Температура';
	String get tempMorning => 'Температура утром';
	String get tempDay => 'Температура днём';
	String get tempEvening => 'Температура вечером';
	String get tempNight => 'Температура ночью';
	String get tempMin => 'Минимальная дневная температура';
	String get tempMax => 'Максимальная дневная температура';
}

// Path: global
class TranslationsGlobalRu {
	TranslationsGlobalRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	late final TranslationsGlobalTimeRu time = TranslationsGlobalTimeRu._(_root);
}

// Path: dialogs
class TranslationsDialogsRu {
	TranslationsDialogsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	late final TranslationsDialogsMessagesRu messages = TranslationsDialogsMessagesRu._(_root);
	late final TranslationsDialogsButtonsRu buttons = TranslationsDialogsButtonsRu._(_root);
	late final TranslationsDialogsPlaceSearchInfoRu placeSearchInfo = TranslationsDialogsPlaceSearchInfoRu._(_root);
	late final TranslationsDialogsConfirmDelPlaceRu confirmDelPlace = TranslationsDialogsConfirmDelPlaceRu._(_root);
	late final TranslationsDialogsSeeFlagRu seeFlag = TranslationsDialogsSeeFlagRu._(_root);
	late final TranslationsDialogsConfirmDelUserApikeyRu confirmDelUserApikey = TranslationsDialogsConfirmDelUserApikeyRu._(_root);
	late final TranslationsDialogsConfirmSaveChangesRu confirmSaveChanges = TranslationsDialogsConfirmSaveChangesRu._(_root);
	late final TranslationsDialogsMakeNoteRu makeNote = TranslationsDialogsMakeNoteRu._(_root);
}

// Path: enums
class TranslationsEnumsRu {
	TranslationsEnumsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	late final TranslationsEnumsHomepageRu homepage = TranslationsEnumsHomepageRu._(_root);
}

// Path: units
class TranslationsUnitsRu {
	TranslationsUnitsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	late final TranslationsUnitsTempRu temp = TranslationsUnitsTempRu._(_root);
	late final TranslationsUnitsSpeedRu speed = TranslationsUnitsSpeedRu._(_root);
	late final TranslationsUnitsPressureRu pressure = TranslationsUnitsPressureRu._(_root);
	late final TranslationsUnitsSideOfTheWorldRu sideOfTheWorld = TranslationsUnitsSideOfTheWorldRu._(_root);
}

// Path: mainPageDRuble.mainPage
class TranslationsMainPageDRubleMainPageRu {
	TranslationsMainPageDRubleMainPageRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	late final TranslationsMainPageDRubleMainPageBottomBarRu bottomBar = TranslationsMainPageDRubleMainPageBottomBarRu._(_root);
}

// Path: mainPageDRuble.hourlyPage
class TranslationsMainPageDRubleHourlyPageRu {
	TranslationsMainPageDRubleHourlyPageRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	late final TranslationsMainPageDRubleHourlyPageForecastRu forecast = TranslationsMainPageDRubleHourlyPageForecastRu._(_root);
	late final TranslationsMainPageDRubleHourlyPagePopRu pop = TranslationsMainPageDRubleHourlyPagePopRu._(_root);
	late final TranslationsMainPageDRubleHourlyPageWindRu wind = TranslationsMainPageDRubleHourlyPageWindRu._(_root);
	late final TranslationsMainPageDRubleHourlyPageMoreRu more = TranslationsMainPageDRubleHourlyPageMoreRu._(_root);
}

// Path: mainPageDRuble.currentPage
class TranslationsMainPageDRubleCurrentPageRu {
	TranslationsMainPageDRubleCurrentPageRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get sunrise => 'Восход';
	String get sunset => 'Закат';
	String get dayLength => 'Продолжительность дня';
	String get timeBeforeSunset => 'Время до захода';
	String get sunAlreadySet => 'солнце уже зашло';
	String get windGust => 'Порывы до';
	late final TranslationsMainPageDRubleCurrentPageHeadersRu headers = TranslationsMainPageDRubleCurrentPageHeadersRu._(_root);
}

// Path: settingsPage.headers
class TranslationsSettingsPageHeadersRu {
	TranslationsSettingsPageHeadersRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get weather => 'Погода';
	String get design => 'Дизайн';
	String get general => 'Общее';
}

// Path: settingsPage.savedPlacesTile
class TranslationsSettingsPageSavedPlacesTileRu {
	TranslationsSettingsPageSavedPlacesTileRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get tileTitle => 'Мои места';
}

// Path: settingsPage.tempTile
class TranslationsSettingsPageTempTileRu {
	TranslationsSettingsPageTempTileRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get tileTitle => 'Единицы измерения температуры';
	String tileSub({required Object units}) => '${units}';
	String get dialogTitle => 'Единицы измерения температуры';
	String get dialogSub => 'Выбранный параметр будет применен во всех измерениях.';
}

// Path: settingsPage.pressureTile
class TranslationsSettingsPagePressureTileRu {
	TranslationsSettingsPagePressureTileRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get tileTitle => 'Единицы измерения давления';
	String tileSub({required Object units}) => '${units}';
	String get dialogTitle => 'Единицы измерения давления';
	String get dialogSub => 'Выбранный параметр будет применен во всех измерениях.';
}

// Path: settingsPage.speedTile
class TranslationsSettingsPageSpeedTileRu {
	TranslationsSettingsPageSpeedTileRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get tileTitle => 'Единицы измерения скорости';
	String tileSub({required Object units}) => '${units}';
	String get dialogTitle => 'Единицы измерения скорости';
	String get dialogSub => 'Выбранный параметр будет применен во всех измерениях.';
}

// Path: settingsPage.weatherLangTile
class TranslationsSettingsPageWeatherLangTileRu {
	TranslationsSettingsPageWeatherLangTileRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get tileTitle => 'Язык погодных условий';
}

// Path: settingsPage.userApiTile
class TranslationsSettingsPageUserApiTileRu {
	TranslationsSettingsPageUserApiTileRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get tileTitle => 'Пользовательское Api';
}

// Path: settingsPage.visualDesignTile
class TranslationsSettingsPageVisualDesignTileRu {
	TranslationsSettingsPageVisualDesignTileRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get tileTitle => 'Визуальное оформление';
}

// Path: settingsPage.themeTile
class TranslationsSettingsPageThemeTileRu {
	TranslationsSettingsPageThemeTileRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get tileTitle => 'Цветовое решение';
}

// Path: settingsPage.countryFlagsTile
class TranslationsSettingsPageCountryFlagsTileRu {
	TranslationsSettingsPageCountryFlagsTileRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get tileTitle => 'Флаги разных стран';
}

// Path: settingsPage.homepageTile
class TranslationsSettingsPageHomepageTileRu {
	TranslationsSettingsPageHomepageTileRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get tileTitle => 'Стартовая страница';
	String tileSub({required Object homepage}) => '${homepage}';
	String get dialogTitle => 'Стартовая страница';
	String get dialogSub => 'Нужная страница откроется сразу при загрузке приложения.';
}

// Path: settingsPage.localeTile
class TranslationsSettingsPageLocaleTileRu {
	TranslationsSettingsPageLocaleTileRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get tileTitle => 'Язык приложения';
	String tileSub({required Object locale}) => '${locale}';
	String get dialogTitle => 'Язык приложения';
	String get dialogSub => 'Выбранный язык будет применен ко всему приложению.';
}

// Path: settingsPage.gratitudeTile
class TranslationsSettingsPageGratitudeTileRu {
	TranslationsSettingsPageGratitudeTileRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get tileTitle => 'Благодарности';
}

// Path: settingsPage.systemSettingsTile
class TranslationsSettingsPageSystemSettingsTileRu {
	TranslationsSettingsPageSystemSettingsTileRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get tileTitle => 'Системные настройки';
}

// Path: settingsPage.aboutAppTile
class TranslationsSettingsPageAboutAppTileRu {
	TranslationsSettingsPageAboutAppTileRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get tileTitle => 'О приложении';
}

// Path: visualDesignPage.headers
class TranslationsVisualDesignPageHeadersRu {
	TranslationsVisualDesignPageHeadersRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get design => 'Оформление главных страниц погоды';
	String get fontSize => 'Размер шрифта';
	String get scroll => 'Скролл';
	String get typography => 'Типографика';
	String get font => 'Шрифт';
}

// Path: savedPlacesPage.tips
class TranslationsSavedPlacesPageTipsRu {
	TranslationsSavedPlacesPageTipsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get clickToMore => 'Нажмите, чтобы узнать больше.';
	String get holdToSet => 'Удерживайте, чтобы установить.';
}

// Path: searchBar.tips
class TranslationsSearchBarTipsRu {
	TranslationsSearchBarTipsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get clickToSet => 'Кликните, чтобы выбрать место.';
	String get holdToAction => 'Удерживайте, чтобы сохранить/удалить место.';
	String get notSavedPlaces => 'Нет сохраненых мест.';
	String get showSavedPlaces => 'Показаны сохраненные места.';
	String get notFoundedPlaces => 'Нет найденных мест.';
	String get showFoundedPlaces => 'Показаны найденные места.';
	String get searchError => 'Произошла ошибка';
}

// Path: systemSettingsPage.enableLogsTile
class TranslationsSystemSettingsPageEnableLogsTileRu {
	TranslationsSystemSettingsPageEnableLogsTileRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get tileTitle => 'Включить логирование';
	String get tileSub => 'Ваши данные - только ваши';
	String get tileContent => 'При включении данной опции будут собираться данные (логи) об использовании приложения. Однако, они не отправляются автоматически НИКОГДА. Их можно отправить только вручную. Выключение данной опции также удалит все логи.';
}

// Path: weatherLangPage.tips
class TranslationsWeatherLangPageTipsRu {
	TranslationsWeatherLangPageTipsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get info => 'Некоторые погодные условия будут предоставляться на выбранном языке.';
}

// Path: apiWeatherPage.tips
class TranslationsApiWeatherPageTipsRu {
	TranslationsApiWeatherPageTipsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get info => 'Чтобы делать запросы чаще, нужно иметь свой ключик Api.';
	String get free => 'Он бесплатный, получить его можно по ссылке ниже.';
}

// Path: apiWeatherPage.defaultApi
class TranslationsApiWeatherPageDefaultApiRu {
	TranslationsApiWeatherPageDefaultApiRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get usingApi => 'Используется Api по умолчанию';
	String get numbOfCalls => 'Количество вызовов ограничено авторским тарифом WeatherOpenApi';
	String get fieldTip => 'Введите Api...';
}

// Path: apiWeatherPage.userApi
class TranslationsApiWeatherPageUserApiRu {
	TranslationsApiWeatherPageUserApiRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get usingApi => 'Установлен пользовательский Api';
	String get numbOfCalls => 'Количество вызовов ограничено вашим тарифом WeatherOpenApi';
	String get fieldTip => 'Используется...';
}

// Path: apiWeatherPage.tooltips
class TranslationsApiWeatherPageTooltipsRu {
	TranslationsApiWeatherPageTooltipsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get delApiKey => 'Удалить Api-ключ';
	String get checkApiKey => 'Проверить Api-ключ';
	String get clipboardButton => 'Вставить из буфера обмена';
	String get awaiting => 'Ожидаем...';
	String get set => 'Установить';
}

// Path: global.time
class TranslationsGlobalTimeRu {
	TranslationsGlobalTimeRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get theDayBeforeYesterday => 'Позавчера';
	String get yesterday => 'Вчера';
	String get today => 'Сегодня';
	String get tomorrow => 'Завтра';
	String get theDayAfterTomorrow => 'Послезавтра';
	String timeToHourMinute({required Object hour, required Object minute}) => '${hour} ч ${minute} мин';
	String timeToMinute({required Object minute}) => '${minute} мин';
	String timeFromTimeSToTimeE({required Object time, required Object timeStart, required Object timeEnd}) => '${time} с ${timeStart} по ${timeEnd}';
	String fromTimeToTime({required Object timeStart, required Object timeEnd}) => 'с ${timeStart} по ${timeEnd}';
	String timeFromTimeSToTimeEnl({required Object time, required Object timeStart, required Object timeEnd}) => '${time} \nс ${timeStart} по ${timeEnd}';
	String fromTimeToTimeNl({required Object timeStart, required Object timeEnd}) => 'с ${timeStart} \nпо ${timeEnd}';
}

// Path: dialogs.messages
class TranslationsDialogsMessagesRu {
	TranslationsDialogsMessagesRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get socketException => 'Отсутствует подключение к интернету или сервис погоды не доступен';
	String get apiKeyWeatherSetTrue => 'Api ключ погоды установлен!';
	String get apiKeyWeatherSetFalse => 'Неудачная установка Api ключа...';
	String get apiKeyOWMVerificationSuccess => 'Api ключ активен!';
	String get apiKeyOWMVerificationFail => 'Api ключ недействителен!';
	String get weatherUpdateFail => 'Сейчас недоступно...';
}

// Path: dialogs.buttons
class TranslationsDialogsButtonsRu {
	TranslationsDialogsButtonsRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get ok => 'Ок';
	String get okay => 'Понятно';
	String get know => 'Узнать';
	String get save => 'Сохранить';
	String get cancel => 'Отмена';
}

// Path: dialogs.placeSearchInfo
class TranslationsDialogsPlaceSearchInfoRu {
	TranslationsDialogsPlaceSearchInfoRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get title => 'А вы знали, что...';
	String get subtitle => 'Есть несколько способов найти местоположение';
	String get way1 => '1 способ – по названию города. Например:';
	String get city => 'Москва';
	String get way2 => '2 способ – по координатам, вот так:';
	String get coord => '55.75199, 37.61773';
}

// Path: dialogs.confirmDelPlace
class TranslationsDialogsConfirmDelPlaceRu {
	TranslationsDialogsConfirmDelPlaceRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get title => 'Предупреждение';
	String get subtitle => 'Удалить местоположение?';
	String get content => 'Местоположение будет удалено из списка сохраненных';
}

// Path: dialogs.seeFlag
class TranslationsDialogsSeeFlagRu {
	TranslationsDialogsSeeFlagRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get title => 'Информация';
	String get subtitle => 'Вы можете увидеть полное наименование страны и её флаг';
}

// Path: dialogs.confirmDelUserApikey
class TranslationsDialogsConfirmDelUserApikeyRu {
	TranslationsDialogsConfirmDelUserApikeyRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get title => 'Предупреждение';
	String get subtitle => 'Ваш пользовательский ключ api будет удален';
}

// Path: dialogs.confirmSaveChanges
class TranslationsDialogsConfirmSaveChangesRu {
	TranslationsDialogsConfirmSaveChangesRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get title => 'Предупреждение';
	String get subtitle => 'Сохранить изменения?';
}

// Path: dialogs.makeNote
class TranslationsDialogsMakeNoteRu {
	TranslationsDialogsMakeNoteRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get title => 'Заметка';
	String get subtitle => 'Ваша заметка об этом местоположении';
}

// Path: enums.homepage
class TranslationsEnumsHomepageRu {
	TranslationsEnumsHomepageRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get settings => 'Настройки';
	String get hourly => 'Почасовая';
	String get today => 'Сегодня';
	String get daily => '7 дней';
}

// Path: units.temp
class TranslationsUnitsTempRu {
	TranslationsUnitsTempRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	late final TranslationsUnitsTempFullNameRu fullName = TranslationsUnitsTempFullNameRu._(_root);
}

// Path: units.speed
class TranslationsUnitsSpeedRu {
	TranslationsUnitsSpeedRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	late final TranslationsUnitsSpeedAbbrRu abbr = TranslationsUnitsSpeedAbbrRu._(_root);
}

// Path: units.pressure
class TranslationsUnitsPressureRu {
	TranslationsUnitsPressureRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	late final TranslationsUnitsPressureAbbrRu abbr = TranslationsUnitsPressureAbbrRu._(_root);
	late final TranslationsUnitsPressureNameRu name = TranslationsUnitsPressureNameRu._(_root);
}

// Path: units.sideOfTheWorld
class TranslationsUnitsSideOfTheWorldRu {
	TranslationsUnitsSideOfTheWorldRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	late final TranslationsUnitsSideOfTheWorldAbbrRu abbr = TranslationsUnitsSideOfTheWorldAbbrRu._(_root);
	late final TranslationsUnitsSideOfTheWorldNameAdjRu nameAdj = TranslationsUnitsSideOfTheWorldNameAdjRu._(_root);
	late final TranslationsUnitsSideOfTheWorldNameRu name = TranslationsUnitsSideOfTheWorldNameRu._(_root);
}

// Path: mainPageDRuble.mainPage.bottomBar
class TranslationsMainPageDRubleMainPageBottomBarRu {
	TranslationsMainPageDRubleMainPageBottomBarRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get settings => 'Настройки';
	String get hourly => 'Почасовая';
	String get today => 'Сегодня';
	String get daily => '7 дней';
}

// Path: mainPageDRuble.hourlyPage.forecast
class TranslationsMainPageDRubleHourlyPageForecastRu {
	TranslationsMainPageDRubleHourlyPageForecastRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get title => 'Погода';
	String get uvi => 'УФ';
	late final TranslationsMainPageDRubleHourlyPageForecastLegendRu legend = TranslationsMainPageDRubleHourlyPageForecastLegendRu._(_root);
}

// Path: mainPageDRuble.hourlyPage.pop
class TranslationsMainPageDRubleHourlyPagePopRu {
	TranslationsMainPageDRubleHourlyPagePopRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get title => 'Осадки';
	String get subtitle => 'Общий объем осадков';
	String get noPopExpected => 'Осадки не ожидаются';
	String popExpected({required Object startDate, required Object endDate}) => 'Осадки с ${startDate} по ${endDate} не ожидаются';
	String get units => 'мм';
	late final TranslationsMainPageDRubleHourlyPagePopLegendRu legend = TranslationsMainPageDRubleHourlyPagePopLegendRu._(_root);
}

// Path: mainPageDRuble.hourlyPage.wind
class TranslationsMainPageDRubleHourlyPageWindRu {
	TranslationsMainPageDRubleHourlyPageWindRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get title => 'Ветер';
	String get subtitle => 'Максимальный ветер';
	String get units => 'м/с';
	String get noWindExpected => 'Ожидается штиль';
	String windExpected({required Object startDate, required Object endDate}) => 'С ${startDate} по ${endDate} штиль';
	late final TranslationsMainPageDRubleHourlyPageWindLegendRu legend = TranslationsMainPageDRubleHourlyPageWindLegendRu._(_root);
}

// Path: mainPageDRuble.hourlyPage.more
class TranslationsMainPageDRubleHourlyPageMoreRu {
	TranslationsMainPageDRubleHourlyPageMoreRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get title => 'Ещё';
	String get unitsRight => 'мм.\nрт.\nст.';
	String get noData => 'Нет других данных';
	late final TranslationsMainPageDRubleHourlyPageMoreLegendRu legend = TranslationsMainPageDRubleHourlyPageMoreLegendRu._(_root);
}

// Path: mainPageDRuble.currentPage.headers
class TranslationsMainPageDRubleCurrentPageHeadersRu {
	TranslationsMainPageDRubleCurrentPageHeadersRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get sun => 'Восход и закат';
	String get wind => 'Ветер';
	String get clouds => 'Облачность';
	String get more => 'Показатели';
	String get alerts => 'Предупреждения';
}

// Path: units.temp.fullName
class TranslationsUnitsTempFullNameRu {
	TranslationsUnitsTempFullNameRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get celsius => 'По шкале Цельсия';
	String get kelvin => 'По шкале Кельвина';
	String get fahrenheit => 'По шкале Фаренгейта';
}

// Path: units.speed.abbr
class TranslationsUnitsSpeedAbbrRu {
	TranslationsUnitsSpeedAbbrRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get ms => 'м/с';
	String get mph => 'миль/ч';
	String get kph => 'км/ч';
}

// Path: units.pressure.abbr
class TranslationsUnitsPressureAbbrRu {
	TranslationsUnitsPressureAbbrRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get hectoPa => 'гПа';
	String get mbar => 'мБар';
	String get mmHg => 'мм. рт. ст.';
	String get kPa => 'кПа';
	String get atm => 'атм';
	String get inHg => 'дюйм рт. ст.';
}

// Path: units.pressure.name
class TranslationsUnitsPressureNameRu {
	TranslationsUnitsPressureNameRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get hectoPa => 'ГектоПаскали';
	String get mbar => 'МиллиБары';
	String get mmHg => 'Миллиметры ртутного столба';
	String get kPa => 'КилоПаскали';
	String get atm => 'Атмосферы';
	String get inHg => 'Дюймы ртутного столба';
}

// Path: units.sideOfTheWorld.abbr
class TranslationsUnitsSideOfTheWorldAbbrRu {
	TranslationsUnitsSideOfTheWorldAbbrRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get north => 'С';
	String get northEast => 'СВ';
	String get east => 'В';
	String get southEast => 'ЮВ';
	String get south => 'Ю';
	String get southWest => 'ЮЗ';
	String get west => 'З';
	String get northWest => 'СЗ';
}

// Path: units.sideOfTheWorld.nameAdj
class TranslationsUnitsSideOfTheWorldNameAdjRu {
	TranslationsUnitsSideOfTheWorldNameAdjRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get north => 'Северный';
	String get northEast => 'Северо-Восточный';
	String get east => 'Восточный';
	String get southEast => 'Юго-Восточный';
	String get south => 'Южный';
	String get southWest => 'Юго-Западный';
	String get west => 'Западный';
	String get northWest => 'Северо-Западный';
}

// Path: units.sideOfTheWorld.name
class TranslationsUnitsSideOfTheWorldNameRu {
	TranslationsUnitsSideOfTheWorldNameRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get north => 'Север';
	String get northEast => 'Северо-Восток';
	String get east => 'Восток';
	String get southEast => 'Юго-Восток';
	String get south => 'Юг';
	String get southWest => 'Юго-Запад';
	String get west => 'Запад';
	String get northWest => 'Северо-Запад';
}

// Path: mainPageDRuble.hourlyPage.forecast.legend
class TranslationsMainPageDRubleHourlyPageForecastLegendRu {
	TranslationsMainPageDRubleHourlyPageForecastLegendRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get realTemp => 'реальная';
	String get feelTemp => 'ощущается';
	String get dewPoint => 'точка росы';
}

// Path: mainPageDRuble.hourlyPage.pop.legend
class TranslationsMainPageDRubleHourlyPagePopLegendRu {
	TranslationsMainPageDRubleHourlyPagePopLegendRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get rain => 'дождь';
	String get snow => 'снег';
}

// Path: mainPageDRuble.hourlyPage.wind.legend
class TranslationsMainPageDRubleHourlyPageWindLegendRu {
	TranslationsMainPageDRubleHourlyPageWindLegendRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get wind => 'ветер';
	String get gust => 'порывы';
}

// Path: mainPageDRuble.hourlyPage.more.legend
class TranslationsMainPageDRubleHourlyPageMoreLegendRu {
	TranslationsMainPageDRubleHourlyPageMoreLegendRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	String get clouds => 'облачность';
	String get humidity => 'влажность';
	String get pressure => 'давление';
}
