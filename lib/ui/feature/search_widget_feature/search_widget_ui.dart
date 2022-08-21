import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:weather_today/const/app_colors.dart';
import 'package:weather_today/const/app_icons.dart';
import 'package:weather_today/const/app_insets.dart';
import 'package:weather_today/core/controllers/saved_places_provider.dart';
import 'package:weather_today/core/models/place/place_model.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/ui/const/dialogs.dart';
import 'package:weather_today/ui/shared/tips_widget.dart';

import '../../utils/correct_show_place.dart';
import '../../utils/image_helper.dart';
import 'search_widget_controller.dart';

/// Виджет поиска в верхней части экрана. Используется для поиска мест.
class SearchWidget extends ConsumerWidget with UiLoggy {
  const SearchWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    loggy.debug('build');

    final model = ref.watch(searchWidgetProvider.notifier);

    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;

    final Color? barrierColor = ModalRoute.of(context)?.barrierColor;
    final AppColors colors = AppColors.of(context);
    final isLight = colors.isLight;

    return FloatingSearchBar(
      accentColor: colors.accentColorSearchbar,
      backgroundColor: colors.backgroundColorSearchbar,
      shadowColor: colors.shadowColorSearchbar,
      backdropColor: barrierColor,
      controller: ref.watch(SearchWidgetNotifier.controllerBarProvider),
      title: const _TitleSearch(),
      hint: 'Введите название места',
      borderRadius:
          const BorderRadius.all(Radius.circular(AppInsets.cornerRadiusCard)),
      border: BorderSide(color: colors.borderColorSearchbar),
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
      // progress: isLoading,
      debounceDelay: Duration(milliseconds: SearchWidgetNotifier.debounceDelay),
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
        ),
        _SavedBookmarkAction(),
        FloatingSearchBarAction.icon(
          showIfClosed: true,
          showIfOpened: false,
          icon:
              Icon(isLight ? Icons.light_mode_rounded : Icons.nightlight_round),
          onTap: () => ref
              .read(AppTheme.pr)
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

    final String name =
        CorrectShowPlace.getLocalNameOrName(place, languageCode) ?? '';

    final String title =
        (place.countryCode ?? '') + (name.isNotEmpty ? ', $name' : '');

    return Text(title);
  }
}

class _SearchBodyWidget extends ConsumerWidget {
  const _SearchBodyWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchBody = ref.watch(searchWidgetProvider);

    const String _baseTooltip =
        '${AppSmiles.pinned} Удерживайте, чтобы сохранить/удалить место.\n'
        '${AppSmiles.set} Кликните, чтобы выбрать место.\n';

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
              return const _TipWidget('Нет сохраненых мест.');
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const _TipWidget('$_baseTooltip \nПоказаны сохраненные места.'),
                const Divider(height: 1.0),
                _BodyTilesWidget(saved),
              ],
            );
          },
          found: (List<Place> founded) {
            if (founded.isEmpty) {
              return const _TipWidget('Нет найденных мест.');
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const _TipWidget('$_baseTooltip \nПоказаны найденные места.'),
                const Divider(height: 1.0),
                _BodyTilesWidget(founded),
              ],
            );
          },
          loading: () => const LinearProgressIndicator(),
          error: () => const Text('Произошла ошибка'),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppInsets.allPadding),
      child: TipRWidget(
        text: Text(tip),
      ),
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
        CorrectShowPlace.getLocalNameOrName(place, languageCode) ?? '';

    title += CorrectShowPlace.getCountryCodeAndState(place) ?? '';
    title += name.isNotEmpty ? ', $name' : '';

    return ListTile(
      onTap: () =>
          ref.read(searchWidgetProvider.notifier).selectCurrentPlace(place),
      onLongPress: () => ref
          .read(searchWidgetProvider.notifier)
          .changePlaceToSavedPlaces(isSaved, place),
      leading: place.countryCode == null
          ? null
          : SizedBox(
              width: 25.0,
              child: Center(
                child: ImageHelper.getFlagIcon(place.countryCode ?? ''),
              ),
            ),
      title: Text(title),
      tileColor: isCurrent ? AppColors.of(context).selectedCard : null,
      trailing: isSaved ? const Icon(AppIcons.savedPlaceBookmark) : null,
    );
  }
}
