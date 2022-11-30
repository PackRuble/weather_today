part of 'translations.g.dart';

// Path: <root>
class TranslationsEn implements TranslationsRu {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  );

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, TranslationsRu> $meta;

	@override late final TranslationsEn _root = this; // ignore: unused_field

	// Translations
	@override late final TranslationsMainPageDRubleEn mainPageDRuble = TranslationsMainPageDRubleEn._(_root);
	@override late final TranslationsSettingsPageEn settingsPage = TranslationsSettingsPageEn._(_root);
	@override late final TranslationsVisualDesignPageEn visualDesignPage = TranslationsVisualDesignPageEn._(_root);
	@override late final TranslationsThemesPageEn themesPage = TranslationsThemesPageEn._(_root);
	@override late final TranslationsSavedPlacesPageEn savedPlacesPage = TranslationsSavedPlacesPageEn._(_root);
	@override late final TranslationsSearchBarEn searchBar = TranslationsSearchBarEn._(_root);
	@override late final TranslationsFlagsPageEn flagsPage = TranslationsFlagsPageEn._(_root);
	@override late final TranslationsGratitudePageEn gratitudePage = TranslationsGratitudePageEn._(_root);
	@override late final TranslationsWeatherLangPageEn weatherLangPage = TranslationsWeatherLangPageEn._(_root);
	@override late final TranslationsApiWeatherPageEn apiWeatherPage = TranslationsApiWeatherPageEn._(_root);
	@override late final TranslationsIntroPageEn introPage = TranslationsIntroPageEn._(_root);
	@override late final TranslationsWeatherEn weather = TranslationsWeatherEn._(_root);
	@override late final TranslationsGlobalEn global = TranslationsGlobalEn._(_root);
	@override late final TranslationsDialogsEn dialogs = TranslationsDialogsEn._(_root);
	@override late final TranslationsEnumsEn enums = TranslationsEnumsEn._(_root);
	@override late final TranslationsUnitsEn units = TranslationsUnitsEn._(_root);
}

// Path: mainPageDRuble
class TranslationsMainPageDRubleEn implements TranslationsMainPageDRubleRu {
	TranslationsMainPageDRubleEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsMainPageDRubleMainPageEn mainPage = TranslationsMainPageDRubleMainPageEn._(_root);
	@override late final TranslationsMainPageDRubleHourlyPageEn hourlyPage = TranslationsMainPageDRubleHourlyPageEn._(_root);
	@override late final TranslationsMainPageDRubleCurrentPageEn currentPage = TranslationsMainPageDRubleCurrentPageEn._(_root);
}

// Path: settingsPage
class TranslationsSettingsPageEn implements TranslationsSettingsPageRu {
	TranslationsSettingsPageEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsSettingsPageHeadersEn headers = TranslationsSettingsPageHeadersEn._(_root);
	@override late final TranslationsSettingsPageSavedPlacesTileEn savedPlacesTile = TranslationsSettingsPageSavedPlacesTileEn._(_root);
	@override late final TranslationsSettingsPageTempTileEn tempTile = TranslationsSettingsPageTempTileEn._(_root);
	@override late final TranslationsSettingsPagePressureTileEn pressureTile = TranslationsSettingsPagePressureTileEn._(_root);
	@override late final TranslationsSettingsPageSpeedTileEn speedTile = TranslationsSettingsPageSpeedTileEn._(_root);
	@override late final TranslationsSettingsPageWeatherLangTileEn weatherLangTile = TranslationsSettingsPageWeatherLangTileEn._(_root);
	@override late final TranslationsSettingsPageUserApiTileEn userApiTile = TranslationsSettingsPageUserApiTileEn._(_root);
	@override late final TranslationsSettingsPageVisualDesignTileEn visualDesignTile = TranslationsSettingsPageVisualDesignTileEn._(_root);
	@override late final TranslationsSettingsPageThemeTileEn themeTile = TranslationsSettingsPageThemeTileEn._(_root);
	@override late final TranslationsSettingsPageCountryFlagsTileEn countryFlagsTile = TranslationsSettingsPageCountryFlagsTileEn._(_root);
	@override late final TranslationsSettingsPageHomepageTileEn homepageTile = TranslationsSettingsPageHomepageTileEn._(_root);
	@override late final TranslationsSettingsPageLocaleTileEn localeTile = TranslationsSettingsPageLocaleTileEn._(_root);
	@override late final TranslationsSettingsPageGratitudeTileEn gratitudeTile = TranslationsSettingsPageGratitudeTileEn._(_root);
	@override late final TranslationsSettingsPageAboutAppTileEn aboutAppTile = TranslationsSettingsPageAboutAppTileEn._(_root);
}

// Path: visualDesignPage
class TranslationsVisualDesignPageEn implements TranslationsVisualDesignPageRu {
	TranslationsVisualDesignPageEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appbarTitle => 'Visual design';
	@override late final TranslationsVisualDesignPageHeadersEn headers = TranslationsVisualDesignPageHeadersEn._(_root);
}

