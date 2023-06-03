// ignore_for_file: prefer-trailing-comma

import 'package:dartx/dartx.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:how_cagri_work_on_flutter/extensions/int_ext.dart';

void main() {
  group('toPlace', () {
    <int, String>{
      0: '0',
      for (var number = 1; number <= 220; number++)

        /// last two digits: 11, 12 or 13
        if (const [11, 12, 13].contains(number % 100))
          number: '${number}th'

        /// last digit is 1
        else if (number % 10 == 1)
          number: '${number}st'

        /// last digit is 2
        else if (number % 10 == 2)
          number: '${number}nd'

        /// last digit is 3
        else if (number % 10 == 3)
          number: '${number}rd'

        /// in other cases use th
        else
          number: '${number}th',
    }.forEach((number, placeStr) {
      test('($number, $placeStr)', () {
        expect(number.toPlace(), placeStr);
      });
    });
  });

  group('toStringWithComma', () {
    <int, String>{
      0: '0',
      10: '10',
      100: '100',
      1000: '1,000',
      10000: '10,000',
      100000: '100,000',
      1000000: '1,000,000',
      10000000: '10,000,000',
      100000000: '100,000,000',
      1000000000: '1,000,000,000',
      -1000000000: '-1,000,000,000',
    }.forEach((number, string) {
      test('$number -> $string', () {
        expect(number.toStringWithComma(), string);
      });
    });
  });

  group('range', () {
    test('0.range(0, step: 0)', () {
      try {
        0.range(0, step: 0);

        /// 'range' must throw exception when step is 0, so
        /// we should not reach this line
        expect(0, isException);
      } catch (e) {
        expect(e, isException);
      }
    });

    <Pair<int, int>, dynamic>{
      const Pair(-10, 0): [-10, -9, -8, -7, -6, -5, -4, -3, -2, -1],
      const Pair(-10, -9): [-10],
      const Pair(0, 0): [],
      const Pair(1, 0): [],
      const Pair(1, 10): [1, 2, 3, 4, 5, 6, 7, 8, 9],
      const Pair(9, 10): [9],
    }.forEach((parameter, expectResult) {
      test('${parameter.first}.range(${parameter.second})', () {
        expect(parameter.first.range(parameter.second), expectResult);
      });
    });
  });
}
