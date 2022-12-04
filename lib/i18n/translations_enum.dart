import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/core/controllers/general_settings_controller.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';
import 'package:weather_today/i18n/translations.g.dart';

extension AppLocaleTr on AppLocale {
  String get nameTr {
    switch (this) {
      case AppLocale.ru:
        return 'Русский';
      case AppLocale.en:
        return 'English';
    }
  }
}

extension HomepageIndexTr on HomepageIndex {
  String get nameTr {
    switch (this) {
      case HomepageIndex.settings:
        return tr.enums.homepage.settings;
      case HomepageIndex.hourly:
        return tr.enums.homepage.hourly;
      case HomepageIndex.today:
        return tr.enums.homepage.today;
      case HomepageIndex.daily:
        return tr.enums.homepage.daily;
    }
  }
}

extension PressureTr on Pressure {
  String get abbrTr {
    switch (this) {
      case Pressure.hectoPa:
        return tr.units.pressure.abbr.hectoPa;
      case Pressure.mbar:
        return tr.units.pressure.abbr.mbar;
      case Pressure.mmHg:
        return tr.units.pressure.abbr.mmHg;
      case Pressure.kPa:
        return tr.units.pressure.abbr.kPa;
      case Pressure.atm:
        return tr.units.pressure.abbr.atm;
      case Pressure.inHg:
        return tr.units.pressure.abbr.inHg;
    }
  }

  String get nameTr {
    switch (this) {
      case Pressure.hectoPa:
        return tr.units.pressure.name.hectoPa;
      case Pressure.mbar:
        return tr.units.pressure.name.mbar;
      case Pressure.mmHg:
        return tr.units.pressure.name.mmHg;
      case Pressure.kPa:
        return tr.units.pressure.name.kPa;
      case Pressure.atm:
        return tr.units.pressure.name.atm;
      case Pressure.inHg:
        return tr.units.pressure.name.inHg;
    }
  }
}

extension TempTr on Temp {
  String get fullNameTr {
    switch (this) {
      case Temp.celsius:
        return tr.units.temp.fullName.celsius;
      case Temp.kelvin:
        return tr.units.temp.fullName.kelvin;
      case Temp.fahrenheit:
        return tr.units.temp.fullName.fahrenheit;
    }
  }
}

extension SpeedTr on Speed {
  String get abbrTr {
    switch (this) {
      case Speed.ms:
        return tr.units.speed.abbr.ms;
      case Speed.mph:
        return tr.units.speed.abbr.mph;
      case Speed.kph:
        return tr.units.speed.abbr.kph;
    }
  }
}

extension SideOfTheWorldTr on SideOfTheWorld {
  String get abbrTr {
    switch (this) {
      case SideOfTheWorld.north:
        return tr.units.sideOfTheWorld.abbr.north;
      case SideOfTheWorld.northEast:
        return tr.units.sideOfTheWorld.abbr.northEast;
      case SideOfTheWorld.east:
        return tr.units.sideOfTheWorld.abbr.east;
      case SideOfTheWorld.southEast:
        return tr.units.sideOfTheWorld.abbr.southEast;
      case SideOfTheWorld.south:
        return tr.units.sideOfTheWorld.abbr.south;
      case SideOfTheWorld.southWest:
        return tr.units.sideOfTheWorld.abbr.southWest;
      case SideOfTheWorld.west:
        return tr.units.sideOfTheWorld.abbr.west;
      case SideOfTheWorld.northWest:
        return tr.units.sideOfTheWorld.abbr.northWest;
    }
  }

  String get nameAdjTr {
    switch (this) {
      case SideOfTheWorld.north:
        return tr.units.sideOfTheWorld.nameAdj.north;
      case SideOfTheWorld.northEast:
        return tr.units.sideOfTheWorld.nameAdj.northEast;
      case SideOfTheWorld.east:
        return tr.units.sideOfTheWorld.nameAdj.east;
      case SideOfTheWorld.southEast:
        return tr.units.sideOfTheWorld.nameAdj.southEast;
      case SideOfTheWorld.south:
        return tr.units.sideOfTheWorld.nameAdj.south;
      case SideOfTheWorld.southWest:
        return tr.units.sideOfTheWorld.nameAdj.southWest;
      case SideOfTheWorld.west:
        return tr.units.sideOfTheWorld.nameAdj.west;
      case SideOfTheWorld.northWest:
        return tr.units.sideOfTheWorld.nameAdj.northWest;
    }
  }

  String get nameTr {
    switch (this) {
      case SideOfTheWorld.north:
        return tr.units.sideOfTheWorld.name.north;
      case SideOfTheWorld.northEast:
        return tr.units.sideOfTheWorld.name.northEast;
      case SideOfTheWorld.east:
        return tr.units.sideOfTheWorld.name.east;
      case SideOfTheWorld.southEast:
        return tr.units.sideOfTheWorld.name.southEast;
      case SideOfTheWorld.south:
        return tr.units.sideOfTheWorld.name.south;
      case SideOfTheWorld.southWest:
        return tr.units.sideOfTheWorld.name.southWest;
      case SideOfTheWorld.west:
        return tr.units.sideOfTheWorld.name.west;
      case SideOfTheWorld.northWest:
        return tr.units.sideOfTheWorld.name.northWest;
    }
  }
}
