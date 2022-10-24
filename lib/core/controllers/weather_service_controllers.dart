import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/const/key_store.dart';
import 'package:weather_today/core/models/place/place_model.dart';
import 'package:weather_today/core/services/api/api_OWM.dart';
import 'package:weather_today/core/services/local_db_service/data_base_controller.dart';
import 'package:weather_today/core/services/local_db_service/interface/i_data_base.dart';

import '../../const/first_run_saved_places.dart';
import '../../utils/state_updater.dart';

/// Общее состояние сервиса получения погоды для приложения.
class WeatherServices with Updater {
  WeatherServices(this.ref);

  @override
  final Ref ref;

  @override
  IDataBase get db => ref.read(dbService);

  /// инициализировать. Переопределяем значения провайдеров на значения из дб.
  Future<void> init() async {
    await loadAndUpdate(currentPlace, DbStore.currentPlace,
        DbStore.currentPlaceDefault, _conversionCurrentPlace);
    // await loadAndUpdate(savedPlacesDb, Store.savedPlaces,
    //     Store.savedPlacesDefault, _conversionSavedPlacesDb);
    await loadAndUpdate(speedUnits, DbStore.speedUnits,
        DbStore.speedUnitsDefault, _conversionSpeedUnits);
    await loadAndUpdate(pressureUnits, DbStore.pressureUnits,
        DbStore.pressureUnitsDefault, _conversionPressureUnits);
    await loadAndUpdate(tempUnits, DbStore.temperatureUnits,
        DbStore.temperatureUnitsDefault, _conversionTempUnits);
    await loadAndUpdate(currentLanguage, DbStore.userWeatherLanguage,
        DbStore.userWeatherLanguageDefault, _conversionCurrentLanguage);
  }

  /// экземпляр.
  static final instance =
      Provider<WeatherServices>(WeatherServices.new, name: '$WeatherServices');

  // Текущее место по которому приходят данные о погоде
  //============================================================================

  /// Текущее место.
  static final currentPlace = StateProvider<Place>((ref) => Place.fromJson({}));

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

  // Обработка сохраненных местоположений
  //============================================================================
  //тодо. подумать как правильно инициализировать один ед раз с начальным местом
  /// Список сохраненных местоположений.
  /*static final savedPlacesDb = StateProvider<List<Place>>((ref) => []);

  static List<Place> _conversionSavedPlacesDb(List<String> listJsonStr) =>
      listJsonStr != []
          ? listJsonStr.map((String strJson) {
              return Place.fromJson(
                  json.decode(strJson) as Map<String, dynamic>);
            }).toList()
          : _initialSavedPlaces;

  /// Установить новый список избранных мест.
  ///
  /// Будет установлено и сохранено в бд.
  Future<void> setSavedPlacesDb(List<Place> list) async => saveAndUpdate(
      savedPlacesDb,
      Store.savedPlaces,
      list
          .map((e) => jsonEncode(e.toJson()))
          .toList()); // тодо обернуть List.of()???*/

  // Единицы измерения скорости.
  //============================================================================

  /// Провайдер предоставляет единицы измерения скорости.
  static final speedUnits = StateProvider<Speed>(
      (ref) => _conversionSpeedUnits(DbStore.speedUnitsDefault));

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
      (ref) => _conversionPressureUnits(DbStore.pressureUnitsDefault));

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
      (ref) => _conversionTempUnits(DbStore.temperatureUnitsDefault));

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
      (ref) => _conversionCurrentLanguage(DbStore.userWeatherLanguageDefault));

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
    final String apiKey = ref.watch(ApiServiceOwm.apiKey);

    // отслеживаем и устанавливаем язык запросов для погодных условий.
    final WeatherLanguage currentLanguage =
        ref.watch(WeatherServices.currentLanguage);

    return WeatherService(apiKey, language: currentLanguage);
  });
}
