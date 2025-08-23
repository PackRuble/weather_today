// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'design_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DesignPage _$DesignPageFromJson(Map<String, dynamic> json) => _DesignPage(
  page: $enumDecode(_$WeatherPageEnumMap, json['page']),
  design: $enumDecode(_$AppVisualDesignEnumMap, json['design']),
);

Map<String, dynamic> _$DesignPageToJson(_DesignPage instance) => <String, dynamic>{
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
