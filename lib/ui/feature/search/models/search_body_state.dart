import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_today/core/models/place/place_model.dart';

part 'search_body_state.freezed.dart';

@freezed
class SearchBodyState with _$SearchBodyState {
  const factory SearchBodyState.found(List<Place> places) = _Found;
  const factory SearchBodyState.saved(List<Place> places) = _Saved;
  const factory SearchBodyState.loading() = _Loading;
  const factory SearchBodyState.error() = _Error;
}
