///
/// Простой класс для хранения ключей и значений по умолчанию для хранилища key-value.
class DbStore {
  DbStore._();

  static const String firstRun = '_firstRun';

  // Настройки взаимодействия с сервисом погоды.
  // ===========================================================================

  // enum
  static const String temperatureUnits = 'temperatureUnits';
  static const int temperatureUnitsDefault = 1; // °C

  // enum
  static const String speedUnits = 'speedUnits';
  static const int speedUnitsDefault = 0; // m/s

  // enum
  static const String pressureUnits = 'pressureUnits';
  static const int pressureUnitsDefault = 2; // mmHg

  // OWM == OpenWeatherMap service
  static const String userApiKeyOWM = 'userApiKeyOWM';
  static const String userApiKeyOWMDefault = '';

  static const String userWeatherLanguage = 'userWeatherLanguage';
  static const String userWeatherLanguageDefault = 'ru';

  static const String lastRequestTimeOneCall = 'lastRequestTimeOneCall';
  static const int lastRequestTimeOneCallDefault = 0;

  static const String lastRequestTimeCurrent = 'lastRequestTimeCurrent';
  static const int lastRequestTimeCurrentDefault = 0;

  // Сохраненные погодные данные.
  // ===========================================================================

  static const String currentPlace = 'currentPlace';
  static const String currentPlaceDefault = '';

  static const String savedPlaces = 'savedPlaces';
  static const List<String> savedPlacesDefault = <String>[firstRun];

  static const String weatherOneCall = 'weatherOneCall';
  static const String weatherOneCallDefault = '';

  static const String weatherCurrent = 'weatherCurrent';
  static const String weatherCurrentDefault = '';

  // Настройки приложения.
  // ===========================================================================
  static const String startPageIndex = 'startPageIndex';
  static const int startPageIndexDefault = 2;

  static const String showIntro = 'isIntro';
  static const bool showIntroDefault = true;

  static const String isAcceptedTermsConditions = 'isAcceptedTermsConditions';
  static const bool isAcceptedTermsConditionsDefault = false;

  // Цветовая тема приложения.
  // ===========================================================================

  static const String themeScheme = 'themeScheme';
  static const int themeSchemeDefault = 8; //sakura

  // enum
  static const String themeMode = 'themeMode';
  static const int themeModeDefault = 0; // system

  static const String swapColorsTheme = 'swapColorsTheme';
  static const bool swapColorsThemeDefault = false;

  static const String swapDarkMainAndContainerColors =
      'swapDarkMainAndContainerColors';
  static const bool swapDarkMainAndContainerColorsDefault = false;

  static const String useMaterial3 = 'useMaterial3';
  static const bool useMaterial3Default = true;

  static const String darkLevelTheme = 'darkLevelTheme';
  static const int darkLevelThemeDefault = 7;

  static const String darkIsTrueBlack = 'darkIsTrueBlack';
  static const bool darkIsTrueBlackDefault = false;

  static const String appLocale = 'appLocale';
  static const String appLocaleDefault = 'ru';

  // enum
  @Deprecated('Been removed in next release (with migrating)') // todo:
  static const String visualDesignApp = 'visualDesignApp';
  static const int visualDesignAppDefault = 0; // by ruble

  static const String textScaleFactor = 'textScaleFactor';
  static const double textScaleFactorDefault = 1.1;

  // enum
  static const String typography = 'typography';
  static const int typographyDefault = 2; // material2021

  // enum
  static const String fontFamily = 'fontFamily';
  static const String fontFamilyDefault = 'Noto Serif';

  // enum
  static const String scrollPhysics = 'scrollPhysics';
  static const int scrollPhysicsDefault = 0; // bouncingScrollPhysics

  // logs
  static const String logsApp = 'logsApp';

  static const String enableLoggingApp = 'enableLoggingApp';
  // todo: turn-ON when we set up the ability to easily copy the logs to send them by email
  static const bool enableLoggingAppDefault = false;
}
