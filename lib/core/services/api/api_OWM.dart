import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/const/key_store.dart';
import 'package:weather_today/core/services/local_db_service/data_base_controller.dart';
import 'package:weather_today/core/services/local_db_service/interface/i_data_base.dart';
import 'package:weather_today/utils/state_updater.dart';

// Api-key. See more https://home.openweathermap.org/api_keys.
final String _apiWeather = dotenv.env['API_WEATHER'] ?? 'Api-key not found';

/// Implementation of the Api service "openweathermap.org == OWM".
///
/// Для инициализации класса должен быть запущен [init].
class ApiServiceOwm with Updater {
  ApiServiceOwm(this.ref);

  @override
  final Ref ref;

  @override
  IDataBase get db => ref.read(dbService);

  /// экземпляр класса для доступа к методам данного класса.
  static final instance = Provider(ApiServiceOwm.new, name: '$ApiServiceOwm');

  /// Apikey сервиса OWM.
  static final apiKey = StateProvider<String>((ref) => _apiWeather);

  /// Установлен пользовательский apiKey?
  static final isUserApiKey =
      Provider<bool>((ref) => ref.watch(apiKey) != _apiWeather);

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
    ref.refresh(apiKey);
  }

  /// Установить пользовательский ключ
  Future<bool> setUserApiKey(String newApiKey) async {
    if (!(await isCorrectApiKey(newApiKey))) return false;

    await saveAndUpdate(apiKey, DbStore.userApiKeyOWM, newApiKey);
    return true;
  }
}
