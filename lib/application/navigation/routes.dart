import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:weather_today/ui/shared/dismissible_page.dart';

import 'routes.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen,Route',
)
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        CustomRoute(page: HomeRoute.page, initial: true),
        DismissibleRoute(page: SavedPlacesRoute.page),
        DismissibleRoute(page: WeatherLanguageRoute.page),
        DismissibleRoute(page: UserApiRoute.page),
        DismissibleRoute(page: CountryFlagsRoute.page),
        DismissibleRoute(page: ThemeRoute.page),
        DismissibleRoute(page: VisualDesignRoute.page),
        DismissibleRoute(page: GratitudeRoute.page),
        DismissibleRoute(page: LogsRoute.page),
        DismissibleRoute(page: SystemSettingsRoute.page),
        DismissibleRoute(page: TermsAppRoute.page),
        DismissibleRoute(page: WeatherProviderRoute.page),
      ];

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
}

class DismissibleRoute extends CustomRoute {
  DismissibleRoute({
    required super.page,
  }) : super(
          customRouteBuilder: _dismissiblePageRouteBuilder,
        );

  static TransparentRoute<T> _dismissiblePageRouteBuilder<T>(
    BuildContext context,
    Widget child,
    AutoRoutePage<T> page,
  ) =>
      TransparentRoute<T>(
        builder: (context) => MyDismissiblePage(
          hitTestBehavior: HitTestBehavior.opaque,
          backgroundColor: Colors.black,
          minRadius: 0.0,
          maxRadius: 24.0,
          dragSensitivity: 0.6,
          startingOpacity: 0.5,
          onDismissed: () => Navigator.of(context).pop(),
          direction: DismissiblePageDismissDirection.startToEnd,
          dismissThresholds: const {
            DismissiblePageDismissDirection.startToEnd: 0.3,
          },
          reverseDuration: const Duration(milliseconds: 100),
          maxTransformValue: 0.5,
          child: child,
        ),
        fullscreenDialog: page.fullscreenDialog,
        backgroundColor: Colors.transparent,
        transitionDuration: const Duration(milliseconds: 200),
        reverseTransitionDuration: const Duration(milliseconds: 200),
        settings: page,
      );
}
