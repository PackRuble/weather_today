import 'package:flutter/material.dart';

import 'wrapper_page.dart';

class DialogOption<T> extends StatelessWidget {
  const DialogOption({
    this.icon,
    required this.groupValue,
    required this.title,
    required this.value,
  });

  final T groupValue;
  final IconData? icon;
  final String title;

  /// Значение, необходимое вернуть в случае выбора.
  final T value;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      padding: EdgeInsets.zero,
      child: RadioListTile<T>(
        dense: false,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[Icon(icon), const SizedBox(width: 5.0)],
            Text.rich(TextSpan(text: title)),
          ],
        ),
        selected: groupValue == value,
        value: value,
        groupValue: groupValue,
        toggleable: true,
        onChanged: (_) {
          Navigator.pop(context, value);
        },
      ),
    );
  }
}

Future<T?> infoDialogCustom<T>(
  BuildContext context, {
  Icon? icon,
  required String title,
  String? subTitle,
  Widget? content,
  required List<TextButton> listActions,
}) async {
  return showDialog<T>(
      context: context,
      builder: (BuildContext context) {
        return WrapperPage(
          child: AlertDialog(
            title: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) icon,
                Text(title, textAlign: TextAlign.center),
                if (subTitle != null) ...[
                  const SizedBox(height: 5.0),
                  Text(
                    subTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14.0),
                  ),
                ],
              ],
            ),
            content: content,
            actions: listActions,
          ),
        );
      });
}

Future<T?> showAboutThingsDialog<T>(
  BuildContext context, {
  String? applicationName,
  String? applicationVersion,
  Widget? applicationIcon,
  String? applicationLegalese,
  List<Widget>? more,
}) async {
  return showDialog<T>(
      context: context,
      builder: (BuildContext context) {
        return WrapperPage(
          child: AboutDialog(
            applicationName: applicationName,
            applicationVersion: applicationVersion,
            applicationIcon: applicationIcon,
            applicationLegalese: applicationLegalese,
            children: more,
          ),
        );
      });
}

Future<T?> showChoosingDialog<T>(
  BuildContext context, {
  required Icon icon,
  required String title,
  required String subTitle,
  required List<DialogOption<T>> listDialogOption,
}) async {
  return showDialog<T>(
      context: context,
      builder: (BuildContext context) {
        return WrapperPage(
          child: SimpleDialog(
            title: Column(
              children: [
                icon,
                Text(title, textAlign: TextAlign.center),
              ],
            ),
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                child: Text(subTitle),
              ),
              ...listDialogOption.map((DialogOption option) {
                return Column(
                  children: [
                    const Divider(height: 0.0),
                    option,
                  ],
                );
              }).toList(),
            ],
          ),
        );
      });
}