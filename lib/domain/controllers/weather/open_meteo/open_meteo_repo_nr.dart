import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/data/open_meteo/open_meteo_repo.dart';

class OpenMeteoRepoNR extends Notifier<OpenMeteoRepo> {
  static final i = NotifierProvider<OpenMeteoRepoNR, OpenMeteoRepo>(
    OpenMeteoRepoNR.new,
    name: '$OpenMeteoRepoNR',
  );

  @override
  OpenMeteoRepo build() => const OpenMeteoRepo();
}
