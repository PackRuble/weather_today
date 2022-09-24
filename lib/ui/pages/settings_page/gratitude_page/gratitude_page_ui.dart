import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';

import '../../../shared/custom_appbar.dart';
import '../../../shared/wrapper_page.dart';

class GratitudePage extends ConsumerWidget {
  const GratitudePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final t = ref.watch(AppLocalization.currentTranslation);

    return WrapperPage(
      child: Scaffold(
        appBar: RAppBar(t.gratitudePage.appbarTitle),
        body: ListView(
          padding: const EdgeInsets.all(8.0),
          physics: ref.watch(AppTheme.scrollPhysics).scrollPhysics,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(3, (_) {
                  return const Icon(Icons.heart_broken_rounded,
                      color: Colors.red, size: 56.0);
                })),
            Text.rich(
              TextSpan(text: t.gratitudePage.text),
              textAlign: TextAlign.justify,
              style: theme.textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
