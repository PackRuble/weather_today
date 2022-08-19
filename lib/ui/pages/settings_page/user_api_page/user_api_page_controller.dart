import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/core/controllers/message_controller.dart';
import 'package:weather_today/core/services/api/api_OWM.dart';
import 'package:weather_today/ui/const/dialogs.dart';

/// Контроллер страницы [UserApiPage].
class UserApiPageController {
  UserApiPageController(this._reader);

  final Reader _reader;

  /// экземпляр.
  static final pr = Provider.autoDispose<UserApiPageController>(
      (ref) => UserApiPageController(ref.read),
      name: '$UserApiPageController');

  /// Происходит ли в данный момент установка ключа apikeyWeather.
  static final isTestingApiKey =
      StateProvider.autoDispose<bool>((ref) => false);

  /// Установлен пользовательский api?
  static final isUserApiKeyWeather = StateProvider.autoDispose<bool>(
      (ref) => ref.watch(ApiServiceOwm.isUserApiKey));

  /// Установить пользовательский api.
  Future<void> setUserApi() async {
    _reader(isTestingApiKey.notifier).update((_) => true);

    final bool isCorrectApi = await _reader(ApiServiceOwm.pr)
        .setUserApiKey(apiTextController.value.text);

    if (isCorrectApi) {
      _reader(MessageController.pr).tApiKeyWeatherSetTrue();
    } else {
      _reader(MessageController.pr).tApiKeyWeatherSetFalse();
    }

    _reader(isTestingApiKey.notifier).update((_) => false);
  }

  /// Удалить пользовательский apiKey-погоды.
  Future<void> deleteUserApi(BuildContext context) async {
    final bool isDelete = await showDialogDeleteUserApiKeyWeather(context);

    if (!isDelete) {
      return;
    }

    await _reader(ApiServiceOwm.pr).resetUserApiKey();
  }

  final listViewController = ScrollController();

  final apiTextController = TextEditingController();

  final apiTextFocusNode = FocusNode();

  /// Установить текст из буфера обмена.
  void setTextFromClipboard(String? text) {
    if (text != null) {
      apiTextController
        ..text = text
        ..selection = TextSelection.collapsed(offset: text.length);
    }
  }
}
