/// Количество меток для отображения на графике.
class CountLabel {
  const CountLabel.fromLTRB(
    this.left,
    this.top,
    this.right,
    this.bottom, {
    this.topUp,
    this.bottomLow,
  });

  static const CountLabel zero = CountLabel.fromLTRB(0, 0, 0, 0);

  /// Количество меток слева
  final int left;

  /// Количество меток сверху
  final int top;

  /// Количество меток справа
  final int right;

  /// Количество меток снизу
  final int bottom;

  /// Количество меток сверху выше [top].
  final int? topUp;

  /// Количество меток снизу ниже [bottom].
  final int? bottomLow;
}
