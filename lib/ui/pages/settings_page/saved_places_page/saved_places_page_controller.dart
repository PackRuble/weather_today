import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/core/controllers/saved_places_provider.dart';
import 'package:weather_today/core/controllers/weather_service_controllers.dart';
import 'package:weather_today/core/models/place/place_model.dart';
import 'package:weather_today/ui/const/dialogs.dart';

import '../../../utils/image_helper.dart';

/// Контроллер страницы [SavedPlacesPage].
class SavedPlacesPageController {
  SavedPlacesPageController(this._ref);

  final Ref _ref;

  Reader get _reader => _ref.read;

  /// экземпляр.
  static final pr = Provider.autoDispose<SavedPlacesPageController>(
      (ref) => SavedPlacesPageController(ref),
      name: '$SavedPlacesPageController');

  // ---------------------------------------------------------------------------
  // работа с сохраненными местами

  /// сохраненные места
  static final savedPlaces = Provider.autoDispose<List<Place>>(
      (ref) => ref.watch(savedPlacesController));

  /// Удалить местоположение из списка сохраненных.
  Future<void> _deletePlace(Place deletedPlace) async =>
      _reader(savedPlacesController.notifier).deletePlace(deletedPlace);

  /// Обновляем местоположение не изменяя его положение в списке.
  Future<void> _updatePlace(Place updatedPlace) async =>
      _reader(savedPlacesController.notifier).updatePlace(updatedPlace);

  /// Выбрать местоположение текущим.
  Future<void> selectPlace(Place newPlace) async =>
      _reader(WeatherServices.pr).setCurrentPlace(newPlace);

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
      ImageHelper.getFlagIcon(place.countryCode ?? ''),
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
