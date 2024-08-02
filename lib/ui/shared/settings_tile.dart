import 'package:flutter/material.dart';

class TileSetting extends StatelessWidget {
  const TileSetting({
    super.key,
    required this.leading,
    required this.title,
    this.subtitle,
    this.trailing,
    required this.onTap,
    this.onLongPress,
  });

  final IconData leading;
  final String title;
  final String? subtitle;
  final IconData? trailing;
  final Function() onTap;
  final Function()? onLongPress;

  @override
  Widget build(BuildContext context) {
    final iconColor = IconTheme.of(context).color;
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      horizontalTitleGap: 16.0,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Icon>[Icon(leading, color: iconColor)],
      ),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle!) : null,
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(trailing ?? Icons.chevron_right, color: iconColor),
        ],
      ),
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