// Path: themesPage
class TranslationsThemesPageEn implements TranslationsThemesPageRu {
	TranslationsThemesPageEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appbarTitle => 'Application color scheme';
	@override String get swapColorsLight => 'Swap Primary and Secondary colors';
	@override String get swapColorsDark => 'Swap Main and Container colors';
	@override String get useMaterial3 => 'Use Material Design 3';
	@override String get useMaterial3Sub => 'New special effects and colors';
	@override String get darkMode => 'Night mode';
	@override String get darkModeSub => 'Mode';
	@override String get darkLevel => 'Shades of black';
	@override String get darkIsTrueBlack => 'Dazzling black';
	@override String get darkIsTrueBlackSub => 'Save power on OLED';
}

// Path: savedPlacesPage
class TranslationsSavedPlacesPageEn implements TranslationsSavedPlacesPageRu {
	TranslationsSavedPlacesPageEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsSavedPlacesPageTipsEn tips = TranslationsSavedPlacesPageTipsEn._(_root);
	@override String get placesNotFound => 'No saved places found.';
	@override String get longitude => 'Longitude';
	@override String get latitude => 'Latitude';
	@override String get emptyNote => 'Note...';
}

// Path: searchBar
class TranslationsSearchBarEn implements TranslationsSearchBarRu {
	TranslationsSearchBarEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get hintTextField => 'Enter place name';
	@override late final TranslationsSearchBarTipsEn tips = TranslationsSearchBarTipsEn._(_root);
}

// Path: flagsPage
class TranslationsFlagsPageEn implements TranslationsFlagsPageRu {
	TranslationsFlagsPageEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appbarTitle => 'Flags of different countries';
}

// Path: gratitudePage
class TranslationsGratitudePageEn implements TranslationsGratitudePageRu {
	TranslationsGratitudePageEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appbarTitle => 'I want to say thank you...';
	@override String get text => '	A year earlier I was fascinated by the new programming language dart, having learned flutter at the same time. To sharpen my skills in the substance of the new, I realized that I wanted to create a simple (it seemed to me at the time, hoho) application - a weather aggregator. And after half a year there appeared an application called Weather Today - Everyday Weather.\n	During the developing process I had a lot of people (and their solutions) helping and supporting me.\n	I am eternally grateful to my girlfriend Ekaterina for her patience, understanding and acceptance of the fact that I spent rare evening hours working on the app instead of spending them with my family.\n	Also I would like to pay tribute to my fellow developers who put up interesting and, importantly, useful developments. In particular I want to mention the dart team, Remi Rousselet for their wonderful Riverpod and freezed packages, Tien Do Nam for their beautiful slang, RydMike for their charming FlexColorScheme package.\n	I am always open to communication and would appreciate if, after using my application, you could write a few lines about its practicality and competence, and share your opinion on possible features that would be worth doing.\n';
}

// Path: weatherLangPage
class TranslationsWeatherLangPageEn implements TranslationsWeatherLangPageRu {
	TranslationsWeatherLangPageEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appbarTitle => 'Language of weather conditions';
	@override late final TranslationsWeatherLangPageTipsEn tips = TranslationsWeatherLangPageTipsEn._(_root);
}

// Path: apiWeatherPage
class TranslationsApiWeatherPageEn implements TranslationsApiWeatherPageRu {
	TranslationsApiWeatherPageEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get appbarTitle => 'Your api key';
	@override String get goToSite => 'Go to openweathermap.org';
	@override late final TranslationsApiWeatherPageTipsEn tips = TranslationsApiWeatherPageTipsEn._(_root);
	@override late final TranslationsApiWeatherPageDefaultApiEn defaultApi = TranslationsApiWeatherPageDefaultApiEn._(_root);
	@override late final TranslationsApiWeatherPageUserApiEn userApi = TranslationsApiWeatherPageUserApiEn._(_root);
	@override late final TranslationsApiWeatherPageTooltipsEn tooltips = TranslationsApiWeatherPageTooltipsEn._(_root);
}

// Path: introPage
class TranslationsIntroPageEn implements TranslationsIntroPageRu {
	TranslationsIntroPageEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get tile1title => 'CHECK';
	@override String get tile1subtitle => 'Super-accurate weather for 48 hours and current for 7 days. Don\'t get caught in the rain - there are weather warnings';
	@override String get tile2title => 'MEASURE';
	@override String get tile2subtitle => 'Use your preferred units of temperature, speed, and pressure';
	@override String get tile3title => 'SAVE';
	@override String get tile3subtitle => 'Favorite locations are always at your fingertips. What\'s the weather like in London today?';
	@override String get tile4title => 'VISUALIZE';
	@override String get tile4subtitle => 'Colorful color themes will take care of the bad mood in gloomy weather. There\'s a nighttime theme';
	@override String get previousButton => 'Back';
	@override String get nextButton => 'Next';
	@override String get doneButton => 'Done';
}

