import 'dart:io' show exit;

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:weather_today/application/const/app_links.dart';
import 'package:weather_today/domain/controllers/general_settings_controller.dart';
import 'package:weather_today/domain/controllers/localization_controller.dart';

import 'expandable_custom.dart';

class DataLoaderNR extends FamilyAsyncNotifier<String, Uri> {
  static final i = AsyncNotifierProvider.family<DataLoaderNR, String, Uri>(
    DataLoaderNR.new,
    name: '$DataLoaderNR',
  );

  @override
  Future<String> build(Uri uri) async => (await http.get(uri)).body;
}

class TermsConditionsWidget extends HookConsumerWidget {
  const TermsConditionsWidget({
    super.key,
    this.isAccepted = false,
  });

  final bool isAccepted;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(AppLocalization.currentTranslation);

    final expandsCR = useState([true, false, false]);
    final expands = expandsCR.value;

    // final hasAnyExpanded = expands.reduce((value, el) => value |= el);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (final (index, isExpanded) in expands.indexed)
          Flexible(
            flex: isExpanded ? 10 : 0,
            child: ExpPanel(
              hasIcon: true,
              initialExpanded: isExpanded,
              onExpand: (isExpanding) {
                List<bool> now = expands.toList();
                now = expands.map((_) => false).toList();
                now[index] = isExpanding;

                expandsCR.value = now.toList();
              },
              header: ListTile(
                title: Text(
                  switch (index) {
                    0 => t.termsConditions.termsUseApp,
                    1 => t.termsConditions.termsAndConditions,
                    2 || _ => t.termsConditions.privacyPolicy,
                  },
                ),
              ),
              expanded: HookConsumer(
                builder: (context, ref, child) {
                  final dataAsync = ref.watch(
                    DataLoaderNR.i(
                      switch (index) {
                        0 => AppLinks.termsOfUseAppUrl,
                        1 => AppLinks.termsAndConditionsUrl,
                        2 || _ => AppLinks.privacyPolicyUrl,
                      },
                    ),
                  );

                  final hExpanded = useRef(0.0);

                  return dataAsync.when(
                    data: (data) => LayoutBuilder(
                      builder: (context, cnstr) {
                        if (cnstr.hasBoundedHeight) {
                          hExpanded.value = cnstr.maxHeight;
                        }

                        return ConstrainedBox(
                          constraints: BoxConstraints(
                            maxHeight: hExpanded.value,
                          ),
                          child: SelectionArea(
                            child: Markdown(
                              selectable: false,
                              data: data,
                              onTapLink: (text, href, title) async {
                                await launchUrl(
                                  Uri.parse(text),
                                  mode: LaunchMode.inAppBrowserView,
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    error: (e, s) => const Center(
                      child: Text('Try again later'),
                    ),
                    loading: () => const LinearProgressIndicator(),
                  );
                },
              ),
            ),
          ),
        if (!isAccepted) ...[
          // if (!hasAnyExpanded) const Spacer(),
          const Divider(height: 0.0, thickness: 0.0),
          Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
            child: Text(t.termsConditions.confirmationWithTheAbove),
          ),
          const _ButtonBarWidget(),
          const SizedBox(height: 12),
        ],
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

    return OverflowBar(
      children: [
        TextButton(
          onPressed: () => exit(1),
          child: Text(t.termsConditions.buttonCancel),
        ),
        TextButton(
          onPressed: () async => ref
              .read(AppGeneralSettings.instance)
              .setAcceptedTermsConditions(true),
          child: Text(t.termsConditions.buttonAccept),
        ),
      ],
    );
  }
}
