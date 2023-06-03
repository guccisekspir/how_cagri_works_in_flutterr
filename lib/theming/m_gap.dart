import 'package:flutter/material.dart';

/// In this class we define the global Gap's which defined in Figma
class MGap {
  static final MGap _mGap = MGap._internal();
  MGap._internal();
  factory MGap() {
    return _mGap;
  }

  SizedBox get tinyGap => const SizedBox(
        height: 4,
        width: 4,
      );
  SizedBox get smallGap => const SizedBox(
        height: 8,
        width: 8,
      );
  SizedBox get mediumGap => const SizedBox(
        height: 12,
        width: 12,
      );
  SizedBox get mediumLargeGap => const SizedBox(
        height: 16,
        width: 16,
      );
  SizedBox get largeGap => const SizedBox(
        height: 24,
        width: 24,
      );
  SizedBox get xLargeGap => const SizedBox(
        height: 32,
        width: 32,
      );
  SizedBox get xxLargeGap => const SizedBox(
        height: 64,
        width: 64,
      );

  /// Whole screen horizontal padding
  Padding get horizontalPadding => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
      );
}
