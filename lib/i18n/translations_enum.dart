import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';

extension PressureTr on Pressure {
  String get abbrTr {
    switch (this) {
      case Pressure.hectoPa:
        return t.units.pressure.abbr.hectoPa;
      case Pressure.mbar:
        return t.units.pressure.abbr.mbar;
      case Pressure.mmHg:
        return t.units.pressure.abbr.mmHg;
      case Pressure.kPa:
        return t.units.pressure.abbr.kPa;
      case Pressure.atm:
        return t.units.pressure.abbr.atm;
      case Pressure.inHg:
        return t.units.pressure.abbr.inHg;
      default:
        return '';
    }
  }

  String get nameTr {
    switch (this) {
      case Pressure.hectoPa:
        return t.units.pressure.name.hectoPa;
      case Pressure.mbar:
        return t.units.pressure.name.mbar;
      case Pressure.mmHg:
        return t.units.pressure.name.mmHg;
      case Pressure.kPa:
        return t.units.pressure.name.kPa;
      case Pressure.atm:
        return t.units.pressure.name.atm;
      case Pressure.inHg:
        return t.units.pressure.name.inHg;
      default:
        return '';
    }
  }
}

extension SpeedTr on Speed {
  String get abbrTr {
    switch (this) {
      case Speed.ms:
        return t.units.speed.abbr.ms;
      case Speed.mph:
        return t.units.speed.abbr.mph;
      case Speed.kph:
        return t.units.speed.abbr.kph;
      default:
        return '';
    }
  }
}

extension SideOfTheWorldTr on SideOfTheWorld {
  String get abbrTr {
    switch (this) {
      case SideOfTheWorld.north:
        return t.units.sideOfTheWorld.abbr.north;
      case SideOfTheWorld.northEast:
        return t.units.sideOfTheWorld.abbr.northEast;
      case SideOfTheWorld.east:
        return t.units.sideOfTheWorld.abbr.east;
      case SideOfTheWorld.southEast:
        return t.units.sideOfTheWorld.abbr.southEast;
      case SideOfTheWorld.south:
        return t.units.sideOfTheWorld.abbr.south;
      case SideOfTheWorld.southWest:
        return t.units.sideOfTheWorld.abbr.southWest;
      case SideOfTheWorld.west:
        return t.units.sideOfTheWorld.abbr.west;
      case SideOfTheWorld.northWest:
        return t.units.sideOfTheWorld.abbr.northWest;
      default:
        return '';
    }
  }

  String get nameAdjTr {
    switch (this) {
      case SideOfTheWorld.north:
        return t.units.sideOfTheWorld.nameAdj.north;
      case SideOfTheWorld.northEast:
        return t.units.sideOfTheWorld.nameAdj.northEast;
      case SideOfTheWorld.east:
        return t.units.sideOfTheWorld.nameAdj.east;
      case SideOfTheWorld.southEast:
        return t.units.sideOfTheWorld.nameAdj.southEast;
      case SideOfTheWorld.south:
        return t.units.sideOfTheWorld.nameAdj.south;
      case SideOfTheWorld.southWest:
        return t.units.sideOfTheWorld.nameAdj.southWest;
      case SideOfTheWorld.west:
        return t.units.sideOfTheWorld.nameAdj.west;
      case SideOfTheWorld.northWest:
        return t.units.sideOfTheWorld.nameAdj.northWest;
      default:
        return '';
    }
  }

  String get nameTr {
    switch (this) {
      case SideOfTheWorld.north:
        return t.units.sideOfTheWorld.name.north;
      case SideOfTheWorld.northEast:
        return t.units.sideOfTheWorld.name.northEast;
      case SideOfTheWorld.east:
        return t.units.sideOfTheWorld.name.east;
      case SideOfTheWorld.southEast:
        return t.units.sideOfTheWorld.name.southEast;
      case SideOfTheWorld.south:
        return t.units.sideOfTheWorld.name.south;
      case SideOfTheWorld.southWest:
        return t.units.sideOfTheWorld.name.southWest;
      case SideOfTheWorld.west:
        return t.units.sideOfTheWorld.name.west;
      case SideOfTheWorld.northWest:
        return t.units.sideOfTheWorld.name.northWest;
      default:
        return '';
    }
  }
}
