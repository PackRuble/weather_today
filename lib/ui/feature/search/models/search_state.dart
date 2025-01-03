import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_today/domain/services/place_service/models/place_model.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.found(List<Place> places) = _Found;
  const factory SearchState.saved(List<Place> places) = _Saved;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.error() = _Error;
}
