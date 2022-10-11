// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SavedPlace _$$_SavedPlaceFromJson(Map<String, dynamic> json) =>
    _$_SavedPlace(
      name: json['name'] as String?,
      localNames: (json['local_names'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry($enumDecode(_$WeatherLanguageEnumMap, k), e as String),
      ),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      country: json['country'] as String?,
      countryCode: json['country_code'] as String?,
      state: json['state'] as String?,
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$_SavedPlaceToJson(_$_SavedPlace instance) =>
    <String, dynamic>{
      'name': instance.name,
      'local_names': instance.localNames
          ?.map((k, e) => MapEntry(_$WeatherLanguageEnumMap[k], e)),
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'country': instance.country,
      'country_code': instance.countryCode,
      'state': instance.state,
      'note': instance.note,
    };

const _$WeatherLanguageEnumMap = {
  WeatherLanguage.afrikaans: 'afrikaans',
  WeatherLanguage.albanian: 'albanian',
  WeatherLanguage.arabic: 'arabic',
  WeatherLanguage.azerbaijani: 'azerbaijani',
  WeatherLanguage.bulgarian: 'bulgarian',
  WeatherLanguage.catalan: 'catalan',
  WeatherLanguage.czech: 'czech',
  WeatherLanguage.danish: 'danish',
  WeatherLanguage.german: 'german',
  WeatherLanguage.greek: 'greek',
  WeatherLanguage.english: 'english',
  WeatherLanguage.basque: 'basque',
  WeatherLanguage.persian: 'persian',
  WeatherLanguage.farsi: 'farsi',
  WeatherLanguage.finnish: 'finnish',
  WeatherLanguage.french: 'french',
  WeatherLanguage.galician: 'galician',
  WeatherLanguage.hebrew: 'hebrew',
  WeatherLanguage.hindi: 'hindi',
  WeatherLanguage.croatian: 'croatian',
  WeatherLanguage.hungarian: 'hungarian',
  WeatherLanguage.indonesian: 'indonesian',
  WeatherLanguage.italian: 'italian',
  WeatherLanguage.japanese: 'japanese',
  WeatherLanguage.korean: 'korean',
  WeatherLanguage.latvian: 'latvian',
  WeatherLanguage.lithuanian: 'lithuanian',
  WeatherLanguage.macedonian: 'macedonian',
  WeatherLanguage.norwegian: 'norwegian',
  WeatherLanguage.dutch: 'dutch',
  WeatherLanguage.polish: 'polish',
  WeatherLanguage.portuguese: 'portuguese',
  WeatherLanguage.portugueseBrazilian: 'portugueseBrazilian',
  WeatherLanguage.romanian: 'romanian',
  WeatherLanguage.russian: 'russian',
  WeatherLanguage.swedish: 'swedish',
  WeatherLanguage.slovak: 'slovak',
  WeatherLanguage.slovenian: 'slovenian',
  WeatherLanguage.spanish: 'spanish',
  WeatherLanguage.serbian: 'serbian',
  WeatherLanguage.thai: 'thai',
  WeatherLanguage.turkish: 'turkish',
  WeatherLanguage.ukrainian: 'ukrainian',
  WeatherLanguage.vietnamese: 'vietnamese',
  WeatherLanguage.chineseSimplified: 'chineseSimplified',
  WeatherLanguage.chineseTraditional: 'chineseTraditional',
  WeatherLanguage.zulu: 'zulu',
};
