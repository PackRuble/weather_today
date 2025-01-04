import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/domain/init_app_service.dart';
import 'package:weather_today/ui/shared/wrapper_page.dart';

import 'application/const/app_info.dart';
import 'application/navigation/routes.dart';
import 'domain/controllers/app_theme/controller/app_theme_controller.dart';
import 'domain/controllers/localization_controller.dart';
import 'utils/logger/all_observers.dart';

void _loggingErrors() {
  // flutter framework error logging
  FlutterError.onError = (details) {
    kDebugMode
        ? FlutterError.presentError(details)
        : logError('Flutter Error', details.exception, details.stack);
  };

  // platform error logging
  PlatformDispatcher.instance.onError = (error, stack) {
    logError('PlatformDispatcher Error', error, stack);
    return true;
  };
}

Future<void> main() async {
  // coldfix: add custom font licenses to the project
  // LicenseRegistry.addLicense(() async* {
  //   final String license =
  //       await rootBundle.loadString('assets/fonts/Anonymous_Pro/OFL.txt');
  //   yield LicenseEntryWithLineBreaks(<String>['google_fonts'], license);
  // });

  await runZonedGuarded(
    () async {
      _loggingErrors();

      final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

      // Keep native splash screen up until app is finished bootstrapping
      widgetsBinding.deferFirstFrame();

      // This let us access providers before runApp (read only)
      final container = ProviderContainer(observers: [RiverpodObserver()]);

      // асинхронная инициализация всех сервисов
      await ServiceInit(container).init();

      runApp(
        UncontrolledProviderScope(
          container: container,
          child: WeatherMain(),
        ),
      );

      // Remove splash screen when bootstrap is complete
      widgetsBinding.allowFirstFrame();
    },
    (error, stackTrace) {
      // here we catch errors from asynchronous calls
      logError('Async Error', error, stackTrace);
    },
  );
}

class WeatherMain extends ConsumerWidget with UiLoggy {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    loggy.info('build');

    final AppLocalization appLocalization = ref.watch(AppLocalization.instance);
    final Locale locale =
        ref.watch(AppLocalization.currentLocale).flutterLocale;

    return MaterialApp.router(
      theme: ref.watch(AppTheme.lightTheme).toTheme,
      darkTheme: ref.watch(AppTheme.darkTheme).toTheme,
      themeMode: ref.watch(AppTheme.themeMode),
      builder: (context, child) => WrapperPage(child: child!),
      routerDelegate: AutoRouterDelegate(
        _appRouter,
        navigatorObservers: () => [NavigationObserver()],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      title: AppInfo.appName,
      locale: locale,
      supportedLocales: appLocalization.supportedLocales,
      localizationsDelegates: appLocalization.localizationsDelegates,
    );
  }
}
