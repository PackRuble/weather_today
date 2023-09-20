// ignore_for_file: file_names

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/domain/controllers/utils/state_updater.dart';
import 'package:weather_today/domain/services/local_storage/data_base_controller.dart';
import 'package:weather_today/domain/services/local_storage/interface/data_base.dart';
import 'package:weather_today/domain/services/local_storage/key_store.dart';

import '../../utils/logger/all_observers.dart';

// Api-key. See more https://home.openweathermap.org/api_keys.
const String _apiWeather = String.fromEnvironment('API_WEATHER');

/// Implementation of the Api service "openweathermap.org == OWM".
///
/// Для инициализации класса должен быть запущен [init].
class OWMController with Updater {
  const OWMController(this.ref);

  @override
  final Ref ref;

  @override
  DataBase get db => ref.read(dbService);

  /// экземпляр класса для доступа к методам данного класса.
  static final instance = Provider.autoDispose(
    OWMController.new,
    name: '$OWMController',
  );

  /// Apikey сервиса OWM.
  static final apiKey = StateProvider<String>((ref) => _apiWeather);

  /// Установлен пользовательский apiKey?
  static final isUserApiKey = Provider<bool>(
    (ref) => ref.watch(apiKey) != _apiWeather,
    name: '$OWMController/isUserApiKey',
  );

  /// Запустить перед созданием класса с ожиданием завершения.
  Future<void> init() async {
    final String apikeyOfDb =
        await loadDb(DbStore.userApiKeyOWM, DbStore.userApiKeyOWMDefault);
    if (apikeyOfDb != '') update(apiKey, apikeyOfDb);
  }

  /// Проверить корректность ключа установленного ключа.
  Future<bool> isCorrectInstalledApiKey() async =>
      _isCorrectApiKey(ref.read(apiKey));

  /// Проверить корректность ключа для запросов.
  Future<bool> isCorrectApiKey(String apiString) async =>
      _isCorrectApiKey(apiString);

  Future<bool> _isCorrectApiKey(String apiString) async {
    try {
      return OWMApiTest()
          .isCorrectApiKey(apiString)
          .timeout(const Duration(seconds: 10));
    } catch (e, s) {
      logError(e, s);
      return false;
    }
  }

  /// Сбросить значение ключа к дефолтным.
  Future<void> resetUserApiKey() async {
    await saveDb(DbStore.userApiKeyOWM, DbStore.userApiKeyOWMDefault);
    ref.invalidate(apiKey);
  }

  /// Установить пользовательский ключ
  Future<bool> setUserApiKey(String newApiKey) async {
    if (!(await isCorrectApiKey(newApiKey))) return false;

    await saveAndUpdate(apiKey, DbStore.userApiKeyOWM, newApiKey);
    return true;
  }
}
