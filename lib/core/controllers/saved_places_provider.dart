import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/const/key_store.dart';
import 'package:weather_today/core/controllers/weather_service_controllers.dart';
import 'package:weather_today/core/models/place/place_model.dart';
import 'package:weather_today/core/services/local_db_service/data_base_controller.dart';

import '../../const/first_run_saved_places.dart';

/// Контроллер сервиса Сохраненных мест.
final savedPlacesController =
    StateNotifierProvider.autoDispose<SavedPlacesNotifier, List<Place>>((ref) {
  // final Place currentPlace = ref.watch(WeatherServices.currentPlace);

  return SavedPlacesNotifier(ref.read);
  // return SavedPlacesNotifier(ref.read, currentPlace);
}, name: '$SavedPlacesNotifier');

/// Контроллер сохраненных мест.
class SavedPlacesNotifier extends StateNotifier<List<Place>> {
  SavedPlacesNotifier(this._reader) : super([]) {
    _init(); // coldfix: при необходимости перевести на AsyncValue и await-инициализацию.
  }

  final Reader _reader;

  /// Текущее выбранное место, по которому выполняется запрос на погоду.
  // late final Place _currentPlace;

  /// Запустить при создании класса.
  Future<void> _init() async {
    state = _conversionSavedPlacesDb(await _reader(dbService)
        .load(DbStore.savedPlaces, DbStore.savedPlacesDefault));
  }

  static List<
      Place> _conversionSavedPlacesDb(List<String> listJsonStr) => listJsonStr
              .contains(DbStore.firstRun) &&
          listJsonStr.length == 1
      ? initialSavedPlaces // coldfix - было бы правильно перевести на freezed state
      : listJsonStr.map((String strJson) {
          return Place.fromJson(json.decode(strJson) as Map<String, dynamic>);
        }).toList();

  /// Является ли место сохраненным.
  bool isSavedPlace(Place place) => state.any((pl) => place.isSamePlace(pl));

  /// Является ли место текущим.
  bool isCurrentPlace(Place place) =>
      place.isSamePlace(_reader(WeatherServices.currentPlace));

  /// Добавить местоположение в список сохраненных.
  ///
  /// Ключевые моменты:
  /// * место помещается в начало списка.
  /// * если место существовало, копируется старая заметка.
  Future<void> addPlace(Place newPlace) async {
    List<Place> newList = _ofState;

    if (isSavedPlace(newPlace)) {
      // находим индекс этого элемента
      final index = newList.indexOf(newPlace);

      // удаляем из списка и получаем этот старый элемент
      final oldPlace = newList.removeAt(index);

      // Помещаем новый элемент в начало списка, но копируем заметку из старого.
      // Ведь места с одинаковым местоположением.
      newList = [newPlace.copyWith(note: oldPlace.note), ...newList];
    } else {
      // места не было в списке сохраненных
      newList = [newPlace, ...newList];
    }

    state = newList;
    await _saveInDatabase(newList);
  }

  /// Отдаем новый объект состояния.
  List<Place> get _ofState => List.of(state);

  /// Обновить состояние и удалить местоположение из бд.
  Future<void> deletePlace(Place deletedPlace) async {
    state =
        _ofState.where((place) => !deletedPlace.isSamePlace(place)).toList();
    await _saveInDatabase(state);
  }

  /// Обновляем местоположение не изменяя его положение в списке.
  ///
  /// Используем, например, когда изменяем заметку о месте.
  /// Мы уверены, что заметка уже существует в списке!
  Future<void> updatePlace(Place newPlace) async {
    final List<Place> saved = _ofState;

    saved[saved.indexWhere((place) => newPlace.isSamePlace(place))] = newPlace;

    state = saved;
    await _saveInDatabase(saved);
  }

  /// Сохранить любимый список мест в бд.
  Future<void> _saveInDatabase(List<Place> places) async =>
      _reader(dbService).save(DbStore.savedPlaces,
          places.map((e) => jsonEncode(e.toJson())).toList());
}
