import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:weather_today/application/const/app_colors.dart';
import 'package:weather_today/application/const/app_icons.dart';
import 'package:weather_today/application/const/app_insets.dart';
import 'package:weather_today/domain/controllers/app_theme/controller/app_theme_controller.dart';
import 'package:weather_today/domain/controllers/saved_places_provider.dart';
import 'package:weather_today/domain/models/place/place_model.dart';
import 'package:weather_today/ui/dialogs/app_dialogs.dart';
import 'package:weather_today/ui/shared/tips_widget.dart';
import 'package:weather_today/utils/logger/all_observers.dart';

import '../../utils/metrics_helper.dart';
import 'search_widget_notifier.dart';

/// Виджет поиска в верхней части экрана. Используется для поиска мест.
class SearchWidget extends ConsumerWidget with UiLoggy {
  const SearchWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    loggy.debug('build');

    final t = ref.watch(SearchWidgetNotifier.tr);

    final widthScreen = MediaQuery.sizeOf(context).width;

    final Color? barrierColor = ModalRoute.of(context)?.barrierColor;
    final AppColors colors = AppColors.of(context);
    final isLight = colors.isLight;

    return FloatingSearchBar(
      implicitDuration: Duration.zero,
      accentColor: colors.accentColorSearchbar,
      backgroundColor: colors.backgroundColorSearchbar,
      shadowColor: colors.shadowColorSearchbar,
      backdropColor: barrierColor,
      controller: ref.watch(SearchWidgetNotifier.controllerBarProvider),
      title: const _TitleSearch(),
      hint: t.searchBar.hintTextField,
      borderRadius:
          const BorderRadius.all(Radius.circular(AppInsets.cornerRadiusCard)),
      border: BorderSide(color: colors.borderColorSearchbar),
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      axisAlignment: 0.0,
      openAxisAlignment: 0.0,
      margins: EdgeInsets.only(
        top: MediaQuery.viewPaddingOf(context).top +
            AppInsets.aroundPaddingSearchBar,
      ),
      height: AppInsets.heightSearchBar,
      width: widthScreen - AppInsets.aroundPaddingSearchBar * 2,
      debounceDelay: Duration(milliseconds: SearchWidgetNotifier.debounceDelay),
      clearQueryOnClose: true,
      onQueryChanged: (String query) async =>
          ref.read(searchWidgetProvider.notifier).newRequest(query),
      onSubmitted: (String query) async =>
          ref.read(searchWidgetProvider.notifier).newRequest(query),
      // onFocusChanged: (bool isFocus) =>
      //     ref.read(searchWidgetProvider.notifier).changeFocus(isFocus),
      transition: CircularFloatingSearchBarTransition(),
      automaticallyImplyBackButton: false,
      leadingActions: [
        IgnorePointer(
          ignoring: true,
          child: FloatingSearchBarAction.icon(
            showIfOpened: false,
            icon: const Icon(Icons.place),
            onTap: () {},
          ),
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
          onTap: () async => AppDialogs.placeSearchInfo(context),
        ),
        _SavedBookmarkAction(),
        FloatingSearchBarAction.icon(
          showIfClosed: true,
          showIfOpened: false,
          icon: Icon(
            isLight ? Icons.light_mode_rounded : Icons.nightlight_round,
            color: colors.scheme.primary,
          ),
          onTap: () async => ref
              .read(AppTheme.instance)
              .setThemeMode(isLight ? ThemeMode.dark : ThemeMode.light),
        ),
      ],
      builder: (_, __) {
        return const _SearchBodyWidget();
      },
    );
  }
}

/// Красивая закладка подсказывает, есть ли текущее место в избранных.
///
/// Это необходимо было сделать так, чтобы
/// * сохранить некоторые важные функции SearchBar.
/// * перерисовывать только эту кнопку при обновлениях закладки.
///
/// Где-то в недрах пакета [material_floating_search_bar] есть проверка *is FloatingSearchBarAction*,
/// тогда обычный ConsumerWidget не подошёл бы.
class _SavedBookmarkAction extends FloatingSearchBarAction {
  _SavedBookmarkAction()
      : super(
          child: const SizedBox.shrink(),
          builder: (_, __) => const SizedBox.shrink(),
        );

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final Place currentPlace = ref.watch(SearchWidgetNotifier.currentPlace);

