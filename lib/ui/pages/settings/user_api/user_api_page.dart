// ignore_for_file: unused_element

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/link.dart';
import 'package:weather_today/application/const/app_icons.dart';
import 'package:weather_today/domain/controllers/weather/weather_current_controller.dart';
import 'package:weather_today/domain/controllers/weather/weather_onecall_controller.dart';
import 'package:weather_today/ui/shared/tips_widget.dart';

import '../../../shared/appbar_widget.dart';
import 'user_api_page_presenter.dart';

const Color _userApiColor = Colors.green;
const Color _devApiColor = Colors.red;

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
        children: const [
          _AboutApiWidget(),
          Divider(height: 4.0),
          _StatusTileWidget(),
          _TextFieldApiWidget(),
          Divider(height: 4.0),
          _AboutTariff(),
          SizedBox(height: 50.0),
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

    final Color color = isSetUserApi ? _userApiColor : _devApiColor;

    return ListTile(
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
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(subtitle),
          Row(
            mainAxisAlignment: isSetUserApi
                ? MainAxisAlignment.spaceEvenly
                : MainAxisAlignment.start,
            children: [
              Flexible(
                child: Tooltip(
                  message: t.apiWeatherPage.tooltips.checkApiKey,
                  child: TextButton(
                    child: Text(
                      t.apiWeatherPage.buttonCheckRelevance,
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () async =>
                        ref.read(UserApiPagePresenter.instance).checkApi(),
                  ),
                ),
              ),
              if (isSetUserApi)
                Tooltip(
                  message: t.apiWeatherPage.tooltips.delApiKey,
                  child: TextButton(
                    child: Text(
                      t.apiWeatherPage.buttonReset,
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () async => ref
                        .read(UserApiPagePresenter.instance)
                        .deleteUserApi(context),
                  ),
                ),
            ],
          ),
        ],
      ),
      contentPadding: const EdgeInsets.all(8.0),
    );
  }
}

class _TextFieldApiWidget extends HookConsumerWidget {
  const _TextFieldApiWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();

    final t = ref.watch(UserApiPagePresenter.tr);
    final bool isSetUserApi =
        ref.watch(UserApiPagePresenter.isUserApiKeyWeather);
    final bool isLoading = ref.watch(UserApiPagePresenter.isTestingApiKey);

    final String hint = isSetUserApi
        ? t.apiWeatherPage.userApi.fieldTip
        : t.apiWeatherPage.defaultApi.fieldTip;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        enabled: !isSetUserApi,
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
                .setUserApi(textController.text),
          ),
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

class _AboutTariff extends ConsumerWidget {
  const _AboutTariff({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = ref.watch(UserApiPagePresenter.tr);

    final currentWeatherForDevApiInSeconds = WeatherCurrentNotifier
        .allowedRequestRateCurrentWithDefaultApi.inSeconds;
    final onecallWeatherForDevApiInHours =
        WeatherOnecallNotifier.allowedRequestRateOnecallWithDefaultApi.inHours;

    return Column(
      children: [
        InfoTile(
          iconColor: _userApiColor,
          text: t.apiWeatherPage.userApi.countCalls,
        ),
        InfoTile(
            iconColor: _devApiColor,
            text: t.apiWeatherPage.defaultApi.countCalls(
              currentInSeconds: currentWeatherForDevApiInSeconds,
              onecallInHours: onecallWeatherForDevApiInHours,
            )),
      ],
    );
  }
}

class InfoTile extends StatelessWidget {
  const InfoTile({super.key, required this.iconColor, required this.text});

  final Color iconColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      minVerticalPadding: 0,
      leading: Icon(
        Icons.circle_rounded,
        color: iconColor,
      ),
      title: Text(text),
      titleTextStyle: theme.textTheme.labelMedium,
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
    );
  }
}
