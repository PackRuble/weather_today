import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:weather_today/extension/value_notifier_x.dart';

/// Optimized expanded panel.
class ExpPanel extends HookWidget {
  const ExpPanel({
    super.key,
    required this.header,
    this.expandIcon,
    this.iconPadding = const EdgeInsets.only(right: 8.0),
    required this.expanded,
    this.scrollOnExpand = true,
    this.collapsed,
    this.onExpand,
    this.animationDuration = const Duration(milliseconds: 300),
    this.initialExpanded = false,
    this.hasIcon = true,
  });

  final Widget header;
  final Widget? expandIcon;

  /// Ignore when using [expandIcon]
  final EdgeInsets iconPadding;

  final Widget expanded;
  final Widget? collapsed;

  final Duration animationDuration;

  final void Function(bool isExpanding)? onExpand;

  final bool initialExpanded;
  final bool scrollOnExpand;
  final bool hasIcon;

  @override
  Widget build(BuildContext context) {
    final expCR = useValueNotifier(initialExpanded, [initialExpanded]);
    final isExpanded = useValueListenable(expCR);

    useEffect(() {
      // ignore: prefer_function_declarations_over_variables
      final remover = expCR.addListenerV((value) => onExpand?.call(value));
      return remover;
    });

    Widget child = isExpanded ? expanded : collapsed ?? const SizedBox.shrink();

    child = AnimatedSwitcher(
      duration: animationDuration,
      transitionBuilder: sizeTransitionBuilder,
      child: SizedBox(
        key: ValueKey<bool>(isExpanded),
        child: child,
      ),
    );

    return ScrollOnExpand(
      isExpanded: isExpanded,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: () => expCR.value = !isExpanded,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: header),
                expandIcon ??
                    Padding(
                      padding: iconPadding,
                      child: RotatedIcon(
                        isExpanded: isExpanded,
                        icon: hasIcon
                            ? const Icon(Icons.expand_more)
                            : const SizedBox.shrink(),
                      ),
                    ),
              ],
            ),
          ),
          Flexible(
            child: child,
          ),
        ],
      ),
    );
  }

  static Widget sizeTransitionBuilder(
    Widget child,
    Animation<double> animation,
  ) =>
      SizeTransition(
        axis: Axis.vertical,
        sizeFactor: animation,
        axisAlignment: -1,
        child: child,
      );
}

class RotatedIcon extends HookWidget {
  const RotatedIcon({
    super.key,
    this.icon,
    this.collapsedIcon,
    this.expandedIcon,
    this.iconRotationAngle = -math.pi,
    this.onTap,
    required this.isExpanded,
  });

  /// Has priority over [collapsedIcon] and [expandedIcon]
  final Widget? icon;
  final Widget? collapsedIcon;
  final Widget? expandedIcon;
  final double iconRotationAngle;
  final bool isExpanded;
  final void Function(bool isExpanding)? onTap;

  @override
  Widget build(BuildContext context) {
    final animCR = useAnimationController(
      initialValue: isExpanded ? 1.0 : 0.0,
      duration: Durations.medium2,
      reverseDuration: Durations.medium2,
    );

    useEffect(
      () {
        isExpanded ? animCR.forward() : animCR.reverse();
        return null;
      },
      [isExpanded],
    );

    return AnimatedBuilder(
      animation: animCR,
      builder: (context, child) {
        late final isExpanding = animCR.value > 0.5;
        return Transform.rotate(
          angle: iconRotationAngle * animCR.value,
          // (showSecondIcon ? -(1.0 - animCR.value) : animCR.value),
          child: icon ?? (isExpanding ? collapsedIcon : expandedIcon),
        );
      },
    );
  }
}

class ScrollOnExpand extends HookWidget {
  const ScrollOnExpand({
    super.key,
    this.scrollOnExpand = true,
    this.scrollOnCollapse = true,
    this.duration = const Duration(milliseconds: 300),
    required this.child,
    required this.isExpanded,
  });

  final Widget child;

  final Duration duration;

  final bool isExpanded;

  final bool scrollOnExpand;

  final bool scrollOnCollapse;

  @override
  Widget build(BuildContext context) {
    final scroll = useRef<bool>(false);

    useEffect(
      () {
        if (scroll.value) {
          Future.delayed(
            duration,
            () {
              if (!context.mounted) return;

              if (scrollOnExpand || scrollOnCollapse) {
                context.findRenderObject()?.showOnScreen(duration: duration);
              }
            },
          );
        }

        scroll.value = true;

        return null;
      },
      [isExpanded],
    );

    return child;
  }
}
