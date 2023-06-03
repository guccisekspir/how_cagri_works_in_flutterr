import 'package:flutter/material.dart';
import 'package:how_cagri_work_on_flutter/extensions/m_colors.dart';

class MTextStyle {
  static final MTextStyle _mButton = MTextStyle._internal();
  MTextStyle._internal();
  factory MTextStyle({BuildContext? fetchedContext}) {
    if (fetchedContext != null) {
      _mButton.ccontext = fetchedContext;
    }
    _mButton.mColors = Theme.of(_mButton.ccontext!).extension<MColors>();
    return _mButton;
  }
  BuildContext? ccontext;
  MColors? mColors;
//////////////////////
  ///* Headline Text Styles
//////////////////////
  TextStyle get hero1 => TextStyle(
      fontFamily: 'Satoshi',
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: mColors!.headingsTextColor);
  TextStyle get h1 => TextStyle(
      fontFamily: 'Satoshi',
      fontSize: 28.0,
      fontWeight: FontWeight.bold,
      color: mColors!.headingsTextColor);
  TextStyle get h2 => TextStyle(
      fontFamily: 'Satoshi',
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: mColors!.headingsTextColor);
  TextStyle get h3 => TextStyle(
      fontFamily: 'Satoshi',
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
      color: mColors!.headingsTextColor);
  TextStyle get h4 => TextStyle(
      fontFamily: 'Satoshi',
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: mColors!.headingsTextColor);

//////////////////////
  ///* OverTitle Text Styles
//////////////////////

  TextStyle get overTitle1 => TextStyle(
      fontFamily: 'Satoshi',
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: mColors!.bodyTextColor);

  TextStyle get overTitle2 => TextStyle(
      fontFamily: 'Satoshi',
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: mColors!.bodyTextColor);
  TextStyle get overTitle3 => TextStyle(
      fontFamily: 'Satoshi',
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: mColors!.bodyTextColor);
//////////////////////
  ///* Body Text Styles
//////////////////////
  TextStyle get body1 => TextStyle(
      fontFamily: 'Satoshi',
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      color: mColors!.bodyTextColor);
  TextStyle get body1Bold => TextStyle(
      fontFamily: 'Satoshi',
      fontSize: 16.0,
      fontWeight: FontWeight.bold,
      color: mColors!.bodyTextColor);

  TextStyle get body2 => TextStyle(
      fontFamily: 'Satoshi',
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: mColors!.bodyTextColor);
  TextStyle get body2Bold => TextStyle(
      fontFamily: 'Satoshi',
      fontSize: 14.0,
      fontWeight: FontWeight.bold,
      color: mColors!.bodyTextColor);
//////////////////////
  ///* Action Text Styles
//////////////////////

  TextStyle get button1 => const TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 18.0,
        fontWeight: FontWeight.bold,
      );
  TextStyle get button1NotSelected => const TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 18.0,
        fontWeight: FontWeight.w700,
      );

  TextStyle get button2 => const TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
      );
  TextStyle get button2NotSelected => const TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
      );

  TextStyle get button3 => const TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      );
  TextStyle get button3NotSelected => const TextStyle(
        fontFamily: 'Satoshi',
        fontSize: 14.0,
        fontWeight: FontWeight.w700,
      );
}
