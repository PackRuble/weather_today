import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

/// Use [ExpandableInexpensive] for optimization.
class ExpandablePanelCustom extends StatelessWidget {
  const ExpandablePanelCustom({
    required this.header,
    required this.expanded,
    this.expandableTheme,
  });

  final Widget? header;

  final Widget expanded;

  final ExpandableThemeData? expandableTheme;

  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        child: ExpandablePanel(
          theme: const ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapHeaderToExpand: true,
            tapBodyToExpand: false,
            tapBodyToCollapse: false,
            hasIcon: false,
          ),
          header: header,
          builder: (_, collapsed, expanded) => ExpandableInexpensive(
            collapsed: collapsed,
            expanded: expanded,
          ),
          collapsed: const SizedBox.shrink(),
          expanded: expanded,
        ),
      ),
    );
  }
}

/// Optimized builder for use instead of [Expandable].
/// Draws only when revealed.
class ExpandableInexpensive extends StatelessWidget {
  const ExpandableInexpensive({
    super.key,
    required this.collapsed,
    required this.expanded,
  });

  final Widget collapsed;
  final Widget expanded;

  @override
  Widget build(BuildContext context) {
    final expCR = ExpandableController.of(context)!;
    final expTheme = ExpandableThemeData.of(context);

    return ClipRect(
      child: AnimatedSize(
        duration: expTheme.animationDuration!,
        curve: expTheme.sizeCurve!,
        child: AnimatedSwitcher(
          duration: expTheme.animationDuration!,
          switchInCurve: Interval(
            expTheme.collapsedFadeStart,
            expTheme.collapsedFadeEnd,
            curve: expTheme.fadeCurve!,
          ),
          switchOutCurve: Interval(
            expTheme.expandedFadeStart,
            expTheme.expandedFadeEnd,
            curve: expTheme.fadeCurve!,
          ),
          layoutBuilder: (currentChild, previousChildren) => Stack(
            clipBehavior: Clip.none,
            alignment: expTheme.alignment!,
            children: <Widget>[
              ...previousChildren,
              if (currentChild != null) currentChild,
            ],
          ),
          child: expCR.expanded ? expanded : collapsed,
        ),
      ),
    );
  }
}
