import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/core/controllers/weather_onecall_controller.dart';
import 'package:weather_today/core/controllers/weather_provider.dart';
import 'package:weather_today/core/services/local_db/local_db_manager.dart';

class DailyPageController {
  DailyPageController(this._reader);

  final Reader _reader;

  /// Погода ONE_CALL на 7 дней [WeatherDaily].
  static final daily = Provider.autoDispose<AsyncValue<List<WeatherDaily>?>>((ref) {
    final AsyncValue<WeatherOneCall?> asyncWeather =
        ref.watch(WeatherOneCallController.weatherOneCall);

    if (asyncWeather.isRefreshing || asyncWeather.isLoading) {
      return const AsyncValue.loading();
    }

    return AsyncValue.data(asyncWeather.value?.daily);
  });

  /// Единицы измерения скорости.
  static final speedUnits = Provider<Speed>((ref) => ref.watch(DbWeatherManager.speedUnits));

  /// Единицы измерения температуры.
  static final tempUnits = Provider<Temp>((ref) => ref.watch(DbWeatherManager.tempUnits));

  /// экземпляр.
  static final pr = Provider<DailyPageController>((ref) {
    return DailyPageController(ref.read);
  });

  /// Обновление погоды.
  Future<void> updateWeather() async => _reader(WeatherController.pr).updateWeatherOneCall();
}
