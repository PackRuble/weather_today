import 'package:flutter/material.dart';

/// Класс содержит все иконки приложения
class AppIcons {
  AppIcons._();

  // main icons
  static const IconData settingsIcon = Icons.settings_suggest;

  static const IconData savedPlaceBookmark = Icons.bookmark;

  static const IconData notSavedPlaceBookmark = Icons.bookmark_outline;

  //============================================================================
  // settings page icons

  static const IconData savedPlaceTile = Icons.place_rounded;

  static const IconData tempUnitsTile = Icons.thermostat_rounded;

  static const IconData speedUnitsTile = Icons.speed_rounded;

  static const IconData pressureUnitsTile = pressure;

  static const IconData weatherLangTile = Icons.wb_cloudy_rounded;

  static const IconData weatherProvider = Icons.satellite_rounded;

  static const IconData apiTile = Icons.api_rounded;

  static const IconData visualDesignTile = Icons.view_quilt_rounded;

  static const IconData themeTile = Icons.palette_rounded;

  static const IconData countryFlagsTile = Icons.outlined_flag_rounded;

  static const IconData homepageTile = Icons.start_rounded;

  static const IconData localeTile = Icons.language_rounded;

  static const IconData systemSettingsTile = Icons.settings_applications_sharp;

  static const IconData gratitudeTile = Icons.volunteer_activism;

  static const IconData aboutAppTile = Icons.self_improvement_rounded;

  //============================================================================
  // weather icons
  static const IconData pressure = Icons.scale_rounded;

  static const IconData dewPoint = Icons.opacity_rounded;

  static const IconData cloudiness = Icons.wb_cloudy_rounded;

  static const IconData uvi = Icons.wb_sunny_rounded;

  static const IconData humidity = Icons.water_drop_rounded;

  static const IconData visibility = Icons.visibility_rounded;

  static const IconData wind = Icons.air_rounded;

  static const IconData directWind = Icons.navigation_rounded;
}

class AppSmiles {
  AppSmiles._();

  /// info-smile
  static const String info = '💁';

  /// set-smile
  static const String set = '🚀';

  /// pinned-smile
  static const String pinned = '📍';

  /// free-smile
  static const String free = '🆓';
}
