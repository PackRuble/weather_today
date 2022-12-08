import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Wrapper for pages with AsyncValue with handy utils.
class RefreshWrapper<T> extends ConsumerWidget {
  const RefreshWrapper({
    required this.asyncValue,
    required this.child,
    required this.onRefresh,
    this.isUseRefreshIndicator = true,
    this.valueIsNull,
    this.valueIsError,
    this.valueIsLoading,
    this.valueIsRefreshing,
    this.physicsListView,
  });

  /// A widget that represents data. Data == isNotNull.
  final Widget Function(T) child;

  /// AsyncValue which is need to load and map.
  final AsyncValue<T?> asyncValue;

  /// Action to update data.
  final RefreshCallback onRefresh;

  /// [_RefreshIndicatorMode] is never equal to [_RefreshIndicatorMode.refresh].
  ///
  /// Default to `true`.
  final bool isUseRefreshIndicator;

  /// Show widget when data is [AsyncValue.data] = null.
  final Widget? valueIsNull;

  /// Show widget when data is [AsyncValue.error].
  final Widget? valueIsError;

  /// Show widget when data is initialized.
  final Widget? valueIsLoading;

  /// Show widget when data is refreshed.
  ///
  /// You can use this to shimmer effect.
  final Widget? valueIsRefreshing;

  /// Физика прокрутки.
  final ScrollPhysics? physicsListView;

  /// Универсальный listView.
  // ignore: non_constant_identifier_names
  Widget CustomListView({required List<Widget> children}) => ListView(
        padding: const EdgeInsets.only(top: 50.0),
        physics: physicsListView ??
            const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
        children: children,
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle? textStyle = textTheme.headlineMedium;

    return RefreshIndicator(
      onRefresh: () async {
        if (isUseRefreshIndicator) return onRefresh();
        return unawaited(onRefresh());
      },
      child: asyncValue.when(
        data: (T? value) {
          if (value != null) return child(value);

          return CustomListView(
            children: [
              valueIsNull ??
                  Center(child: Text(r'¯\_(ツ)_/¯', style: textStyle)),
            ],
          );
        },
        error: (Object e, __) {
          return CustomListView(
            children: [
              valueIsError ??
                  Center(child: Text('(っ °Д °;)っ \n $e', style: textStyle)),
            ],
          );
        },
        loading: () {
          return asyncValue.isRefreshing
              ? valueIsRefreshing ?? const SizedBox.shrink()
              : valueIsLoading ??
                  const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
