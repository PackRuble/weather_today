import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';
import 'package:weather_today/core/controllers/message_controller.dart';
import 'package:weather_today/core/services/api/api_OWM.dart';
import 'package:weather_today/i18n/translations.g.dart';
import 'package:weather_today/ui/const/app_dialogs.dart';

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

  /// Провайдер возвращает translate.
  static final tr = Provider.autoDispose<TranslationsRu>(
      (ref) => ref.watch(AppLocalization.currentTranslation));

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

  /// Проверить, корректный ли апи установлен.
  Future<void> checkApi() async {
    _reader(isTestingApiKey.notifier).update((_) => true);

    if (await _reader(ApiServiceOwm.pr).isCorrectInstalledApiKey()) {
      _reader(MessageController.pr).tCheckApikeyOWMSuccess();
    } else {
      _reader(MessageController.pr).tCheckApikeyOWMFail();
    }

    _reader(isTestingApiKey.notifier).update((_) => false);
  }

  /// Удалить пользовательский apiKey-погоды.
  Future<void> deleteUserApi(BuildContext context) async {
    final bool isDelete =
        await AppDialogs.confirmDeletionUserApiKeyWeather(context);

    if (isDelete) {
      await _reader(ApiServiceOwm.pr).resetUserApiKey();
    }
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
