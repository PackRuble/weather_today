import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';

/// Обертка позволяет сделать много полезной работы за нас.
/// В данный момент:
/// - следит за фокусом;
/// - следит за размером текста.
class WrapperPage extends ConsumerWidget {
  const WrapperPage({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double textScaleFactor = ref.watch(AppTheme.textScaleFactor);

    // Применяем масштабирование текста во всем приложении
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: textScaleFactor),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: child,
      ),
    );
  }
}
