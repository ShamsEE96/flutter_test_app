import 'package:flutter/material.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/colors.dart';

enum TextStyleType {
  TITLE_2, // 22px
  HEADLINE_REG, // 17px
  BODYBIG, // 22px
  BODY, // 15px
  CAPTION_1, // 12px
  SMALL,
  FOOTNOTE, // 13px
  CUSTOM,
}

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.textType,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign = TextAlign.center,
    this.textDecoration = TextDecoration.none,
    this.letterSpacing,
  }) : super(key: key);

  final TextStyleType textType;
  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;
  final double? letterSpacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: getTextStyle(context),
    );
  }

  TextStyle getTextStyle(BuildContext context) {
    switch (textType) {
      case TextStyleType.TITLE_2:
        return TextStyle(
          height: 1.2,
          letterSpacing: letterSpacing ?? 0.35,
          decoration: textDecoration,
          color: color ?? AppColors.uiTypographyPrimaryColor,
          fontSize: screenWidthPercent(16, context),
          // fontSize: 22,
          fontWeight: fontWeight ?? FontWeight.w500,
        );

      case TextStyleType.HEADLINE_REG:
        return TextStyle(
          height: 1.2,
          letterSpacing: letterSpacing ?? -0.41,
          decoration: textDecoration,
          color: color ?? AppColors.uiTypographySecondaryColor,
          fontSize: screenWidthPercent(21, context),
          // fontSize: screenHeightPercent(32, context),
          fontWeight: fontWeight ?? FontWeight.w400,
        );

      case TextStyleType.BODYBIG:
        return TextStyle(
          height: 1.2,
          letterSpacing: letterSpacing,
          decoration: textDecoration,
          color: color,
          fontSize: screenWidthPercent(20, context),
          // fontSize: screenHeightPercent(35),
          fontWeight: fontWeight ?? FontWeight.w700,
        );

      case TextStyleType.BODY:
        return TextStyle(
          height: 1.2,
          letterSpacing: letterSpacing ?? -0.32,
          decoration: textDecoration,
          color: color ?? AppColors.uiTypographyPrimaryColor,
          fontSize: screenWidthPercent(24, context),
          // fontSize: 15,
          fontWeight: fontWeight ?? FontWeight.w400,
        );

      case TextStyleType.CAPTION_1:
        return TextStyle(
          height: 1.2,
          letterSpacing: letterSpacing,
          decoration: textDecoration,
          color: color,
          fontSize: screenWidthPercent(28, context),
          fontWeight: fontWeight ?? FontWeight.w400,
        );
      case TextStyleType.SMALL:
        return TextStyle(
          height: 1.2,
          letterSpacing: letterSpacing,
          decoration: textDecoration,
          color: color,
          fontSize: screenWidthPercent(28, context),
          fontWeight: fontWeight ?? FontWeight.w400,
        );
      case TextStyleType.FOOTNOTE:
        return TextStyle(
          height: 1.2,
          letterSpacing: letterSpacing ?? -0.08,
          decoration: textDecoration,
          color: color ?? AppColors.uiTypographySecondaryColor,
          fontSize: screenWidthPercent(28, context),
          fontWeight: fontWeight ?? FontWeight.w400,
        );

      case TextStyleType.CUSTOM:
        return TextStyle(
          height: 1.2,
          letterSpacing: letterSpacing,
          decoration: textDecoration,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        );
    }
  }
}
