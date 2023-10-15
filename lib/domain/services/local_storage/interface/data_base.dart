/// Abstract interface for the App Settings and user data.
abstract class DataBase {
  /// Implementations can override this method to perform
  /// the necessary initialization and configuration.
  Future<void> init();

  /// Loads a setting from service, stored with `key` string.
  Future<T> load<T>(String key, T defaultValue);

  /// Save a setting to service, using `key` as its storage key.
  Future<void> save<T>(String key, T value);

  /// Is there a key-value record in the storage.
  Future<bool> contains(String key);

  /// Ends with true after all records from storage are cleared.
  Future<bool> clearAll();

  /// Deletes the record from the permanent storage.
  Future<bool> clearKey(String key);
}
