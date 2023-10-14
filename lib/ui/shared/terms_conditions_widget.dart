// ignore_for_file: unnecessary_raw_strings
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'markdown_future_builder.dart';

enum _TermsAsset {
  privacyPolicy(r'assets/doc/privacy_policy.md'),
  termsConditions(r'assets/doc/terms&conditions.md'),
  termsUseApp(r'assets/doc/terms_of_use_of_the_app.md'),
  ;

  const _TermsAsset(this.filePath);

  final String filePath;
}

class TermsDocWidget extends StatelessWidget {
  const TermsDocWidget({
    required this.termsAsset,
    super.key,
  });

  final _TermsAsset termsAsset;

  Future<String> loadAsset() async {
    return rootBundle.loadString(termsAsset.filePath);
  }

  @override
  Widget build(BuildContext context) {
    return MarkdownFutureBuilder(loadAsset: loadAsset);
  }
}

class PrivacyPolicyMarkdown extends ConsumerWidget {
  const PrivacyPolicyMarkdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const TermsDocWidget(
      termsAsset: _TermsAsset.privacyPolicy,
    );
  }
}

class TermsAndConditionsMarkdown extends ConsumerWidget {
  const TermsAndConditionsMarkdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const TermsDocWidget(
      termsAsset: _TermsAsset.termsConditions,
    );
  }
}

class TermsUseAppMarkdown extends ConsumerWidget {
  const TermsUseAppMarkdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const TermsDocWidget(
      termsAsset: _TermsAsset.termsUseApp,
    );
  }
}
