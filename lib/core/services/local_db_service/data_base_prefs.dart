import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_today/utils/logger/all_observers.dart';
import 'package:weather_today/utils/same_types.dart';

import 'interface/i_data_base.dart';

/// The class allows access to [SharedPreferences].
class DataBasePrefs with DbLogger implements IDataBase {
  DataBasePrefs();

  late final SharedPreferences _prefs;

  @override
  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  /// Load values from [SharedPreferences] using the key from [DbStore].
  @override
  Future<T> load<T>(String key, T defaultValue) async {
    Object? value;
    try {
      if (sameTypes<T, List<String>>()) {
        value = _prefs.getStringList(key);
      } else {
        value = _prefs.get(key);
      }

      // значения ещё нет в бд
      if (value == null) {
        loggy.info(
            'For <$key> value is null, loaded the `defaultValue`: <$defaultValue>');
        return defaultValue;
      }

      if (kReleaseMode) {
        loggy.info('LOADED: [ key: <$key> | type: <$T> ]');
      } else {
        loggy.info('LOADED: [ key: <$key> | value: <$value> | type: <$T> ]');
      }

      return value as T;
    } catch (e, s) {
      loggy.error(
          'Not loaded for key: <$key>! Has been loaded the `defaultValue`: <$defaultValue> | type: <$T>',
          e,
          s);

      return defaultValue;
    }
  }

  /// Save a setting in [SharedPreferences], using key as its storage key [DbStore].
  @override
  Future<void> save<T>(String key, T value) async {
    Future<bool> _save() async {
      try {
        if (sameTypes<T, bool>()) {
          await _prefs.setBool(key, value as bool);
          return true;
        }

        if (sameTypes<T, int>()) {
          await _prefs.setInt(key, value as int);
          return true;
        }

        if (sameTypes<T, double>()) {
          await _prefs.setDouble(key, value as double);
          return true;
        }

        if (sameTypes<T, String>()) {
          await _prefs.setString(key, value as String);
          return true;
        }

        if (sameTypes<T, List<String>>()) {
          await _prefs.setStringList(key, value as List<String>);
          return true;
        }

        if (value is Enum) {
          await _prefs.setInt(key, value.index);
          return true;
        }

        throw Exception('Wrong type for saving to database');
      } catch (e, s) {
        if (kReleaseMode) {
          loggy.error('NOT Saved: [ key: <$key> | type: <$T> ]', e, s);
        } else {
          loggy.error(
              'NOT Saved: [ key: <$key> | value: <$value> | type: <$T> ]',
              e,
              s);
        }
        return false;
      }
    }

    if (await _save()) {
      if (kReleaseMode) {
        loggy.info('SAVED: [ key: <$key> | type: <$T> ]');
      } else {
        loggy.info('SAVED: [ key: <$key> | value: <$value>, | type: <$T> ]');
      }
    }
  }

  @override
  Future<bool> clearAll() async {
    if (await _prefs.clear()) {
      loggy.info(
          'The user storage has been cleared: [ AllKeys: ${_prefs.getKeys()} ]');
      return true;
    } else {
      loggy.error(
          'An error occurred while clearing the user storage: [ prefs: ${_prefs.toString()} ]');
      return false;
    }
  }

  @override
  Future<bool> clearKey(String key) async {
    if (await _prefs.remove(key)) {
      loggy.info(
          'The record has been deleted from the storage: [ key: <$key> | value: <${_prefs.get(key)}> ]');
      return true;
    } else {
      loggy.error(
          'Failed to delete a record from the storage: [ key: <$key> | value: <${_prefs.get(key)}> ]');
      return false;
    }
  }
}
