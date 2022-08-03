/// Useful extensions to [String].
extension StringCasingExtension on String {
  /// Change the first letter to a capital letter.
  ///
  /// 'hello world' => 'Hello world'
  String toCapitalized() {
    return length > 0
        ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}'
        : '';
  }

  /// Change the first letter to a lowercase letter.
  ///
  /// 'Hello world' => 'hello world'
  String toStartWithLowercase() {
    return length > 0
        ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}'
        : '';
  }
}
