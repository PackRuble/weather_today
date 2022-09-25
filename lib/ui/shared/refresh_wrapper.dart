import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Обертка для страниц с AsyncValue.
class RefreshWrapper<T extends Object> extends ConsumerWidget {
  const RefreshWrapper({
    required this.asyncValue,
    required this.child,
    required this.onRefresh,
    this.valueIsNull,
    this.valueIsError,
    this.valueIsLoading,
    this.valueIsRefreshing,
    this.physicsListView,
  });

  final Widget Function(T) child;

  final AsyncValue<T?> asyncValue;

  final Future<void> Function() onRefresh;

  /// Отображается данный виджет, если AsyncValue.data = null.
  final Widget? valueIsNull;

  /// Отображается данный виджет, если AsyncValue.error.
  final Widget? valueIsError;

  /// Отображается данный виджет, если AsyncValue.loading.
  final Widget? valueIsLoading;

  /// Отображается данный виджет, если AsyncValue.loading и значение обновляется.
  final Widget? valueIsRefreshing;

  /// Физика прокрутки.
  final ScrollPhysics? physicsListView;

  /// Универсальный listView.
  // ignore: non_constant_identifier_names
  Widget CustomListView({required List<Widget> children}) => ListView(
        padding: const EdgeInsets.only(top: 50.0),
        physics: physicsListView ??
            const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics()),
        children: children,
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final TextStyle? textStyle = textTheme.headlineMedium;

    return RefreshIndicator(
      onRefresh: onRefresh,
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
        error: (_, __) {
          return CustomListView(
            children: [
              valueIsError ??
                  Center(child: Text('(っ °Д °;)っ', style: textStyle)),
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
