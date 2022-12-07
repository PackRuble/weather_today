import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/core/controllers/localization_controller.dart';

import '../../../shared/appbar_widget.dart';
import '../../../shared/terms_use_app_markdown.dart';
import '../../../shared/wrapper_page.dart';

class TermsUseAppPage extends ConsumerWidget {
  const TermsUseAppPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(AppLocalization.currentTranslation);

    return WrapperPage(
      child: Scaffold(
        appBar: RAppBar(t.licenseTermsPage.title),
        body: const TermsUseAppMarkdown(),
      ),
    );
  }
}
