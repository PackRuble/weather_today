import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_today/const/key_store.dart';

import '../../../utils/logger/db_logger.dart';
import '../../../utils/same_types.dart';
import 'interface/i_data_base.dart';

/// Модель для связи настроек компонентов приложения с SharedPreferences.
class DataBasePrefs with DbLoggy implements IDataBase {
  DataBasePrefs();

  late final SharedPreferences _prefs;

  @override
  Future<void> init() async => _prefs = await SharedPreferences.getInstance();

  /// Загрузка значений из [SharedPreferences] используя key из [Store] с некоторым компромиссом... тодо
  /// Учитываем, что первоначальные значения
  @override
  Future<T> load<T>(String key, T defaultValue) async {
    T value;

    try {
      value = _prefs.get(key) as T;
    } catch (e, s) {
      loggy.warning(
          'Not loaded for key: *$key*! Has been loaded the defaultValue: *$defaultValue* | type value: *$T*',
          e);
      return defaultValue;
    }

    loggy.info(
        'LOADED --> key: *$key*, value: *$value* | type value: *$T* | defaultValue: *$defaultValue*');
    return value;
  }

  /// Save a setting in [SharedPreferences], using `key` as its storage key.
  @override
  Future<void> save<T>(String key, T value) async {
    try {
      if (sameTypes<T, bool>()) {
        await _prefs.setBool(key, value as bool);
        return;
      }

      if (sameTypes<T, int>()) {
        await _prefs.setInt(key, value as int);
        return;
      }

      if (sameTypes<T, double>()) {
        await _prefs.setDouble(key, value as double);
        return;
      }

      if (sameTypes<T, String>()) {
        await _prefs.setString(key, value as String);
        return;
      }

      if (sameTypes<T, List<String>>()) {
        await _prefs.setStringList(key, value as List<String>);
        return;
      }

      if (value is Enum) {
        await _prefs.setInt(key, value.index);
        return;
      }
    } catch (e, s) {
      loggy.error(
          'Not saved --> key: *$key* | value: *$value* | type value: *$T*',
          e,
          s);
      return;
    } finally {
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