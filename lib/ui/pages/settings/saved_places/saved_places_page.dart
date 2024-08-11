import 'package:auto_route/annotations.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/application/const/app_icons.dart';
import 'package:weather_today/application/const/app_insets.dart';
import 'package:weather_today/domain/controllers/weather_service_controllers.dart';
import 'package:weather_today/domain/models/place/place_model.dart';
import 'package:weather_today/ui/pages/settings/saved_places/saved_places_page_presenter.dart';
import 'package:weather_today/ui/shared/expandable_custom.dart';
import 'package:weather_today/utils/logger/all_observers.dart';

import '../../../shared/tips_widget.dart';
import '../../../shared/wrap_body_with_search_bar.dart';
import '../../../utils/metrics_helper.dart';

/// Страница сохраненных мест.
///
/// Есть возможность:
/// * удалить места;
/// * добавить места;
/// * добавить заметку к каждому месту;
/// * посмотреть на флаг;
/// * посмотреть некоторые характеристики места;
@RoutePage()
class SavedPlacesPage extends ConsumerWidget with UiLoggy {
  const SavedPlacesPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    loggy.debug('build');

    final t = ref.watch(SavedPlacesPagePresenter.tr);

    final List<Place> listPlaces =
        ref.watch(SavedPlacesPagePresenter.savedPlaces);

    return Scaffold(
      body: Stack(
        children: [
          WrapperBodyWithFSBar(
            body: listPlaces.isEmpty
                ? Center(child: Text(t.savedPlacesPage.placesNotFound))
                : ListView.separated(
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 5.0,
                      );
                    },
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          if (index == 0)
                            TipRWidget(
                              text: Text(
                                  '${AppSmiles.info} ${t.savedPlacesPage.tips.clickToMore}\n'
                                  '${AppSmiles.pinned} ${t.savedPlacesPage.tips.holdToSet}'),
                            ),
                          _TileFoundedWidget(listPlaces[index]),
                          if (index == listPlaces.length - 1)
                            const SizedBox(height: 50.0)
                        ],
                      );
                    },
                    itemCount: listPlaces.length,
                  ),
          ),
          if (defaultTargetPlatform == TargetPlatform.windows ||
              defaultTargetPlatform == TargetPlatform.linux ||
              defaultTargetPlatform == TargetPlatform.macOS)
            const Align(
              alignment: Alignment.bottomLeft,
              child: BackButton(),
            )
        ],
      ),
    );
  }
}

class _TileFoundedWidget extends ConsumerWidget {
  const _TileFoundedWidget(this.place);

  final Place place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Place curPlace = ref.watch(WeatherServices.currentPlace);

    final bool isSelected = curPlace == place;

    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(AppInsets.allPadding),
      child: GestureDetector(
        onLongPress: () async =>
            ref.read(SavedPlacesPagePresenter.instance).selectPlace(place),
        child: Card(
          color: isSelected
              ? colors.secondary.blend(colors.surface, 40)
              : theme.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppInsets.cornerRadiusCard),
            side: BorderSide(
              color: colors.primaryContainer,
              width: isSelected ? 1.8 : 1.0,
            ),
          ),
          margin: EdgeInsets.zero,
          child: ExpPanel(
            hasIcon: true,
            header: _HeaderWidget(place),
            expanded: _ExpandedWidget(place),
          ),
        ),
      ),
    );
  }
}

class _HeaderWidget extends ConsumerWidget {
  const _HeaderWidget(this.place);

  final Place place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String title =
        MetricsHelper.getCountryCodeAndStateOrName(place) ?? '';

    final String languageCode = Localizations.localeOf(context).languageCode;

    final String subtitle =
        MetricsHelper.getLocalNameOrName(place, languageCode) ?? '';

    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async => ref
            .read(SavedPlacesPagePresenter.instance)
            .dialogAfterDeletingPlace(context, place),
      ),
    );
  }
}

class _ExpandedWidget extends ConsumerWidget {
  const _ExpandedWidget(this.place);

  final Place place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.read(SavedPlacesPagePresenter.tr);

    final Place curPlace = ref.watch(WeatherServices.currentPlace);

    // ignore: unused_local_variable
    final bool isSelected = curPlace == place;

    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(AppInsets.allPadding),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppInsets.cornerRadiusCard),
            border: Border.all(color: colors.primaryContainer)),
        child: Padding(
          padding: const EdgeInsets.all(AppInsets.allPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5.0),
              Text('${t.savedPlacesPage.latitude}: ${place.latitude}'),
              const SizedBox(height: 5.0),
              Text('${t.savedPlacesPage.longitude}: ${place.longitude}'),
              const SizedBox(height: 5.0),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(place.note ?? t.savedPlacesPage.emptyNote),
                  ),
                  Center(
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () async => ref
                          .read(SavedPlacesPagePresenter.instance)
                          .dialogMakeNote(context, place),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5.0),
            ],
          ),
        ),
      ),
    );
  }
}
