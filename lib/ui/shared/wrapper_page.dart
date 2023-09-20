import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/domain/controllers/app_theme/controller/app_theme_controller.dart';

/// The wrapper allows us to do a lot of useful work for us.
/// At the moment:
/// - monitors focus;
/// - monitors the text size;
/// - helps to customize interaction with the application according to the device;
/// - monitors the scroll physics used;
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
          ...scrollTheme.dragDevices,
          if (defaultTargetPlatform == TargetPlatform.windows) ...{
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
