import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown_selectionarea/flutter_markdown_selectionarea.dart';
import 'package:url_launcher/url_launcher.dart';

class MarkdownFutureBuilder extends HookWidget {
  const MarkdownFutureBuilder({
    required this.loadAsset,
    super.key,
  });

  final AsyncValueGetter<String> loadAsset;

  @override
  Widget build(BuildContext context) {
    // ignore: discarded_futures
    final futureLoaded = useMemoized(loadAsset);

    return FutureBuilder<String>(
      future: futureLoaded,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SelectionArea(
            child: Markdown(
              onTapLink: (String text, String? href, String title) async {
                await launchUrl(
                  Uri.parse(text),
                  mode: LaunchMode.externalApplication,
                );
              },
              // ignore: deprecated_member_use
              selectable: false,
              data: snapshot.data!,
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
