import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/core/services/local_db_service/interface/i_data_base.dart';

/// Полезные методы обновления провайдеров и дб.
mixin Updater {
  Reader get reader;

  IDataBase get db;

  /// Метод обновления провайдеров с состоянием.
  void update<S>(StateProvider<S> pr, S value) {
    // print('pr: $pr || S: $S || reader: $reader');
    reader(pr.notifier).update((_) => value);
  }

  /// Метод асинхронной загрузки данных из бд.
  Future<V> loadDb<V>(String key, V defaultValue) async =>
      db.load(key, defaultValue);

  /// Метод асинхронного сохранения данных в бд.
  Future<void> saveDb<T>(String key, T value) async => db.save(key, value);

  /// Метод обновления провайдера и сохранения нового значения в бд.
  ///
  /// Для простых случаев, когда состояние провайдера совпадает со значением,
  /// допустимым для сохранения в бд.
  Future<void> saveAndUpdate<S>(
      StateProvider<S> pr, String key, S value) async {
    update<S>(pr, value);
    await saveDb<S>(key, value);
  }

  // /// Метод обновления провайдера и сохранения нового значения в бд.
  // /// Сложный метод решил оставить.
  // Future<void> saveAndUpdate<S, V>(StateProvider<S> pr, String key, V value,
  //     {S Function(V)? conversion, bool isWait = true}) async {
  //
  //
  //   conversion == null
  //       ? update<S>(pr, value as S)
  //       : update<S>(pr, conversion(value));
  //
  //   isWait ? await saveDb(key, value) : saveDb(key, value);
  // }

  /// Удобное обновление состояния провайдеров асинхронным значением.
  Future<void> loadAndUpdate<S, V>(
      StateProvider<S> pr, String key, V defaultValue,
      [S Function(V)? conversion]) async {
    // print(
    //     'pr: $pr || S: $S || V: $V|| reader: $reader || conversion: $conversion');
    final V loaded = await loadDb<V>(key, defaultValue);
    update<S>(pr, conversion == null ? loaded as S : conversion(loaded));
  }

  S getState<S>(StateProvider<S> pr) => reader(pr);
}
