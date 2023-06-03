import 'package:flutter/material.dart';
import 'package:how_cagri_work_on_flutter/extensions/m_colors.dart';
import 'package:how_cagri_work_on_flutter/theming/base_colors.dart';

enum MThemeKeys {
  DAY,
  NIGHT,
}

final ThemeData baseLight = ThemeData.light();
final ThemeData baseDark = ThemeData.dark();

//helper extensions, bridges some functionality for compatibility reasons
extension MThemeKeyExtension on MThemeKeys {
  String get folder {
    switch (this) {
      case MThemeKeys.DAY:
        return 'day';
      case MThemeKeys.NIGHT:
        return 'night';
      default:
        return "day";
    }
  }

  ThemeData get themeData {
    switch (this) {
      case MThemeKeys.DAY:
        return MTheme.dayTheme;
      case MThemeKeys.NIGHT:
        return MTheme.nightTheme;
      default:
        return MTheme.dayTheme;
    }
  }
}

// ignore: avoid_classes_with_only_static_members
class MTheme {
  //TODO: add theme extensions for other theme dependent properties, for example images
  //this is used for the light theme
  static final MColors mColorsDay = MColors(
    brandColor: const Color(0xff01C19F),
    bgColor: BaseColors.roseWhite,
    headingsTextColor: BaseColors.darkGrey87,
    bodyTextColor: BaseColors.darkGrey70,
    buttonPrimaryTextColor: Colors.white,
    buttonSecondaryTextColor: BaseColors.darkRose,
    buttonTertiaryTextColor: BaseColors.darkRose,
    primaryButtonLinear: const LinearGradient(
      colors: [
        Color(0XFFAF4B68),
        Color(0xffF89B95),
      ],
    ),
    secondaryButtonLinear: LinearGradient(colors: [
      const Color(
        0XFFAF4B68,
      ).withOpacity(0.1),
      const Color(
        0XFFAF4B68,
      ).withOpacity(0.1)
    ]),
    tertiaryButtonLinear:
        const LinearGradient(colors: [Colors.transparent, Colors.transparent]),
  );

  static final ThemeData dayTheme = ThemeData(
    fontFamily: 'Satoshi',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.transparent,
    colorSchemeSeed: Colors.deepPurple,
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Colors.transparent),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: BaseColors.darkRose,
      unselectedItemColor: BaseColors.darkRose,
    ),
    useMaterial3: true,
    extensions: <ThemeExtension<dynamic>>[
      mColorsDay,
    ],
  );

  //this is used for the dark theme
  static final MColors mColorsNight = MColors(
    brandColor: const Color(0xff01C19F),
    bgColor: BaseColors.darkBlue,
    headingsTextColor: Colors.white.withOpacity(0.87),
    bodyTextColor: Colors.white.withOpacity(0.75),
    buttonPrimaryTextColor: BaseColors.darkBlue,
    buttonSecondaryTextColor: BaseColors.orange,
    buttonTertiaryTextColor: BaseColors.orange,
    primaryButtonLinear: const LinearGradient(
      colors: [
        Color(0XFFAF4B68),
        Color(0xffF89B95),
      ],
    ),
    secondaryButtonLinear: LinearGradient(colors: [
      BaseColors.orange.withOpacity(0.16),
      BaseColors.orange.withOpacity(0.16),
    ]),
    tertiaryButtonLinear:
        const LinearGradient(colors: [Colors.transparent, Colors.transparent]),
  );

  static final ThemeData nightTheme = ThemeData(
    fontFamily: 'Satoshi',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.transparent,
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: Colors.transparent),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: BaseColors.darkBlue,
      selectedItemColor: BaseColors.darkOrange,
      unselectedItemColor: Colors.white,
    ),
    extensions: <ThemeExtension<dynamic>>[
      mColorsNight,
    ],
  );
}
