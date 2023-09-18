import 'package:auto_route/auto_route.dart';
import 'package:dismissible_page/dismissible_page.dart';
import 'package:flutter/material.dart';

import 'routes.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page|Screen,Route',
)
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page, initial: true),
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
      ];
}

class DismissibleRoute extends CustomRoute {
  DismissibleRoute({
    required super.page,
  }) : super(customRouteBuilder: _dismissiblePageRouteBuilder);

  static TransparentRoute<T> _dismissiblePageRouteBuilder<T>(
    BuildContext context,
    Widget child,
    AutoRoutePage<T> page,
  ) {
    return TransparentRoute<T>(
      builder: (_) => DismissiblePage(
        backgroundColor: Colors.black,
        minRadius: 0.0,
        maxRadius: 24.0,
        dragSensitivity: 0.7,
        startingOpacity: 0.5,
        onDismissed: () => Navigator.of(context).pop(),
        direction: DismissiblePageDismissDirection.startToEnd,
        dismissThresholds: const {
          DismissiblePageDismissDirection.startToEnd: 0.4
        },
        reverseDuration: const Duration(milliseconds: 100),
        maxTransformValue: 0.5,
        child: child,
      ),
      fullscreenDialog: false,
      backgroundColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 250),
      reverseTransitionDuration: const Duration(milliseconds: 250),
      settings: page,
    );
  }
}
