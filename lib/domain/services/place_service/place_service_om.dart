// ignore_for_file: file_names

import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/application/i18n/translations.g.dart';
import 'package:weather_today/data/open_meteo/models/models.dart';
import 'package:weather_today/data/open_meteo/open_meteo_repo.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/domain/controllers/utils/call_wrapper.dart';
import 'package:weather_today/domain/services/place_service/models/place_model.dart';

import '../../../application/const/countries_code.dart';
import 'interface/place_service.dart';

final geocodingOMPR =
    Provider.autoDispose((_) => const OpenMeteoGeocodingRepo());

class PlaceOMService extends AutoDisposeNotifier<void>
    with CallWrapper
    implements PlaceService {
  static final i = AutoDisposeNotifierProvider<PlaceOMService, void>(
    PlaceOMService.new,
    name: '$PlaceOMService',
  );

  late OpenMeteoGeocodingRepo _geocodingOMPR;
  late AppLocale _locale;

  @override
  void build() {
    _geocodingOMPR = ref.watch(geocodingOMPR);
    _locale = ref.watch(AppLocalization.currentLocale);
  }

  @override
  Future<List<Place>> getPlacesByCoordinates({
    required double latitude,
    required double longitude,
  }) async {
    throw UnimplementedError(
      'It is not possible to use coordinates for this geo-service',
    );
  }

  @override
  Future<List<Place>> getPlacesByName(String queryCity) async {
    final List<OpenMeteoPlace> placesDirect = (await callSafely(
          () => _geocodingOMPR.geocode(
            text: queryCity,
            count: 5,
            lang: _locale.languageCode,
          ),
        )) ??
        [];

    final List<Place> places = placesDirect.map(_convertGeocodePlace).toList();

    return places;
  }

  /// Convert the location entity to its own entity.
  Place _convertGeocodePlace(OpenMeteoPlace place) {
    return Place(
      name: place.name,
      localNames: {
        switch (_locale) {
          AppLocale.ru => WeatherLanguage.russian,
          AppLocale.en => WeatherLanguage.english,
        }: place.name,
      },
      latitude: place.latitude,
      longitude: place.longitude,
      countryCode: place.countryCode,
      country: countriesCode[place.countryCode.toUpperCase()] ?? '??',
      state: place.admin1 ?? place.admin2 ?? place.admin3 ?? place.admin4,
    );
  }
}
