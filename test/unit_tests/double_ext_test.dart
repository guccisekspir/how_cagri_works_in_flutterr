import 'package:dartx/dartx.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:how_cagri_work_on_flutter/extensions/double_ext.dart';

void main() {
  group('toStringWithComma', () {
    <double, String>{
      0: '0.0',
      12: '12.0',
      123: '123.0',
      12.3: '12.3',
      1234: '1,234.0',
      123.4: '123.4',
      12345: '12,345.0',
      123456: '123,456.0',
      1234567: '1,234,567.0',
      12345678: '12,345,678.0',
      123456789: '123,456,789.0',
      1234567890: '1,234,567,890.0',
      -1234567890: '-1,234,567,890.0',
      1234567.891: '1,234,567.891',
      -1234567.891: '-1,234,567.891',
    }.forEach((number, string) {
      test('$number -> $string', () {
        expect(number.toStringWithComma(), string);
      });
    });
  });

  group('asFixed', () {
    <Pair<double, int>, double>{
      const Pair(10, 0): 10,
      const Pair(-10, 0): -10,
      const Pair(10.325, 0): 10,
      const Pair(-10.325, 0): -10,
      const Pair(1234567.891123, 2): 1234567.89,
      const Pair(1234567.891123, 4): 1234567.8911,
    }.forEach((parameter, number) {
      test('${parameter.first} -> $number', () {
        expect(
          parameter.first.asFixed(parameter.second),
          number,
        );
      });
    });
  });

  group('toStringAsFixedWithComma', () {
    <Pair<double, int>, String>{
      const Pair(10, 0): '10',
      const Pair(-10, 0): '-10',
      const Pair(10.325, 0): '10',
      const Pair(-10.325, 0): '-10',
      const Pair(1234567.891123, 2): '1,234,567.89',
      const Pair(1234567.891123, 4): '1,234,567.8911',
    }.forEach((parameter, string) {
      test('${parameter.first} -> $string', () {
        expect(
          parameter.first.toStringAsFixedWithComma(parameter.second),
          string,
        );
      });
    });
  });
}
