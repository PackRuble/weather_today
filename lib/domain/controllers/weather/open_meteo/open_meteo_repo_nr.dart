import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/data/open_meteo/open_meteo_repo.dart';

class OpenMeteoRepoPR extends Notifier<OpenMeteoRepo> {
  static final i = NotifierProvider<OpenMeteoRepoPR, OpenMeteoRepo>(
    OpenMeteoRepoPR.new,
    name: '$OpenMeteoRepoPR',
  );

  @override
  OpenMeteoRepo build() => const OpenMeteoRepo();
}
