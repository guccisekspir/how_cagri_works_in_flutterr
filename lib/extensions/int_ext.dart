extension IntExt on int {
  List<int> range(
    int stop, {
    int? start,
    int step = 1,
  }) {
    if (step == 0) {
      throw Exception('Step cannot be 0');
    }
    // before upgrade to null-safety:
    // return start ?? this < stop == step > 0 ...

    return this < stop == step > 0
        ? List<int>.generate(
            ((start ?? this - stop) / step).abs().ceil(),
            (int i) => start ?? this + (i * step),
          )
        : [];
  }

  String toStringWithComma() {
    final reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

    return toString().replaceAllMapped(reg, (Match match) => '${match[1]},');
  }

  String toPlace() => ordinalEnUs(this);

  /// Get ordinal number for provided [value] in en-us locale.
  ///
  /// For multiple locales you can use package 'humanizer'
  ///
  /// https://pub.dev/packages/humanizer
  static String ordinalEnUs(int value) {
    if (value == 0) {
      return '0';
      // ignore: prefer-trailing-comma
    } else if ([11, 12, 13].contains(value % 100)) {
      // Ordinal format when value ends with 11, 12, 13
      return '${value}th';
    } else {
      return [
        // Ordinal format when value ends with 0, e.g. 80th
        '${value}th',
        // Ordinal format when value ends with 1, e.g. 81st, except 11.
        '${value}st',
        // Ordinal format when value ends with 2, e.g. 82nd, except 12.
        '${value}nd',
        // Ordinal format when value ends with 3, e.g. 83rd, except 13.
        '${value}rd',
        // Ordinal format when value ends with 4, e.g. 84th.
        '${value}th',
        // Ordinal format when value ends with 5, e.g. 85th.
        '${value}th',
        // Ordinal format when value ends with 6, e.g. 86th.
        '${value}th',
        // Ordinal format when value ends with 7, e.g. 87th.
        '${value}th',
        // Ordinal format when value ends with 8, e.g. 88th.
        '${value}th',
        // Ordinal format when value ends with 9, e.g. 89th.
        '${value}th',
      ][value % 10];
    }
  }
}
