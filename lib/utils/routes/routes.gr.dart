// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;

import '../../ui/pages/main_page/home_page_ui.dart' as _i1;
import '../../ui/pages/settings_page/country_flags_page/county_flags_page_ui.dart'
    as _i5;
import '../../ui/pages/settings_page/gratitude_page/gratitude_page_ui.dart'
    as _i8;
import '../../ui/pages/settings_page/logs_page/logs_page_ui.dart' as _i9;
import '../../ui/pages/settings_page/saved_places_page/saved_places_page_ui.dart'
    as _i2;
import '../../ui/pages/settings_page/system_settings_page/system_page_ui.dart'
    as _i10;
import '../../ui/pages/settings_page/terms_of_use_page/terms_of_use_ui.dart'
    as _i11;
import '../../ui/pages/settings_page/themes_page/theme_page_ui.dart' as _i6;
import '../../ui/pages/settings_page/user_api_page/user_api_page_ui.dart'
    as _i4;
import '../../ui/pages/settings_page/visual_design_page/visual_design_page_ui.dart'
    as _i7;
import '../../ui/pages/settings_page/weather_language_page/weather_language_page_ui.dart'
    as _i3;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.HomePage(),
      );
    },
    SavedPlacesRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.SavedPlacesPage(),
      );
    },
    WeatherLanguageRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.WeatherLanguagePage(),
      );
    },
    UserApiRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.UserApiPage(),
      );
    },
    CountryFlagsRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i5.CountryFlagsPage(),
      );
    },
    ThemeRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i6.ThemePage(),
      );
    },
    VisualDesignRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i7.VisualDesignPage(),
      );
    },
    GratitudeRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i8.GratitudePage(),
      );
    },
    LogsRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.LogsPage(),
      );
    },
    SystemSettingsRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.SystemSettingsPage(),
      );
    },
    TermsUseAppRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.TermsUseAppPage(),
      );
    },
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        _i12.RouteConfig(
          SavedPlacesRoute.name,
          path: '/saved-places-page',
        ),
        _i12.RouteConfig(
          WeatherLanguageRoute.name,
          path: '/weather-language-page',
        ),
        _i12.RouteConfig(
          UserApiRoute.name,
          path: '/user-api-page',
        ),
        _i12.RouteConfig(
          CountryFlagsRoute.name,
          path: '/country-flags-page',
        ),
        _i12.RouteConfig(
          ThemeRoute.name,
          path: '/theme-page',
        ),
        _i12.RouteConfig(
          VisualDesignRoute.name,
          path: '/visual-design-page',
        ),
        _i12.RouteConfig(
          GratitudeRoute.name,
          path: '/gratitude-page',
        ),
        _i12.RouteConfig(
          LogsRoute.name,
          path: '/logs-page',
        ),
        _i12.RouteConfig(
          SystemSettingsRoute.name,
          path: '/system-settings-page',
        ),
        _i12.RouteConfig(
          TermsUseAppRoute.name,
          path: '/terms-use-app-page',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.SavedPlacesPage]
class SavedPlacesRoute extends _i12.PageRouteInfo<void> {
  const SavedPlacesRoute()
      : super(
          SavedPlacesRoute.name,
          path: '/saved-places-page',
        );

  static const String name = 'SavedPlacesRoute';
}

/// generated route for
/// [_i3.WeatherLanguagePage]
class WeatherLanguageRoute extends _i12.PageRouteInfo<void> {
  const WeatherLanguageRoute()
      : super(
          WeatherLanguageRoute.name,
          path: '/weather-language-page',
        );

  static const String name = 'WeatherLanguageRoute';
}

/// generated route for
/// [_i4.UserApiPage]
class UserApiRoute extends _i12.PageRouteInfo<void> {
  const UserApiRoute()
      : super(
          UserApiRoute.name,
          path: '/user-api-page',
        );

  static const String name = 'UserApiRoute';
}

/// generated route for
/// [_i5.CountryFlagsPage]
class CountryFlagsRoute extends _i12.PageRouteInfo<void> {
  const CountryFlagsRoute()
      : super(
          CountryFlagsRoute.name,
          path: '/country-flags-page',
        );

  static const String name = 'CountryFlagsRoute';
}

/// generated route for
/// [_i6.ThemePage]
class ThemeRoute extends _i12.PageRouteInfo<void> {
  const ThemeRoute()
      : super(
          ThemeRoute.name,
          path: '/theme-page',
        );

  static const String name = 'ThemeRoute';
}

/// generated route for
/// [_i7.VisualDesignPage]
class VisualDesignRoute extends _i12.PageRouteInfo<void> {
  const VisualDesignRoute()
      : super(
          VisualDesignRoute.name,
          path: '/visual-design-page',
        );

  static const String name = 'VisualDesignRoute';
}

/// generated route for
/// [_i8.GratitudePage]
class GratitudeRoute extends _i12.PageRouteInfo<void> {
  const GratitudeRoute()
      : super(
          GratitudeRoute.name,
          path: '/gratitude-page',
        );

  static const String name = 'GratitudeRoute';
}

/// generated route for
/// [_i9.LogsPage]
class LogsRoute extends _i12.PageRouteInfo<void> {
  const LogsRoute()
      : super(
          LogsRoute.name,
          path: '/logs-page',
        );

  static const String name = 'LogsRoute';
}

/// generated route for
/// [_i10.SystemSettingsPage]
class SystemSettingsRoute extends _i12.PageRouteInfo<void> {
  const SystemSettingsRoute()
      : super(
          SystemSettingsRoute.name,
          path: '/system-settings-page',
        );

  static const String name = 'SystemSettingsRoute';
}

/// generated route for
/// [_i11.TermsUseAppPage]
class TermsUseAppRoute extends _i12.PageRouteInfo<void> {
  const TermsUseAppRoute()
      : super(
          TermsUseAppRoute.name,
          path: '/terms-use-app-page',
        );

  static const String name = 'TermsUseAppRoute';
}
