import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';
import 'package:weather_today/core/controllers/saved_places_provider.dart';
import 'package:weather_today/core/controllers/weather_service_controllers.dart';
import 'package:weather_today/core/models/place/place_model.dart';
import 'package:weather_today/core/services/place_service/place_service.dart';
import 'package:weather_today/i18n/translations.g.dart';
import 'package:weather_today/ui/feature/search_widget_feature/models/search_body_state.dart';

final searchWidgetProvider =
    StateNotifierProvider.autoDispose<SearchWidgetNotifier, SearchBodyState>(
        (ref) {
  final List<Place> _savedPlaces = ref.watch(savedPlacesController);

  return SearchWidgetNotifier(ref, _savedPlaces);
}, name: '$SearchWidgetNotifier');

/// Контроллер предназначен для работы с отображением найденных и сохраненных
/// мест в body searchBar.
class SearchWidgetNotifier extends StateNotifier<SearchBodyState> {
  SearchWidgetNotifier(this._ref, this._savedPlaces)
      : super(const SearchBodyState.loading()) {
    _init();
  }

  Reader get _reader => _ref.read;

  final Ref _ref;

  /// Список сохраненных мест.
  final List<Place> _savedPlaces;

  /// Количество мест для отображения.
  static const int _countDisplayedPlaces = 5;

  /// Отсрочка сетевого вызова, миллисекунды.
  ///
  /// Задержка между моментом, когда пользователь перестал набирать текст,
  /// и вызовом onQueryChanged.
  /// Это полезно, например, если вы хотите избежать выполнения дорогостоящих задач,
  /// таких как вызов сети или вызов для каждого отдельного символа.
  static int get debounceDelay => 1000;

  /// Инициализация класса.
  Future<void> _init() async {
    // если запроса нет, автоматически пустой _foundedPlaces.
    if (_reader(_query).isEmpty) {
      state = SearchBodyState.saved(
          _savedPlaces.take(_countDisplayedPlaces).toList());

      // запрос есть
    } else {
      state = SearchBodyState.found(
          _reader(_foundedPlaces).take(_countDisplayedPlaces).toList());
    }
  }

  // Список провайдеров
  // ===========================================================================

  /// Провайдер возвращает translate.
  static final tr = Provider.autoDispose<TranslationsRu>(
      (ref) => ref.watch(AppLocalize.currentTranslation));

  /// Список найденных мест
  static final _foundedPlaces = StateProvider<List<Place>>((ref) => []);

  /// Текущее выбранное местоположение.
  static final currentPlace = Provider.autoDispose<Place>(
      (ref) => ref.watch(WeatherServices.currentPlace));

  /// Контроллер бара.
  static final controllerBarProvider =
      Provider.autoDispose<FloatingSearchBarController>(
          (ref) => FloatingSearchBarController());

  /// запрос
  static final _query = StateProvider<String>((ref) => '');

  // Управление состоянием виджетов
  // ===========================================================================

  /// Изменение фокуса виджета
  void changeFocus(bool isFocus) {
    if (!isFocus) {
      _reader(controllerBarProvider).close();
    }
  }

  /// Индикатор загрузки
  ///
  /// When set to true, the FloatingSearchBar will show an undetermined LinearProgressIndicator.
  /// When false, will hide the LinearProgressIndicator
  // static final progress = StateProvider<bool>((ref) => false);

  // Работа с запросом
  // ===========================================================================

  /// Функция обрабатывает запрос.
  Future<void> newRequest(String newQuery) async {
    state = const SearchBodyState.loading();

    _reader(_query.notifier).update((_) => newQuery);

    // если запрос пуст - возвращаем список сохраненных мест
    if (newQuery.isEmpty) {
      final List<Place> saved =
          _savedPlaces.take(_countDisplayedPlaces).toList();
      state = SearchBodyState.saved(saved);

      // иначе обрабатываем запрос
    } else {
      List<Place> founded;

      try {
        founded = await _handleRawQuery(newQuery);
      } catch (e, s) {
        logError(newQuery, e, s);

        founded = [];
        state = const SearchBodyState.error();
      }

      _reader(_foundedPlaces.notifier).update((_) => founded);
      state = SearchBodyState.found(founded);
    }
  }

  /// Паттерн позволяет обработать строку с широтой и долготой.
  static const String _patternLonLat =
      r'(^\s*[-+]?(?:[1-8]?\d(?:\.\d+)?|90(?:\.0+)?))\s*,\s*([-+]?(?:180(?:\.0+)?|(?:(?:1[0-7]\d)|(?:[1-9]?\d))(?:\.\d+)?)\s*)$';

  /// Обработать сырую строку
  Future<List<Place>> _handleRawQuery(String rawQuery) async {
    // todo logger
    // содержит ли строка цифры /todo более общий паттерн типа 85, 82
    // if (rawQuery.contains(RegExp(r'\d+'))) {
    // Проверяем, содержит ли строка паттерн 'долгота, широта'
    if (rawQuery.contains(RegExp(_patternLonLat))) {
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

  /// Получаем список мест по их предположительному наименованию.
  Future<List<Place>> _getPlacesByName(String name) async =>
      _reader(placeServiceOWMPr).getPlacesByName(name);

  /// Получаем список мест по их координатам.
  Future<List<Place>> _getPlacesByCoordinates(
          {required double latitude, required double longitude}) async =>
      _reader(placeServiceOWMPr)
          .getPlacesByCoordinates(latitude: latitude, longitude: longitude);

  // Методы работы с местами.
  // ===========================================================================

  /// Выбрать местоположение текущим.
  void selectCurrentPlace(Place place) {
    _reader(controllerBarProvider).close();
    _reader(WeatherServices.pr).setCurrentPlace(place);
  }

  /// Добавить/удалить место.
  Future<void> changePlaceToSavedPlaces(bool status, Place place) async {
    if (status) {
      // удаляем
      await _deletePlace(place);
    } else {
      // сохраняем
      await _addPlaceToSavedPlaces(place);
    }
  }

  /// Сохранить местоположение в список сохраненных.
  Future<void> _addPlaceToSavedPlaces(Place place) async =>
      _reader(savedPlacesController.notifier).addPlace(place);

  /// Удалить местоположение из списка сохраненных.
  Future<void> _deletePlace(Place deletedPlace) async =>
      _reader(savedPlacesController.notifier).deletePlace(deletedPlace);
}