// Path: weather
class TranslationsWeatherEn implements TranslationsWeatherRu {
	TranslationsWeatherEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override Map<String, String> get condition => {
		'thunderstorm': 'Thunderstorm',
		'drizzle': 'Drizzle',
		'rain': 'Rain',
		'snow': 'Snow',
		'mist': 'Mist',
		'smoke': 'Smoke',
		'haze': 'Haze',
		'dust': 'Dust',
		'fog': 'Fog',
		'sand': 'Sand',
		'ash': 'Ash',
		'squall': 'Squall',
		'tornado': 'Tornado',
		'clear': 'Clear',
		'clouds': 'Clouds',
	};
	@override String get quietlyOnTheHorizon => 'On the horizon quietly';
	@override String get noDataProvided => 'No data provided';
	@override String get indicators => 'Indicators';
	@override String get minimum => 'Minimum';
	@override String get maximum => 'Maximum';
	@override String get real => 'Real';
	@override String get feels => 'Feels';
	@override String get feelsLikeAs => 'Feels like';
	@override String get currentAsOf => 'Actual on';
	@override String get riseAndSet => 'Sunrise and sunset';
	@override String get riseAndSetPl => 'Sunrises and sunsets';
	@override String get sun => 'Sun';
	@override String get moon => 'Moon';

	/// It is correct?
	@override String get rise => 'Sunrise';

	@override String get set => 'Sunset';
	@override String get sunrise => 'Sunrise';
	@override String get sunset => 'Sunset';
	@override String get moonrise => 'Moonrise';
	@override String get moonset => 'Moonset';
	@override String get moonPhase => 'Moon phase';
	@override String get sunAlreadySet => 'the sun has already set';
	@override String get daylightHours => 'Daylight hours';
	@override String get daylightHoursNl => 'Daylight\nhours';
	@override String get atMorning => 'At morning';
	@override String get atDay => 'At day';
	@override String get atEvening => 'At evening';
	@override String get atNight => 'At night';
	@override String get morning => 'Morning';
	@override String get day => 'Day';
	@override String get evening => 'Evening';
	@override String get night => 'Night';
	@override String get pressure => 'Pressure';
	@override String get humidity => 'Humidity';
	@override String get dewPoint => 'DewPoint';
	@override String get cloudiness => 'Cloudiness';
	@override String get visibility => 'Visibility';
	@override String get uvi => 'UV';
	@override String get rain => 'Rain';
	@override String get snow => 'Snow';
	@override String get pop => 'Probability of precipitation';
	@override String get precipitation => 'Precipitation';
	@override String get description => 'Description';
	@override String get sideOfTheWorld => 'Side of the world';
	@override String get speed => 'Speed';
	@override String get wind => 'Wind';
	@override String get windSpeed => 'Wind speed';
	@override String get windGust => 'Wind gust';
	@override String get gust => 'Gust';
	@override String get gusts => 'Gusts';
	@override String get gustUp => 'Gusts up';
	@override String get windSide => 'Wind direction';
	@override String get degree => 'Degree';
	@override String get degrees => 'Degrees';
	@override String get temp => 'Temperature';
	@override String get tempMorning => 'Temperature in the morning';
	@override String get tempDay => 'Temperature in the day';
	@override String get tempEvening => 'Temperature in the evening';
	@override String get tempNight => 'Temperature in the night';
	@override String get tempMin => 'Minimum daytime temperature';
	@override String get tempMax => 'Maximum daytime temperature';
}

// Path: global
class TranslationsGlobalEn implements TranslationsGlobalRu {
	TranslationsGlobalEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsGlobalTimeEn time = TranslationsGlobalTimeEn._(_root);
}

// Path: dialogs
class TranslationsDialogsEn implements TranslationsDialogsRu {
	TranslationsDialogsEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsDialogsMessagesEn messages = TranslationsDialogsMessagesEn._(_root);
	@override late final TranslationsDialogsButtonsEn buttons = TranslationsDialogsButtonsEn._(_root);
	@override late final TranslationsDialogsPlaceSearchInfoEn placeSearchInfo = TranslationsDialogsPlaceSearchInfoEn._(_root);
	@override late final TranslationsDialogsConfirmDelPlaceEn confirmDelPlace = TranslationsDialogsConfirmDelPlaceEn._(_root);
	@override late final TranslationsDialogsSeeFlagEn seeFlag = TranslationsDialogsSeeFlagEn._(_root);
	@override late final TranslationsDialogsConfirmDelUserApikeyEn confirmDelUserApikey = TranslationsDialogsConfirmDelUserApikeyEn._(_root);
	@override late final TranslationsDialogsConfirmSaveChangesEn confirmSaveChanges = TranslationsDialogsConfirmSaveChangesEn._(_root);
	@override late final TranslationsDialogsMakeNoteEn makeNote = TranslationsDialogsMakeNoteEn._(_root);
}

