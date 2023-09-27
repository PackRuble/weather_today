import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/message_controller.dart';
import 'package:weather_today/domain/controllers/owm_controller.dart';
import 'package:weather_today/ui/const/app_dialogs.dart';

/// Контроллер страницы [UserApiPage].
class UserApiPageController {
  UserApiPageController(this._ref);

  final Ref _ref;

  /// экземпляр.
  static final instance = Provider.autoDispose(
    UserApiPageController.new,
    name: '$UserApiPageController',
  );

  /// Происходит ли в данный момент установка ключа apikeyWeather.
  static final isTestingApiKey =
      StateProvider.autoDispose<bool>((ref) => false);

  /// Установлен пользовательский api?
  static final isUserApiKeyWeather = StateProvider.autoDispose<bool>(
      (ref) => ref.watch(OWMController.isUserApiKey));

  /// Провайдер возвращает translate.
  static final tr = Provider.autoDispose<TranslationsRu>(
      (ref) => ref.watch(AppLocalization.currentTranslation));

  /// Установить пользовательский api.
  Future<void> setUserApi(String text) async {
    _ref.read(isTestingApiKey.notifier).update((_) => true);

    // todo: сделать нормальную валидацию при пустом поле
    final bool isCorrectApi = text.isNotEmpty &&
        await _ref.read(OWMController.instance).setUserApiKey(text);

    if (isCorrectApi) {
      _ref.read(MessageController.instance).tApiKeyWeatherSetTrue();
    } else {
      _ref.read(MessageController.instance).tApiKeyWeatherSetFalse();
    }

    _ref.read(isTestingApiKey.notifier).update((_) => false);
  }

  /// Проверить, корректный ли апи установлен сейчас.
  Future<void> checkApi() async {
    _ref.read(isTestingApiKey.notifier).update((_) => true);

    if (await _ref.read(OWMController.instance).isCorrectInstalledApiKey()) {
      _ref.read(MessageController.instance).tCheckApikeyOWMSuccess();
    } else {
      _ref.read(MessageController.instance).tCheckApikeyOWMFail();
    }

    _ref.read(isTestingApiKey.notifier).update((_) => false);
  }

  /// Удалить пользовательский apiKey-погоды.
  Future<void> deleteUserApi(BuildContext context) async {
    final bool isDelete =
        await AppDialogs.confirmDeletionUserApiKeyWeather(context);

    if (isDelete) {
      await _ref.read(OWMController.instance).resetUserApiKey();
    }
  }
}
