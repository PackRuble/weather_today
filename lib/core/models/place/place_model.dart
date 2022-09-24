import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:open_weather_api/open_weather_api.dart';

part 'place_model.freezed.dart';
part 'place_model.g.dart';

/// Местоположение и его характеристики.
///
@freezed
class Place with _$Place {
  const Place._();

  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Place({
    /// Название местоположения.
    required String? name,

    /// Словарь локальных названий местоположения.
    required Map<WeatherLanguage, String>? localNames,

    /// Широта местоположения.
    required double? latitude,

    /// Долгота местоположения.
    required double? longitude,

    /// Название страны.
    required String? country,

    /// Код страны в формате ISO 3166-alpha2.
    required String? countryCode,

    /// Штат или область.
    required String? state,

    /// Заметка об этом месте.
    String? note,
  }) = _SavedPlace;

  /// Внутренний метод десериализации json.
  factory Place.fromJson(Map<String, dynamic> map) => _$PlaceFromJson(map);

  /// Одно и тоже местоположение?
  ///
  /// true - если совпадает [name], [longitude] и [latitude].
  bool isSamePlace(Place otherPlace) =>
      name == otherPlace.name &&
      longitude == otherPlace.longitude &&
      latitude == otherPlace.latitude;

  @override
  bool operator ==(dynamic other) =>
      other is _SavedPlace &&
      name == other.name &&
      longitude == other.longitude &&
      latitude == other.latitude;

  // @override
  // bool operator ==(dynamic other) {
  //   return identical(this, other) ||
  //       (other.runtimeType == runtimeType &&
  //           other is _SavedPlace &&
  //           name == other.name &&
  //           longitude == other.longitude &&
  //           latitude == other.latitude);
  // }

  @override
  int get hashCode => Object.hash(
        runtimeType,
        name,
        latitude,
        longitude,
      );

  @override
  String toString() =>
      '$Place(name: $name, lat: $latitude, lon: $longitude, note: $note, hashCode: $hashCode)';
}