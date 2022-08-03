extension DoubleExt on double {
  double doubleToPrecision([int precision = 5]) => num.parse(toStringAsFixed(precision)) as double;
}

extension ExtDoubleNull on double? {
  String toStringMaybe({String filler = '-', int fixed = 0}) =>
      this?.toStringAsFixed(fixed) ?? filler;
}
