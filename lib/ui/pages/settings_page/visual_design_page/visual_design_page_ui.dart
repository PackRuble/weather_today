import 'package:auto_route/annotations.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/const/app_colors.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/core/services/app_theme_service/models/design_page.dart';
import 'package:weather_today/core/services/app_theme_service/models/models.dart';
import 'package:weather_today/extension/enum_extension.dart';

import '../../../shared/appbar_widget.dart';
import '../../../shared/shared_widget.dart';
import '../../../shared/wrapper_page.dart';
import 'visual_design_page_controller.dart';

/// Страница из настроек визуального оформления.
@RoutePage()
class VisualDesignPage extends ConsumerWidget {
  const VisualDesignPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(VisualDPageController.tr);

    final ScrollPhysics scrollPhysic =
        ref.watch(VisualDPageController.selectedScrollPhysic).scrollPhysics;

    return WrapperPage(
      child: WillPopScope(
        onWillPop: () async =>
            ref.watch(VisualDPageController.instance).onWillPop(context),
        child: Scaffold(
          appBar: RAppBar(
            t.visualDesignPage.appbarTitle,
            actions: const [_SaveButtonWidget()],
          ),
          body: Column(
            children: [
              // const _ExampleTileDesign(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  physics: AlwaysScrollableScrollPhysics(parent: scrollPhysic),
                  children: [
                    HeaderRWidget(t.visualDesignPage.headers.design),
                    const _DesignWidgetChip(),
                    HeaderRWidget(t.visualDesignPage.headers.font),
                    const _FamilyFontsWidget(),
                    HeaderRWidget(t.visualDesignPage.headers.fontSize),
                    const _ChangerTextScaleWidget(),
                    HeaderRWidget(t.visualDesignPage.headers.typography),
                    const _TypographyWidget(),
                    HeaderRWidget(t.visualDesignPage.headers.scroll),
                    const _ScrollPhysicsWidget(),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Пример виджета погоды с главной страницы.
class _ExampleTileDesign extends ConsumerWidget {
  const _ExampleTileDesign();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final WeatherOneCall? weatherMock =
        ref.watch(VisualDPageController.weatherMock).valueOrNull;

    // final AppVisualDesign visualDesign =
    //     ref.watch(VisualDPageController.selectedDesignProvider);
    //
    Widget? _testedWidget;
    //
    // if (weatherMock != null) {
    //   switch (visualDesign) {
    //     case AppVisualDesign.byRuble:
    //       _testedWidget = ruble_daily.TileDailyWidget(weatherMock.daily!.first);
    //       break;
    //     case AppVisualDesign.byTolskaya:
    //       _testedWidget =
    //           tolskaya_hourly.TileHourlyWidget(weatherMock.hourly![10]);
    //       break;
    //   }

    const Widget _divider = Divider(height: 12.0, thickness: 12.0);

    _testedWidget = Column(
      children: [_divider, /*_testedWidget,*/ _divider],
    );
    // }

    final double textScaleFactor =
        ref.watch(VisualDPageController.textScaleFactorProvider);

    final Typography typography =
        ref.watch(VisualDPageController.selectedTypography).typography;

    final String fontFamily =
        ref.watch(VisualDPageController.selectedFontFamily).fontFamily;

    final bool isDark = Brightness.dark == Theme.of(context).brightness;

    final FlexColorScheme nowFlexTheme =
        ref.watch(AppTheme.usingThemeNow(isDark)).copyWith(
              typography: typography,
              fontFamily: fontFamily,
            );

    return Theme(
      data: nowFlexTheme.toTheme,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: textScaleFactor),
        child: _testedWidget ?? const SizedBox.shrink(),
      ),
    );
  }
}

class _SaveButtonWidget extends ConsumerWidget {
  const _SaveButtonWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isNeedSave =
        ref.watch(VisualDPageController.changesProvider).isNotEmpty;

    return isNeedSave
        ? IconButton(
            onPressed: ref.read(VisualDPageController.instance).saveAllChanges,
            icon: const Icon(Icons.done),
          )
        : const SizedBox.shrink();
  }
}

class _DesignWidgetChip extends ConsumerWidget {
  const _DesignWidgetChip();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(VisualDPageController.instance);
    final List<DesignPage> designPages =
        ref.watch(VisualDPageController.weatherDesignPages);

    // we really want to read it once
    final textScaleFactor =
        ref.read(VisualDPageController.textScaleFactorProvider);

    return ReorderableListView(
      buildDefaultDragHandles: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      onReorder: notifier.onReorderWeatherPage,
      children: [
        for (final (index, designPage) in designPages.indexed)
          SwitchListTile(
            value: notifier.isSelectedDesign(designPage.design),
            onChanged: designPage.page == WeatherPage.daily
                ? null
                : (value) async => notifier.onChangeDesignPage(value, index),
            key: ValueKey(designPage.hashCode),
            title: Text(
              // using for all states
              style: Theme.of(context).textTheme.titleMedium,
              designPage.toString(),
              textScaleFactor: textScaleFactor,
            ),
            secondary: ReorderableDragStartListener(
              index: index,
              child: Icon(
                Icons.drag_handle_rounded,
                // using for all states
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          )
      ],
    );

    // return ChipsCloud(
    //   items: List<ChipInCloud>.generate(_designs.length, (int index) {
    //     return ChipInCloud(
    //       selected: _selected == _designs[index],
    //       label: Text(_designs[index].toCamelCaseToWords()),
    //       onSelected: (_) => ref
    //           .read(VisualDPageController.instance)
    //           .setVisualDesign(_designs[index]),
    //     );
    //   }),
    // );
  }
}

class _ChangerTextScaleWidget extends ConsumerWidget {
  const _ChangerTextScaleWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double textScaleFactor =
        ref.watch(VisualDPageController.textScaleFactorProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: ColoredBox(
            color: Colors.transparent,
            child: Slider(
              value: textScaleFactor,
              divisions:
                  ((maxTextScaleFactor - minTextScaleFactor) * 100).toInt(),
              min: minTextScaleFactor,
              max: maxTextScaleFactor,
              onChanged:
                  ref.read(VisualDPageController.instance).setTextScaleFactor,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: ColoredBox(
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${(textScaleFactor * 100).toStringAsFixed(0)}%',
                textAlign: TextAlign.start,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _FamilyFontsWidget extends ConsumerWidget {
  const _FamilyFontsWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<AppFontFamily> items =
        ref.watch(VisualDPageController.fontsFamilyProvider);

    final AppFontFamily selected =
        ref.watch(VisualDPageController.selectedFontFamily);

    return ChipsCloud(
      items: List<ChipInCloud>.generate(items.length, (int index) {
        return ChipInCloud(
          selected: selected == items[index],
          label: Text(items[index].toCamelCaseToWords()),
          onSelected: (_) => ref
              .read(VisualDPageController.instance)
              .setFontFamily(items[index]),
        );
      }),
    );
  }
}

class _TypographyWidget extends ConsumerWidget {
  const _TypographyWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<AppTypography> items =
        ref.watch(VisualDPageController.typographyList);

    final AppTypography selected =
        ref.watch(VisualDPageController.selectedTypography);

    return ChipsCloud(
      items: List<ChipInCloud>.generate(items.length, (int index) {
        return ChipInCloud(
          selected: selected == items[index],
          label: Text(items[index].toCamelCaseToWords()),
          onSelected: (_) => ref
              .read(VisualDPageController.instance)
              .setTypography(items[index]),
        );
      }),
    );
  }
}

class _ScrollPhysicsWidget extends ConsumerWidget {
  const _ScrollPhysicsWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<AppScrollPhysics> items =
        ref.watch(VisualDPageController.scrollPhysicsProvider);

    final AppScrollPhysics selected =
        ref.watch(VisualDPageController.selectedScrollPhysic);

    return ChipsCloud(
      items: List<ChipInCloud>.generate(items.length, (int index) {
        return ChipInCloud(
          selected: selected == items[index],
          label: Text(items[index].toCamelCaseToWords()),
          onSelected: (_) => ref
              .read(VisualDPageController.instance)
              .setScrollPhysic(items[index]),
        );
      }),
    );
  }
}

class ChipsCloud extends ConsumerWidget {
  const ChipsCloud({
    required this.items,
  });

  final List<ChipInCloud> items;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        runAlignment: WrapAlignment.spaceEvenly,
        spacing: 6.0,
        runSpacing: 6.0,
        children: items,
      ),
    );
  }
}

class ChipInCloud extends StatelessWidget {
  const ChipInCloud({
    required this.selected,
    required this.label,
    required this.onSelected,
  });

  final bool selected;
  final Widget label;
  final void Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    return RawChip(
      label: label,
      elevation: 0.0,
      showCheckmark: false,
      selected: selected,
      side: BorderSide(color: AppColors.of(context).chipBorderColor),
      backgroundColor: AppColors.of(context).chipColor,
      selectedColor: AppColors.of(context).chipSelectedColor,
      onSelected: onSelected,
    );
  }
}
