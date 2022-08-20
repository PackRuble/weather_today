import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/const/app_insets.dart';
import 'package:weather_today/core/controllers/saved_places_provider.dart';
import 'package:weather_today/core/models/place/place_model.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/ui/const/dialogs.dart';
import 'package:weather_today/ui/feature/search_widget_feature/models/search_state.dart';
import 'package:weather_today/ui/feature/search_widget_feature/search_widget_controller.dart';

import '../../shared/constant_todo.dart';

/// Виджет поиска в верхней части экрана. Используется для поиска мест.
class SearchWidget extends ConsumerWidget with UiLoggy {
  const SearchWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    loggy.debug('build');

    final model = ref.watch(SearchWidgetController.pr);

    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;

    final Color? barrierColor = ModalRoute.of(context)?.barrierColor;

    return FloatingSearchBar(
      accentColor: colorScheme.primary,
      backgroundColor: theme.scaffoldBackgroundColor,
      shadowColor: theme.appBarTheme.shadowColor,
      backdropColor: barrierColor,
      controller: SearchWidgetController.controller,
      title: const _TitleSearch(),
      hint: 'Введите название места',
      borderRadius: const BorderRadius.all(Radius.circular(6)),
      border: BorderSide(color: colorScheme.primary),
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: ref.watch(AppTheme.scrollPhysics).scrollPhysics,
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      margins: EdgeInsets.only(
        top: MediaQuery.of(context).viewPadding.top +
            AppInsets.aroundPaddingSearchBar,
      ),
      height: AppInsets.heightSearchBar,
      width: isPortrait
          ? widthScreen - AppInsets.aroundPaddingSearchBar * 2
          : widthScreen - AppInsets.aroundPaddingSearchBar * 4,
      progress: ref.watch(SearchWidgetController.progress),
      debounceDelay:
          Duration(milliseconds: SearchWidgetController.debounceDelay),
      clearQueryOnClose: true,
      onQueryChanged: (String query) async => model.newRequest(query),
      onSubmitted: (String query) async => model.newRequest(query),
      onFocusChanged: (bool isFocus) => model.changeFocus(isFocus),
      transition: CircularFloatingSearchBarTransition(),
      automaticallyImplyBackButton: false,
      leadingActions: [
        FloatingSearchBarAction.icon(
          showIfOpened: false,
          icon: const Icon(Icons.place),
          onTap: () {},
        ),
      ],
      actions: [
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
        FloatingSearchBarAction.icon(
          showIfClosed: false,
          showIfOpened: true,
          icon: const Icon(Icons.info_outline_rounded),
          onTap: () => showDialogPlaceSearchInfo(context),
        )
      ],
      builder: (_, __) {
        return const _SearchBodyWidget();
      },
    );
  }
}

class _TitleSearch extends ConsumerWidget {
  const _TitleSearch();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Place place = ref.watch(SearchWidgetController.currentPlace);

    final String languageCode = Localizations.localeOf(context).languageCode;

    String title = '';
    if (place.countryCode != null) title += '${place.countryCode}';
    if (place.state != null) title += ', ${place.state}';
    if (place.countryCode?.toUpperCase() == languageCode.toUpperCase()) {
      if (place.localNames != null) {
        final String? localName =
            place.localNames![languageCodeReverse[languageCode]];
        if (localName != null) title += ', $localName';
      }
    } else {
      if (place.name != null) title += ', ${place.name}';
    }

    return Text(title);
  }
}

class _SearchBodyWidget extends ConsumerWidget {
  const _SearchBodyWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Material(
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: const [
            // LinearProgressIndicator(),
            _TipsWidget(),
            Divider(height: 1.0),
            _BodyTilesWidget(),
          ],
        ),
      ),
    );
  }
}

class _TipsWidget extends ConsumerWidget {
  const _TipsWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SearchState state = ref.watch(SearchWidgetController.searchState);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(state.tip),
    );
  }
}

class _BodyTilesWidget extends ConsumerWidget {
  const _BodyTilesWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Place> places =
        ref.watch(SearchWidgetController.searchState).displayedPlaces;
    places = List.of(places.take(5).toList());

    return Column(
      children: [
        for (final place in places) ...[
          _TileSearchWidget(place),
          const Divider(height: 1.0),
        ]
      ],
    );
  }
}

class _TileSearchWidget extends HookConsumerWidget {
  const _TileSearchWidget(this.place);

  final Place place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String languageCode = Localizations.localeOf(context).languageCode;

    final bool isSaved =
        ref.watch(savedPlacesController.notifier).isSavedPlace(place);

    final bool isCurrent =
        ref.watch(savedPlacesController.notifier).isCurrentPlace(place);

    String title = '';
    if (place.countryCode != null) title += '${place.countryCode}';
    if (place.state != null) title += ', ${place.state}';
    if (place.countryCode?.toUpperCase() == languageCode.toUpperCase()) {
      if (place.localNames != null) {
        title += ', ${place.localNames![languageCodeReverse[languageCode]]}';
      }
    } else {
      if (place.name != null) title += ', ${place.name}';
    }

    return ListTile(
      onTap: () =>
          ref.read(SearchWidgetController.pr).selectCurrentPlace(place),
      onLongPress: () {
        final SearchWidgetController model =
            ref.read(SearchWidgetController.pr);

        if (isSaved) {
          model.deletePlace(place);
        } else {
          // сохраняем
          model.addPlaceToSavedPlaces(place);
        }
      },
      leading: place.countryCode == null
          ? null
          : SizedBox(
              width: 25.0,
              child: Center(
                child: AppImages.getFlagIcon(place.countryCode!.toLowerCase()),
              ),
            ),
      title: Text(title),
      tileColor:
          isCurrent ? Theme.of(context).colorScheme.primaryContainer : null,
      trailing: isSaved ? const Icon(Icons.bookmark) : null,
    );
  }
}
