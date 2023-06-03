import 'package:flutter/material.dart';
import 'package:how_cagri_work_on_flutter/extensions/m_colors.dart';
import 'package:how_cagri_work_on_flutter/global/widgets/spam_blocker.dart';
import 'package:how_cagri_work_on_flutter/theming/m_contants.dart';
import 'package:how_cagri_work_on_flutter/theming/m_text_style.dart';

enum ButtonTypes { Primary, Secondary, Tertiary }

class MButton {
  static final MButton _mButton = MButton._internal();
  MButton._internal();
  factory MButton({BuildContext? fetchedContext}) {
    /// we fetch the context only one time
    if (fetchedContext != null) {
      _mButton.ccontext = fetchedContext;
    }
    _mButton.mColors = Theme.of(_mButton.ccontext!).extension<MColors>();
    return _mButton;
  }
  BuildContext? ccontext;
  MColors? mColors;

///////////////////////////////
  //* Main Buttons
///////////////////////////////

  Widget BigButton({
    required bool isEnabled,
    required String title,
    required ButtonTypes type,
    double? height = 52,
    double? width = double.infinity,
    Function()? onTap,
  }) {
    final baseTextStyle = MTextStyle().button1.apply(
        color: type == ButtonTypes.Primary
            ? mColors!.buttonPrimaryTextColor
            : type == ButtonTypes.Secondary
                ? mColors!.buttonSecondaryTextColor
                : mColors!.buttonTertiaryTextColor);

    return SpamBlocker(
      intervalMs: MConstants().buttonNormalSpamDurationInMs,
      onTap: isEnabled ? onTap : null,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            gradient: !isEnabled
                ? const LinearGradient(colors: [
                    Colors.grey,
                    Colors.grey,
                  ])
                : type == ButtonTypes.Primary
                    ? mColors!.primaryButtonLinear
                    : type == ButtonTypes.Secondary
                        ? mColors!.secondaryButtonLinear
                        : mColors!.tertiaryButtonLinear,
            borderRadius: BorderRadius.circular(16)),
        child: Center(
          child: Text(
            title,
            style: type == ButtonTypes.Primary
                ? baseTextStyle
                : type == ButtonTypes.Secondary
                    ? baseTextStyle
                    : baseTextStyle,
          ),
        ),
      ),
    );
  }

  Widget MediumButton({
    required bool isEnabled,
    required String title,
    required ButtonTypes type,
    double? height = 40,
    double? width = 130,
    Function()? onTap,
  }) {
    final baseTextStyle = MTextStyle().button2.apply(
        color: type == ButtonTypes.Primary
            ? mColors!.buttonPrimaryTextColor
            : type == ButtonTypes.Secondary
                ? mColors!.buttonSecondaryTextColor
                : mColors!.buttonTertiaryTextColor);

    return SpamBlocker(
      intervalMs: MConstants().buttonHighSpamDurationInMs,
      onTap: isEnabled ? onTap : null,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
            gradient: type == ButtonTypes.Primary
                ? mColors!.primaryButtonLinear
                : type == ButtonTypes.Secondary
                    ? mColors!.secondaryButtonLinear
                    : mColors!.tertiaryButtonLinear,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text(
              title,
              style: type == ButtonTypes.Primary
                  ? baseTextStyle.apply(color: Colors.white)
                  : type == ButtonTypes.Secondary
                      ? baseTextStyle
                      : baseTextStyle,
            ),
          ),
        ),
      ),
    );
  }
}
