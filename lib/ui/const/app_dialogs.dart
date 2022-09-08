import 'package:flutter/material.dart';
import 'package:weather_today/const/app_info.dart';
import 'package:weather_today/const/countries_code.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';
import 'package:weather_today/ui/shared/dialogs_widget.dart';

import '../utils/image_helper.dart';

/// Класс представляет список диалогов приложения.
class AppDialogs {
  AppDialogs._();

  /// Вызов диалога, подтверждающего удаление [Place] из базы данных.
  ///
  /// --> true: удалить
  /// --> false: отменить удаление
  static Future<bool> confirmDeletionPlace(
    BuildContext context,
  ) async =>
      await infoDialogCustom<bool>(
        context,
        icon: const Icon(Icons.delete),
        title: tr.dialogs.confirmDelPlace.title,
        subTitle: tr.dialogs.confirmDelPlace.subtitle,
        content: Text(tr.dialogs.confirmDelPlace.content),
        listActions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(tr.dialogs.buttons.cancel)),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(tr.dialogs.buttons.ok)),
        ],
      ) ??
      false;

  /// Информационный диалог, показывающий флаг в крупном виде и полное название страны.
  static Future<void> seeFlag(
    BuildContext context,
    String countryCode,
    Widget image,
  ) async {
    final String? countryName = countriesCode[countryCode.toUpperCase()];

    await infoDialogCustom<void>(
      context,
      icon: const Icon(Icons.flag_rounded),
      title: tr.dialogs.seeFlag.title,
      subTitle: tr.dialogs.seeFlag.subtitle,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          image,
          if (countryName != null) ...[
            const SizedBox(height: 8.0),
            Center(child: Text(countryName, textAlign: TextAlign.center)),
          ]
        ],
      ),
      listActions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(tr.dialogs.buttons.ok),
        ),
      ],
    );
  }

  /// Диалог, предлагающий создать заметку о местоположении.
  static Future<String?> makeNote(BuildContext context, String? oldNote) async {
    final controller = TextEditingController();

    if (oldNote != null) {
      controller.text = oldNote;
    }

    final focusNode = FocusNode();

    final String? response = await infoDialogCustom<String>(
      context,
      icon: const Icon(Icons.note),
      title: tr.dialogs.makeNote.title,
      subTitle: tr.dialogs.makeNote.subtitle,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: TextField(
              maxLines: null,
              autofocus: true,
              focusNode: focusNode..requestFocus(),
              keyboardType: TextInputType.multiline,
              controller: controller,
              onSubmitted: (String value) => Navigator.pop(context, value),
            ),
          ),
        ],
      ),
      listActions: [
        TextButton(
            onPressed: () => Navigator.pop(context, oldNote),
            child: Text(tr.dialogs.buttons.cancel)),
        TextButton(
            onPressed: () => Navigator.pop(context, controller.value.text),
            child: Text(tr.dialogs.buttons.ok)),
      ],
    );

    controller.dispose();
    focusNode.dispose();

    return response;
  }

  /// Предупреждающий диалог, удаление userApiKeyWeather.
  ///
  /// --> true: удалить
  /// --> false: отменить удаление
  static Future<bool> confirmDeletionUserApiKeyWeather(
          BuildContext context) async =>
      await infoDialogCustom<bool>(
        context,
        icon: const Icon(Icons.delete),
        title: tr.dialogs.confirmDelUserApikey.title,
        subTitle: tr.dialogs.confirmDelUserApikey.subtitle,
        listActions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(tr.dialogs.buttons.cancel)),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(tr.dialogs.buttons.ok)),
        ],
      ) ??
      false;

  /// Информационный диалог, показывающий информацию об этом приложении.
  static Future<void> aboutApp(
    BuildContext context,
  ) async =>
      showAboutThingsDialog<void>(
        context,
        applicationName: AppInfo.appName,
        // applicationIcon: const Icon(Icons.self_improvement_rounded),
        applicationIcon: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: ColoredBox(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            child: Image.asset(
              ImagePaths.iconAbout,
              fit: BoxFit.cover,
              width: 70,
              height: 70,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        applicationLegalese: AppInfo.copyright,
        applicationVersion: 'v${AppInfo.version}',
        more: [
          const Text(''),
          const Text('❤ Flutter - ${AppInfo.flutterVersion}'),
        ],
      );

  /// Предупреждающий диалог о сохранении изменений.
  ///
  /// --> true: сохранить изменения
  /// --> false: не сохранять
  /// --> null: без действия
  static Future<bool> confirmSaveChanges(
    BuildContext context,
  ) async =>
      await infoDialogCustom<bool>(
        context,
        icon: const Icon(Icons.done),
        title: tr.dialogs.confirmSaveChanges.title,
        subTitle: tr.dialogs.confirmSaveChanges.subtitle,
        listActions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(tr.dialogs.buttons.cancel)),
          TextButton(
              onPressed: () => Navigator.pop(context, true),
              child: Text(tr.dialogs.buttons.save)),
        ],
      ) ??
      false;

  /// Информационный диалог об возможностях поиска мест.
  static Future<void> placeSearchInfo(
    BuildContext context,
  ) async {
    final TextTheme styles = Theme.of(context).textTheme;

    await infoDialogCustom<void>(
      context,
      title: tr.dialogs.placeSearchInfo.title,
      subTitle: tr.dialogs.placeSearchInfo.subtitle,
      content: Text.rich(
        TextSpan(
          style: styles.bodyMedium,
          children: [
            TextSpan(text: tr.dialogs.placeSearchInfo.way1),
            WidgetSpan(
              child: Center(
                child: Text(
                  tr.dialogs.placeSearchInfo.city,
                  style: styles.labelLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            TextSpan(text: tr.dialogs.placeSearchInfo.way2),
            WidgetSpan(
              child: Center(
                child: Text(
                  tr.dialogs.placeSearchInfo.coord,
                  style: styles.labelLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
      listActions: [
        TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(tr.dialogs.buttons.okay)),
      ],
    );
  }
}
