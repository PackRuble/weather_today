import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/core/models/place/place_model.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/ui/pages/settings_page/saved_places_page/saved_places_page_controller.dart';
import 'package:weather_today/ui/shared/constant_todo.dart';
import 'package:weather_today/ui/shared/wrap_body_with_search_bar.dart';

class SavedPlacesPage extends ConsumerWidget {
  const SavedPlacesPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('##build $SavedPlacesPage');

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
                  return _TileFoundedWidget(listPlaces[index]);
                },
                itemCount: listPlaces.length,
              ),
      ),
    );
  }
}

class _TileFoundedWidget extends HookConsumerWidget {
  const _TileFoundedWidget(this.place);

  // this.index);

  final Place place;

  // final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint('##build $_TileFoundedWidget');

    // final SavedPlace sPlace =
    //     ref.watch(model.savedPlaces.select((list) => list[index]));

    final bool isSelected =
        ref.watch(SavedPlacesPageController.currentPlace) == place;

    // final bool isSelected =
    //     ref.watch(SavedPlacesPageController.pr).isCurrentPlace(place);

    final ValueNotifier<bool> isExpanded = useState(false);

    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onLongPress: () async =>
            ref.read(SavedPlacesPageController.pr).selectPlace(place),
        child: Card(
          color: isSelected ? colorScheme.primaryContainer : null, //todo
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
            controller: ExpandableController(initialExpanded: isExpanded.value),
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
    String title = '';

    if (place.countryCode != null) title += '${place.countryCode}';
    if (place.state != null) title += ', ${place.state}';

    String subtitle = '';
    if (place.name != null) subtitle += '${place.name}';

    // if (place.localName != null) { //todo
    //   subtitle += ', ${place.localName}';
    // }

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
    final model = ref.watch(SavedPlacesPageController.pr);

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

/// Старый вариант отображения с gridview
// class _BodySavedWidget extends ConsumerWidget {
//   const _BodySavedWidget();
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     debugPrint('##build $_BodySavedWidget');
//
//     final List<Place> listPlaces = ref.watch(SavedPlacesModel.model);
//
//     return Padding(
//       padding:
//           const EdgeInsets.only(top: heightSearchBar + topPaddingSearchBar),
//       child: SafeArea(
//         child: listPlaces.isEmpty
//             ? const Align(
//                 alignment: Alignment.topCenter,
//                 child: Text('Нет сохраненных мест'))
//             : GridView.builder(
//                 padding: const EdgeInsets.all(10),
//                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                     maxCrossAxisExtent: 200,
//                     childAspectRatio: 4 / 5,
//                     crossAxisSpacing: 10,
//                     mainAxisSpacing: 10),
//                 itemCount: listPlaces.length,
//                 itemBuilder: (_, int index) {
//                   return _TileFoundedWidget(listPlaces[index]);
//                 },
//               ),
//       ),
//     );
//   }
// }

// class _TileFoundedWidget extends HookConsumerWidget {
//   const _TileFoundedWidget(this.place);
//
//   final Place place;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     debugPrint('##build $_TileFoundedWidget');
//
//     return DecoratedBox(
//       decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5.0), border: Border.all()),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(5.0),
//         child: GridTile(
//           key: ValueKey<int>(place.hashCode),
//           header: SizedBox(
//             height: 40.0,
//             child: GridTileBar(
//               backgroundColor: Colors.black54,
//               title: Row(
//                 children: [
//                   SizedBox(
//                     width: 25.0,
//                     child: Center(
//                       child: AppImages.getFlagIcon(
//                           place.countryCode.toLowerCase()),
//                     ),
//                   ),
//                   const SizedBox(width: 9.0),
//                   Expanded(
//                     child: Text(
//                       '${place.countryCode}, ${place.state}',
//                       style: const TextStyle(
//                           fontSize: 14, fontWeight: FontWeight.bold),
//                       overflow: TextOverflow.fade,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           footer: SizedBox(
//             height: 50.0,
//             child: Padding(
//               padding: const EdgeInsets.all(5.0),
//               child: DecoratedBox(
//                 decoration: BoxDecoration(
//                     border: const Border.fromBorderSide(BorderSide()),
//                     borderRadius: BorderRadius.circular(5.0)),
//                 child: ListTile(
//                   visualDensity: VisualDensity.compact,
//                   dense: true,
//                   // shape: RoundedRectangleBorder(
//                   //     side: BorderSide(), borderRadius: BorderRadius.circular(5.0)),
//                   minVerticalPadding: 0.0,
//                   onTap: () async => ref
//                       .read(SavedPlacesModel.model.notifier)
//                       .dialogAfterDeletingPlace(context, place),
//                   title: Text('Удалить'),
//                   trailing: Icon(Icons.delete),
//                 ),
//               ),
//             ),
//           ),
//           child: ColoredBox(
//               color: Colors.yellow.withAlpha(100),
//               child: Padding(
//                 padding: const EdgeInsets.only(top: 40.0),
//                 child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('${place.localName}'),
//                       const Spacer(),
//                       const Divider(),
//                       Text('Широта: ${place.latitude}'),
//                       const SizedBox(height: 5.0),
//                       Text('Долгота: ${place.longitude}'),
//                       const SizedBox(height: 50.0),
//                     ],
//                   ),
//                 ),
//               )),
//         ),
//       ),
//     );
//   }
// }

/// попытка сделать работу с координатами
// class _CoordinateBodyWidget extends HookConsumerWidget {
//   const _CoordinateBodyWidget();
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     debugPrint('##build $_CoordinateBodyWidget');
//
//     // final hideController =
//     //     useAnimationController(duration: Duration(seconds: 3), initialValue: 1);
//     //
//     // useAnimation(hideController);
//
//     ref.listen(isActivatedCoordPr, (_, bool isTrue) {
//       // if (isTrue) {
//       //   hideController.value = 0;
//       // } else {
//       //   hideController.value = 1;
//       // }
//     });
//
//     final isActivated = ref.watch(isActivatedCoordPr);
//
//     return AnimatedCrossFade(
//       firstChild: _CoordFields(),
//       secondChild: SizedBox.shrink(),
//       // firstCurve: Curves.slowMiddle,
//       // secondCurve: Curves.easeInOutQuad,
//       sizeCurve: Curves.easeOut,
//       crossFadeState:
//           isActivated ? CrossFadeState.showFirst : CrossFadeState.showSecond,
//       //3
//       duration: const Duration(milliseconds: 500),
//       reverseDuration: const Duration(milliseconds: 500),
//     );
//
//     // if (isActivated) {
//     //   return FadeTransition(
//     //     opacity: hideController,
//     //     child:
//     //         ScaleTransition(scale: hideController, child: const _CoordFields()),
//     //   );
//     // } else {
//     //   return const SizedBox.shrink();
//     // }
//   }
// }

// class _SliderWidget extends HookConsumerWidget {
//   const _SliderWidget();
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final value = useState(10.0000);
//     return RotatedBox(
//       quarterTurns: 1,
//       child: Positioned(
//         right: 0.0,
//         child: Slider(
//           min: 0.0000,
//           max: 90.0000,
//           value: value.value,
//           onChanged: (double newValue) {
//             value.value = newValue;
//           },
//         ),
//       ),
//     );
//   }
// }

// class _CoordFields extends HookConsumerWidget {
//   const _CoordFields();
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     debugPrint('##build $_CoordFields');
//
//     return Column(
//       // mainAxisSize: MainAxisSize.min,
//       children: [
//         // ContainerWidget(),
//         Row(
//           // mainAxisSize: MainAxisSize.min,
//           children: [
//             Text('Широта:'),
//             Expanded(
//                 child: TextField(
//               decoration: const InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: const BorderSide(),
//                 ),
//               ),
//             )),
//             // TextField(),
//           ],
//         ),
//         Row(
//           // mainAxisSize: MainAxisSize.min,
//           children: [
//             Text('Долгота:'),
//             Expanded(child: TextField()),
//           ],
//         ),
//       ],
//     );
//   }
// }
