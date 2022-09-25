import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

class RivLoggy extends ProviderObserver implements LoggyType {
  @override
  Loggy<RivLoggy> get loggy => Loggy<RivLoggy>('Riverpod Loggy');

  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    if (provider.name != null &&
        !(provider.name?.contains('.notifier') ?? false)) {
      return loggy.debug('INIT: ${provider.name}'
          '\n╔══'
          '\n║ value: $value'
          '\n╚══');
    }
  }

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (provider.name != null &&
        !(provider.name?.contains('.notifier') ?? false)) {
      return loggy.debug('UPD: ${provider.name}'
          '\n╔══'
          '\n║ previousValue: $previousValue'
          '\n║ newValue: $newValue'
          '\n╚══');
    }
  }

  /// A provider was disposed.
  @override
  void didDisposeProvider(
    ProviderBase provider,
    ProviderContainer container,
  ) {
    if (provider.name != null &&
        !(provider.name?.contains('.notifier') ?? false)) {
      return loggy.debug('Dispose: ${provider.name}');
    }
  }

  @override
  void providerDidFail(
    ProviderBase provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    if (provider.name != null) {
      return loggy.debug('FAIL: ${provider.name}', [error, stackTrace]);
    }
  }
}

Loggy<RivLoggy> get _rivLoggy => Loggy<RivLoggy>('Riverpod Loggy');

final void Function(dynamic, [Object?, StackTrace?]) rlogDebug =
    _rivLoggy.debug;
final void Function(dynamic, [Object?, StackTrace?]) rlogInfo = _rivLoggy.info;
final void Function(dynamic, [Object?, StackTrace?]) rlogWarning =
    _rivLoggy.warning;
final void Function(dynamic, [Object?, StackTrace?]) rlogError =
    _rivLoggy.error;