// Path: enums
class TranslationsEnumsEn implements TranslationsEnumsRu {
	TranslationsEnumsEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsEnumsHomepageEn homepage = TranslationsEnumsHomepageEn._(_root);
}

// Path: units
class TranslationsUnitsEn implements TranslationsUnitsRu {
	TranslationsUnitsEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsUnitsTempEn temp = TranslationsUnitsTempEn._(_root);
	@override late final TranslationsUnitsSpeedEn speed = TranslationsUnitsSpeedEn._(_root);
	@override late final TranslationsUnitsPressureEn pressure = TranslationsUnitsPressureEn._(_root);
	@override late final TranslationsUnitsSideOfTheWorldEn sideOfTheWorld = TranslationsUnitsSideOfTheWorldEn._(_root);
}

// Path: mainPageDRuble.mainPage
class TranslationsMainPageDRubleMainPageEn implements TranslationsMainPageDRubleMainPageRu {
	TranslationsMainPageDRubleMainPageEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsMainPageDRubleMainPageBottomBarEn bottomBar = TranslationsMainPageDRubleMainPageBottomBarEn._(_root);
}

// Path: mainPageDRuble.hourlyPage
class TranslationsMainPageDRubleHourlyPageEn implements TranslationsMainPageDRubleHourlyPageRu {
	TranslationsMainPageDRubleHourlyPageEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsMainPageDRubleHourlyPageForecastEn forecast = TranslationsMainPageDRubleHourlyPageForecastEn._(_root);
	@override late final TranslationsMainPageDRubleHourlyPagePopEn pop = TranslationsMainPageDRubleHourlyPagePopEn._(_root);
	@override late final TranslationsMainPageDRubleHourlyPageWindEn wind = TranslationsMainPageDRubleHourlyPageWindEn._(_root);
	@override late final TranslationsMainPageDRubleHourlyPageMoreEn more = TranslationsMainPageDRubleHourlyPageMoreEn._(_root);
}

// Path: mainPageDRuble.currentPage
class TranslationsMainPageDRubleCurrentPageEn implements TranslationsMainPageDRubleCurrentPageRu {
	TranslationsMainPageDRubleCurrentPageEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get sunrise => 'Sunrise';
	@override String get sunset => 'Sunset';
	@override String get dayLength => 'Length of day';
	@override String get timeBeforeSunset => 'Time before sunset';
	@override String get sunAlreadySet => 'the sun has already set';
	@override String get windGust => 'Gusts to';
	@override late final TranslationsMainPageDRubleCurrentPageHeadersEn headers = TranslationsMainPageDRubleCurrentPageHeadersEn._(_root);
}

// Path: settingsPage.headers
class TranslationsSettingsPageHeadersEn implements TranslationsSettingsPageHeadersRu {
	TranslationsSettingsPageHeadersEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get weather => 'Weather';
	@override String get design => 'Design';
	@override String get general => 'General';
}

// Path: settingsPage.savedPlacesTile
class TranslationsSettingsPageSavedPlacesTileEn implements TranslationsSettingsPageSavedPlacesTileRu {
	TranslationsSettingsPageSavedPlacesTileEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get tileTitle => 'My Places';
}

// Path: settingsPage.tempTile
class TranslationsSettingsPageTempTileEn implements TranslationsSettingsPageTempTileRu {
	TranslationsSettingsPageTempTileEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get tileTitle => 'Temperature units';
	@override String tileSub({required Object units}) => '${units}';
	@override String get dialogTitle => 'Temperature units';
	@override String get dialogSub => 'The selected parameter will be applied in all measurements.';
}

// Path: settingsPage.pressureTile
class TranslationsSettingsPagePressureTileEn implements TranslationsSettingsPagePressureTileRu {
	TranslationsSettingsPagePressureTileEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get tileTitle => 'Pressure units';
	@override String tileSub({required Object units}) => '${units}';
	@override String get dialogTitle => 'Pressure units';
	@override String get dialogSub => 'The selected parameter will be applied in all measurements.';
}

// Path: settingsPage.speedTile
class TranslationsSettingsPageSpeedTileEn implements TranslationsSettingsPageSpeedTileRu {
	TranslationsSettingsPageSpeedTileEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get tileTitle => 'Speed units';
	@override String tileSub({required Object units}) => '${units}';
	@override String get dialogTitle => 'Speed units';
	@override String get dialogSub => 'The selected parameter will be applied in all measurements.';
}

// Path: settingsPage.weatherLangTile
class TranslationsSettingsPageWeatherLangTileEn implements TranslationsSettingsPageWeatherLangTileRu {
	TranslationsSettingsPageWeatherLangTileEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get tileTitle => 'Language of weather conditions';
}

