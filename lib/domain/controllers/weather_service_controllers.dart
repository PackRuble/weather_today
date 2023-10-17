import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/domain/controllers/owm_controller.dart';
import 'package:weather_today/domain/models/place/place_model.dart';
import 'package:weather_today/domain/services/cardoteka/weather_storage.dart';
import 'package:weather_today/domain/services/local_storage/data_base_controller.dart';
import 'package:weather_today/domain/services/local_storage/interface/data_base.dart';
import 'package:weather_today/domain/services/local_storage/key_store.dart';

import '../../application/const/first_run_saved_places.dart';
import 'utils/state_updater.dart';

/// Общее состояние сервиса получения погоды для приложения.
///
/// Содержит состояния:
/// - [currentPlace]
/// - [speedUnits]
/// - [pressureUnits]
/// - [tempUnits]
/// - [currentLanguage]
class WeatherServices with Updater {
  WeatherServices(this.ref);

  @override
  final Ref ref;

  @override
  DataBase get db => ref.read(dbService);

  /// Инициализация. Переопределяем значения провайдеров на значения из бд.
  Future<void> init() async {
    await loadAndUpdate(currentPlace, DbStore.currentPlace,
        DbStore.currentPlaceDefault, _conversionCurrentPlace);
    await loadAndUpdate(speedUnits, DbStore.speedUnits,
        DbStore.speedUnitsDefault, _conversionSpeedUnits);
    await loadAndUpdate(pressureUnits, DbStore.pressureUnits,
        DbStore.pressureUnitsDefault, _conversionPressureUnits);
    await loadAndUpdate(tempUnits, DbStore.temperatureUnits,
        DbStore.temperatureUnitsDefault, _conversionTempUnits);
    await loadAndUpdate(currentLanguage, DbStore.userWeatherLanguage,
        DbStore.userWeatherLanguageDefault, _conversionCurrentLanguage);
  }

  /// Instance of current class.
  static final instance = Provider<WeatherServices>(
    WeatherServices.new,
    name: '$WeatherServices/instance',
  );

  // ignore: unused_element
  WeatherStorage get _weatherStorage => ref.read(WeatherStorage.instance);

  // Current location at which weather data is received
  //============================================================================

  /// Current location.
  static final currentPlace = StateProvider<Place>(
    (ref) {
      ref.listenSelf(
        (previous, next) {
          _autoUpdatePreviousPlace(
            previous,
            next,
            ref.read(WeatherStorage.instance),
          );
        },
      );
      return Place.fromJson({});
    },
    name: '$WeatherServices/currentPlace',
  );

  static Future<void> _autoUpdatePreviousPlace(
    Place? previous,
    Place next,
    WeatherStorage storage,
  ) async {
    if (previous == null) return;

    await storage.set<Place>(WeatherCards.previousPlace, previous);

    if (!next.isSamePlace(previous)) {
      await storage.set<bool>(
        WeatherCards.isAllowONECALLUpdateDueToDiffPrevAndCurrentPlaces,
        true,
      );
      await storage.set<bool>(
        WeatherCards.isAllowCURRENTUpdateDueToDiffPrevAndCurrentPlaces,
        true,
      );
    }
  }

  static Place _conversionCurrentPlace(String raw) {
    return raw != ''
        ? Place.fromJson(json.decode(raw) as Map<String, dynamic>)
        : initialPlace;
  }

  /// Установить новое местоположение для определения по нему погоды.
  Future<void> setCurrentPlace(Place place) async {
    update<Place>(currentPlace, place);
    await saveDb(DbStore.currentPlace, jsonEncode(place.toJson()));
  }

  // Единицы измерения скорости.
  //============================================================================

  /// Провайдер предоставляет единицы измерения скорости.
  static final speedUnits = StateProvider<Speed>(
    (ref) => _conversionSpeedUnits(DbStore.speedUnitsDefault),
    name: '$WeatherServices/speedUnits',
  );

  static Speed _conversionSpeedUnits(int value) => Speed.values[value];

  /// Установить единицы измерения скорости.
  Future<void> setSpeedUnits(Speed newValue) async {
    update<Speed>(speedUnits, newValue);
    await saveDb(DbStore.speedUnits, newValue.index);
  }

  // Единицы измерения давления.
  //============================================================================

  /// Провайдер предоставляет единицы измерения давления.
  static final pressureUnits = StateProvider<Pressure>(
    (ref) => _conversionPressureUnits(DbStore.pressureUnitsDefault),
    name: '$WeatherServices/pressureUnits',
  );

  static Pressure _conversionPressureUnits(int value) => Pressure.values[value];

  /// Установить единицы измерения давления.
  Future<void> setPressureUnits(Pressure newValue) async {
    update<Pressure>(pressureUnits, newValue);
    await saveDb(DbStore.pressureUnits, newValue.index);
  }

  // Единицы измерения температуры.
  //============================================================================

  /// Провайдер предоставляет единицы измерения температуры.
  static final tempUnits = StateProvider<Temp>(
    (ref) => _conversionTempUnits(DbStore.temperatureUnitsDefault),
    name: '$WeatherServices/tempUnits',
  );

  static Temp _conversionTempUnits(int value) => Temp.values[value];

  /// Установить единицы измерения температуры.
  Future<void> setTempUnits(Temp newValue) async {
    update<Temp>(tempUnits, newValue);
    await saveDb(DbStore.temperatureUnits, newValue.index);
  }

  // Язык погодных условий.
  //============================================================================

  /// Провайдер предоставляет язык погодных условий.
  static final currentLanguage = StateProvider<WeatherLanguage>(
    (ref) => _conversionCurrentLanguage(DbStore.userWeatherLanguageDefault),
    name: '$WeatherServices/currentLanguage',
  );

  static WeatherLanguage _conversionCurrentLanguage(String code) =>
      codeAndLangMatching[code] ??
      codeAndLangMatching[DbStore.userWeatherLanguageDefault]!;

  /// Установить язык погодных условий.
  Future<void> setCurrentLanguage(WeatherLanguage newValue) async {
    await saveDb(DbStore.userWeatherLanguage, newValue.name);
    update(currentLanguage, newValue);
  }

  /// Доступ к экземпляру сервиса погоды.
  static final weatherService = Provider<WeatherService>((ref) {
    // отслеживаем и устанавливаем apikey weather
    final String apiKey = ref.watch(OWMController.apiKey);

    // отслеживаем и устанавливаем язык запросов для погодных условий.
    final WeatherLanguage currentLanguage =
        ref.watch(WeatherServices.currentLanguage);

    return WeatherService(apiKey, language: currentLanguage);
  });
}
