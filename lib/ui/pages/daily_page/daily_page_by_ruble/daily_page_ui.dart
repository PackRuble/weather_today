import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:open_weather_api/open_weather_api.dart';
import 'package:weather_today/core/controllers/theme_provider.dart';
import 'package:weather_today/extension/double_extension.dart';
import 'package:weather_today/ui/shared/constant_todo.dart';
import 'package:weather_today/ui/shared/label_weather_widget.dart';
import 'package:weather_today/ui/shared/shared_widget.dart';
import 'package:weather_today/utils/const/app_icons.dart';
import 'package:weather_today/utils/const/app_insets.dart';
import 'package:weather_today/utils/conversion_manager.dart';

import '../daily_page_controller.dart';

/// Страница погоды на 7 дней.
class DailyWeatherPageByRuble extends ConsumerWidget {
  const DailyWeatherPageByRuble(this.daily);

  final List<WeatherDaily> daily;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      physics: ref.watch(AppDesignController.scrollPhysics).scrollPhysics,
      itemBuilder: (BuildContext context, int index) {
        if (index + 1 == daily.length) {
          return const LabelWeatherWidget();
        }
        return _GroupExpansionWidget(daily[index]);
      },
      separatorBuilder: (_, int index) {
        if (index + 2 == daily.length) {
          return const SizedBox.shrink();
        }
        return const Divider(height: 4.0);
      },
      itemCount: daily.length,
    );
  }
}

class _GroupExpansionWidget extends ConsumerWidget {
  const _GroupExpansionWidget(this.daily);

  final WeatherDaily daily;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ExpandableNotifier(
      child: ScrollOnExpand(
        child: ExpandablePanel(
          theme: const ExpandableThemeData(
            headerAlignment: ExpandablePanelHeaderAlignment.center,
            tapHeaderToExpand: true,
            tapBodyToExpand: false,
            tapBodyToCollapse: false,
            hasIcon: false,
          ),
          header: TileDailyWidget(daily),
          collapsed: const SizedBox.shrink(),
          expanded: _ExpandedWidget(daily),
        ),
      ),
    );
  }
}

/// Заголовок раскрывающегося тайла.
class TileDailyWidget extends ConsumerWidget {
  const TileDailyWidget(this.weather);

  final WeatherDaily weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Temp tempUnits = ref.watch(DailyPageController.tempUnits);

    final ThemeData theme = Theme.of(context);

    final TextTheme styles = theme.textTheme;

    final double textScaleFactor = MediaQuery.textScaleFactorOf(context);

    final String tempMin =
        (weather.tempMin != null) ? Temp.fromKelvinToString(tempUnits, weather.tempMin!) : '-';

    final String tempMax =
        (weather.tempMax != null) ? Temp.fromKelvinToString(tempUnits, weather.tempMax!) : '-';

    final String? pop = (weather.pop != null && weather.pop != 0.0)
        ? (weather.pop! * 100).toStringAsFixed(0)
        : null;

