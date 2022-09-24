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
  WeatherLanguage.Afrikaans: 'afrikaans',
  WeatherLanguage.Albanian: 'albanian',
  WeatherLanguage.Arabic: 'arabic',
  WeatherLanguage.Azerbaijani: 'azerbaijani',
  WeatherLanguage.Bulgarian: 'bulgarian',
  WeatherLanguage.Catalan: 'catalan',
  WeatherLanguage.Czech: 'czech',
  WeatherLanguage.Danish: 'danish',
  WeatherLanguage.German: 'german',
  WeatherLanguage.Greek: 'greek',
  WeatherLanguage.English: 'english',
  WeatherLanguage.Basque: 'basque',
  WeatherLanguage.Persian: 'persian',
  WeatherLanguage.Farsi: 'farsi',
  WeatherLanguage.Finnish: 'finnish',
  WeatherLanguage.French: 'french',
  WeatherLanguage.Galician: 'galician',
  WeatherLanguage.Hebrew: 'hebrew',
  WeatherLanguage.Hindi: 'hindi',
  WeatherLanguage.Croatian: 'croatian',
  WeatherLanguage.Hungarian: 'hungarian',
  WeatherLanguage.Indonesian: 'indonesian',
  WeatherLanguage.Italian: 'italian',
  WeatherLanguage.Japanese: 'japanese',
  WeatherLanguage.Korean: 'korean',
  WeatherLanguage.Latvian: 'latvian',
  WeatherLanguage.Lithuanian: 'lithuanian',
  WeatherLanguage.Macedonian: 'macedonian',
  WeatherLanguage.Norwegian: 'norwegian',
  WeatherLanguage.Dutch: 'dutch',
  WeatherLanguage.Polish: 'polish',
  WeatherLanguage.Portuguese: 'portuguese',
  WeatherLanguage.PortugueseBrazilian: 'portugueseBrazilian',
  WeatherLanguage.Romanian: 'romanian',
  WeatherLanguage.Russian: 'russian',
  WeatherLanguage.Swedish: 'swedish',
  WeatherLanguage.Slovak: 'slovak',
  WeatherLanguage.Slovenian: 'slovenian',
  WeatherLanguage.Spanish: 'spanish',
  WeatherLanguage.Serbian: 'serbian',
  WeatherLanguage.Thai: 'thai',
  WeatherLanguage.Turkish: 'turkish',
  WeatherLanguage.Ukrainian: 'ukrainian',
  WeatherLanguage.Vietnamese: 'vietnamese',
  WeatherLanguage.ChineseSimplified: 'chineseSimplified',
  WeatherLanguage.ChineseTraditional: 'chineseTraditional',
  WeatherLanguage.Zulu: 'zulu',
};
