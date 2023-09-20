// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'design_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DesignPage _$$_DesignPageFromJson(Map<String, dynamic> json) =>
    _$_DesignPage(
      page: $enumDecode(_$WeatherPageEnumMap, json['page']),
      design: $enumDecode(_$AppVisualDesignEnumMap, json['design']),
    );

Map<String, dynamic> _$$_DesignPageToJson(_$_DesignPage instance) =>
    <String, dynamic>{
      'page': _$WeatherPageEnumMap[instance.page]!,
      'design': _$AppVisualDesignEnumMap[instance.design]!,
    };

const _$WeatherPageEnumMap = {
  WeatherPage.hourly: 'hourly',
  WeatherPage.currently: 'currently',
  WeatherPage.daily: 'daily',
};

const _$AppVisualDesignEnumMap = {
  AppVisualDesign.byRuble: 'byRuble',
  AppVisualDesign.byTolskaya: 'byTolskaya',
};
