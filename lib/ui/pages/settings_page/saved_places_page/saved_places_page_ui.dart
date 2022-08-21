import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:weather_today/const/app_colors.dart';
import 'package:weather_today/const/app_icons.dart';
import 'package:weather_today/const/app_insets.dart';
import 'package:weather_today/core/models/place/place_model.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/ui/feature/search_widget_feature/search_widget_controller.dart';
import 'package:weather_today/ui/pages/settings_page/saved_places_page/saved_places_page_controller.dart';
import 'package:weather_today/ui/shared/tips_widget.dart';
import 'package:weather_today/ui/shared/wrap_body_with_search_bar.dart';
import 'package:weather_today/ui/utils/image_helper.dart';

import '../../../utils/correct_show_place.dart';

// todo tr

/// Страница сохраненных мест.
///
/// Есть возможность:
/// * удалить места;
/// * добавить места;
/// * добавить заметку к каждому месту;
/// * посмотреть на флаг;
/// * посмотреть некоторые характеристики места;
class SavedPlacesPage extends ConsumerWidget with UiLoggy {
  const SavedPlacesPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    loggy.debug('build');

    final List<Place> listPlaces =
        ref.watch(SavedPlacesPageController.savedPlaces);

    return Scaffold(
      body: WrapperBodyWithFSBar(
        body: listPlaces.isEmpty
            ? const Center(child: Text('Сохраненных местоположений не найдено'))
            : ListView.separated(
                physics: ref.watch(AppTheme.scrollPhysics).scrollPhysics,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(
                    height: 5.0,
                  );
                },
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      if (index == 0)
                        const TipRWidget(
                          text: Text('${AppSmiles.info} ' +
                              'Нажмите, чтобы узнать больше.\n'
                                  '${AppSmiles.pinned} ' +
                              'Удерживайте, чтобы установить.'),
                        ),
                      _TileFoundedWidget(listPlaces[index]),
                    ],
                  );
                },
                itemCount: listPlaces.length,
              ),
      ),
    );
  }
}

class _TileFoundedWidget extends ConsumerWidget {
  const _TileFoundedWidget(this.place);

  final Place place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Place curPlace = ref.watch(SearchWidgetController.currentPlace);

    final bool isSelected = curPlace == place;

    final AppColors colors = AppColors.of(context);

    return Padding(
      padding: const EdgeInsets.all(AppInsets.allPadding),
      child: GestureDetector(
        onLongPress: () async =>
            ref.read(SavedPlacesPageController.pr).selectPlace(place),
        child: Card(
          color: isSelected ? colors.selectedCard : colors.card,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppInsets.cornerRadiusCard),
            side: BorderSide(
              color: isSelected ? colors.selectedBorder : colors.border,
            ),
          ),
          margin: EdgeInsets.zero,
          child: ExpandablePanel(
            theme: const ExpandableThemeData(
              headerAlignment: ExpandablePanelHeaderAlignment.center,
              tapHeaderToExpand: true,
              tapBodyToExpand: false,
              tapBodyToCollapse: false,
              hasIcon: false,
            ),
            controller: ExpandableController(
                // initialExpanded: isExpanded.value
                ),
            header: _HeaderWidget(place),
            collapsed: const SizedBox.shrink(),
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
    final String title = CorrectShowPlace.getCountryCodeAndState(place) ?? '';

    final String languageCode = Localizations.localeOf(context).languageCode;

    final String subtitle =
        CorrectShowPlace.getLocalNameOrName(place, languageCode) ?? '';

    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: place.countryCode == null
          ? null
          : IconButton(
              icon: ImageHelper.getFlagIcon(place.countryCode ?? ''),
              onPressed: () => ref
                  .read(SavedPlacesPageController.pr)
                  .dialogSeeFlag(context, place),
            ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () async => ref
            .read(SavedPlacesPageController.pr)
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
    final Place curPlace = ref.watch(SearchWidgetController.currentPlace);

    final bool isSelected = curPlace == place;

    final AppColors colors = AppColors.of(context);

    return Padding(
      padding: const EdgeInsets.all(AppInsets.allPadding),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppInsets.cornerRadiusCard),
            border: Border.all(
                color: isSelected ? colors.selectedBorder : colors.border)),
        child: Padding(
          padding: const EdgeInsets.all(AppInsets.allPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5.0),
              Text('Широта: ${place.latitude}'),
              const SizedBox(height: 5.0),
              Text('Долгота: ${place.longitude}'),
              const SizedBox(height: 5.0),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(place.note ?? 'Заметка...'),
                  ),
                  Center(
                    child: IconButton(
                      icon: const Icon(Icons.edit),
                      onPressed: () async => ref
                          .read(SavedPlacesPageController.pr)
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
