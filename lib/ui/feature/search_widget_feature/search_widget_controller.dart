import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:weather_today/core/controllers/saved_places_provider.dart';
import 'package:weather_today/core/controllers/weather_service_controllers.dart';
import 'package:weather_today/core/models/place/place_model.dart';
import 'package:weather_today/core/services/place_service/place_service.dart';

import 'models/search_state.dart';

/// Контроллер виджета-поиска.
class SearchWidgetController {
  SearchWidgetController(this._ref);

  final ProviderRef<SearchWidgetController> _ref;

  Reader get _reader => _ref.read;

  /// Список найденных мест.
  static final pr = Provider.autoDispose<SearchWidgetController>(
      (ref) => SearchWidgetController(ref));

  /// Отсрочка сетевого вызова, миллисекунды.
  ///
  /// Задержка между моментом, когда пользователь перестал набирать текст,
  /// и вызовом onQueryChanged.
  /// Это полезно, например, если вы хотите избежать выполнения дорогостоящих задач,
  /// таких как вызов сети или вызов для каждого отдельного символа.
  static int get debounceDelay => 1000;

  // -------------------------------------------
  // Провайдеры

  /// Состояние FSB.
  static final searchState = Provider.autoDispose<SearchState>((ref) {
    final List<Place> saved = ref.watch(_savedPlaces);
    final List<Place> founded = ref.watch(_foundedPlaces);
    final String baseTooltip = ref.watch(_baseTooltip);

    ref.keepAlive();

    return _updateSearchState(
        saved: saved, founded: founded, baseTooltip: baseTooltip);
  });

  static SearchState _updateSearchState({
    required List<Place> saved,
    required List<Place> founded,
    required String baseTooltip,
  }) {
    // если поле для запроса пустое и нет сохраненных мест
    if (controller.query == '' && saved.isEmpty) {
      return const SearchState(
          displayedPlaces: [], tip: 'Нет сохраненных мест.');
    } else if (controller.query == '' && saved.isNotEmpty) {
      return SearchState(
          displayedPlaces: saved,
          tip: '$baseTooltip\nПоказаны ваши сохраненные места.');
    }

    // далее рассмотрены случаи, когда поле содержит запрос.

    // если мест по текущему запросу не найдено
    if (founded.isEmpty) {
      return const SearchState(
          displayedPlaces: [], tip: 'Местоположений не найдено.');
    }

    // найденные местоположения
    return SearchState(
        displayedPlaces: List.of(
          _matchingPlaces(
            // места из бд
            saved: saved,
            // найденные по запросу
            founded: founded,
          ),
        ),
        tip: '${baseTooltip} \nНайденные местоположения');
  }

  static List<Place> _matchingPlaces({
    required List<Place> saved,
    required List<Place> founded,
  }) {
    for (final Place s in saved) {
      if (founded.contains(s)) {
        // находим индекс этого элемента
        final int index = founded.indexOf(s);
        // заменяем элемент на сохраненный
        founded[index] = s;
      }
    }
    return founded;
  }

  /// Текущее выбранное местоположение.
  static final currentPlace = Provider.autoDispose<Place>(
      (ref) => ref.watch(WeatherServices.currentPlace));

  /// Список сохраненных мест пользователя.
  static final _savedPlaces = Provider.autoDispose<List<Place>>(
      (ref) => ref.watch(savedPlacesController));

  /// Места, найденные по запросу.
  static final _foundedPlaces = StateProvider<List<Place>>((ref) => []);

  /// Базовая подсказка.
  static final _baseTooltip = Provider<String>((ref) {
    //todo tr
    return 'Удерживайте, чтобы сохранить/удалить место.\n'
        'Кликните, чтобы выбрать место.\n';
  });

  /// Индикатор загрузки
  ///
  /// When set to true, the FloatingSearchBar will show an undetermined LinearProgressIndicator.
  /// When false, will hide the LinearProgressIndicator
  static final progress = StateProvider<bool>((ref) => false);