        final bool isCurrentPlaceSaved = ref
            .watch(savedPlacesController.notifier)
            .isSavedPlace(currentPlace);

        /// необходимо для отслеживания [isCurrentPlaceSaved]
        ref.watch(savedPlacesController);

        return FloatingSearchBarAction(
          showIfClosed: true,
          showIfOpened: false,
          child: CircularButton(
            icon: Icon(isCurrentPlaceSaved
                ? AppIcons.savedPlaceBookmark
                : AppIcons.notSavedPlaceBookmark),
            onPressed: () async => ref
                .read(searchWidgetProvider.notifier)
                .changePlaceToSavedPlaces(isCurrentPlaceSaved, currentPlace),
          ),
        );
      },
    );
  }
}

class _TitleSearch extends ConsumerWidget {
  const _TitleSearch();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Place place = ref.watch(SearchWidgetNotifier.currentPlace);

    final String languageCode = Localizations.localeOf(context).languageCode;

    final String title =
        MetricsHelper.getCountryCodeAndNameOrName(place, languageCode) ??
            'Ghost-town';

    return Text(title);
  }
}

class _SearchBodyWidget extends ConsumerWidget {
  const _SearchBodyWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(SearchWidgetNotifier.tr);

    final searchBody = ref.watch(searchWidgetProvider);

    final String _baseTooltip =
        '${AppSmiles.pinned} ${t.searchBar.tips.holdToAction}\n'
        '${AppSmiles.set} ${t.searchBar.tips.clickToSet}\n';

    final AppColors colors = AppColors.of(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(AppInsets.cornerRadiusCard),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppInsets.cornerRadiusCard),
          side: BorderSide(color: colors.borderColorSearchbar),
        ),
        elevation: 4.0,
        child: searchBody.when(
          saved: (List<Place> saved) {
            if (saved.isEmpty) {
              return _TipWidget(t.searchBar.tips.notSavedPlaces);
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _TipWidget(
                    '$_baseTooltip \n${t.searchBar.tips.showSavedPlaces}'),
                const Divider(height: 1.0),
                _BodyTilesWidget(saved),
              ],
            );
          },
          found: (List<Place> founded) {
            if (founded.isEmpty) {
              return _TipWidget(t.searchBar.tips.notFoundedPlaces);
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                _TipWidget(
                    '$_baseTooltip \n${t.searchBar.tips.showFoundedPlaces}'),
                const Divider(height: 1.0),
                _BodyTilesWidget(founded),
              ],
            );
          },
          loading: () => const LinearProgressIndicator(),
          error: () => Text(t.searchBar.tips.searchError),
        ),
      ),
    );
  }
}

class _TipWidget extends ConsumerWidget {
  const _TipWidget(this.tip);

  final String tip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TipRWidget(
      text: Text(tip),
    );
  }
}

class _BodyTilesWidget extends ConsumerWidget {
  const _BodyTilesWidget(this.places);

  final List<Place> places;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

class _TileSearchWidget extends ConsumerWidget {
  const _TileSearchWidget(this.place);

  final Place place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Place curPlace = ref.watch(SearchWidgetNotifier.currentPlace);

    final String languageCode = Localizations.localeOf(context).languageCode;

    final bool isSaved =
        ref.watch(savedPlacesController.notifier).isSavedPlace(place);

    final bool isCurrent = curPlace == place;

    String title = '';
    final String name =
        MetricsHelper.getLocalNameOrName(place, languageCode) ?? '';

    title += MetricsHelper.getCountryCodeAndStateOrName(place) ?? '';
    title += name.isNotEmpty ? ', $name' : '';

    return ListTile(
      onTap: () async =>
          ref.read(searchWidgetProvider.notifier).selectCurrentPlace(place),
      onLongPress: () async => ref
          .read(searchWidgetProvider.notifier)
          .changePlaceToSavedPlaces(isSaved, place),
      title: Text(title),
      horizontalTitleGap: 0.0,
      tileColor: isCurrent ? AppColors.of(context).cardSelectedColor : null,
      trailing: isSaved
          ? Icon(
              AppIcons.savedPlaceBookmark,
              color: IconTheme.of(context).color,
            )
          : null,
    );
  }
}