// Path: settingsPage.userApiTile
class TranslationsSettingsPageUserApiTileEn implements TranslationsSettingsPageUserApiTileRu {
	TranslationsSettingsPageUserApiTileEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get tileTitle => 'Custom API';
}

// Path: settingsPage.visualDesignTile
class TranslationsSettingsPageVisualDesignTileEn implements TranslationsSettingsPageVisualDesignTileRu {
	TranslationsSettingsPageVisualDesignTileEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get tileTitle => 'Visual design';
}

// Path: settingsPage.themeTile
class TranslationsSettingsPageThemeTileEn implements TranslationsSettingsPageThemeTileRu {
	TranslationsSettingsPageThemeTileEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get tileTitle => 'Application color scheme';
}

// Path: settingsPage.countryFlagsTile
class TranslationsSettingsPageCountryFlagsTileEn implements TranslationsSettingsPageCountryFlagsTileRu {
	TranslationsSettingsPageCountryFlagsTileEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get tileTitle => 'Flags of different countries';
}

// Path: settingsPage.homepageTile
class TranslationsSettingsPageHomepageTileEn implements TranslationsSettingsPageHomepageTileRu {
	TranslationsSettingsPageHomepageTileEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get tileTitle => 'Start Page';
	@override String tileSub({required Object homepage}) => '${homepage}';
	@override String get dialogTitle => 'Start Page';
	@override String get dialogSub => 'The desired page will open immediately when the application loads.';
}

// Path: settingsPage.localeTile
class TranslationsSettingsPageLocaleTileEn implements TranslationsSettingsPageLocaleTileRu {
	TranslationsSettingsPageLocaleTileEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get tileTitle => 'Application language';
	@override String tileSub({required Object locale}) => '${locale}';
	@override String get dialogTitle => 'Application language';
	@override String get dialogSub => 'The selected language will be applied to the entire application.';
}

// Path: settingsPage.gratitudeTile
class TranslationsSettingsPageGratitudeTileEn implements TranslationsSettingsPageGratitudeTileRu {
	TranslationsSettingsPageGratitudeTileEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get tileTitle => 'Gratitude';
}

// Path: settingsPage.aboutAppTile
class TranslationsSettingsPageAboutAppTileEn implements TranslationsSettingsPageAboutAppTileRu {
	TranslationsSettingsPageAboutAppTileEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get tileTitle => 'About the app';
}

// Path: visualDesignPage.headers
class TranslationsVisualDesignPageHeadersEn implements TranslationsVisualDesignPageHeadersRu {
	TranslationsVisualDesignPageHeadersEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get design => 'Weather main page design';
	@override String get fontSize => 'Font size';
	@override String get scroll => 'Scroll';
	@override String get typography => 'Typography';
	@override String get font => 'Font';
}

// Path: savedPlacesPage.tips
class TranslationsSavedPlacesPageTipsEn implements TranslationsSavedPlacesPageTipsRu {
	TranslationsSavedPlacesPageTipsEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get clickToMore => 'Click to learn more.';
	@override String get holdToSet => 'Hold to set.';
}

// Path: searchBar.tips
class TranslationsSearchBarTipsEn implements TranslationsSearchBarTipsRu {
	TranslationsSearchBarTipsEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get clickToSet => 'Click to select a place.';
	@override String get holdToAction => 'Hold to save/delete place.';
	@override String get notSavedPlaces => 'There are no saved places.';
	@override String get showSavedPlaces => 'Saved places are shown.';
	@override String get notFoundedPlaces => 'No places found.';
	@override String get showFoundedPlaces => 'The found places are shown.';
	@override String get searchError => 'An error has occurred.';
}

// Path: weatherLangPage.tips
class TranslationsWeatherLangPageTipsEn implements TranslationsWeatherLangPageTipsRu {
	TranslationsWeatherLangPageTipsEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get info => 'Some weather conditions will be provided in the selected language.';
}

// Path: apiWeatherPage.tips
class TranslationsApiWeatherPageTipsEn implements TranslationsApiWeatherPageTipsRu {
	TranslationsApiWeatherPageTipsEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get info => 'To make requests more often, you need to have your Api key.';
	@override String get free => 'It\'s free, you can get it from the link below.';
}

// Path: apiWeatherPage.defaultApi
class TranslationsApiWeatherPageDefaultApiEn implements TranslationsApiWeatherPageDefaultApiRu {
	TranslationsApiWeatherPageDefaultApiEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get usingApi => 'The default Api is used.';
	@override String get numbOfCalls => 'The number of calls is limited to the author\'s WeatherOpenApi rate';
	@override String get fieldTip => 'Enter Api...';
}

