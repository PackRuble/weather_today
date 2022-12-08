/// Расширение, чтобы правильно отразить название языка.
extension WaysToString on Enum {
  // String toShortString() {
  //   final String short = toString().split('.').last;
  //   return short.substring(0, 1).toUpperCase() + short.substring(1);
  // }

  String toCamelCaseToWords() {
    final List<String> words = name.split('');

    final List<String> newWords = [];
    newWords.add(words[0].toUpperCase());

    for (var i = 1; i < words.length; i++) {
      if (words[i].toUpperCase() == words[i]) {
        newWords.add(' ${words[i].toUpperCase()}');
      } else {
        newWords.add(words[i]);
      }
    }

    return newWords.join();
  }
}
