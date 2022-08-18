import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:weather_today/core/models/place/place_model.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/ui/pages/settings_page/saved_places_page/saved_places_page_controller.dart';
import 'package:weather_today/ui/shared/constant_todo.dart';
import 'package:weather_today/ui/shared/tips_widget.dart';
import 'package:weather_today/ui/shared/wrap_body_with_search_bar.dart';

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
            : Column(
                children: [
                  const TipRWidget(
                    text: Text('ℹ️ Нажмите, чтобы узнать больше.\n'
                        '📌 Удерживайте, чтобы установить.'),
                  ),
                  Expanded(
                    child: ListView.separated(
                      physics: ref.watch(AppTheme.scrollPhysics).scrollPhysics,
                      separatorBuilder: (BuildContext context, int index) {
                        return const Divider(
                          height: 5.0,
                        );
                      },
                      itemBuilder: (BuildContext context, int index) {
                        return _TileFoundedWidget(listPlaces[index]);
                      },
                      itemCount: listPlaces.length,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class _TileFoundedWidget extends ConsumerWidget {
  const _TileFoundedWidget(this.place);

  // this.index);

  final Place place;

  // final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final SavedPlace sPlace =
    //     ref.watch(model.savedPlaces.select((list) => list[index]));

    final bool isSelected =
        ref.watch(SavedPlacesPageController.pr).isCurrentPlace(place);

    // final ValueNotifier<bool> isExpanded = useState(false);

    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onLongPress: () async =>
            ref.read(SavedPlacesPageController.pr).selectPlace(place),
        child: Card(
          color: isSelected ? colorScheme.primaryContainer : theme.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(
              color: colorScheme.onPrimaryContainer,
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
    final String title =
        ref.watch(SavedPlacesPageController.pr).getTitle(place);

    final String code = Localizations.localeOf(context).languageCode;
    final String subtitle =
        ref.watch(SavedPlacesPageController.pr).getSubtitle(place, code);

    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: place.countryCode == null
          ? null
          : IconButton(
              icon: AppImages.getFlagIcon(place.countryCode!.toLowerCase()),
              onPressed: () {
                ref
                    .read(SavedPlacesPageController.pr)
                    .dialogSeeFlag(context, place);
              },
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: Colors.black12)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
