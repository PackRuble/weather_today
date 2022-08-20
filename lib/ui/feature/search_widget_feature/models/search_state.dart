import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_today/core/models/place/place_model.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    /// Список мест, которые будут выведены на экран.
    required List<Place> displayedPlaces,

    /// Подсказка.
    required String tip,
  }) = _SearchState;
}
