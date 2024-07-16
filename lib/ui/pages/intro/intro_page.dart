import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:weather_today/application/i18n/translations_enum.dart';
import 'package:weather_today/domain/controllers/general_settings_controller.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';
import 'package:weather_today/ui/pages/intro/intro_page_presenter.dart';

import '../../../application/i18n/translations.g.dart';
import '../../shared/theme_button.dart';

/// Manual slide duration when scrolling.
const _durationMill = 500;

class IntroPage extends HookConsumerWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final viewPadding = MediaQuery.viewPaddingOf(context);

    final introTiles = ref.watch(IntroPagePresenter.introTiles);

    final pageController = usePageController();

    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          physics: const ClampingScrollPhysics(),
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              children: [for (final tile in introTiles) _IntroTileWidget(tile)],
            ),
            Positioned(
              top: viewPadding.top + 4.0,
              right: 4.0,
              child: const ChangerThemeButton(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      flex: 1,
                      child: _LeftButtonWidget(controller: pageController),
                    ),
                    Flexible(
                      flex: 2,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SmoothPageIndicator(
                            effect: JumpingDotEffect(
                              verticalOffset: 20.0,
                              jumpScale: 1.1,
                              activeDotColor: theme.primaryColor,
                            ),
                            onDotClicked: pageController.jumpToPage,
                            controller: pageController,
                            count: 4,
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: _RightButtonWidget(controller: pageController),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _IntroTileWidget extends ConsumerWidget {
  const _IntroTileWidget(
    this.tile, {
    // ignore: unused_element
    super.key,
  });

  final IntroTile tile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Stack(
      fit: StackFit.expand,
      children: [
        Opacity(opacity: 0.8, child: tile.scene.sceneWidget),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              Text(
                tile.title,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium?.copyWith(
                  shadows: [
                    Shadow(
                      color: theme.primaryColor,
                      offset: const Offset(4, 4),
                      blurRadius: 24,
                    ),
                  ],
                  letterSpacing: 4,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const Spacer(flex: 2),
              Text(
                tile.subtitle,
                textAlign: TextAlign.center,
                style: theme.textTheme.titleLarge,
              ),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ],
    );
  }
}

class _LeftButtonWidget extends ConsumerWidget {
  const _LeftButtonWidget({
    // ignore: unused_element
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tr = ref.watch(IntroPagePresenter.tr);

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, Widget? child) {
        final index = controller.page ?? 0;

        if (0.0 <= index && index <= 0.5) {
          return Opacity(
            opacity: 1 - index * 2,
            child: const LocaleButtonWidget(),
          );
        } else if (0.5 < index && index <= 1.0) {
          return Opacity(
            opacity: index * 2 - 1,
            child: child,
          );
        } else {
          return child!;
        }
      },
      child: ElevatedButton(
        style: const ButtonStyle(
          padding: WidgetStatePropertyAll(EdgeInsets.all(8)),
        ),
        onPressed: () async => controller.previousPage(
          duration: const Duration(milliseconds: _durationMill),
          curve: Curves.ease,
        ),
        child: Text(tr.introPage.previousButton, textAlign: TextAlign.center),
      ),
    );
  }
}

class _RightButtonWidget extends ConsumerWidget {
  const _RightButtonWidget({
    // ignore: unused_element
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _lastIndex = ref.watch(IntroPagePresenter.introTiles).length - 1;
    final tr = ref.watch(IntroPagePresenter.tr);

    late final nextButton = _StepButton(
      text: tr.introPage.nextButton,
      onPressed: () async => controller.nextPage(
        duration: const Duration(milliseconds: _durationMill),
        curve: Curves.ease,
      ),
    );

    late final doneButton = _StepButton(
      text: tr.introPage.doneButton,
      onPressed: () async =>
          ref.read(AppGeneralSettings.instance).setIsIntro(false),
    );

    return AnimatedBuilder(
      animation: controller,
      builder: (BuildContext context, _) {
        final index = controller.page ?? 1;

        if (_lastIndex - 1 <= index && index <= _lastIndex - 0.5) {
          return Opacity(
            opacity: 1 - ((index - (_lastIndex - 1)) * 2),
            child: nextButton,
          );
        } else if (_lastIndex - 0.5 < index && index <= _lastIndex) {
          return Opacity(
            opacity: ((index - (_lastIndex - 1)) * 2) - 1,
            child: doneButton,
          );
        } else {
          return nextButton;
        }
      },
    );
  }
}

class _StepButton extends StatelessWidget {
  // ignore: unused_element
  const _StepButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        padding: WidgetStatePropertyAll(
          EdgeInsets.all(8),
        ),
      ),
      onPressed: onPressed,
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}

class LocaleButtonWidget extends HookConsumerWidget {
  const LocaleButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(AppLocalization.currentLocale);

    final theme = Theme.of(context);

    final focus = useFocusNode()..unfocus();

    // bug: Selected item is correctly highlighted on the web and desktop, but on the android
    //  https://github.com/flutter/flutter/issues/70294
    return DropdownButton<AppLocale>(
      value: currentLocale,
      onChanged: (_) => focus.unfocus(),
      focusNode: focus,
      alignment: Alignment.bottomCenter,
      isExpanded: true,
      items: [
        for (final locale in AppLocale.values)
          DropdownMenuItem<AppLocale>(
            value: locale,
            onTap: () async =>
                ref.read(AppLocalization.instance).setLocale(locale),
            child: Text(
              locale.nameTr,
              textAlign: TextAlign.center,
              // changed after _bug fixed
              style: theme.textTheme.titleMedium?.copyWith(
                  color: locale == currentLocale
                      ? theme.colorScheme.primary
                      : null),
            ),
          )
      ],
      selectedItemBuilder: (BuildContext context) {
        final theme = Theme.of(context);
        return [
          for (final _ in AppLocale.values)
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                currentLocale.nameTr,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            )
        ];
      },
    );
  }
}
