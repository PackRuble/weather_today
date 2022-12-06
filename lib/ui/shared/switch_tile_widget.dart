import 'package:flutter/material.dart';

class SwitchTileWidget extends StatefulWidget {
  const SwitchTileWidget({
    this.leading,
    required this.title,
    this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final String title;
  final String? subtitle;
  final IconData? leading;
  final ValueChanged<bool>? onChanged;
  final bool value;

  @override
  State<SwitchTileWidget> createState() => _SwitchTileWidgetState();
}

class _SwitchTileWidgetState extends State<SwitchTileWidget> {
  late bool value = widget.value;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      title: Text(widget.title),
      subtitle: widget.subtitle != null ? Text(widget.subtitle!) : null,
      secondary: widget.leading == null
          ? null
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(widget.leading, color: IconTheme.of(context).color),
              ],
            ),
      onChanged: (bool value) {
        setState(() {
          this.value = value;
        });

        widget.onChanged?.call(value);
      },
      value: value,
    );
  }
}
