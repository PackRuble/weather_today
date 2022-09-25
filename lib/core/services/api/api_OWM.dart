import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_weather_api/open_weather_api.dart';
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
  ApiServiceOwm(this._ref) : reader = _ref.read;

  final Ref _ref;

  @override
  final Reader reader;

  @override
  IDataBase get db => reader(dbService);

  /// Доступ к методам данного класса.
  static final pr = Provider<ApiServiceOwm>((ref) => ApiServiceOwm(ref));

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
      WeatherDomain.isCorrectApi(reader(apiKey));

  /// Проверить корректность ключа для запросов.
  Future<bool> isCorrectApiKey(String apiString) async =>
      WeatherDomain.isCorrectApi(apiString);

  /// Сбросить значение ключа к дефолтным.
  Future<void> resetUserApiKey() async {
    await saveDb(DbStore.userApiKeyOWM, DbStore.userApiKeyOWMDefault);
    _ref.refresh(apiKey);
  }

  /// Установить пользовательский ключ
  Future<bool> setUserApiKey(String newApiKey) async {
    // тодо добавить обработку ошибок
    if (!(await isCorrectApiKey(newApiKey))) return false;

    await saveAndUpdate(apiKey, DbStore.userApiKeyOWM, newApiKey);
    return true;
  }
}
