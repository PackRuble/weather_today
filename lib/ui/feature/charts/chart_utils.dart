import 'package:weather_today/extension/double_extension.dart';

/// Полезные утилиты для работы с графиками.
///
/// В основном, для размещения лэйблов по осям графика.
class ChartUtils {
  const ChartUtils._();

  /// Определяем, рационален ли лэйбл по оси Y.
  ///
  /// Необходимо для того, чтобы лэйблы очень близкие друг к другу,
  /// игнорировались и не отрисовывались.
  static bool isSuitYLabel(
    double value,
    double min,
    double max,
    double interval,
  ) {
    final double tolerance = interval / 2;

    if (value == 0.0 || value == min || value == max) return true;

    // min * max >= 0 - значит числа с разными знаками => следовательно, по разную сторону от нуля
    if (min * max < 0) {
      // проверка на близлежание к нулю
      if (-interval < value && value < interval) return false;

      return (0.0 < value && value <= max - tolerance) ||
          (0.0 > value && value >= min + tolerance);
    } else if (min == 0.0) {
      // значит max > 0
      return interval <= value && value <= max - tolerance;
    } else if (max == 0.0) {
      // значит min < 0
      return interval <= value.abs() && value.abs() <= min.abs() - tolerance;
    } else if (min > 0.0) {
      return min + tolerance <= value && value <= max - tolerance;
    } else {
      // max < 0
      return max.abs() + tolerance <= value.abs() &&
          value.abs() <= min.abs() - tolerance;
    }
  }

  /// Определить рациональный интервал между лэйблами оси Y.
  ///
  /// Параметры:
  /// * [count] - количество меток (label);
  /// * [upperValue] - максимальное значение метки;
  /// * [lowerValue] - минимальное значение метки;
  static double getYIntervalBetweenLabel(
    double lowerValue,
    double upperValue,
    int count,
  ) {
    assert(upperValue > lowerValue);
    assert(count > 1);

    if (lowerValue > 0 && upperValue > 0) {
      return (upperValue / (count - 1)).doubleToPrecision();
    } else if (lowerValue < 0 && upperValue < 0) {
      return (lowerValue.abs() / (count - 1)).doubleToPrecision();
    } else {
      return ((upperValue - lowerValue) / (count - 1)).doubleToPrecision();
    }
  }

  /// Получить точность разряда дробей, для рациональных меток шкалы.
  static int getYPrecision(double interval) {
    if (interval >= 1.0) {
      return 0;
    } else if (interval >= 0.1) {
      return 1;
    } else if (interval >= 0.01) {
      return 2;
    } else {
      return 3;
    }
  }

  /// Функция для разбития списка на равные интервалы. С нюансом.
  ///
  /// Если при делении (длина списка - 1)/(кол-во точек - 1) получаем:
  /// * нечетное число, то левый крайний интервал больше правого.
  /// * четное число, то крайние интервалы будут равны.
  /// * 0 - все интервалы будут равны
  ///
  /// [edgePoints] - обязательно использовать краевые точки.
  /// Чтобы разделить оптимально, нужно проверить по формуле:
  /// (длина списка - кол-во точек) / (кол-во точек - 1) = целое число.
  static List<int> getXInterval(
    int count,
    int length, [
    bool edgePoints = false,
  ]) {
    assert(length >= count && count >= 2);

    final int lastPoints = length - 1;

    if (edgePoints) {
      if (count == 2) {
        return [0, lastPoints];
      }

      // находим целочисленный интервал. Интервалов на 1 меньше, чем точек.
      final int lengthInterval = lastPoints ~/ (count - 1);

      return List.generate(count - 1, (int index) => index * lengthInterval)
        ..add(lastPoints);
    }

    // остаток от деления, который необходимо распределить по краям.
    // затем делим пополам, чтобы обозначить точку отсчета.
    final int startPlus = ((length - 1) % (count - 1)) ~/ 2;

    // находим целочисленный интервал. Интервалов на 1 меньше, чем точек
    final int lengthInterval = (length - 1) ~/ (count - 1);

    return List.generate(
      count,
      (int index) => startPlus + (index * lengthInterval),
    );
  }
}
