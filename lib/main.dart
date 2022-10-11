import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:slang_flutter/slang_flutter.dart';
import 'package:weather_today/core/init_app_service.dart';
import 'package:weather_today/utils/logger/riverpod_logger.dart';
import 'package:weather_today/utils/routes/routes.gr.dart';

import 'const/app_info.dart';
import 'core/controllers/localization_controller.dart';
import 'core/services/app_theme_service/controller/app_theme_controller.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Keep native splash screen up until app is finished bootstrapping
  widgetsBinding.deferFirstFrame();

  // This let us access providers before runApp (read only)
  final container = ProviderContainer(observers: [RivLoggy()]);

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
}

class WeatherMain extends ConsumerWidget with UiLoggy {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    loggy.debug('build');

    final AppLocalization appLocalization = ref.watch(AppLocalization.instance);
    final Locale locale =
        ref.watch(AppLocalization.currentLocale).flutterLocale;

    return MaterialApp.router(
      theme: ref.watch(AppTheme.lightTheme).toTheme,
      darkTheme: ref.watch(AppTheme.darkTheme).toTheme,
      themeMode: ref.watch(AppTheme.themeMode),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
      title: AppInfo.appName,
      locale: locale,
      supportedLocales: appLocalization.supportedLocales,
      localizationsDelegates: appLocalization.localizationsDelegates,
    );
  }
}
