import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/saved_places_provider.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';
import 'package:weather_today/domain/services/place_service/models/place_model.dart';
import 'package:weather_today/ui/dialogs/app_dialogs.dart';

import '../../../utils/image_helper.dart';

/// Page presenter [SavedPlacesPage].
class SavedPlacesPagePresenter {
  const SavedPlacesPagePresenter(this._ref);

  final Ref _ref;

  /// Instance of current class.
  static final instance = Provider.autoDispose(
    SavedPlacesPagePresenter.new,
    name: '$SavedPlacesPagePresenter',
  );

  /// Provider returns translation.
  static StateProvider<TranslationsRu> get tr =>
      AppLocalization.currentTranslation;

  // ---------------------------------------------------------------------------
  // working with saved places

  /// saved places
  static AutoDisposeStateNotifierProvider<SavedPlacesNotifier, List<Place>>
      get savedPlaces => savedPlacesController;

  /// Remove a location from your saved list.
  Future<void> _deletePlace(Place deletedPlace) async =>
      _ref.read(savedPlacesController.notifier).deletePlace(deletedPlace);

  /// We update the location without changing its position in the list.
  Future<void> _updatePlace(Place updatedPlace) async =>
      _ref.read(savedPlacesController.notifier).updatePlace(updatedPlace);

  /// Select location as current.
  Future<void> selectPlace(Place newPlace) async =>
      _ref.read(WeatherServices.instance).setCurrentPlace(newPlace);

  // ---------------------------------------------------------------------------
  // dialogues

  /// Cancel deletion dialog.
  Future<void> dialogAfterDeletingPlace(
    BuildContext context,
    Place place,
  ) async {
    final isDelPlace = await AppDialogs.confirmDeletionPlace(context);
    if (isDelPlace) {
      await _deletePlace(place);
    }
  }

  /// View the flag and full name of the country.
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

  /// Show the note creation window.
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
