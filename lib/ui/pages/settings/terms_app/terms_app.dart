import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_today/domain/controllers/general_settings_controller.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';

import '../../../shared/all_terms_widget.dart';
import '../../../shared/appbar_widget.dart';

@RoutePage()
class TermsAppPage extends ConsumerWidget {
  const TermsAppPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(AppLocalization.currentTranslation);

    // хотя это и не требуется, т.к. в обязательном порядке принимается при старте приложения.
    final bool isAcceptedTerms =
        ref.watch(AppGeneralSettings.isAcceptedTermsConditions);

    return Scaffold(
      appBar: AppBarCustom(t.termsConditions.termsAndConditions),
      body: TermsConditionsWidget(isAccepted: isAcceptedTerms),
    );
  }
}
