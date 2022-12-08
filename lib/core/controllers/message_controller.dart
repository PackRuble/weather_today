import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';
import 'package:weather_today/core/models/toasts_model.dart';
import 'package:weather_today/utils/logger/all_observers.dart';
import 'package:weather_today/utils/routes/routes.gr.dart';

import 'global_key.dart';

/// Здесь находится центр вызова снэков.
class SnackController extends ChangeNotifier {
  SnackController();

  MessageSnack? snack;

  void showSnack(MessageSnack snack) {
    this.snack = snack;
    notifyListeners();

    logInfo(snack);
  }
}

/// Центр по управлению высплывающими тостами!
class ToastController extends ChangeNotifier {
  MessageToast? toast;

  void showToast(MessageToast toast) {
    this.toast = toast;
    notifyListeners();

    logInfo(toast);
  }
}

/// Реализует возможность показывать сообщения (Snackbar or Toast).
class MessageController {
  MessageController(this._ref);

  final Ref _ref;

  static final instance = Provider(
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
  void sUpdateWeatherFail() =>
      _showSnack(_StoreMessages.snackUpdateWeatherFail);

  /// Апи ключ для сервиса OWM действителен.
  void tCheckApikeyOWMSuccess() =>
      _showToast(_StoreMessages.toastApikeyOWMSuccess);

  /// Апи ключ для сервиса OWM НЕдействителен.
  void tCheckApikeyOWMFail() => _showToast(_StoreMessages.toastApikeyOWMFail);
}

class _StoreMessages {
  /// Уведомление об отсутствии интернета.
  ///
  /// Возникает если:
  /// - Нет соединения с сервером погоды;
  /// - Нет соединения с интернетом.
  static final MessageToast toastSocketException = MessageToast(
    message: tr.dialogs.messages.socketException,
    toastTime: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
  );

  /// Уведомление о невозможности установить соединение с сервером.
  ///
  /// Возникает если:
  /// - Нет удается установить соединение с сервером погоды;
  static final MessageToast toastTimeoutException = MessageToast(
    message: '🕐🕜🕑👈',
    toastTime: Toast.LENGTH_LONG,
    gravity: ToastGravity.TOP,
  );

  /// Уведомление об успехе установки apiKey weather.
  ///
  static final MessageToast toastApiKeyWeatherSetTrue = MessageToast(
    message: tr.dialogs.messages.apiKeyWeatherSetTrue,
    toastTime: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );

  /// Уведомление об провале установки apiKey weather.
  ///
  static final MessageToast toastApiKeyWeatherSetFalse = MessageToast(
    message: tr.dialogs.messages.apiKeyWeatherSetFalse,
    toastTime: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );

  /// Уведомление об успешной проверке api ключа погоды.
  ///
  static MessageToast toastApikeyOWMSuccess = MessageToast(
    message: tr.dialogs.messages.apiKeyOWMVerificationSuccess,
    toastTime: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );

  /// Уведомление об провальной проверке api ключа погоды.
  ///
  static final MessageToast toastApikeyOWMFail = MessageToast(
    message: tr.dialogs.messages.apiKeyOWMVerificationFail,
    toastTime: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );

  /// Уведомление о неудачном обновлении погоды.
  ///
  static MessageSnack snackUpdateWeatherFail = MessageSnack(
    message: tr.dialogs.messages.weatherUpdateFail,
    action: MapEntry(tr.dialogs.buttons.know, () {
      return AutoRouter.of(materialKeyProvider.currentContext!)
          .push(const UserApiRoute());
    }),
  );
}