// Path: apiWeatherPage.userApi
class TranslationsApiWeatherPageUserApiEn implements TranslationsApiWeatherPageUserApiRu {
	TranslationsApiWeatherPageUserApiEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get usingApi => 'User Api installed';
	@override String get numbOfCalls => 'The number of calls is limited to your WeatherOpenApi rate.';
	@override String get fieldTip => 'Used...';
}

// Path: apiWeatherPage.tooltips
class TranslationsApiWeatherPageTooltipsEn implements TranslationsApiWeatherPageTooltipsRu {
	TranslationsApiWeatherPageTooltipsEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get delApiKey => 'Remove Api key';
	@override String get checkApiKey => 'Check Api key';
	@override String get clipboardButton => 'Paste from clipboard';
	@override String get awaiting => 'Awaiting...';
	@override String get set => 'Set';
}

// Path: global.time
class TranslationsGlobalTimeEn implements TranslationsGlobalTimeRu {
	TranslationsGlobalTimeEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get theDayBeforeYesterday => 'The day before yesterday';
	@override String get yesterday => 'Yesterday';
	@override String get today => 'Today';
	@override String get tomorrow => 'Tomorrow';
	@override String get theDayAfterTomorrow => 'The day after tomorrow';
	@override String timeToHourMinute({required Object hour, required Object minute}) => '${hour} h ${minute} min';
	@override String timeToMinute({required Object minute}) => '${minute} min';
	@override String timeFromTimeSToTimeE({required Object time, required Object timeStart, required Object timeEnd}) => '${time} from ${timeStart} to ${timeEnd}';
	@override String fromTimeToTime({required Object timeStart, required Object timeEnd}) => 'from ${timeStart} to ${timeEnd}';
	@override String timeFromTimeSToTimeEnl({required Object time, required Object timeStart, required Object timeEnd}) => '${time} \nfrom ${timeStart} to ${timeEnd}';
	@override String fromTimeToTimeNl({required Object timeStart, required Object timeEnd}) => 'from ${timeStart} \nto ${timeEnd}';
}

// Path: dialogs.messages
class TranslationsDialogsMessagesEn implements TranslationsDialogsMessagesRu {
	TranslationsDialogsMessagesEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get socketException => 'No internet connection or weather service not available';
	@override String get apiKeyWeatherSetTrue => 'Api weather key installed!';
	@override String get apiKeyWeatherSetFalse => 'Api key installation failed...';
	@override String get apiKeyOWMVerificationSuccess => 'Api key active!';
	@override String get apiKeyOWMVerificationFail => 'Api key is invalid!';
	@override String get weatherUpdateFail => 'Not available right now...';
}

// Path: dialogs.buttons
class TranslationsDialogsButtonsEn implements TranslationsDialogsButtonsRu {
	TranslationsDialogsButtonsEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get ok => 'Ok';
	@override String get okay => 'Okay';
	@override String get know => 'Know';
	@override String get save => 'Save';
	@override String get cancel => 'Cancel';
}

// Path: dialogs.placeSearchInfo
class TranslationsDialogsPlaceSearchInfoEn implements TranslationsDialogsPlaceSearchInfoRu {
	TranslationsDialogsPlaceSearchInfoEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Did you know that...';
	@override String get subtitle => 'There are several ways to find a place';
	@override String get way1 => '1 way - by city name. For example:';
	@override String get city => 'Moscow';
	@override String get way2 => '2 way - by coordinates, like this:';
	@override String get coord => '55.75199, 37.61773';
}

// Path: dialogs.confirmDelPlace
class TranslationsDialogsConfirmDelPlaceEn implements TranslationsDialogsConfirmDelPlaceRu {
	TranslationsDialogsConfirmDelPlaceEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Warning';
	@override String get subtitle => 'Delete place?';
	@override String get content => 'The place will be removed from the list of saved places';
}

// Path: dialogs.seeFlag
class TranslationsDialogsSeeFlagEn implements TranslationsDialogsSeeFlagRu {
	TranslationsDialogsSeeFlagEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Information';
	@override String get subtitle => 'You can see the full name of the country and its flag';
}

// Path: dialogs.confirmDelUserApikey
class TranslationsDialogsConfirmDelUserApikeyEn implements TranslationsDialogsConfirmDelUserApikeyRu {
	TranslationsDialogsConfirmDelUserApikeyEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Warning';
	@override String get subtitle => 'Your user api key will be deleted.';
}

// Path: dialogs.confirmSaveChanges
class TranslationsDialogsConfirmSaveChangesEn implements TranslationsDialogsConfirmSaveChangesRu {
	TranslationsDialogsConfirmSaveChangesEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Warning';
	@override String get subtitle => 'Save changes?';
}

// Path: dialogs.makeNote
class TranslationsDialogsMakeNoteEn implements TranslationsDialogsMakeNoteRu {
	TranslationsDialogsMakeNoteEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Note';
	@override String get subtitle => 'Your note about this place';
}

