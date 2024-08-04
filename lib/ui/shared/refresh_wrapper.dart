import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

typedef ValueBuilder<T> = Widget Function(BuildContext context, T value);

/// Wrapper for pages with AsyncValue with handy utils.
class RefreshWrapper<T extends Object> extends ConsumerWidget {
  const RefreshWrapper({
    required this.asyncValue,
    required this.child,
    required this.onRefresh,
    this.childIsNull,
    this.childIsError,
    this.childIsLoading,
    this.scrollPhysics,
  });

  /// A widget that represents data. Data == isNotNull.
  final ValueBuilder<T> child;

  /// AsyncValue which is need to load and map.
  final AsyncValue<T?> asyncValue;

  /// Action to update data.
  final RefreshCallback onRefresh;

  /// Show widget when data is [AsyncValue.data] = null.
  final Widget? childIsNull;

  /// Show widget when data is [AsyncValue.error].
  final Widget? childIsError;

  /// Show widget when data is initialized.
  final Widget? childIsLoading;

  /// The physics of scrolling.
  final ScrollPhysics? scrollPhysics;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle? textStyle = textTheme.headlineMedium;

    return RefreshIndicator(
      onRefresh: onRefresh,
      child: asyncValue.when(
        // when dependent on another provider with [Ref.watch]
        skipLoadingOnReload: true,
        // when [Ref.invalidate]/[Ref.refresh]
        skipLoadingOnRefresh: false,
        data: (T? value) {
          if (value != null) return child(context, value);

          return CustomListView(
            scrollPhysics: scrollPhysics,
            children: [
              childIsNull ??
                  Center(
                    child: Text(
                      r'¯\_(ツ)_/¯',
                      style: textStyle,
                    ),
                  ),
            ],
          );
        },
        error: (Object e, __) {
          return CustomListView(
            scrollPhysics: scrollPhysics,
            children: [
              childIsError ??
                  Center(
                    child: Text(
                      '(っ °Д °;)っ \n\n\n $e',
                      style: textStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
            ],
          );
        },
        loading: () =>
            childIsLoading ?? const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
    required this.scrollPhysics,
    required this.children,
  });

  final ScrollPhysics? scrollPhysics;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(top: 50.0),
      physics: scrollPhysics ??
          const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
      children: children,
    );
  }
}
