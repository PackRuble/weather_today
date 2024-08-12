import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/application/const/app_utils.dart';
import 'package:weather_today/application/navigation/routes.gr.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/models/toasts_model.dart';
import 'package:weather_today/ui/shared/listen_message_widget.dart';
import 'package:weather_today/utils/log'
    'ger/all_observers.dart';

import 'global_key.dart';

/// Здесь находится центр вызова снэков.
class SnackController extends ChangeNotifier {
  SnackController();

  MessageSnack? snack;

  void showSnack(MessageSnack snack) {
    final result =
        snack.copyWith(message: AppUtils.clearSecrets(snack.message));
    this.snack = result;
    notifyListeners();

    logInfo(result);
  }
}

/// Центр по управлению всплывающими тостами!
class ToastController extends ChangeNotifier {
  MessageToast? toast;

  void showToast(MessageToast toast) {
    final result =
        toast.copyWith(message: AppUtils.clearSecrets(toast.message));
    this.toast = result;
    notifyListeners();

    logInfo(result);
  }
}

/// Реализует возможность показывать сообщения (Snackbar or Toast).
class MessageController {
  MessageController(this._ref);

  final Ref _ref;

  static final instance = Provider.autoDispose(
    MessageController.new,
    name: '$MessageController/instance',
  );

  /// Пассивное уведомление. Не интерактивный.
  static final toasts = ChangeNotifierProvider<ToastController>(
    (ref) => ToastController(),
    name: '$MessageController/toasts->$ToastController',
  );

  /// Активное уведомление. Интерактивный, позволяет выбрать действия.
  static final snacks = ChangeNotifierProvider<SnackController>(
    (ref) => SnackController(),
    name: '$MessageController/snacks->$SnackController',
  );

  /// показать Toast.
  void _showToast(MessageToast toast) => _ref.read(toasts).showToast(toast);

  /// показать Snack.
  void _showSnack(MessageSnack snack) => _ref.read(snacks).showSnack(snack);

  /// Любая ошибка.
  void showErrorSnack(String message) => _showSnack(
        MessageSnack(
          message: message,
          action: MapEntry(
            tr.dialogs.buttons.know,
            () async => showDialog(
              useSafeArea: true,
              context: materialKeyProvider.currentContext!,
              builder: (_) => ErrorInfoDialog(AppUtils.clearSecrets(message)),
            ),
          ),
        ),
      );

  /// Любое сообщение.
  void showSnack(String message) => _showSnack(
        MessageSnack(
          message: message,
        ),
      );

  /// Ошибка сети.
  void tSocketException() => _showToast(_StoreMessages.toastSocketException);

  /// Время соединения истекло.
  void tTimeoutException() => _showToast(_StoreMessages.toastTimeoutException);

  /// Успешная установка ApiKey-погоды.
  void tApiKeyWeatherSetTrue() =>
      _showToast(_StoreMessages.toastApiKeyWeatherSetTrue);

  /// Установка ApiKey-погоды не удалась.
  void tApiKeyWeatherSetFalse() =>
      _showToast(_StoreMessages.toastApiKeyWeatherSetFalse);

  /// Обновить погоду сейчас не разрешено.
  void sUpdateWeatherNotAllowed() =>
      _showSnack(_StoreMessages.snackUpdateWeatherFail);

  /// Апи ключ для сервиса OWM действителен.
  void tCheckApikeyOWMSuccess() =>
      _showToast(_StoreMessages.toastApikeyOWMSuccess);

  /// Апи ключ для сервиса OWM НЕдействителен.
  void tCheckApikeyOWMFail() => _showToast(_StoreMessages.toastApikeyOWMFail);
}

class _StoreMessages {
  const _StoreMessages._();

  /// Уведомление об отсутствии интернета.
  ///
  /// Возникает если:
  /// - Нет соединения с сервером погоды;
  /// - Нет соединения с интернетом.
  static MessageToast get toastSocketException => MessageToast(
        message: tr.dialogs.messages.socketException,
        toastTime: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
      );

  /// Уведомление о невозможности установить соединение с сервером.
  ///
  /// Возникает если:
  /// - Нет удается установить соединение с сервером погоды;
  static MessageToast get toastTimeoutException => MessageToast(
        message: '🕐🕜🕑👈',
        toastTime: Toast.LENGTH_LONG,
        gravity: ToastGravity.TOP,
      );

  /// Уведомление об успехе установки apiKey weather.
  ///
  static MessageToast get toastApiKeyWeatherSetTrue => MessageToast(
        message: tr.dialogs.messages.apiKeyWeatherSetTrue,
        toastTime: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );

  /// Уведомление об провале установки apiKey weather.
  ///
  static MessageToast get toastApiKeyWeatherSetFalse => MessageToast(
        message: tr.dialogs.messages.apiKeyWeatherSetFalse,
        toastTime: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );

  /// Уведомление об успешной проверке api ключа погоды.
  ///
  static MessageToast get toastApikeyOWMSuccess => MessageToast(
        message: tr.dialogs.messages.apiKeyOWMVerificationSuccess,
        toastTime: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );

  /// Уведомление об провальной проверке api ключа погоды.
  ///
  static MessageToast get toastApikeyOWMFail => MessageToast(
        message: tr.dialogs.messages.apiKeyOWMVerificationFail,
        toastTime: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );

  /// Уведомление о неудачном обновлении погоды.
  ///
  static MessageSnack get snackUpdateWeatherFail => MessageSnack(
        message: tr.dialogs.messages.weatherUpdateFail,
        action: MapEntry(
          tr.dialogs.buttons.know,
          () async => AutoRouter.of(materialKeyProvider.currentContext!).push(
            const UserApiRoute(),
          ),
        ),
      );
}
