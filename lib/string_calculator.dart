class StringCalculator {
  int add(String input) {
    if (input.isEmpty) return 0;

    final delimiters = <String>[',', '\n'];
    String numbers = input;

    if (input.startsWith('//')) {
      final delimiterSectionEnd = input.indexOf('\n');
      final delimiterSection = input.substring(2, delimiterSectionEnd);
      numbers = input.substring(delimiterSectionEnd + 1);

      final customDelimiters = RegExp(r'\[(.*?)\]').allMatches(delimiterSection);
      if (customDelimiters.isNotEmpty) {
        for (final match in customDelimiters) {
          delimiters.add(RegExp.escape(match.group(1)!));
        }
      } else {
        delimiters.add(RegExp.escape(delimiterSection));
      }
    }

    final pattern = RegExp(delimiters.join('|'));
    final parts = numbers.split(pattern);

    final parsed = parts.where((e) => e.trim().isNotEmpty).map(int.parse).toList();
    final negatives = parsed.where((n) => n < 0).toList();

    if (negatives.isNotEmpty) {
      throw Exception('negative numbers not allowed ${negatives.join(',')}');
    }

    return parsed.reduce((a, b) => a + b);
  }
}
