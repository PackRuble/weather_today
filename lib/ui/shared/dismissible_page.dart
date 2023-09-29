/// Made based on the development of the package [dismissible_page](https://pub.dev/packages/dismissible_page)
/// Based on https://github.com/Tkko/Flutter_dismissible_page
///
library;

import 'package:dismissible_page/dismissible_page.dart'
    show
        DismissiblePage,
        DismissiblePageDismissDirection,
        // ignore: invalid_use_of_visible_for_testing_member
        MultiAxisDismissiblePage,
        // ignore: invalid_use_of_visible_for_testing_member
        SingleAxisDismissiblePage;
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter/material.dart';

export 'package:dismissible_page/dismissible_page.dart'
    show DismissiblePageDismissDirection, TransparentRoute;

/// Problems were caused by the [_DismissiblePageScrollBehavior] widget expanding from ScrollBehavior.
/// Eliminating it inside the build method in MyDismissiblePage helped get rid of
/// from problems with scrolling in [BouncingScrollPhysics] mode.
class MyDismissiblePage extends DismissiblePage {
  const MyDismissiblePage({
    required super.child,
    required super.onDismissed,
    super.onDragStart,
    super.onDragEnd,
    super.onDragUpdate,
    super.isFullScreen = true,
    super.disabled = false,
    super.backgroundColor = Colors.black,
    super.direction = DismissiblePageDismissDirection.horizontal,
    super.dismissThresholds = const <DismissiblePageDismissDirection, double>{},
    super.dragStartBehavior = DragStartBehavior.down,
    super.dragSensitivity = 0.7,
    super.minRadius = 7,
    super.minScale = .85,
    super.maxRadius = 30,
    super.maxTransformValue = .4,
    super.startingOpacity = 1,
    super.hitTestBehavior = HitTestBehavior.opaque,
    super.reverseDuration = const Duration(milliseconds: 200),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contentPadding =
        isFullScreen ? EdgeInsets.zero : MediaQuery.of(context).padding;

    if (disabled) {
      return DecoratedBox(
        decoration: BoxDecoration(color: backgroundColor),
        child: Padding(
          padding: contentPadding,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(minRadius),
            child: child,
          ),
        ),
      );
    }

    if (direction == DismissiblePageDismissDirection.multi) {
      return MultiAxisDismissiblePage(
        onDismissed: onDismissed,
        isFullScreen: isFullScreen,
        backgroundColor: backgroundColor,
        direction: direction,
        dismissThresholds: dismissThresholds,
        dragStartBehavior: dragStartBehavior,
        dragSensitivity: dragSensitivity,
        minRadius: minRadius,
        minScale: minScale,
        maxRadius: maxRadius,
        maxTransformValue: maxTransformValue,
        startingOpacity: startingOpacity,
        onDragStart: onDragStart,
        onDragEnd: onDragEnd,
        onDragUpdate: onDragUpdate,
        reverseDuration: reverseDuration,
        hitTestBehavior: hitTestBehavior,
        contentPadding: contentPadding,
        child: child,
      );
    } else {
      return SingleAxisDismissiblePage(
        onDismissed: onDismissed,
        isFullScreen: isFullScreen,
        backgroundColor: backgroundColor,
        direction: direction,
        dismissThresholds: dismissThresholds,
        dragStartBehavior: dragStartBehavior,
        dragSensitivity: dragSensitivity,
        minRadius: minRadius,
        minScale: minScale,
        maxRadius: maxRadius,
        maxTransformValue: maxTransformValue,
        startingOpacity: startingOpacity,
        onDragStart: onDragStart,
        onDragEnd: onDragEnd,
        onDragUpdate: onDragUpdate,
        reverseDuration: reverseDuration,
        hitTestBehavior: hitTestBehavior,
        contentPadding: contentPadding,
        child: child,
      );
    }
  }
}
