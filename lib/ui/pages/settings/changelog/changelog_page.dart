import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_today/ui/shared/markdown_future_builder.dart';

class ChangelogPage extends StatelessWidget {
  const ChangelogPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Dialog.fullscreen(
      backgroundColor: theme.scaffoldBackgroundColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const CloseButton(),
                Text(
                  'Changelog',
                  style: theme.textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          Expanded(
            child: MarkdownFutureBuilder(
              loadAsset: () async {
                final url = Uri.https(
                  'raw.githubusercontent.com',
                  'PackRuble/weather_today/master/CHANGELOG.md',
                );
                return (await http.get(url)).body;
              },
            ),
          ),
        ],
      ),
    );
  }
}
