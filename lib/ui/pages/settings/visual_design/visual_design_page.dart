// ignore_for_file: unused_element

import 'dart:collection';

import 'package:auto_route/annotations.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:weather_pack/weather_pack.dart';
import 'package:weather_today/application/const/app_colors.dart';
import 'package:weather_today/application/const/app_icons.dart';
import 'package:weather_today/domain/controllers/app_theme/controller/app_theme_controller.dart';
import 'package:weather_today/domain/controllers/app_theme/models/design_page.dart';
import 'package:weather_today/domain/controllers/app_theme/models/models.dart';
import 'package:weather_today/extension/enum_extension.dart';
import 'package:weather_today/ui/pages/current/current_page_main.dart';
import 'package:weather_today/ui/pages/daily/daily_page_by_ruble/daily_page.dart'
    as ruble_daily;
import 'package:weather_today/ui/pages/daily/daily_page_main.dart';
import 'package:weather_today/ui/pages/hourly/hourly_page_main.dart';
import 'package:weather_today/ui/shared/bottom_bar.dart';
import 'package:weather_today/ui/shared/reset_button.dart';
import 'package:weather_today/ui/shared/theme_button.dart';
import 'package:weather_today/ui/shared/tips_widget.dart';

import '../../../shared/appbar_widget.dart';
import '../../../shared/shared_widget.dart';
import '../../../shared/wrapper_page.dart';
import 'visual_design_page_presenter.dart';

/// A page from the visual design settings.
@RoutePage()
class VisualDesignPage extends ConsumerWidget {
  const VisualDesignPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(VisualDesignPresenter.tr);

    final scrollPhysics =
        ref.watch(VisualDesignPresenter.selectedScrollPhysic).scrollPhysics;

