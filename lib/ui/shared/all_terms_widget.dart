import 'dart:io' show exit;

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/domain/controllers/general_settings_controller.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';

import 'terms_conditions_widget.dart';

const _padding = 16.0;

// ignore: non_constant_identifier_names
Widget _Divider() => const Divider(height: 0.0, thickness: 0.0);

// ignore: non_constant_identifier_names
Widget _DecoratedWidget(BuildContext context, {required Widget child}) {
  final theme = Theme.of(context);

  return Container(
    margin: const EdgeInsets.all(_padding),
    clipBehavior: Clip.antiAlias,
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
        side: BorderSide(width: 1.0, color: theme.dividerColor),
      ),
    ),
    child: child,
  );
}

class TermsConditionsWidget extends ConsumerWidget {
  const TermsConditionsWidget({
    super.key,
    this.isAccepted = false,
  });

  final bool isAccepted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(AppLocalization.currentTranslation);

    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              if (!isAccepted) ...[
                _DecoratedWidget(
                  context,
                  child: Padding(
                    padding: const EdgeInsets.all(_padding),
                    child: Text(t.termsConditions.informationForAction),
                  ),
                ),
                _Divider(),
              ],
              _TileDocWidget(
                title: t.termsConditions.termsUseApp,
                child: const TermsUseAppMarkdown(),
              ),
              _Divider(),
              _TileDocWidget(
                title: t.termsConditions.termsAndConditions,
                child: const TermsAndConditionsMarkdown(),
              ),
              _Divider(),
              _TileDocWidget(
                title: t.termsConditions.privacyPolicy,
                child: const PrivacyPolicyMarkdown(),
              ),
            ],
          ),
        ),
        if (!isAccepted) ...[
          _Divider(),
          Padding(
            padding:
                const EdgeInsets.fromLTRB(_padding, _padding, _padding, 0.0),
            child: Text(t.termsConditions.confirmationWithTheAbove),
          ),
          const _ButtonBarWidget(),
        ]
      ],
    );
  }
}

class _ButtonBarWidget extends ConsumerWidget {
  const _ButtonBarWidget({
    // ignore: unused_element
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(AppLocalization.currentTranslation);

    return ButtonBar(
      children: [
        TextButton(
            onPressed: () => exit(1),
            child: Text(t.termsConditions.buttonCancel)),
        TextButton(
            onPressed: () async => ref
                .read(AppGeneralSettings.instance)
                .setAcceptedTermsConditions(true),
            child: Text(t.termsConditions.buttonAccept)),
      ],
    );
  }
}

class _TileDocWidget extends ConsumerWidget {
  const _TileDocWidget({
    // ignore: unused_element
    super.key,
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.sizeOf(context);
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(_padding, _padding, _padding, 0.0),
          child: Text(
            title,
            style: theme.textTheme.titleMedium,
          ),
        ),
        SizedBox(
          height: size.height / 3,
          child: _DecoratedWidget(
            context,
            child: child,
          ),
        ),
      ],
    );
  }
}
