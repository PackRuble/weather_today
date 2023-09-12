enum StringCase { upper, lower }

/// Расширение, чтобы правильно отразить название перечисления.
extension WaysToString on Enum {
  // String toShortString() {
  //   final String short = toString().split('.').last;
  //   return short.substring(0, 1).toUpperCase() + short.substring(1);
  // }

  String toWords({
    StringCase stringCase = StringCase.upper,
    bool startWithSmall = true,
  }) {
    final List<String> words = name.split('');

    final List<String> newWords = [];

    newWords
        .add(startWithSmall ? words[0].toLowerCase() : words[0].toUpperCase());

    for (var i = 1; i < words.length; i++) {
      final letter = words[i];

      if (letter.toUpperCase() == words[i]) {
        // next word
        newWords.add(' ${switch (stringCase) {
          StringCase.upper => letter.toUpperCase(),
          StringCase.lower => letter.toLowerCase(),
        }}');
      } else {
        newWords.add(words[i]);
      }
    }

    return newWords.join();
  }
}
