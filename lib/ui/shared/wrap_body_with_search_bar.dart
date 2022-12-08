import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/const/app_insets.dart';
import 'package:weather_today/ui/feature/search_widget_feature/search_widget_ui.dart';

/// A wrapper for a page body with FSBar.
///
/// Эта обертка предназначена для правильного позиционирования body, если
/// на странице присутствует FloatingSearchBar.
///
class WrapperBodyWithFSBar extends ConsumerWidget {
  const WrapperBodyWithFSBar({required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double statusBarHeight = MediaQuery.of(context).viewPadding.top;

    final double paddingTop = statusBarHeight +
        AppInsets.aroundPaddingSearchBar +
        AppInsets.heightSearchBar +
        AppInsets.aroundPaddingSearchBar;

    return Stack(
      fit: StackFit.expand,
      children: [
        Padding(
          // coldfix не получилось реализовать blurred из-за padding
          padding: EdgeInsets.only(top: paddingTop),
          child: MediaQuery.removePadding(
            context: context,
            removeTop: true,
            child: body,
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: ColoredBox(
            color: Theme.of(context).appBarTheme.backgroundColor ??
                Theme.of(context).colorScheme.primaryContainer,
            child: SizedBox(
              height: paddingTop,
              width: double.infinity,
              // child: ClipRect(
              //   child: BackdropFilter(
              //     filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              //   ),
              // ),
            ),
          ),
        ),
        const SearchWidget(),
      ],
    );
  }
}
