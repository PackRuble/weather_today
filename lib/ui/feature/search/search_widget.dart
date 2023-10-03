import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_floating_search_bar_2/material_floating_search_bar_2.dart';
import 'package:weather_today/application/const/app_colors.dart';
import 'package:weather_today/application/const/app_icons.dart';
import 'package:weather_today/application/const/app_insets.dart';
import 'package:weather_today/domain/controllers/app_theme/controller/app_theme_controller.dart';
import 'package:weather_today/domain/models/place/place_model.dart';
import 'package:weather_today/ui/dialogs/app_dialogs.dart';
import 'package:weather_today/ui/shared/tips_widget.dart';
import 'package:weather_today/utils/logger/all_observers.dart';

import '../../utils/metrics_helper.dart';
import 'search_widget_notifier.dart';

/// Search widget at the top of the screen. Used to search for locations.
class SearchWidget extends ConsumerWidget with UiLoggy {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    loggy.debug('build');

    final t = ref.watch(SearchWidgetNotifier.tr);
    final notifier = ref.watch(SearchWidgetNotifier.instance.notifier);

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
      controller: notifier.controllerBar,
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
      debounceDelay:
          Duration(milliseconds: SearchWidgetNotifier.debounceDelayMilSec),
      clearQueryOnClose: true,
      onQueryChanged: (String query) async => notifier.newRequest(query),
      onSubmitted: (String query) async => notifier.newRequest(query),
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
        // _SearchToClearAction(),
        // todo кнопка поиска закрывает бар, что нелогично
        // попытка починить это отдельной виджетом-кнопкой не увенчалась успехом
        // будет полностью переработано при переходе на Search от flutter sdk
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
        FloatingSearchBarAction.icon(
          showIfClosed: false,
          showIfOpened: true,
          icon: const Icon(Icons.info_outline_rounded),
          onTap: () async => AppDialogs.placeSearchInfo(context),
        ),
        const _SavedBookmarkAction(),
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
      builder: (_, __) => const _SearchBody(),
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
  // ignore: unused_element
  const _SavedBookmarkAction({super.key})
      : super(child: const SizedBox.shrink());

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, _) {
        /// необходимо для отслеживания [isCurrentPlaceSaved]
        ref.watch(SearchWidgetNotifier.savedPlaces);
        final Place currentPlace = ref.watch(SearchWidgetNotifier.currentPlace);

        final bool isCurrentPlaceSaved = ref
            .watch(SearchWidgetNotifier.savedPlaces.notifier)
            .isSavedPlace(currentPlace);

        return FloatingSearchBarAction(
          showIfOpened: true,
          showIfClosed: true,
          child: CircularButton(
            icon: Icon(isCurrentPlaceSaved
                ? AppIcons.savedPlaceBookmark
                : AppIcons.notSavedPlaceBookmark),
            onPressed: () async => ref
                .read(SearchWidgetNotifier.instance.notifier)
                .changePlaceToSavedPlaces(isCurrentPlaceSaved, currentPlace),
          ),
        );
      },
    );
  }
}

// class _SearchToClearAction extends FloatingSearchBarAction {
//   _SearchToClearAction({super.key})
//       : super(
//           builder: (BuildContext context, _) {
//             return FloatingSearchBarAction(
//               showIfOpened: true,
//               showIfClosed: true,
//               builder: (BuildContext context, Animation<double> animation) {
//                 final FloatingSearchAppBarState bar =
//                     FloatingSearchAppBar.of(context)!;
//
//                 return ValueListenableBuilder<String>(
//                   valueListenable: bar.queryNotifer,
//                   builder: (BuildContext context, String query, _) {
//                     return SearchToClear(
//                       isEmpty: query.isEmpty,
//                       size: 24,
//                       color: bar.style.iconColor,
//                       duration: const Duration(milliseconds: 450),
//                       onTap: () {
//                         if (query.isNotEmpty) {
//                           bar.clear();
//                         } else {
//                           bar.isOpen = !bar.isOpen ||
//                               (!bar.hasFocus && bar.isAlwaysOpened);
//                         }
//                       },
//                       searchButtonSemanticLabel: 'Search',
//                       clearButtonSemanticLabel: 'Clear',
//                     );
//                   },
//                 );
//               },
//             );
//           },
//         );
// }

class _TitleSearch extends ConsumerWidget {
  // ignore: unused_element
  const _TitleSearch({super.key});

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

class _SearchBody extends ConsumerWidget {
  // ignore: unused_element
  const _SearchBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(SearchWidgetNotifier.tr);

    final searchState = ref.watch(SearchWidgetNotifier.instance);

    final AppColors colors = AppColors.of(context);

    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppInsets.cornerRadiusCard),
        side: BorderSide(color: colors.borderColorSearchbar),
      ),
      clipBehavior: Clip.antiAlias,
      elevation: 4.0,
      child: searchState.when(
        saved: (List<Place> saved) => _BodyCard(
          places: saved,
          tip: t.searchBar.tips.notSavedPlaces,
          tipResult: t.searchBar.tips.showSavedPlaces,
        ),
        found: (List<Place> founded) => _BodyCard(
          places: founded,
          tip: t.searchBar.tips.notFoundedPlaces,
          tipResult: t.searchBar.tips.showFoundedPlaces,
        ),
        loading: () => const LinearProgressIndicator(),
        error: () => Text(t.searchBar.tips.searchError),
      ),
    );
  }
}

class _BodyCard extends ConsumerWidget {
  const _BodyCard({
    // ignore: unused_element
    super.key,
    required this.places,
    required this.tip,
    required this.tipResult,
  });

  final List<Place> places;
  final String tip;
  final String tipResult;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(SearchWidgetNotifier.tr);

    final String _baseTooltip =
        '${AppSmiles.pinned} ${t.searchBar.tips.holdToAction}\n'
        '${AppSmiles.set} ${t.searchBar.tips.clickToSet}\n';

    if (places.isEmpty) return _TipWidget(tip);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _TipWidget('$_baseTooltip \n$tipResult'),
        const Divider(height: 1.0),
        for (final place in places) ...[
          _TileSearchWidget(place),
          const Divider(height: 1.0),
        ],
      ],
    );
  }
}

class _TipWidget extends ConsumerWidget {
  // ignore: unused_element
  const _TipWidget(this.tip, {super.key});

  final String tip;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TipRWidget(
      text: Text(tip),
    );
  }
}

class _TileSearchWidget extends ConsumerWidget {
  // ignore: unused_element
  const _TileSearchWidget(this.place, {super.key});

  final Place place;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Place curPlace = ref.watch(SearchWidgetNotifier.currentPlace);

    final String languageCode = Localizations.localeOf(context).languageCode;

    final bool isSaved = ref
        .watch(SearchWidgetNotifier.savedPlaces.notifier)
        .isSavedPlace(place);

    final bool isCurrent = curPlace == place;

    String title = '';
    final String name =
        MetricsHelper.getLocalNameOrName(place, languageCode) ?? '';

    title += MetricsHelper.getCountryCodeAndStateOrName(place) ?? '';
    title += name.isNotEmpty ? ', $name' : '';

    return ListTile(
      onTap: () async => ref
          .read(SearchWidgetNotifier.instance.notifier)
          .selectCurrentPlace(place),
      onLongPress: () async => ref
          .read(SearchWidgetNotifier.instance.notifier)
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
