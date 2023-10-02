import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/place_service_controller.dart';
import 'package:weather_today/domain/controllers/saved_places_provider.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';
import 'package:weather_today/domain/models/place/place_model.dart';
import 'package:weather_today/ui/feature/search/models/search_state.dart';
import 'package:weather_today/utils/logger/all_observers.dart';

/// Notifier is designed to work with displaying found and saved places
/// in body searchBar.
class SearchWidgetNotifier extends AutoDisposeNotifier<SearchState> {
  SearchWidgetNotifier();

  /// List of saved places.
  late List<Place> _savedPlaces;

  /// List of found places.
  List<Place> _foundedPlaces = [];

  /// Active request.
  String _query = '';

  @override
  SearchState build() {
    _savedPlaces = ref.watch(savedPlacesController);
    ref.onDispose(() {
      controllerBar.dispose();
    });

    state = const SearchState.loading();
    // если запроса нет, автоматически пустой _foundedPlaces.
    if (_query.isEmpty) {
      state = SearchState.saved(
        _savedPlaces.take(_countDisplayedPlaces).toList(),
      );

      // запрос есть
    } else {
      state = SearchState.found(
        _foundedPlaces.take(_countDisplayedPlaces).toList(),
      );
    }

    return state;
  }

  /// The number of locations to display.
  static const int _countDisplayedPlaces = 5;

  /// Network call delay, milliseconds.
  ///
  /// The delay between when the user stopped typing and the onQueryChanged call.
  /// This is useful, for example, if you want to avoid performing expensive tasks
  /// such as calling the network or calling for each individual character.
  static int get debounceDelayMilSec => 1000;

  // List of providers
  // ===========================================================================

  static final instance =
      AutoDisposeNotifierProvider<SearchWidgetNotifier, SearchState>(
    SearchWidgetNotifier.new,
    name: '$SearchWidgetNotifier',
  );

  // ignore: avoid_public_notifier_properties
  /// The provider returns translate.
  static StateProvider<TranslationsRu> get tr =>
      AppLocalization.currentTranslation;

  /// Current selected location.
  static StateProvider<Place> get currentPlace => WeatherServices.currentPlace;

  static AutoDisposeStateNotifierProvider<SavedPlacesNotifier, List<Place>>
      get savedPlaces => savedPlacesController;

  // Working with a request
  // ===========================================================================

  /// The function processes the request.
  Future<void> newRequest(String newQuery) async {
    state = const SearchState.loading();

    _query = newQuery;

    // если запрос пуст - возвращаем список сохранённых мест
    if (newQuery.isEmpty) {
      final List<Place> saved =
          _savedPlaces.take(_countDisplayedPlaces).toList();
      state = SearchState.saved(saved);
    }
    // иначе, обрабатываем запрос
    else {
      try {
        _foundedPlaces = await _handleRawQuery(newQuery);
      } catch (e, s) {
        logError(newQuery, e, s);

        _foundedPlaces = [];
        state = const SearchState.error();
      }

      state = SearchState.found(_foundedPlaces);
    }
  }

  /// The pattern allows you to process a string with latitude and longitude.
  static final _patternLonLat = RegExp(
    r'(^\s*[-+]?(?:[1-8]?\d(?:\.\d+)?|90(?:\.0+)?))\s*,\s*([-+]?(?:180(?:\.0+)?|(?:(?:1[0-7]\d)|(?:[1-9]?\d))(?:\.\d+)?)\s*)$',
  );

  /// Process raw string
  Future<List<Place>> _handleRawQuery(String rawQuery) async {
    // todo logger
    // содержит ли строка цифры /todo более общий паттерн типа 85, 82
    // if (rawQuery.contains(RegExp(r'\d+'))) {
    // Проверяем, содержит ли строка паттерн 'долгота, широта'
    if (rawQuery.contains(_patternLonLat)) {
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
    // иначе поиск по местоположению
    else {
      return _getPlacesByName(
          rawQuery[0].toUpperCase() + rawQuery.substring(1));
    }

    return [];
  }

  /// We get a list of places by their presumed name.
  Future<List<Place>> _getPlacesByName(String name) async =>
      ref.read(placeServiceOWMPr).getPlacesByName(name);

  /// We get a list of places by their coordinates.
  Future<List<Place>> _getPlacesByCoordinates(
          {required double latitude, required double longitude}) async =>
      ref
          .read(placeServiceOWMPr)
          .getPlacesByCoordinates(latitude: latitude, longitude: longitude);

  // Methods of working with places.
  // ===========================================================================

  // ignore: avoid_public_notifier_properties
  /// Bar controller.
  final controllerBar = FloatingSearchBarController();

  /// Select location as current.
  Future<void> selectCurrentPlace(Place place) async {
    controllerBar.close();
    unawaited(ref.read(WeatherServices.instance).setCurrentPlace(place));
  }

  /// Add/remove location.
  Future<void> changePlaceToSavedPlaces(bool isSave, Place place) async {
    if (isSave) {
      // удаляем
      await _deletePlace(place);
    } else {
      // сохраняем
      await _addPlaceToSavedPlaces(place);
    }
  }

  /// Save the location to the list of saved locations.
  Future<void> _addPlaceToSavedPlaces(Place place) async =>
      ref.read(savedPlacesController.notifier).addPlace(place);

  /// Delete a location from the list of saved locations.
  Future<void> _deletePlace(Place deletedPlace) async =>
      ref.read(savedPlacesController.notifier).deletePlace(deletedPlace);
}