    return WillPopScope(
      onWillPop: () async =>
          ref.read(VisualDesignPresenter.instance).onWillPop(context),
      // fixdep(04.08.2024): [On dialog pop + page pop after unawaited async method called ('!_debugLocked': is not true.) · Issue #2017 · Milad-Akarie/auto_route_library](https://github.com/Milad-Akarie/auto_route_library/issues/2017)
      // PopScope(
      // onPopInvoked: (_) async =>
      //     ref.read(VisualDesignPresenter.instance).onWillPop(context),
      child: Scaffold(
        appBar: AppBarCustom(
          t.visualDesignPage.appbarTitle,
          actions: LinkedHashMap.of({
            ActionButton.slot1: const _SaveButtonWidget(),
            ActionButton.reset: ResetButton(
              onConfirm: ref
                  .read(VisualDesignPresenter.instance)
                  .resetToDefaultSettings,
            ),
            ActionButton.themeMode: const ChangerThemeButton(),
          }),
        ),
        body: CustomScrollView(
          physics: scrollPhysics,
          // if necessary padding, use MultiSliver
          // padding: const EdgeInsets.symmetric(horizontal: 4.0),
          slivers: [
            // todo(02.08.2024): tr Оформление погодных страниц
            _HeaderSliverText(t.visualDesignPage.headers.design),
            SliverToBoxAdapter(
              key: ValueKey('$_DesignPagesNew'),
              child: const _DesignPagesNew(),
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
    );
  }
}

class _HeaderSliverText extends StatelessWidget {
  const _HeaderSliverText(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      key: ValueKey(text),
      child: HeaderRWidget(
        text,
        padding: const EdgeInsets.only(left: 16, top: 16, bottom: 8),
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
        ref.watch(VisualDesignPresenter.weatherMock).valueOrNull;

    Widget? testedWidget;

    if (weatherMock != null) {
      testedWidget = ruble_daily.TileDailyWidget(weatherMock.daily!.first);

      const Widget _divider = Divider(height: 12.0, thickness: 12.0);

      testedWidget = Column(
        children: [_divider, testedWidget, _divider],
      );
    }

    final double textScaleFactor =
        ref.watch(VisualDesignPresenter.textScaleFactorProvider);

    final Typography typography =
        ref.watch(VisualDesignPresenter.selectedTypography).typography;

    final String fontFamily =
        ref.watch(VisualDesignPresenter.selectedFontFamily).fontFamily;

    final bool isDark = Brightness.dark == theme.brightness;

    final FlexColorScheme nowFlexTheme =
        ref.watch(AppTheme.usingThemeNow(isDark)).copyWith(
              typography: typography,
              fontFamily: fontFamily,
            );

    return Theme(
      data: nowFlexTheme.toTheme,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(
          textScaler: TextScaler.linear(textScaleFactor),
        ),
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
        ref.watch(VisualDesignPresenter.changesProvider).isNotEmpty;

    return isNeedSave
        ? IconButton(
            onPressed: ref.read(VisualDesignPresenter.instance).saveAllChanges,
            icon: const Icon(Icons.done_rounded),
          )
        : const SizedBox.shrink();
  }
}

class _DesignPagesNew extends HookConsumerWidget {
  const _DesignPagesNew();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(VisualDesignPresenter.tr);
    final notifier = ref.watch(VisualDesignPresenter.instance);
    final designPages = ref.watch(VisualDesignPresenter.weatherDesignPages);

    return Column(
      children: [
        ReorderableListView(
          buildDefaultDragHandles: false,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          onReorder: notifier.onReorderWeatherPage,
          children: [
            for (final (index, designPage) in designPages.indexed)
              _DesignTileNew(
                key: ValueKey(index),
                designPage: designPage,
                index: index,
              )
          ],
        ),
        TipRWidget(
          // todo(02.08.2024): tr
          text: Text('${AppSmiles.info} Нажмите, чтобы увидеть'),
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        ),
        const _BottomBarTip(),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _BottomBarTip extends StatelessWidget {
  const _BottomBarTip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final overlay = Overlay.of(context);
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: ShapeDecoration(
        color: AppColors.of(context).tipBackgroundColor,
        shape: LinearBorder(
          top: const LinearBorderEdge(),
          bottom: const LinearBorderEdge(),
          side: BorderSide(color: AppColors.of(context).tipBorderColor),
        ),
      ),
      child: BottomBarWidget(
        mockTap: (designPage) {
          final DesignPage(:page, :design) = designPage;

          late OverlayEntry weatherOverlayEntry;

          weatherOverlayEntry = OverlayEntry(
            builder: (context) => GestureDetector(
              onTap: weatherOverlayEntry.remove,
              child: SafeArea(
                child: ColoredBox(
                  color: Colors.black54,
                  child: Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                      side: BorderSide(color: theme.primaryColor),
                    ),
                    margin: const EdgeInsets.all(16.0),
                    child: WrapperPage(
                      child: IgnorePointer(
                        child: switch (page) {
                          WeatherPage.hourly =>
                            HourlyWeatherPage(design: design),
                          WeatherPage.currently =>
                            CurrentWeatherPage(design: design),
                          WeatherPage.daily => DailyWeatherPage(design: design),
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );

          overlay.insert(weatherOverlayEntry);
        },
      ),
    );
  }
}

class _DesignTileNew extends HookConsumerWidget {
  const _DesignTileNew({
    super.key,
    required this.designPage,
    required this.index,
  });

  final DesignPage designPage;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(VisualDesignPresenter.instance);
    final textScaleFactor = ref.watch(AppTheme.textScaleFactor);
    final t = ref.watch(VisualDesignPresenter.tr);
    final titleTr = t.mainPageDRuble.mainPage.bottomBar;

    final DesignPage(:page, :design) = designPage;

    final title = switch (page) {
      WeatherPage.currently => titleTr.today,
      WeatherPage.hourly => titleTr.hourly,
      WeatherPage.daily => titleTr.daily
    };

    // todo(02.08.2024):
    final activatedTileState = useState(true);
    final activatedTile = activatedTileState.value;

    return SwitchListTile(
      value: activatedTile,
      onChanged: (_) => activatedTileState.value = !activatedTile,
      title: Text(title, textScaler: TextScaler.linear(textScaleFactor)),
      subtitle: SegmentedButton<AppVisualDesign>(
        segments: [
          ButtonSegment(
            value: AppVisualDesign.byRuble,
            label: Text(AppVisualDesign.byRuble.toWords()),
          ),
          ButtonSegment(
            value: AppVisualDesign.byTolskaya,
            label: Text(AppVisualDesign.byTolskaya.toWords()),
          ),
        ],
        selected: {design},
        onSelectionChanged: activatedTile && page != WeatherPage.daily
            ? (value) async => notifier.onChangeDesignPage(
                  value.first,
                  index,
                )
            : null,
      ),
      secondary: ReorderableDragStartListener(
        index: index,
        child: const Icon(Icons.drag_handle_rounded),
      ),
    );
  }
}

class _ChangerTextScaleWidget extends ConsumerWidget {
  const _ChangerTextScaleWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double textScaleFactor =
        ref.watch(VisualDesignPresenter.textScaleFactorProvider);

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
                      .read(VisualDesignPresenter.instance)
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
    final presenter = ref.watch(VisualDesignPresenter.instance);
    final List<AppFontFamily> items = presenter.fontsFamily;

    final AppFontFamily selected =
        ref.watch(VisualDesignPresenter.selectedFontFamily);

    return ChipsCloud(
      items: List<ChipInCloud>.generate(items.length, (int index) {
        return ChipInCloud(
          selected: selected == items[index],
          label: Text(items[index].fontFamily),
          onSelected: (_) => presenter.setFontFamily(items[index]),
        );
      }),
    );
  }
}

class _TypographyWidget extends ConsumerWidget {
  const _TypographyWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final presenter = ref.watch(VisualDesignPresenter.instance);
    final List<AppTypography> items = presenter.typographyList;

    final AppTypography selected =
        ref.watch(VisualDesignPresenter.selectedTypography);

    return ChipsCloud(
      items: List<ChipInCloud>.generate(items.length, (int index) {
        return ChipInCloud(
          selected: selected == items[index],
          label: Text(items[index].toCamelCaseToWords()),
          onSelected: (_) => ref
              .read(VisualDesignPresenter.instance)
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
        ref.watch(VisualDesignPresenter.instance).scrollPhysics;

    final AppScrollPhysics selected =
        ref.watch(VisualDesignPresenter.selectedScrollPhysic);

    return ChipsCloud(
      items: List<ChipInCloud>.generate(items.length, (int index) {
        return ChipInCloud(
          selected: selected == items[index],
          label: Text(items[index]
              .toWords(startWithSmall: false, stringCase: StringCase.lower)),
          onSelected: (_) => ref
              .read(VisualDesignPresenter.instance)
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
