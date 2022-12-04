import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_today/const/key_store.dart';

import '../../../utils/logger/_observers/db_logger.dart';
import '../../../utils/same_types.dart';
import 'interface/i_data_base.dart';

/// Модель для связи настроек компонентов приложения с SharedPreferences.
class DataBasePrefs with DbLogger implements IDataBase {
  DataBasePrefs();

  late final SharedPreferences _prefs;

  @override
  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  /// Загрузка значений из [SharedPreferences] используя key из [DbStore].
  @override
  Future<T> load<T>(String key, T defaultValue) async {
    Object? value;
    try {
      if (sameTypes<T, List<String>>()) {
        value = _prefs.getStringList(key) as T?;
      } else {
        // простые типы не нуждаются в cast
        // coldfix: добавить проверку других типов, если необходимо
        value = _prefs.get(key);
      }

      // значения ещё нет в бд, либо проблемы с cast
      if (value == null) {
        loggy.info(
            'For *$key* value is null, loaded the Default: *$defaultValue*');
        return defaultValue;
      }

      loggy.info('LOADED --> key: *$key*, value: *$value* | type value: *$T*');
      return value as T;
    } catch (e, s) {
      loggy.error(
          'Not loaded for key: *$key*! Has been loaded the defaultValue: *$defaultValue* | type value: *$T*',
          e,
          s);
      return defaultValue;
    }
  }

  /// Save a setting in [SharedPreferences], using `key` as its storage key.
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
        loggy.error(
            'Not saved --> key: *$key* | value: *$value* | type value: *$T*',
            e,
            s);
        return false;
      }
    }

    if (await _save()) {
      loggy.info('SAVED --> key: *$key* | value: *$value*, | type value: *$T*');
    }
  }

  @override
  Future<bool> clearAll() async {
    if (await _prefs.clear()) {
      loggy.info(
          'The user storage has been cleared. | prefs: ${_prefs.toString()}|');
      return true;
    }

    loggy.error(
        'An error occurred while clearing the user storage. | prefs: ${_prefs.toString()}|');
    return false;
  }

  @override
  Future<bool> clearKey(String key) async {
    if (await _prefs.remove(key)) {
      loggy.info(
          'The record has been deleted from the storage. | key: *$key* | | prefs: ${_prefs.toString()}|');
      return true;
    }

    loggy.error(
        'Failed to delete a record from the storage. | key: *$key* | | prefs: ${_prefs.toString()}|');
    return false;
  }
}
