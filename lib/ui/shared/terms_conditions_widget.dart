// ignore_for_file: unnecessary_raw_strings
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

enum _TermsAsset {
  privacyPolicy(r'assets/doc/privacy_policy.md'),
  termsConditions(r'assets/doc/terms&conditions.md'),
  termsUseApp(r'assets/doc/terms_of_use_of_the_app.md'),
  ;

  const _TermsAsset(this.filePath);

  final String filePath;
}

class TermsDocWidget extends ConsumerWidget {
  const TermsDocWidget({
    required this.termsAsset,
    Key? key,
  }) : super(key: key);

  final _TermsAsset termsAsset;

  Future<String> loadAsset() async {
    return rootBundle.loadString(termsAsset.filePath);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FutureBuilder<String>(
      // ignore: discarded_futures
      future: loadAsset(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Markdown(
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

class PrivacyPolicyMarkdown extends ConsumerWidget {
  const PrivacyPolicyMarkdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const TermsDocWidget(
      termsAsset: _TermsAsset.privacyPolicy,
    );
  }
}

class TermsAndConditionsMarkdown extends ConsumerWidget {
  const TermsAndConditionsMarkdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const TermsDocWidget(
      termsAsset: _TermsAsset.termsConditions,
    );
  }
}

class TermsUseAppMarkdown extends ConsumerWidget {
  const TermsUseAppMarkdown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const TermsDocWidget(
      termsAsset: _TermsAsset.termsUseApp,
    );
  }
}