// Path: enums.homepage
class TranslationsEnumsHomepageEn implements TranslationsEnumsHomepageRu {
	TranslationsEnumsHomepageEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get settings => 'Settings';
	@override String get hourly => 'Hourly';
	@override String get today => 'Today';
	@override String get daily => '7 days';
}

// Path: units.temp
class TranslationsUnitsTempEn implements TranslationsUnitsTempRu {
	TranslationsUnitsTempEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsUnitsTempFullNameEn fullName = TranslationsUnitsTempFullNameEn._(_root);
}

// Path: units.speed
class TranslationsUnitsSpeedEn implements TranslationsUnitsSpeedRu {
	TranslationsUnitsSpeedEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsUnitsSpeedAbbrEn abbr = TranslationsUnitsSpeedAbbrEn._(_root);
}

// Path: units.pressure
class TranslationsUnitsPressureEn implements TranslationsUnitsPressureRu {
	TranslationsUnitsPressureEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsUnitsPressureAbbrEn abbr = TranslationsUnitsPressureAbbrEn._(_root);
	@override late final TranslationsUnitsPressureNameEn name = TranslationsUnitsPressureNameEn._(_root);
}

// Path: units.sideOfTheWorld
class TranslationsUnitsSideOfTheWorldEn implements TranslationsUnitsSideOfTheWorldRu {
	TranslationsUnitsSideOfTheWorldEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final TranslationsUnitsSideOfTheWorldAbbrEn abbr = TranslationsUnitsSideOfTheWorldAbbrEn._(_root);
	@override late final TranslationsUnitsSideOfTheWorldNameAdjEn nameAdj = TranslationsUnitsSideOfTheWorldNameAdjEn._(_root);
	@override late final TranslationsUnitsSideOfTheWorldNameEn name = TranslationsUnitsSideOfTheWorldNameEn._(_root);
}

// Path: mainPageDRuble.mainPage.bottomBar
class TranslationsMainPageDRubleMainPageBottomBarEn implements TranslationsMainPageDRubleMainPageBottomBarRu {
	TranslationsMainPageDRubleMainPageBottomBarEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get settings => 'Settings';
	@override String get hourly => 'Hourly';
	@override String get today => 'Today';
	@override String get daily => '7 days';
}

// Path: mainPageDRuble.hourlyPage.forecast
class TranslationsMainPageDRubleHourlyPageForecastEn implements TranslationsMainPageDRubleHourlyPageForecastRu {
	TranslationsMainPageDRubleHourlyPageForecastEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Weather';
	@override String get uvi => 'UV';
	@override late final TranslationsMainPageDRubleHourlyPageForecastLegendEn legend = TranslationsMainPageDRubleHourlyPageForecastLegendEn._(_root);
}

// Path: mainPageDRuble.hourlyPage.pop
class TranslationsMainPageDRubleHourlyPagePopEn implements TranslationsMainPageDRubleHourlyPagePopRu {
	TranslationsMainPageDRubleHourlyPagePopEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Precipitation';
	@override String get subtitle => 'Total precipitation';
	@override String get noPopExpected => 'No precipitation expected';
	@override String popExpected({required Object startDate, required Object endDate}) => 'Precipitation from ${startDate} to ${endDate} is not expected';
	@override String get units => 'mm';
	@override late final TranslationsMainPageDRubleHourlyPagePopLegendEn legend = TranslationsMainPageDRubleHourlyPagePopLegendEn._(_root);
}

// Path: mainPageDRuble.hourlyPage.wind
class TranslationsMainPageDRubleHourlyPageWindEn implements TranslationsMainPageDRubleHourlyPageWindRu {
	TranslationsMainPageDRubleHourlyPageWindEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Wind';
	@override String get subtitle => 'Maximum wind';
	@override String get units => 'm/s';
	@override String get noWindExpected => 'Doldrums pending';
	@override String windExpected({required Object startDate, required Object endDate}) => 'From ${startDate} to ${endDate} doldrums';
	@override late final TranslationsMainPageDRubleHourlyPageWindLegendEn legend = TranslationsMainPageDRubleHourlyPageWindLegendEn._(_root);
}

// Path: mainPageDRuble.hourlyPage.more
class TranslationsMainPageDRubleHourlyPageMoreEn implements TranslationsMainPageDRubleHourlyPageMoreRu {
	TranslationsMainPageDRubleHourlyPageMoreEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'More';
	@override String get unitsRight => 'mmHg';
	@override String get noData => 'No other data';
	@override late final TranslationsMainPageDRubleHourlyPageMoreLegendEn legend = TranslationsMainPageDRubleHourlyPageMoreLegendEn._(_root);
}

// Path: mainPageDRuble.currentPage.headers
class TranslationsMainPageDRubleCurrentPageHeadersEn implements TranslationsMainPageDRubleCurrentPageHeadersRu {
	TranslationsMainPageDRubleCurrentPageHeadersEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get sun => 'Sunrise and sunset';
	@override String get wind => 'Wind';
	@override String get clouds => 'Cloudiness';
	@override String get more => 'Indicators';
	@override String get alerts => 'Alerts';
}

