import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/application/const/app_colors.dart';

// todo(31.07.2024): combine TipRWidget and TipWidget

/// Виджет-подсказка.
class TipRWidget extends ConsumerWidget {
  const TipRWidget({
    required this.text,
    this.padding = const EdgeInsets.all(8.0),
  });

  final Text text;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: padding,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: DecoratedBox(
            decoration: ShapeDecoration(
              // color: Theme.of(context).dividerColor,
              color: AppColors.of(context).tipBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: AppColors.of(context).tipBorderColor),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: text,
            ),
          ),
        ),
      ),
    );
  }
}

class TipWidget extends StatelessWidget {
  const TipWidget({
    super.key,
    required this.child,
    required this.color,
  });

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(2.0),
      decoration: ShapeDecoration(
        color: color ?? AppColors.of(context).tipBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
          side: BorderSide(color: AppColors.of(context).tipBorderColor),
        ),
      ),
      child: child,
    );
  }
}
