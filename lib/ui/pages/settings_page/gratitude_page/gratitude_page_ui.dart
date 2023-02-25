import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_today/const/app_info.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';

import '../../../shared/appbar_widget.dart';
import '../../../shared/wrapper_page.dart';

class GratitudePage extends ConsumerWidget {
  const GratitudePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final t = ref.watch(AppLocalization.currentTranslation);

    final textStyle = theme.textTheme.titleMedium;

    InlineSpan getLinkText(String text, String link) {
      return WidgetSpan(
        alignment: PlaceholderAlignment.middle,
        child: InkWell(
          onTap: () async =>
              launchUrl(Uri.parse(link), mode: LaunchMode.platformDefault),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              text,
              style: theme.textTheme.titleMedium?.copyWith(
                inherit: false,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      );
    }

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
              t.gratitudePage.text(
                dart: (text) => getLinkText(text, 'https://dart.dev/'),
                flutter: (text) => getLinkText(text, 'https://flutter.dev//'),
                remiRousselet: (text) =>
                    getLinkText(text, 'https://github.com/rrousselGit'),
                riverpod: (text) => getLinkText(text, 'https://riverpod.dev/'),
                freezed: (text) =>
                    getLinkText(text, 'https://pub.dev/packages/freezed'),
                tienDoNam: (text) => getLinkText(text, 'https://tienisto.com/'),
                slang: (text) =>
                    getLinkText(text, 'https://pub.dev/packages/slang'),
                rydMike: (text) => getLinkText(text, 'http://rydmike.com/'),
                flexColorScheme: (text) => getLinkText(
                    text, 'https://pub.dev/packages/flex_color_scheme'),
                myEmail: (_) => getLinkText(
                    AppInfo.mailAuthor, 'mailto:${AppInfo.mailAuthor}'),
                tgGroup: (text) => getLinkText(text, AppInfo.telegramGroup),
              ),
              textAlign: TextAlign.justify,
              style: textStyle,
            ),
          ],
        ),
      ),
    );
  }
}
