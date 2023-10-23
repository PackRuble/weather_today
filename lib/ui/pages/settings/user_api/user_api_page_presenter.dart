import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/message_controller.dart';
import 'package:weather_today/domain/controllers/owm_controller.dart';
import 'package:weather_today/ui/dialogs/app_dialogs.dart';

/// [UserApiPage] page presenter.
class UserApiPagePresenter {
  const UserApiPagePresenter(this._ref);

  final Ref _ref;

  /// Instance of current class.
  static final instance = Provider.autoDispose(
    UserApiPagePresenter.new,
    name: '$UserApiPagePresenter',
  );

  /// Is the apikeyWeather key currently being installed.
  static final isTestingApiKey =
      StateProvider.autoDispose<bool>((ref) => false);

  /// Do you have a custom api installed?
  static Provider<bool> get isUserApiKeyWeather => OWMController.isUserApiKey;

  /// Provider returns translation.
  static StateProvider<TranslationsRu> get tr =>
      AppLocalization.currentTranslation;

  /// Install custom api.
  Future<void> setUserApi(String text) async {
    _ref.read(isTestingApiKey.notifier).update((_) => true);

    // todo: сделать нормальную валидацию при пустом поле
    final bool isCorrectApi = text.isNotEmpty &&
        await _ref.read(OWMController.instance).setUserApiKey(text);

    final messageController = _ref.read(MessageController.instance);
    if (isCorrectApi) {
      messageController.tApiKeyWeatherSetTrue();
    } else {
      messageController.tApiKeyWeatherSetFalse();
    }

    _ref.read(isTestingApiKey.notifier).update((_) => false);
  }

  /// Check if the correct API is installed now.
  Future<void> checkApi() async {
    _ref.read(isTestingApiKey.notifier).update((_) => true);

    final messageController = _ref.read(MessageController.instance);
    if (await _ref.read(OWMController.instance).isCorrectInstalledApiKey()) {
      messageController.tCheckApikeyOWMSuccess();
    } else {
      messageController.tCheckApikeyOWMFail();
    }

    _ref.read(isTestingApiKey.notifier).update((_) => false);
  }

  /// Remove custom weather apiKey.
  Future<void> deleteUserApi(BuildContext context) async {
    final bool isDelete =
        await AppDialogs.confirmDeletionUserApiKeyWeather(context);

    if (isDelete) {
      await _ref.read(OWMController.instance).resetUserApiKey();
    }
  }
}
