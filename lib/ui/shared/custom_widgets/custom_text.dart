import 'package:flutter/material.dart';
import 'package:flutter_template/core/utils/general_utils.dart';

enum TextStyleType {
  TITLE, // 40px
  SUBTITLE, // 25px
  BODYBIG, // 22px
  BODY, // 20px
  SMALL, // 15px
  CUSTOM,
}

class CustomText extends StatelessWidget {
  final TextStyleType textType;
  final String text;
  final Color color;

  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  final TextDecoration? textDecoration;

  const CustomText({
    Key? key,
    required this.textType,
    required this.text,
    required this.color,
    this.fontSize,
    this.fontWeight,
    this.textAlign = TextAlign.center,
    this.textDecoration = TextDecoration.none,
  }) : super(key: key);

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
      case TextStyleType.TITLE:
        return TextStyle(
          height: 1.2,
          decoration: textDecoration,
          color: color,
          fontSize: screenWidthPercent(13, context),
          // fontSize: screenHeightPercent(20, context),
          fontWeight: FontWeight.w900,
        );

      case TextStyleType.SUBTITLE:
        return TextStyle(
          height: 1.2,
          decoration: textDecoration,
          color: color,
          fontSize: screenWidthPercent(20, context),
          // fontSize: screenHeightPercent(32, context),
          fontWeight: fontWeight ?? FontWeight.w400,
        );

      case TextStyleType.BODYBIG:
        return TextStyle(
          height: 1.2,
          decoration: textDecoration,
          color: color,
          fontSize: screenWidthPercent(20, context),
          // fontSize: screenHeightPercent(35),
          fontWeight: fontWeight ?? FontWeight.w700,
        );

      case TextStyleType.BODY:
        return TextStyle(
          height: 1.2,
          decoration: textDecoration,
          color: color,
          fontSize: screenWidthPercent(25, context),
          // fontSize:  screenHeightPercent(45, context),
          fontWeight: fontWeight ?? FontWeight.w400,
        );

      case TextStyleType.SMALL:
        return TextStyle(
          height: 1.2,
          decoration: textDecoration,
          color: color,
          fontSize: screenWidthPercent(28, context),
          fontWeight: fontWeight ?? FontWeight.w400,
        );

      case TextStyleType.CUSTOM:
        return TextStyle(
          height: 1.2,
          decoration: textDecoration,
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        );
    }
  }
}
