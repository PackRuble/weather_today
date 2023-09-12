import 'package:auto_route/annotations.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/const/app_colors.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/core/services/app_theme_service/models/design_page.dart';
import 'package:weather_today/core/services/app_theme_service/models/models.dart';
import 'package:weather_today/extension/enum_extension.dart';
import 'package:weather_today/ui/pages/current_page/current_page_main.dart';
import 'package:weather_today/ui/pages/daily_page/daily_page_by_ruble/daily_page_ui.dart'
    as ruble_daily;
import 'package:weather_today/ui/pages/daily_page/daily_page_main.dart';
import 'package:weather_today/ui/pages/hourly_page/hourly_page_main.dart';

import '../../../shared/appbar_widget.dart';
import '../../../shared/shared_widget.dart';
import '../../../shared/wrapper_page.dart';
import 'visual_design_page_controller.dart';

/// A page from the visual design settings.
@RoutePage()
class VisualDesignPage extends ConsumerWidget {
  const VisualDesignPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(VisualDPageController.tr);

    final ScrollPhysics scrollPhysics =
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
          body: CustomScrollView(
            physics: scrollPhysics,
            // if necessary padding, use MultiSliver
            // padding: const EdgeInsets.symmetric(horizontal: 4.0),
            slivers: [
              _HeaderSliverText(t.visualDesignPage.headers.design),
              SliverToBoxAdapter(
                key: ValueKey('$_DesignPagesWidget'),
                child: const _DesignPagesWidget(),
              ),
              SliverPinnedHeader(
                key: ValueKey('$_ExampleTileDesign'),
                child: ColoredBox(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: const _ExampleTileDesign(),
                ),
              ),
              _HeaderSliverText(t.visualDesignPage.headers.font),
              SliverToBoxAdapter(
                key: ValueKey('$_FamilyFontsWidget'),
                child: const _FamilyFontsWidget(),
              ),
              _HeaderSliverText(t.visualDesignPage.headers.fontSize),
              SliverToBoxAdapter(
                key: ValueKey('$_ChangerTextScaleWidget'),
                child: const _ChangerTextScaleWidget(),
              ),
              _HeaderSliverText(t.visualDesignPage.headers.typography),
              SliverToBoxAdapter(
                key: ValueKey('$_TypographyWidget'),
                child: const _TypographyWidget(),
              ),
              _HeaderSliverText(t.visualDesignPage.headers.scroll),
              SliverToBoxAdapter(
                key: ValueKey('$_ScrollPhysicsWidget'),
                child: const _ScrollPhysicsWidget(),
              ),
              const SliverToBoxAdapter(
                key: ValueKey('SizedBox bottom'),
                child: SizedBox(height: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderSliverText extends StatelessWidget {
  const _HeaderSliverText(this.text, {super.key});

  final String text;

  static const _paddingHeader = EdgeInsets.only(left: 16, top: 16, bottom: 8);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      key: ValueKey(text),
      child: HeaderRWidget(
        text,
        padding: _paddingHeader,
      ),
    );
  }
}

/// An example of a weather widget from the home page.
class _ExampleTileDesign extends ConsumerWidget {
  const _ExampleTileDesign();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final WeatherOneCall? weatherMock =
        ref.watch(VisualDPageController.weatherMock).valueOrNull;

    Widget? testedWidget;

    if (weatherMock != null) {
      testedWidget = ruble_daily.TileDailyWidget(weatherMock.daily!.first);

      const Widget _divider = Divider(height: 12.0, thickness: 12.0);

      testedWidget = Column(
        children: [_divider, testedWidget, _divider],
      );
    }

    final double textScaleFactor =
        ref.watch(VisualDPageController.textScaleFactorProvider);

    final Typography typography =
        ref.watch(VisualDPageController.selectedTypography).typography;

    final String fontFamily =
        ref.watch(VisualDPageController.selectedFontFamily).fontFamily;

    final bool isDark = Brightness.dark == theme.brightness;

    final FlexColorScheme nowFlexTheme =
        ref.watch(AppTheme.usingThemeNow(isDark)).copyWith(
              typography: typography,
              fontFamily: fontFamily,
            );

    return Theme(
      data: nowFlexTheme.toTheme,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: textScaleFactor),
        child: testedWidget ?? const SizedBox.shrink(),
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

class _DesignPagesWidget extends HookConsumerWidget {
  const _DesignPagesWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(VisualDPageController.instance);
    final List<DesignPage> designPages =
        ref.watch(VisualDPageController.weatherDesignPages);

    return ReorderableListView(
      buildDefaultDragHandles: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      onReorder: notifier.onReorderWeatherPage,
      children: [
        for (final (index, designPage) in designPages.indexed)
          _DesignTile(
            key: ValueKey(designPage.hashCode),
            designPage: designPage,
            index: index,
          )
      ],
    );
  }
}

class _DesignTile extends ConsumerWidget {
  const _DesignTile({
    super.key,
    required this.designPage,
    required this.index,
  });

  final DesignPage designPage;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(VisualDPageController.instance);
    // we really want to read it once
    final textScaleFactor = ref.watch(AppTheme.textScaleFactor);
    final design = designPage.design;
    final page = designPage.page;

    return _OverlayWeatherOnLongPress(
      overlayBuilder: (_) => SafeArea(
        child: Card(
          margin: const EdgeInsets.all(16.0),
          child: switch (designPage.page) {
            WeatherPage.daily => DailyWeatherPage(design: design),
            WeatherPage.hourly => HourlyWeatherPage(design: design),
            WeatherPage.currently => CurrentWeatherPage(design: design),
          },
        ),
      ),
      child: SwitchListTile(
        value: notifier.isSelectedDesign(design),
        onChanged: page == WeatherPage.daily
            ? (_) {}
            : (value) async => notifier.onChangeDesignPage(value, index),
        title: Text(
          page.toWords(), // todo tr
          textScaleFactor: textScaleFactor,
        ),
        subtitle: Text(
          '${page == WeatherPage.daily ? 'only ' : ''}design ${design.toWords()}',
          textScaleFactor: textScaleFactor,
        ),
        secondary: ReorderableDragStartListener(
          index: index,
          child: const Icon(Icons.drag_handle_rounded),
        ),
      ),
    );
  }
}

class _OverlayWeatherOnLongPress extends HookConsumerWidget {
  const _OverlayWeatherOnLongPress({
    super.key,
    required this.child,
    required this.overlayBuilder,
  });

  final Widget child;
  final WidgetBuilder overlayBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    OverlayEntry? weatherOverlayEntry;

    useMemoized(() => weatherOverlayEntry?.dispose, const []);

    void showOverlay() {
      final overlay = Overlay.of(context);
      weatherOverlayEntry = OverlayEntry(builder: overlayBuilder);
      overlay.insert(weatherOverlayEntry!);
    }

    void hideOverlay() {
      weatherOverlayEntry?.remove();
      weatherOverlayEntry = null;
    }

    return GestureDetector(
      onLongPressStart: (_) => showOverlay(),
      onLongPressEnd: (_) => hideOverlay(),
      child: child,
    );
  }
}

class _ChangerTextScaleWidget extends ConsumerWidget {
  const _ChangerTextScaleWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double textScaleFactor =
        ref.watch(VisualDPageController.textScaleFactorProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        return Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: width / 1.4,
                child: Slider(
                  value: textScaleFactor,
                  divisions:
                      ((maxTextScaleFactor - minTextScaleFactor) * 100).toInt(),
                  min: minTextScaleFactor,
                  max: maxTextScaleFactor,
                  onChanged: ref
                      .read(VisualDPageController.instance)
                      .setTextScaleFactor,
                ),
              ),
              Flexible(
                child: SizedBox(
                  width: width / 3,
                  child: Text(
                    '${(textScaleFactor * 100).toStringAsFixed(0)}%',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
          label: Text(items[index].fontFamily),
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
          label: Text(items[index]
              .toWords(startWithSmall: false, stringCase: StringCase.lower)),
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