// Path: units.temp.fullName
class TranslationsUnitsTempFullNameEn implements TranslationsUnitsTempFullNameRu {
	TranslationsUnitsTempFullNameEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get celsius => 'On the Celsius scale';
	@override String get kelvin => 'On the Kelvin scale';
	@override String get fahrenheit => 'On the Fahrenheit scale';
}

// Path: units.speed.abbr
class TranslationsUnitsSpeedAbbrEn implements TranslationsUnitsSpeedAbbrRu {
	TranslationsUnitsSpeedAbbrEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get ms => 'm/s';
	@override String get mph => 'mph';
	@override String get kph => 'km/h';
}

// Path: units.pressure.abbr
class TranslationsUnitsPressureAbbrEn implements TranslationsUnitsPressureAbbrRu {
	TranslationsUnitsPressureAbbrEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get hectoPa => 'hPa';
	@override String get mbar => 'mbar';
	@override String get mmHg => 'mmHg';
	@override String get kPa => 'kPa';
	@override String get atm => 'atm';
	@override String get inHg => 'inHg';
}

// Path: units.pressure.name
class TranslationsUnitsPressureNameEn implements TranslationsUnitsPressureNameRu {
	TranslationsUnitsPressureNameEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get hectoPa => 'Hectopascal';
	@override String get mbar => 'Millibar';
	@override String get mmHg => 'Millimetre of mercury';
	@override String get kPa => 'Kilopascal';
	@override String get atm => 'Atmosphere';
	@override String get inHg => 'Inch of mercury';
}

// Path: units.sideOfTheWorld.abbr
class TranslationsUnitsSideOfTheWorldAbbrEn implements TranslationsUnitsSideOfTheWorldAbbrRu {
	TranslationsUnitsSideOfTheWorldAbbrEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get north => 'N';
	@override String get northEast => 'NE';
	@override String get east => 'E';
	@override String get southEast => 'SE';
	@override String get south => 'S';
	@override String get southWest => 'SW';
	@override String get west => 'W';
	@override String get northWest => 'NW';
}

// Path: units.sideOfTheWorld.nameAdj
class TranslationsUnitsSideOfTheWorldNameAdjEn implements TranslationsUnitsSideOfTheWorldNameAdjRu {
	TranslationsUnitsSideOfTheWorldNameAdjEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get north => 'Northern';
	@override String get northEast => 'Northeastern';
	@override String get east => 'Eastern';
	@override String get southEast => 'Southeastern';
	@override String get south => 'Southern';
	@override String get southWest => 'Southwestern';
	@override String get west => 'Western';
	@override String get northWest => 'Northwestern';
}

// Path: units.sideOfTheWorld.name
class TranslationsUnitsSideOfTheWorldNameEn implements TranslationsUnitsSideOfTheWorldNameRu {
	TranslationsUnitsSideOfTheWorldNameEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get north => 'North';
	@override String get northEast => 'North-East';
	@override String get east => 'East';
	@override String get southEast => 'South-East';
	@override String get south => 'South';
	@override String get southWest => 'South-West';
	@override String get west => 'West';
	@override String get northWest => 'North-West';
}

// Path: mainPageDRuble.hourlyPage.forecast.legend
class TranslationsMainPageDRubleHourlyPageForecastLegendEn implements TranslationsMainPageDRubleHourlyPageForecastLegendRu {
	TranslationsMainPageDRubleHourlyPageForecastLegendEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get realTemp => 'real';
	@override String get feelTemp => 'feels';
	@override String get dewPoint => 'dew point';
}

// Path: mainPageDRuble.hourlyPage.pop.legend
class TranslationsMainPageDRubleHourlyPagePopLegendEn implements TranslationsMainPageDRubleHourlyPagePopLegendRu {
	TranslationsMainPageDRubleHourlyPagePopLegendEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get rain => 'rain';
	@override String get snow => 'snow';
}

// Path: mainPageDRuble.hourlyPage.wind.legend
class TranslationsMainPageDRubleHourlyPageWindLegendEn implements TranslationsMainPageDRubleHourlyPageWindLegendRu {
	TranslationsMainPageDRubleHourlyPageWindLegendEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get wind => 'wind';
	@override String get gust => 'gust';
}

// Path: mainPageDRuble.hourlyPage.more.legend
class TranslationsMainPageDRubleHourlyPageMoreLegendEn implements TranslationsMainPageDRubleHourlyPageMoreLegendRu {
	TranslationsMainPageDRubleHourlyPageMoreLegendEn._(this._root);

	@override final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get clouds => 'cloudiness';
	@override String get humidity => 'humidity';
	@override String get pressure => 'pressure';
}