  // -------------------------------------------
  // Управление состоянием виджетов

  /// управление панелью поиска
  static final controller = FloatingSearchBarController();

  /// Выбрать местоположение текущим.
  void selectCurrentPlace(Place place) {
    controller.close();
    _reader(WeatherServices.pr).setCurrentPlace(place);
  }

  /// Изменение фокуса виджета
  void changeFocus(bool isFocus) {
    if (!isFocus) {
      controller.close();
    }

    _ref.invalidate(_foundedPlaces);
  }

  // -------------------------------------------
  // Управление запросом, его обработка и обновление состояния

  /// Получаем список мест по их предположительному наименованию.
  Future<List<Place>> _getPlacesByName(String name) async =>
      _reader(placeServiceOWMPr).getPlacesByName(name);

  /// Получаем список мест по их координатам.
  Future<List<Place>> _getPlacesByCoordinates(
          {required double latitude, required double longitude}) async =>
      _reader(placeServiceOWMPr)
          .getPlacesByCoordinates(latitude: latitude, longitude: longitude);

  /// Функция обрабатывает запрос.
  Future<void> newRequest(String newQuery) async {
    if (newQuery.isEmpty) {
      // самообновление
      _ref.invalidate(_foundedPlaces);
    } else {
      List<Place> places;

      try {
        _reader(progress.notifier).state = true;

        places = await _handleRawQuery(newQuery);
      } catch (e, s) {
        print('$e, $s'); // todo logger
        places = [];

        _reader(progress.notifier).state = false;
      }

      _reader(_foundedPlaces.notifier).state = List.of(places);

      _reader(progress.notifier).state = false;
    }
  }

  /// Паттерн позволяет обработать строку с широтой и долготой.
  static const String patternLonLat =
      r'(^\s*[-+]?(?:[1-8]?\d(?:\.\d+)?|90(?:\.0+)?))\s*,\s*([-+]?(?:180(?:\.0+)?|(?:(?:1[0-7]\d)|(?:[1-9]?\d))(?:\.\d+)?)\s*)$';

  /// Обработать сырую строку
  Future<List<Place>> _handleRawQuery(String rawQuery) async {
    // todo logger
    // содержит ли строка цифры /todo более общий паттерн типа 85, 82
    // if (rawQuery.contains(RegExp(r'\d+'))) {
    // Проверяем, содержит ли строка паттерн 'долгота, широта'
    if (rawQuery.contains(RegExp(patternLonLat))) {
      final List<String> splitter = rawQuery.split(',');

      if (splitter.length == 2) {
        final double? latitude = double.tryParse(splitter[0]);
        final double? longitude = double.tryParse(splitter[1]);

        if (latitude != null && longitude != null) {
          return _getPlacesByCoordinates(
              latitude: latitude, longitude: longitude);
        }
      }
    }
    // }
    // иначе поиск по местоположению
    else {
      return _getPlacesByName(
          rawQuery[0].toUpperCase() + rawQuery.substring(1));
    }

    return [];
  }

  // -------------------------------------------
  // Удаление/добавление мест в/из сохраненных

  /// Сохранить местоположение в список сохраненных.
  Future<void> addPlaceToSavedPlaces(Place place) async {
    await _reader(savedPlacesController.notifier).addPlace(place);
  }

  /// Удалить местоположение из списка сохраненных.
  Future<void> deletePlace(Place deletedPlace) async =>
      _reader(savedPlacesController.notifier).deletePlace(deletedPlace);

// /// Обновить найденные после удаления/сохранения.
// void _updateIsSaved(SavedPlace place) {
//   List<SavedPlace> currentFounded = _reader(foundedPlaces.notifier).state;
//
//   final foundedIndex = currentFounded.indexOf(place);
//   currentFounded.removeAt(foundedIndex);
//
//   // заменяем измененное место
//   currentFounded.insert(
//       foundedIndex, place.copyWith(isSaved: !place.isSaved));
//
//   _reader(foundedPlaces.notifier).state = List.of(currentFounded);
// }
}
