import 'package:flutter_test/flutter_test.dart';
import 'package:weather_today/ui/feature/chart_widget_feature/chart_utils.dart';

void main() {
  group('chart_utils.dart', () {
    test('Testing ChartUtils.isSuitYLabel()', () {
      bool isLabel = ChartUtils.isSuitYLabel(15.0, -15.0, 20.0, 5.0);
      expect(isLabel, true);

      // тестируем краевые положительные точки
      isLabel = ChartUtils.isSuitYLabel(17.6, -20.0, 20.0, 5.0);
      expect(isLabel, false);

      isLabel = ChartUtils.isSuitYLabel(17.5, -20.0, 20.0, 5.0);
      expect(isLabel, true);

      isLabel = ChartUtils.isSuitYLabel(17.4, -20.0, 20.0, 5.0);
      expect(isLabel, true);

      // тестируем краевые отрицательные
      isLabel = ChartUtils.isSuitYLabel(-17.6, -20.0, 20.0, 5.0);
      expect(isLabel, false);

      isLabel = ChartUtils.isSuitYLabel(-17.5, -20.0, 20.0, 5.0);
      expect(isLabel, true);

      isLabel = ChartUtils.isSuitYLabel(-17.4, -20.0, 20.0, 5.0);
      expect(isLabel, true);

      // тестируем точки ближе к 0
      isLabel = ChartUtils.isSuitYLabel(-0.1, -1.0, 1.0, 0.4);
      expect(isLabel, false);

      // когда (min и max) >= 0
      isLabel = ChartUtils.isSuitYLabel(2.9, 1.0, 20.0, 4.0);
      expect(isLabel, false);

      isLabel = ChartUtils.isSuitYLabel(3.0, 1.0, 20.0, 4.0);
      expect(isLabel, true);

      isLabel = ChartUtils.isSuitYLabel(3.1, 1.0, 20.0, 4.0);
      expect(isLabel, true);

      isLabel = ChartUtils.isSuitYLabel(17.9, 1.0, 20.0, 4.0);
      expect(isLabel, true);

      isLabel = ChartUtils.isSuitYLabel(18.0, 1.0, 20.0, 4.0);
      expect(isLabel, true);

      isLabel = ChartUtils.isSuitYLabel(18.1, 1.0, 20.0, 4.0);
      expect(isLabel, false);

      // когда (min и max) < 0
      isLabel = ChartUtils.isSuitYLabel(-2.9, -20.0, -1.0, 4.0);
      expect(isLabel, false);

      isLabel = ChartUtils.isSuitYLabel(-3.0, -20.0, -1.0, 4.0);
      expect(isLabel, true);

      isLabel = ChartUtils.isSuitYLabel(-3.1, -20.0, -1.0, 4.0);
      expect(isLabel, true);

      isLabel = ChartUtils.isSuitYLabel(-17.9, -20.0, -1.0, 4.0);
      expect(isLabel, true);

      isLabel = ChartUtils.isSuitYLabel(-18.0, -20.0, -1.0, 4.0);
      expect(isLabel, true);

      isLabel = ChartUtils.isSuitYLabel(-18.1, -20.0, -1.0, 4.0);
      expect(isLabel, false);

      // когда min = 0, max > 0
      isLabel = ChartUtils.isSuitYLabel(3.9, 0.0, 20.0, 4.0);
      expect(isLabel, false);

      isLabel = ChartUtils.isSuitYLabel(4.0, 0.0, 20.0, 4.0);
      expect(isLabel, true);

      isLabel = ChartUtils.isSuitYLabel(4.1, 0.0, 20.0, 4.0);
      expect(isLabel, true);

      isLabel = ChartUtils.isSuitYLabel(17.9, 0.0, 20.0, 4.0);
      expect(isLabel, true);

      isLabel = ChartUtils.isSuitYLabel(18.0, 0.0, 20.0, 4.0);
      expect(isLabel, true);

      isLabel = ChartUtils.isSuitYLabel(18.1, 0.0, 20.0, 4.0);
      expect(isLabel, false);

      // когда max = 0, min < 0
      isLabel = ChartUtils.isSuitYLabel(-3.9, -20.0, 0.0, 4.0);
      expect(isLabel, false);

      isLabel = ChartUtils.isSuitYLabel(-4.0, -20.0, 0.0, 4.0);
      expect(isLabel, true);

      isLabel = ChartUtils.isSuitYLabel(-4.1, -20.0, 0.0, 4.0);
      expect(isLabel, true);

      isLabel = ChartUtils.isSuitYLabel(-17.9, -20.0, 0.0, 4.0);
      expect(isLabel, true);

      isLabel = ChartUtils.isSuitYLabel(-18.0, -20.0, 0.0, 4.0);
      expect(isLabel, true);

      isLabel = ChartUtils.isSuitYLabel(-18.1, -20.0, 0.0, 4.0);
      expect(isLabel, false);
    });
  });
}
