import 'package:flutter/material.dart';
import 'package:weather_today/application/const/app_colors.dart';

import 'wrapper_page.dart';

ShapeBorder getDialogShape(BuildContext context) => RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16.0),
      side: BorderSide(
        color: AppColors.of(context).cardBorderColor,
      ),
    );

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
            Flexible(child: Text.rich(TextSpan(text: title))),
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

class DialogSwitch extends StatefulWidget {
  const DialogSwitch({
    super.key,
    required this.value,
    required this.title,
    this.subtitle,
    required this.onChanged,
  });

  final String title;
  final String? subtitle;
  final void Function(bool) onChanged;
  final bool value;

  @override
  State<DialogSwitch> createState() => _DialogSwitchState();
}

class _DialogSwitchState extends State<DialogSwitch> {
  late bool value = widget.value;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      padding: EdgeInsets.zero,
      child: SwitchListTile(
        onChanged: (bool value) {
          setState(() {
            this.value = value;
          });
          widget.onChanged(value);
        },
        title: Text(widget.title),
        subtitle: widget.subtitle != null ? Text(widget.subtitle!) : null,
        value: value,
      ),
    );
  }
}

class DialogTile extends StatelessWidget {
  const DialogTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.onTap,
  });

  final String title;
  final String? subtitle;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      padding: EdgeInsets.zero,
      child: ListTile(
        title: Text(title),
        subtitle: subtitle != null ? Text(subtitle!) : null,
        onTap: onTap,
      ),
    );
  }
}

Future<T?> infoDialogCustom<T>(
  BuildContext context, {
  Icon? icon,
  required String title,
  bool? barrierDismissible,
  String? subTitle,
  Widget? content,
  bool? scrollable,
  required List<TextButton> listActions,
}) async {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible ?? true,
    builder: (BuildContext context) {
      return WrapperPage(
        child: AlertDialog(
          shape: getDialogShape(context),
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
          scrollable: scrollable ?? false,
        ),
      );
    },
  );
}

Future<T?> showAboutAppDialog<T>(
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
      return Theme(
        data: Theme.of(context).copyWith(
          dialogTheme: DialogTheme(
            shape: getDialogShape(context),
          ),
        ),
        child: WrapperPage(
          child: AboutDialog(
            applicationName: applicationName,
            applicationVersion: applicationVersion,
            applicationIcon: applicationIcon,
            applicationLegalese: applicationLegalese,
            children: more,
          ),
        ),
      );
    },
  );
}

Future<T?> showChoosingDialog<T>(
  BuildContext context, {
  Icon? icon,
  required String title,
  String? subTitle,
  required List<DialogOption<T>> listDialogOption,
}) async {
  return showDialog<T>(
    context: context,
    builder: (BuildContext context) {
      return WrapperPage(
        child: SimpleDialog(
          shape: getDialogShape(context),
          title: Column(
            children: [
              if (icon != null) icon,
              Text(title, textAlign: TextAlign.center),
            ],
          ),
          children: [
            if (subTitle != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 24.0,
                ),
                child: Text(subTitle),
              ),
            ...listDialogOption.map((DialogOption option) {
              return Column(
                children: [
                  const Divider(height: 0.0),
                  option,
                ],
              );
            }),
          ],
        ),
      );
    },
  );
}

Future<void> showSwitchedDialog(
  BuildContext context, {
  Icon? icon,
  required String title,
  String? subTitle,
  required List<Widget> listDialogOption,
}) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return WrapperPage(
        child: SimpleDialog(
          shape: getDialogShape(context),
          title: Column(
            children: [
              if (icon != null) icon,
              Text(title, textAlign: TextAlign.center),
            ],
          ),
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
              child: subTitle != null ? Text(subTitle) : null,
            ),
            ...listDialogOption.map((Widget option) {
              return Column(
                children: [
                  const Divider(height: 0.0),
                  option,
                ],
              );
            }),
          ],
        ),
      );
    },
  );
}
