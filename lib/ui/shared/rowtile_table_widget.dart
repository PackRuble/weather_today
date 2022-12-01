import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Строка с отображением параметров погоды.
class RowItem extends ConsumerWidget {
  const RowItem(
    this.icon,
    this.title,
    this.value, {
    super.key,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(icon),
          const SizedBox(width: 16.0),
          Expanded(flex: 10, child: Text(title, style: textTheme.bodyMedium)),
          Flexible(
            flex: 11,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                value,
                style: textTheme.bodyMedium,
                textAlign: TextAlign.end,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
