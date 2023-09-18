import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/const/app_colors.dart';
import 'package:weather_today/ui/utils/image_helper.dart';
import 'package:weather_today/utils/logger/all_observers.dart';

import '../../../shared/appbar_widget.dart';
import 'country_flags_page_controller.dart';

const double _inset = 8.0;

@RoutePage()
class CountryFlagsPage extends ConsumerWidget with UiLoggy {
  const CountryFlagsPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    loggy.info('build');

    // [[countryCode, countryName], ...]
    final List<List<String>> countries =
        ref.watch(CountryFlagsPageController.instance).getCountries();

    final t = ref.watch(CountryFlagsPageController.tr);

    return Scaffold(
      appBar: RAppBar(t.flagsPage.appbarTitle),
      body: GridView.custom(
        padding: const EdgeInsets.all(_inset),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1,
          crossAxisSpacing: _inset,
          mainAxisSpacing: _inset,
        ),
        childrenDelegate: SliverChildBuilderDelegate(
          (_, int index) {
            return _TileCountryWidget(countries[index][0], countries[index][1]);
          },
          childCount: countries.length,
        ),
      ),
    );
  }
}

class _TileCountryWidget extends ConsumerWidget {
  const _TileCountryWidget(this.countryCode, this.countryName);

  final String countryCode;
  final String countryName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.of(context).cardColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.of(context).cardBorderColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(_inset / 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.0,
              child: Center(
                child: ImageHelper.getFlagIcon(countryCode),
              ),
            ),
            const SizedBox(height: 5.0),
            Column(
              children: [
                Text(countryCode),
                Text(
                  countryName,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
