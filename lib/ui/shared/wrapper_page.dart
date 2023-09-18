import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';

/// Обертка позволяет сделать много полезной работы за нас.
/// В данный момент:
/// - следит за фокусом;
/// - следит за размером текста;
/// - помогает настроить взаимодействие с приложением согласно устройства;
/// - следит за используемой физикой скролла
class WrapperPage extends ConsumerWidget {
  const WrapperPage({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double textScaleFactor = ref.watch(AppTheme.textScaleFactor);
    final scrollTheme = ScrollConfiguration.of(context);

    final _child = ScrollConfiguration(
      behavior: scrollTheme.copyWith(
        physics: ref
            .watch(AppTheme.scrollPhysics)
            .scrollPhysics
            .applyTo(scrollTheme.getScrollPhysics(context)),
        dragDevices: {
          if (defaultTargetPlatform == TargetPlatform.windows) ...{
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          }
        },
      ),
      child: child,
    );

    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: textScaleFactor),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: _child,
      ),
    );
  }
}
