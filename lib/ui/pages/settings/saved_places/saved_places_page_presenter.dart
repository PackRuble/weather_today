import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/saved_places_provider.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';
import 'package:weather_today/domain/models/place/place_model.dart';
import 'package:weather_today/ui/dialogs/app_dialogs.dart';

import '../../../utils/image_helper.dart';

/// Контроллер страницы [SavedPlacesPage].
class SavedPlacesPageController {
  SavedPlacesPageController(this._ref);

  final Ref _ref;

  /// экземпляр.
  static final instance = Provider.autoDispose(
    SavedPlacesPageController.new,
    name: '$SavedPlacesPageController',
  );

  /// Провайдер возвращает translate.
  static final tr = Provider.autoDispose<TranslationsRu>(
      (ref) => ref.watch(AppLocalization.currentTranslation));

  // ---------------------------------------------------------------------------
  // работа с сохраненными местами

  /// сохраненные места
  static final savedPlaces = Provider.autoDispose<List<Place>>(
      (ref) => ref.watch(savedPlacesController));

  /// Удалить местоположение из списка сохраненных.
  Future<void> _deletePlace(Place deletedPlace) async =>
      _ref.read(savedPlacesController.notifier).deletePlace(deletedPlace);

  /// Обновляем местоположение не изменяя его положение в списке.
  Future<void> _updatePlace(Place updatedPlace) async =>
      _ref.read(savedPlacesController.notifier).updatePlace(updatedPlace);

  /// Выбрать местоположение текущим.
  Future<void> selectPlace(Place newPlace) async =>
      _ref.read(WeatherServices.instance).setCurrentPlace(newPlace);

  // ---------------------------------------------------------------------------
  // диалоги

  /// Диалог отмены удаления.
  Future<void> dialogAfterDeletingPlace(
    BuildContext context,
    Place place,
  ) async {
    final isDelPlace = await AppDialogs.confirmDeletionPlace(context);
    if (isDelPlace) {
      await _deletePlace(place);
    }
  }

  /// Посмотреть флаг и полное название страны.
  Future<void> dialogSeeFlag(
    BuildContext context,
    Place place,
  ) async {
    if (place.countryCode == null) return;
    await AppDialogs.seeFlag(
      context,
      place.countryCode!,
      FittedBox(
          fit: BoxFit.contain,
          child: ImageHelper.getFlagIcon(place.countryCode)),
    );
  }

  /// Показать окно создания заметки.
  Future<void> dialogMakeNote(
    BuildContext context,
    Place place,
  ) async {
    final String? oldNote = place.note;

    final String? newNote = await AppDialogs.makeNote(context, place.note);

    if (newNote != null && newNote != oldNote) {
      await _updatePlace(place.copyWith(note: newNote));
    }
  }
}