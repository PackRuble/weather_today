import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';

class RiverpodObserver extends ProviderObserver implements LoggyType {
  @override
  Loggy<RiverpodObserver> get loggy => Loggy<RiverpodObserver>('[Riverpod]');

  @override
  void didAddProvider(
    ProviderBase provider,
    Object? value,
    ProviderContainer container,
  ) {
    if (provider.name != null &&
        !(provider.name?.contains('.notifier') ?? false)) {
      return loggy.info('INIT: ${provider.name}'
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
      return loggy.info('UPD: ${provider.name}'
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
      return loggy.info('Dispose: ${provider.name}');
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
      return loggy.error('FAIL: ${provider.name}', [error, stackTrace]);
    }
  }
}
