import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/domain/services/local_storage/interface/data_base.dart';

// coldfix:
//  * rename class
//  * delete dead code
//  *

/// Полезные методы обновления провайдеров и дб.
mixin Updater {
  @visibleForOverriding
  Ref get ref;

  @visibleForOverriding
  DataBase get db;

  /// Метод обновления провайдеров с состоянием.
  @protected
  void update<S>(StateProvider<S> pr, S value) =>
      ref.read(pr.notifier).update((_) => value);

  /// Метод асинхронной загрузки данных из бд.
  @protected
  Future<V> loadDb<V>(String key, V defaultValue) async =>
      db.load(key, defaultValue);

  /// Метод асинхронного сохранения данных в бд.
  @protected
  Future<void> saveDb<T>(String key, T value) async => db.save(key, value);

  /// Метод обновления провайдера и сохранения нового значения в бд.
  ///
  /// Для простых случаев, когда состояние провайдера совпадает со значением,
  /// допустимым для сохранения в бд.
  @protected
  Future<void> saveAndUpdate<S>(
    StateProvider<S> pr,
    String key,
    S value,
  ) async {
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
  @protected
  Future<void> loadAndUpdate<S, V>(
    StateProvider<S> pr,
    String key,
    V defaultValue, [
    S Function(V)? conversion,
  ]) async {
    final V loaded = await loadDb<V>(key, defaultValue);
    update<S>(pr, conversion == null ? loaded as S : conversion(loaded));
  }

  @protected
  S getState<S>(StateProvider<S> pr) => ref.read(pr);
}
