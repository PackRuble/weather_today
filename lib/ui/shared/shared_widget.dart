import 'dart:math';

import 'package:flutter/material.dart';

const double _indent = 16.0;

/// Используется как заголовок на всех экранах.
class HeaderRWidget extends StatelessWidget {
  const HeaderRWidget(
    this.head, {
    super.key,
    this.fontStyle,
    this.textStyle,
    this.padding = const EdgeInsets.only(left: _indent, top: _indent),
  });

  final String head;
  final FontStyle? fontStyle;
  final TextStyle? textStyle;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final bool isDark = Brightness.dark == Theme.of(context).brightness;

    final TextStyle? _textStyle = textStyle ?? textTheme.titleMedium;

    return Padding(
      padding: padding,
      child: Text(
        head,
        style: _textStyle?.copyWith(
          fontStyle: fontStyle,
          color: isDark
              ? Theme.of(context).primaryColor
              : Theme.of(context).primaryColorDark,
        ),
      ),
    );
  }
}

/// Удобно использовать для отладки местоположения элемента на экране.
class ColorRWidget extends StatelessWidget {
  const ColorRWidget({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final int index = Random().nextInt(Colors.primaries.length);
    return ColoredBox(
      color: Colors.primaries[index],
      child: child,
    );
  }
}
