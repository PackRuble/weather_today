import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:weather_today/ui/pages/main_page/home_page_ui.dart';
import 'package:weather_today/ui/pages/settings_page/country_flags_page/county_flags_page_ui.dart';
import 'package:weather_today/ui/pages/settings_page/gratitude_page/gratitude_page_ui.dart';
import 'package:weather_today/ui/pages/settings_page/saved_places_page/saved_places_page_ui.dart';
import 'package:weather_today/ui/pages/settings_page/themes_page/theme_page_ui.dart';
import 'package:weather_today/ui/pages/settings_page/user_api_page/user_api_page_ui.dart';
import 'package:weather_today/ui/pages/settings_page/visual_design_page/visual_design_page_ui.dart';
import 'package:weather_today/ui/pages/settings_page/weather_language_page/weather_language_page_ui.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: SavedPlacesPage),
    AutoRoute(page: WeatherLanguagePage),
    AutoRoute(page: UserApiPage),
    AutoRoute(page: CountryFlagsPage),
    AutoRoute(page: ThemePage),
    AutoRoute(page: VisualDesignPage),
    AutoRoute(page: GratitudePage),
  ],
)
class $AppRouter {}
