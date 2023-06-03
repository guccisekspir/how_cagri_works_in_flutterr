import 'package:flutter/material.dart';

@immutable
class MColors extends ThemeExtension<MColors> {
  const MColors({
    required this.brandColor,
    required this.bgColor,
    required this.headingsTextColor,
    required this.bodyTextColor,
    required this.buttonPrimaryTextColor,
    required this.buttonSecondaryTextColor,
    required this.buttonTertiaryTextColor,
    required this.primaryButtonLinear,
    required this.secondaryButtonLinear,
    required this.tertiaryButtonLinear,
  });

  ///  ////////////// Read Only Colors /////////////

  final Color? brandColor;
  final Color? bgColor;
  final Color? headingsTextColor;
  final Color? bodyTextColor;
  final Color? buttonPrimaryTextColor;
  final Color? buttonSecondaryTextColor;
  final Color? buttonTertiaryTextColor;
  final LinearGradient? primaryButtonLinear;
  final LinearGradient? secondaryButtonLinear;
  final LinearGradient? tertiaryButtonLinear;

  @override
  MColors copyWith({
    Color? brandColor,
    Color? bgColor,
    Color? headingsTextColor,
    Color? bodyTextColor,
    Color? buttonPrimaryTextColor,
    Color? buttonSecondaryTextColor,
    Color? buttonTertiaryTextColor,
    LinearGradient? primaryButtonLinear,
    LinearGradient? secondaryButtonLinear,
    LinearGradient? tertiaryButtonLinear,
  }) {
    return MColors(
      //* Colors

      brandColor: brandColor ?? this.brandColor,
      bgColor: bgColor ?? this.bgColor,

      headingsTextColor: headingsTextColor ?? this.headingsTextColor,
      bodyTextColor: bodyTextColor ?? this.bodyTextColor,
      buttonPrimaryTextColor:
          buttonPrimaryTextColor ?? this.buttonPrimaryTextColor,
      buttonSecondaryTextColor:
          buttonSecondaryTextColor ?? this.buttonSecondaryTextColor,
      buttonTertiaryTextColor:
          buttonTertiaryTextColor ?? this.buttonTertiaryTextColor,
      primaryButtonLinear: primaryButtonLinear ?? this.primaryButtonLinear,
      secondaryButtonLinear:
          secondaryButtonLinear ?? this.secondaryButtonLinear,
      tertiaryButtonLinear: tertiaryButtonLinear ?? this.tertiaryButtonLinear,
    );
  }

  @override
  MColors lerp(ThemeExtension<MColors>? other, double t) {
    if (other is! MColors) {
      return this;
    }
    return MColors(
      brandColor: Color.lerp(brandColor, other.brandColor, t),
      bgColor: Color.lerp(bgColor, other.bgColor, t),
      headingsTextColor:
          Color.lerp(headingsTextColor, other.headingsTextColor, t),
      bodyTextColor: Color.lerp(bodyTextColor, other.bodyTextColor, t),
      buttonPrimaryTextColor:
          Color.lerp(buttonPrimaryTextColor, other.buttonPrimaryTextColor, t),
      buttonSecondaryTextColor: Color.lerp(
          buttonSecondaryTextColor, other.buttonSecondaryTextColor, t),
      buttonTertiaryTextColor:
          Color.lerp(buttonTertiaryTextColor, other.buttonTertiaryTextColor, t),
      primaryButtonLinear: LinearGradient.lerp(
          primaryButtonLinear, other.primaryButtonLinear, t),
      secondaryButtonLinear: LinearGradient.lerp(
          secondaryButtonLinear, other.secondaryButtonLinear, t),
      tertiaryButtonLinear: LinearGradient.lerp(
          tertiaryButtonLinear, other.tertiaryButtonLinear, t),
    );
  }
}
