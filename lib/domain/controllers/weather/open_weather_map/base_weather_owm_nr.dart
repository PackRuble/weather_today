// ignore_for_file: avoid_public_notifier_properties, join_return_with_assignment
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';
import 'package:weather_today/domain/services/cardoteka/weather_storage.dart';
import 'package:weather_today/domain/services/local_storage/data_base_controller.dart';
import 'package:weather_today/domain/services/local_storage/interface/data_base.dart';

import '../weather_nr.dart';

/// Allowed for OneCall API, пакет - Free:
/// * 1,000 calls/day
/// * 30,000 calls/month
///
/// Allowed for Weather API, пакет - Free:
/// * 60 calls/minute
/// * 1,000,000 calls/month
///
abstract class BaseWeatherOwmNR<T> extends WeatherNR<T> {
  @protected
  DataBase get db => ref.read(dbService);

  /// Weather request service.
  late WeatherService weatherService;

  /// Access to local weather storage.
  @protected
  WeatherStorage get weatherStorage => _weatherStorage;

  late WeatherStorage _weatherStorage;

  /// Implementations of this method should end with a call to the inherited
  /// method, as in `super.build()`.
  @override
  @mustCallSuper
  FutureOr<T?> build() async {
    _weatherStorage = ref.watch(WeatherStorage.instance);

    ref.listen(
      WeatherServices.weatherService,
      (_, next) => weatherService = next,
      fireImmediately: true,
    );

    return super.build();
  }

  @override
  FutureOr<void> whenUpdateNotAllowed() {
    messagesNR.sUpdateWeatherNotAllowed();
  }
}
