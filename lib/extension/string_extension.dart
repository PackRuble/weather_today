/// Useful extensions to [String].
extension StringCasingExtension on String {
  /// Change the first letter to a capital letter.
  ///
  /// 'hello world' => 'Hello world'
  String toCapitalized() => toCapitalize;

  String get toCapitalize => isNotEmpty
      ? length == 1
          ? toUpperCase()
          : '${this[0].toUpperCase()}${substring(1)}'
      : '';

  /// Change the first letter to a lowercase letter.
  ///
  /// 'Hello World' => 'hello World'
  String toLowerCased() {
    if (length > 1) {
      return '${this[0].toLowerCase()}${substring(1)}';
    } else if (length == 1) {
      return toLowerCase();
    } else {
      return '';
    }
  }
}
