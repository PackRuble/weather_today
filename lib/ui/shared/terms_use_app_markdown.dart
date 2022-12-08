import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';

class TermsUseAppMarkdown extends ConsumerWidget {
  const TermsUseAppMarkdown({Key? key}) : super(key: key);

  Future<String> loadAsset() async {
    return rootBundle.loadString('assets/doc/terms_of_use_of_the_app.md');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<String>(
      // ignore: discarded_futures
      future: loadAsset(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Markdown(
            physics: ref.watch(AppTheme.scrollPhysics).scrollPhysics,
            onTapLink: (String text, String? href, String title) async {
              await launchUrl(
                Uri.parse(text),
                mode: LaunchMode.externalApplication,
              );
            },
            selectable: true,
            data: snapshot.data.toString(),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
