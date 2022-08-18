import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/core/controllers/saved_places_provider.dart';
import 'package:weather_today/core/controllers/weather_service_controllers.dart';
import 'package:weather_today/core/models/place/place_model.dart';
import 'package:weather_today/ui/const/dialogs.dart';
import 'package:weather_today/ui/shared/constant_todo.dart';

/// Контроллер страницы [SavedPlacesPage].
class SavedPlacesPageController {
  SavedPlacesPageController(this._reader);

  final Reader _reader;

  /// экземпляр.
  static final pr = Provider.autoDispose<SavedPlacesPageController>(
      (ref) => SavedPlacesPageController(ref.read),
      name: '$SavedPlacesPageController');

  // ---------------------------------------------------------------------------
  // работа с сохраненными местами

  /// сохраненные места
  static final savedPlaces = Provider.autoDispose<List<Place>>(
      (ref) => ref.watch(savedPlacesController));

  /// Является ли место текущим.
  bool isCurrentPlace(Place place) =>
      _reader(savedPlacesController.notifier).isCurrentPlace(place);

  /// Удалить местоположение из списка сохраненных.
  Future<void> _deletePlace(Place deletedPlace) async =>
      _reader(savedPlacesController.notifier).deletePlace(deletedPlace);

  /// Обновляем местоположение не изменяя его положение в списке.
  Future<void> _updatePlace(Place updatedPlace) async =>
      _reader(savedPlacesController.notifier).updatePlace(updatedPlace);

  /// Выбрать местоположение текущим.
  void selectPlace(Place newPlace) =>
      _reader(WeatherServices.pr).setCurrentPlace(newPlace);

  // ---------------------------------------------------------------------------
  // ui текст

  /// Вернуть правильное название места.
  String getTitle(Place place) =>
      ((place.countryCode != null) ? '${place.countryCode}' : '') +
      ((place.state != null) ? ', ${place.state}' : '');

  /// Вернуть правильное название места.
  String getSubtitle(Place place, String codeLang) =>
      ((place.name != null) ? '${place.name}' : '') +
      ((place.localNames != null)
          ? ', ${place.localNames![languageCodeReverse[codeLang]]}'
          : '');

  // ---------------------------------------------------------------------------
  // диалоги

  /// Диалог отмены удаления.
  Future<void> dialogAfterDeletingPlace(
    BuildContext context,
    Place place,
  ) async {
    if (await showDialogAfterDeletingPlace(context)) {
      await _deletePlace(place);
    }
  }

  /// Посмотреть флаг и полное название страны.
  Future<void> dialogSeeFlag(
    BuildContext context,
    Place place,
  ) async {
    if (place.countryCode == null) return;
    await showDialogSeeFlag(
      context,
      place.countryCode!,
      AppImages.getFlagIcon(place.countryCode!.toLowerCase()),
    );
  }

  /// Показать окно создания заметки.
  Future<void> dialogMakeNote(
    BuildContext context,
    Place place,
  ) async {
    final String? oldNote = place.note;

    final String? newNote = await showDialogMakeNote(context, place.note);

    if (newNote != null && newNote != oldNote) {
      await _updatePlace(place.copyWith(note: newNote));
    }
  }
}
