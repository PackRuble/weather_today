/// Abstract interface for the App Settings used to read and save theme
/// properties.
abstract class IDataBase {
  /// ThemeService implementations may override this method to perform needed
  /// initialization and setup work.
  Future<void> init();

  /// Loads a setting from service, stored with `key` string.
  Future<T> load<T>(String key, T defaultValue);

  /// Save a setting to service, using `key` as its storage key.
  Future<void> save<T>(String key, T value);

  /// Завершается значением true после очистки всех записей из хранилища.
  Future<bool> clearAll();

  /// Удаляет запись из постоянного хранилища.
  Future<bool> clearKey(String key);
}
