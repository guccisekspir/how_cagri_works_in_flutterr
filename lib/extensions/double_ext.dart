import 'package:dartx/dartx.dart';
import 'package:how_cagri_work_on_flutter/extensions/int_ext.dart';

extension DoubleExt on double {
  String toStringWithComma() {
    final split = toString().split('.');
    final intPart = toInt().toStringWithComma();

    return split.length == 1 ? intPart : '$intPart.${split[1]}';
  }

  double asFixed(int fractionDigits) =>
      toStringAsFixed(fractionDigits).toDoubleOrNull() ?? 0;

  String toStringAsFixedWithComma(int fractionDigits) =>
      asFixed(fractionDigits).toStringWithComma().removeSuffix('.0');

  String removeDecimalZeroFormat() =>
      toStringAsFixed(truncateToDouble() == this ? 0 : 1);

  String removeZeroAtStart() => toString().removePrefix('0');

  String fixedRemoveZeroAtStart(int fractionDigits) =>
      toStringAsFixed(fractionDigits).removePrefix('0');
}
