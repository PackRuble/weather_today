import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/link.dart';
import 'package:weather_today/const/app_icons.dart';
import 'package:weather_today/core/services/app_theme_service/controller/app_theme_controller.dart';
import 'package:weather_today/ui/shared/tips_widget.dart';
import 'package:weather_today/ui/shared/wrapper_page.dart';

import '../../../shared/custom_appbar.dart';
import 'user_api_page_controller.dart';

/// Страница по управлению пользовательским апи ключом.
class UserApiPage extends ConsumerWidget {
  const UserApiPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController viewController =
        ref.watch(UserApiPageController.pr).listViewController;

    final t = ref.watch(UserApiPageController.tr);

    return WrapperPage(
      child: Scaffold(
        appBar: RAppBar(t.apiWeatherPage.appbarTitle),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          controller: viewController,
          physics: ref.watch(AppTheme.scrollPhysics).scrollPhysics,
          children: const [
            _AboutApiWidget(),
            Divider(height: 4.0),
            _StatusTileWidget(),
            Divider(height: 4.0),
            _TextFieldApiWidget(),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}

class _AboutApiWidget extends ConsumerWidget {
  const _AboutApiWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(UserApiPageController.tr);

    return Column(
      children: [
        TipRWidget(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          text: Text('${AppSmiles.info} ${t.apiWeatherPage.tips.info}\n'
              '${AppSmiles.free} ${t.apiWeatherPage.tips.free}'),
        ),
        Link(
          target: LinkTarget.defaultTarget,
          uri: Uri.parse('https://openweathermap.org/api'),
          builder: (BuildContext context, Future<void> Function()? followLink) {
            return TextButton(
              onPressed: followLink,
              child: Text(t.apiWeatherPage.goToSite,
                  style: const TextStyle(color: Colors.blue)),
            );
          },
        ),
      ],
    );
  }
}

class _StatusTileWidget extends ConsumerWidget {
  const _StatusTileWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(UserApiPageController.tr);

    final bool isSetUserApi =
        ref.watch(UserApiPageController.isUserApiKeyWeather);

    final ThemeData theme = Theme.of(context);

    final String title = isSetUserApi
        ? t.apiWeatherPage.userApi.usingApi
        : t.apiWeatherPage.defaultApi.usingApi;

    final String subtitle = isSetUserApi
        ? t.apiWeatherPage.userApi.numbOfCalls
        : t.apiWeatherPage.defaultApi.numbOfCalls;

    final Color color = isSetUserApi ? Colors.green : Colors.red;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: ListTile(
            title: Text(title),
            subtitle: Text(subtitle),
            contentPadding: const EdgeInsets.all(8.0),
            leading: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
              ],
            ),
            horizontalTitleGap: 0.0,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isSetUserApi)
              IconButton(
                padding: EdgeInsets.zero,
                tooltip: t.apiWeatherPage.tooltips.delApiKey,
                icon: const Icon(Icons.delete),
                onPressed: () async =>
                    ref.watch(UserApiPageController.pr).deleteUserApi(context),
              ),
            Tooltip(
              message: t.apiWeatherPage.tooltips.checkApiKey,
              child: TextButton(
                child: const Text('Check'),
                onPressed: () async =>
                    ref.watch(UserApiPageController.pr).checkApi(),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class _TextFieldApiWidget extends ConsumerWidget {
  const _TextFieldApiWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(UserApiPageController.tr);

    final bool isSetUserApi =
        ref.watch(UserApiPageController.isUserApiKeyWeather);

    final bool isLoading = ref.watch(UserApiPageController.isTestingApiKey);

    final String hint = isSetUserApi
        ? t.apiWeatherPage.userApi.fieldTip
        : t.apiWeatherPage.defaultApi.fieldTip;

    final controller = ref.watch(UserApiPageController.pr).apiTextController;

    final focusNode = ref.watch(UserApiPageController.pr).apiTextFocusNode;

    focusNode.addListener(() {
      // coldfix хотелось плавно перемещать вверх поле, если вдруг оно не вмещалось
      final listController =
          ref.read(UserApiPageController.pr).listViewController;

      double? offset;

      if (focusNode.hasFocus) {
        offset = listController.position.maxScrollExtent;
        if (offset == 0.0) {
          offset = 50.0;
        }
      } else {
        offset = 0.0;
      }

      listController.animateTo(offset,
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
    });

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        focusNode: focusNode,
        obscureText: isSetUserApi,
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: IconButton(
            icon: const Icon(Icons.content_paste_rounded),
            tooltip: t.apiWeatherPage.tooltips.clipboardButton,
            onPressed: () async {
              final String? clipboardData =
                  (await Clipboard.getData('text/plain'))?.text;

              ref
                  .read(UserApiPageController.pr)
                  .setTextFromClipboard(clipboardData);
            },
          ),
          suffixIcon: const _DoneAndLoadingWidget(),
          enabled: !isSetUserApi && !isLoading,
          hintText: hint,
          border: const OutlineInputBorder(),
        ),
        keyboardType: TextInputType.text,
        onSubmitted: (_) => ref.read(UserApiPageController.pr).setUserApi(),
      ),
    );
  }
}

class _DoneAndLoadingWidget extends ConsumerWidget {
  const _DoneAndLoadingWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(UserApiPageController.tr);

    final bool isLoading = ref.watch(UserApiPageController.isTestingApiKey);
    return isLoading
        ? IconButton(
            tooltip: t.apiWeatherPage.tooltips.awaiting,
            icon: const CircularProgressIndicator(strokeWidth: 2.0),
            onPressed: () => ref
                .read(UserApiPageController.isTestingApiKey.notifier)
                .update((_) => true),
          )
        : IconButton(
            tooltip: t.apiWeatherPage.tooltips.set,
            icon: const Icon(Icons.check_circle_outline_rounded),
            onPressed: () => ref.read(UserApiPageController.pr).setUserApi(),
          );
  }
}
