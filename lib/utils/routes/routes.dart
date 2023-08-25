import 'package:auto_route/auto_route.dart';
import 'routes.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen,Route',
)
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: SavedPlacesRoute.page),
        AutoRoute(page: WeatherLanguageRoute.page),
        AutoRoute(page: UserApiRoute.page),
        AutoRoute(page: CountryFlagsRoute.page),
        AutoRoute(page: ThemeRoute.page),
        AutoRoute(page: VisualDesignRoute.page),
        AutoRoute(page: GratitudeRoute.page),
        AutoRoute(page: LogsRoute.page),
        AutoRoute(page: SystemSettingsRoute.page),
        AutoRoute(page: TermsAppRoute.page),
      ];
}
