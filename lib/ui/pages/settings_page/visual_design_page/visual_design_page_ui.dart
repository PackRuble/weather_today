import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/const/app_colors.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/core/services/app_theme_service/models/models.dart';
import 'package:weather_today/extension/enum_extension.dart';

import '../../../shared/custom_appbar.dart';
import '../../../shared/shared_widget.dart';
import '../../../shared/wrapper_page.dart';
import '../../daily_page/daily_page_by_ruble/daily_page_ui.dart';
import 'visual_design_page_controller.dart';

/// Страница из настроек визуального оформления.
class VisualDesignPage extends ConsumerWidget {
  const VisualDesignPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(VisualDPageController.tr);

    final ScrollPhysics scrollPhysic =
        ref.watch(VisualDPageController.selectedScrollPhysic).scrollPhysics;

    const Widget _divider = Divider(height: 12.0, thickness: 12.0);

    return WrapperPage(
      child: WillPopScope(
        onWillPop: () async =>
            ref.watch(VisualDPageController.cr).onWillPop(context),
        child: Scaffold(
          appBar: RAppBar(
            t.visualDesignPage.appbarTitle,
            actions: const [_SaveButtonWidget()],
          ),
          body: ListView(
            physics: AlwaysScrollableScrollPhysics(parent: scrollPhysic),
            children: [
              _divider,
              const _ExampleTileDesign(),
              _divider,
              HeaderRWidget(t.visualDesignPage.headers.design),
              const _DesignWidgetChip(),
              HeaderRWidget(t.visualDesignPage.headers.fontSize),
              const _ChangerTextScaleWidget(),
              HeaderRWidget(t.visualDesignPage.headers.font),
              const _FamilyFontsWidget(),
              HeaderRWidget(t.visualDesignPage.headers.typography),
              const _TypographyWidget(),
              HeaderRWidget(t.visualDesignPage.headers.scroll),
              const _ScrollPhysicsWidget(),
              const SizedBox(height: 20.0),
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
    final double textScaleFactor =
        ref.watch(VisualDPageController.textScaleFactorProvider);

    final WeatherDaily? daily =
        ref.watch(VisualDPageController.weatherDailyProvider).value;

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

    // буду тестировать в 12 сборке
    // не работает типографика, ждем решения этой проблемы
    // todo https://github.com/flutter/flutter/issues/103864

    return Theme(
      // data: ThemeData(
      //     typography: typography,
      //     fontFamily: fontFamily),
      data: nowFlexTheme.toTheme,
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: textScaleFactor),
        child: daily == null ? const SizedBox.shrink() : TileDailyWidget(daily),
      ), // todo исходя из выбранного стиля визуального дизайна выбрать соотв тайл
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
            onPressed: ref.read(VisualDPageController.cr).saveAllChanges,
            icon: const Icon(Icons.done),
          )
        : const SizedBox.shrink();
  }
}

class _DesignWidgetChip extends ConsumerWidget {
  const _DesignWidgetChip();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<AppVisualDesign> _designs =
        ref.watch(VisualDPageController.visualDesignsProvider);

    final AppVisualDesign _selected =
        ref.watch(VisualDPageController.selectedDesignProvider);

    return ChipsCloud(
      items: List<ChipInCloud>.generate(_designs.length, (int index) {
        return ChipInCloud(
          selected: _selected == _designs[index],
          label: Text(_designs[index].toCamelCaseToWords()),
          onSelected: (_) => ref
              .read(VisualDPageController.cr)
              .setVisualDesign(_designs[index]),
        );
      }),
    );
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
              onChanged: ref.read(VisualDPageController.cr).setTextScaleFactor,
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
          onSelected: (_) =>
              ref.read(VisualDPageController.cr).setFontFamily(items[index]),
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
          onSelected: (_) =>
              ref.read(VisualDPageController.cr).setTypography(items[index]),
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
          onSelected: (_) =>
              ref.read(VisualDPageController.cr).setScrollPhysic(items[index]),
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
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      runAlignment: WrapAlignment.spaceEvenly,
      children: items,
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
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ChoiceChip(
        label: label,
        elevation: 2.0,
        selected: selected,
        side: BorderSide(color: AppColors.of(context).chipBorderColor),
        backgroundColor: AppColors.of(context).chipColor,
        selectedColor: AppColors.of(context).chipSelectedColor,
        onSelected: onSelected,
      ),
    );
  }
}
