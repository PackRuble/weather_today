import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/link.dart';
import 'package:weather_today/application/const/app_icons.dart';
import 'package:weather_today/ui/shared/tips_widget.dart';

import '../../../shared/appbar_widget.dart';
import 'user_api_page_presenter.dart';

/// Страница по управлению пользовательским апи ключом.
@RoutePage()
class UserApiPage extends HookConsumerWidget {
  const UserApiPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();

    final t = ref.watch(UserApiPagePresenter.tr);

    return Scaffold(
      appBar: AppBarCustom(t.apiWeatherPage.appbarTitle),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        controller: scrollController,
        children: [
          const _AboutApiWidget(),
          const Divider(height: 4.0),
          const _StatusTileWidget(),
          const Divider(height: 4.0),
          _TextFieldApiWidget(scrollController),
          const SizedBox(height: 50.0),
        ],
      ),
    );
  }
}

class _AboutApiWidget extends ConsumerWidget {
  const _AboutApiWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(UserApiPagePresenter.tr);

    return Column(
      children: [
        TipRWidget(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          text: Text('${AppSmiles.info} ${t.apiWeatherPage.tips.info}\n'
              '${AppSmiles.free} ${t.apiWeatherPage.tips.free}'),
        ),
        Link(
          target: LinkTarget.defaultTarget,
          uri: Uri.parse('https://home.openweathermap.org/api_keys'),
          builder: (BuildContext context, Future<void> Function()? followLink) {
            return TextButton(
              onPressed: followLink,
              child: Text(t.apiWeatherPage.goToSite,
                  style: const TextStyle(color: Colors.blue)),
            );
          },
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}

class _StatusTileWidget extends ConsumerWidget {
  const _StatusTileWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(UserApiPagePresenter.tr);

    final bool isSetUserApi =
        ref.watch(UserApiPagePresenter.isUserApiKeyWeather);

    final ThemeData theme = Theme.of(context);

    final String title = isSetUserApi
        ? t.apiWeatherPage.userApi.usingApi
        : t.apiWeatherPage.defaultApi.usingApi;

    final String subtitle = isSetUserApi
        ? t.apiWeatherPage.userApi.numbOfCalls
        : t.apiWeatherPage.defaultApi.numbOfCalls;

    final Color color = isSetUserApi ? Colors.green : Colors.red;

    return Row(
      children: [
        Expanded(
          child: ListTile(
            title: Row(
              children: [
                DecoratedBox(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: theme.colorScheme.primary),
                  ),
                  child: Icon(
                    Icons.circle_rounded,
                    color: color,
                  ),
                ),
                const SizedBox(width: 8.0),
                Flexible(child: Text(title)),
              ],
            ),
            subtitle: Text(subtitle),
            contentPadding: const EdgeInsets.all(8.0),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSetUserApi)
              IconButton(
                padding: EdgeInsets.zero,
                tooltip: t.apiWeatherPage.tooltips.delApiKey,
                icon: const Icon(Icons.delete),
                onPressed: () async => ref
                    .watch(UserApiPagePresenter.instance)
                    .deleteUserApi(context),
              ),
            Tooltip(
              message: t.apiWeatherPage.tooltips.checkApiKey,
              child: TextButton(
                child: const Text('Check'),
                onPressed: () async =>
                    ref.watch(UserApiPagePresenter.instance).checkApi(),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _TextFieldApiWidget extends HookConsumerWidget {
  const _TextFieldApiWidget(this.scrollController);

  final ScrollController scrollController;

  void _moveScrollPosition(bool hasFocus) {
    double offset = scrollController.position.maxScrollExtent;

    if (hasFocus && offset == 0.0) {
      offset = 50.0;
    }

    // ignore: discarded_futures
    scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();
    final textController = useTextEditingController();

    final t = ref.watch(UserApiPagePresenter.tr);
    final bool isSetUserApi =
        ref.watch(UserApiPagePresenter.isUserApiKeyWeather);
    final bool isLoading = ref.watch(UserApiPagePresenter.isTestingApiKey);

    final String hint = isSetUserApi
        ? t.apiWeatherPage.userApi.fieldTip
        : t.apiWeatherPage.defaultApi.fieldTip;

    useEffect(() {
      focusNode.addListener(() => _moveScrollPosition(focusNode.hasFocus));

      return null;
    }, const []);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        enabled: !isSetUserApi,
        focusNode: focusNode,
        obscureText: isSetUserApi,
        controller: textController,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: const Icon(Icons.content_paste_rounded),
            tooltip: t.apiWeatherPage.tooltips.clipboardButton,
            onPressed: !isSetUserApi
                ? () async {
                    final String? clipboardData =
                        (await Clipboard.getData('text/plain'))?.text;

                    if (clipboardData != null) {
                      textController
                        ..text = clipboardData
                        ..selection = TextSelection.collapsed(
                            offset: clipboardData.length);
                    }
                  }
                : null,
          ),
          suffixIcon: _DoneAndLoadingWidget(
              onDone: () async => ref
                  .read(UserApiPagePresenter.instance)
                  .setUserApi(textController.text)),
          enabled: !isSetUserApi && !isLoading,
          hintText: hint,
          border: const OutlineInputBorder(),
        ),
        keyboardType: TextInputType.text,
        onSubmitted: (text) async =>
            ref.read(UserApiPagePresenter.instance).setUserApi(text),
      ),
    );
  }
}

class _DoneAndLoadingWidget extends ConsumerWidget {
  const _DoneAndLoadingWidget({required this.onDone});

  final void Function() onDone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(UserApiPagePresenter.tr);

    final bool isEnabled = !ref.watch(UserApiPagePresenter.isUserApiKeyWeather);

    final bool isLoading = ref.watch(UserApiPagePresenter.isTestingApiKey);
    return isLoading
        ? IconButton(
            tooltip: t.apiWeatherPage.tooltips.awaiting,
            icon: const CircularProgressIndicator(strokeWidth: 2.0),
            onPressed: () => ref
                .read(UserApiPagePresenter.isTestingApiKey.notifier)
                .update((_) => true),
          )
        : IconButton(
            tooltip: t.apiWeatherPage.tooltips.set,
            icon: const Icon(Icons.check_circle_outline_rounded),
            onPressed: isEnabled ? onDone : null,
          );
  }
}