    return ListTile(
      minLeadingWidth: 0.0,
      horizontalTitleGap: 5.0,
      leading: SizedBox(
        width: 50.0,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.scale(
                scale: textScaleFactor * AppInsets.scaleFactorIcon,
                child: Transform.rotate(
                  angle: ConversionManager.fromRadiansToDegrees(weather.windDegree ?? 0),
                  child: Icon(AppIcons.dailyDirectWind, color: theme.iconTheme.color),
                ),
              ),
              const SizedBox(height: 3.0),
              Text.rich(
                TextSpan(
                  style: styles.bodyMedium,
                  children: <TextSpan>[
                    TextSpan(text: weather.windSpeed.toStringMaybe()),
                    TextSpan(text: ' м/с', style: styles.bodySmall),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      title: weather.date?.day == DateTime.now().day
          ? const Text('сегодня') //todo tr
          : Text(DateFormat.MMMEd().format(weather.date ?? DateTime.now())),
      subtitle: Text('${weather.weatherDescription}'),
      trailing: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text.rich(
            TextSpan(
              style: styles.bodyMedium?.copyWith(color: Colors.blue),
              children: <TextSpan>[
                TextSpan(text: pop ?? ''),
                TextSpan(
                    text: pop == null ? '' : '%',
                    style: styles.bodySmall?.copyWith(color: Colors.blue)),
              ],
            ),
          ),
          SizedBox.square(
            dimension: 50,
            child: Transform.scale(
                scale: textScaleFactor * AppInsets.scaleFactorIcon,
                child: AppImages.getWeatherIcon(weather.weatherIcon!)),
          ),
          SizedBox(
            width: 50.0,
            child: Align(
              alignment: Alignment.centerRight,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        style: styles.bodyMedium,
                        children: <TextSpan>[
                          TextSpan(text: tempMax),
                          TextSpan(text: tempUnits.abbr, style: styles.bodySmall),
                        ],
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 2.0),
                    Text.rich(
                      TextSpan(
                        style: styles.bodyMedium,
                        children: <TextSpan>[
                          TextSpan(text: tempMin),
                          TextSpan(text: tempUnits.abbr, style: styles.bodySmall),
                        ],
                      ),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Высота одного тайла с показателем погоды.
const double _minHeightRowTile = 25.0;

/// Информация в расширяющемся боксе. Все погодные характеристики здесь.
class _ExpandedWidget extends ConsumerWidget {
  const _ExpandedWidget(this.weather);

  final WeatherDaily weather;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme stylesText = Theme.of(context).textTheme;
    final Temp tempUnits = ref.watch(DailyPageController.tempUnits);

    String getTemp(double? value) {
      if (value == null) return '-';
      return Temp.fromKelvinToString(tempUnits, value);
    }

    String getPressure(double? value) {
      if (value == null) return '-';
      return Pressure.fromHectoPaToString(Pressure.mmHg, value);
    }

    const Widget HDivider = Divider(height: 1.0);

    const VerticalDivider VDivider = VerticalDivider(
      indent: 5.0,
      endIndent: 5.0,
      thickness: 1.0,
      width: 14.0,
    );

    /// Одна тайл-строка.
    Row _buildTile(String title, [String? value, String? unit]) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: stylesText.labelLarge,
          ),
          Text.rich(
            TextSpan(
              style: stylesText.labelLarge,
              children: <TextSpan>[
                TextSpan(text: value),
                TextSpan(
                  text: unit,
                  style: stylesText.labelMedium,
                ),
              ],
            ),
          ),
        ],
      );
    }

    Row _buildRow({
      required double height,
      required List<Widget> left,
      required List<Widget> right,
    }) {
      return Row(
        children: [
          Expanded(
            child: SizedBox(
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: left,
              ),
            ),
          ),
          SizedBox(
            height: height,
            child: VDivider,
          ),
          Expanded(
            child: SizedBox(
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: right,
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        const Divider(height: 0.0),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildTitleRow('Восходы и закаты'),
              _buildRow(
                height: _minHeightRowTile * 3,
                left: [
                  _buildTile('Восход солнца', DateFormat.Hm().format(weather.sunrise!)),
                  _buildTile('Закат солнца', DateFormat.Hm().format(weather.sunset!)),
                ],
                right: [
                  _buildTile('Восход луны', DateFormat.Hm().format(weather.moonrise!)),
                  _buildTile('Закат луны', DateFormat.Hm().format(weather.moonset!)),
                  _buildTile('Фаза луны', weather.moonPhase.toString()),
                ],
              ),
              HDivider,
              _buildTitleRow('Температура'),
              _buildRow(
                height: _minHeightRowTile * 1,
                left: [_buildTile('Минимум', getTemp(weather.tempMin), tempUnits.abbr)],
                right: [_buildTile('Максимум', getTemp(weather.tempMax), tempUnits.abbr)],
              ),
              HDivider,
              _buildRow(
                height: _minHeightRowTile * 5,
                left: [
                  _buildTile(' Реальная'),
                  _buildTile('Утром', getTemp(weather.tempMorning), tempUnits.abbr),
                  _buildTile('Днём', getTemp(weather.tempDay), tempUnits.abbr),
                  _buildTile('Вечером', getTemp(weather.tempEvening), tempUnits.abbr),
                  _buildTile('Ночью', getTemp(weather.tempNight), tempUnits.abbr),
                ],
                right: [
                  _buildTile(' Ощущается'),
                  _buildTile('Утром', getTemp(weather.tempFeelsLikeMorning), tempUnits.abbr),
                  _buildTile('Днём', getTemp(weather.tempFeelsLikeDay), tempUnits.abbr),
                  _buildTile('Вечером', getTemp(weather.tempFeelsLikeEvening), tempUnits.abbr),
                  _buildTile('Ночью', getTemp(weather.tempFeelsLikeNight), tempUnits.abbr),
                ],
              ),
              HDivider,
              _buildTitleRow('Показатели'),
              _buildRow(
                height: _minHeightRowTile * 3,
                left: [
                  _buildTile('Давление', getPressure(weather.pressure), ' ${Pressure.mmHg.abbr}'),
                  _buildTile('Облачность', weather.cloudiness.toStringMaybe(), '%'),
                  _buildTile('УФ', weather.uvi.toStringMaybe()),
                ],
                right: [
                  _buildTile('Влажность', weather.humidity.toStringMaybe(), '%'),
                  _buildTile('Точка росы', getTemp(weather.dewPoint), tempUnits.abbr),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// Заголовок показателей.
  Widget _buildTitleRow(String title) => Align(
        alignment: Alignment.centerLeft,
        child: HeaderRWidget(
          title,
          padding: const EdgeInsets.all(4.0),
        ),
      );
}
