import 'package:flutter/painting.dart';

class AppColors {
//!--- Base Colors -----

  static const Color mainBackgroundColor = Color.fromRGBO(37, 40, 54, 1);
  static const Color secondaryBackgroundColor = Color.fromRGBO(31, 29, 43, 1);
  static const Color mainOrangeColor = Color.fromRGBO(234, 124, 105, 1);
  static const Color lightTextColor = Color.fromRGBO(171, 187, 194, 1);
  static const Color darkBorderColor = Color.fromRGBO(57, 60, 73, 1);
  static const Color textfieldColor = Color.fromRGBO(45, 48, 62, 1);
  static const Color lightPerpileColor = Color.fromRGBO(146, 136, 224, 1);
  static const Color lightOrangeColor = Color.fromRGBO(255, 181, 114, 1);
  static const Color lightBlueColor = Color.fromRGBO(101, 176, 246, 1);

  static const Color mainColor = Color.fromARGB(255, 81, 60, 95);

//*--- Order status color
  static const Color completeOrderTextColor = Color.fromRGBO(80, 209, 170, 1);
  static const Color completeOrderBackColor =
      Color.fromRGBO(80, 209, 170, 0.24);
  static const Color pleacedOrderTextColor = Color.fromRGBO(255, 181, 114, 1);
  static const Color pleacedOrderBackColor =
      Color.fromRGBO(255, 181, 114, 0.24);
  static const Color preparingOrderTextColor = Color.fromARGB(255, 92, 78, 196);
  static const Color preparingOrderBackColor =
      Color.fromRGBO(146, 136, 224, 0.24);
  static const Color cancelOrderTextColor = Color.fromRGBO(230, 69, 82, 1);
  static const Color cancelOrderBackColor = Color.fromRGBO(230, 69, 82, 0.24);

  static const Color deliverdOrderTextColor = Color.fromRGBO(101, 176, 246, 1);
  static const Color deliverdOrderBackColor =
      Color.fromRGBO(101, 176, 246, 0.24);

  //*=======================

  static const Color primaryColor = Color(0xFFFF7D31);
  static const Color secondaryColor = Color(0xFFFFA837);
  static const Color greyIosBottomSheetBackgroundColor =
      Color.fromRGBO(248, 248, 248, 0.82);

  static const Color blueColor = Color.fromRGBO(59, 134, 255, 1);
  static const Color blackColor = Color.fromRGBO(0, 0, 0, 1);
  static const Color whiteColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color transparentColor = Color.fromRGBO(0, 0, 0, 0);

  static const Color blue100Color = Color.fromRGBO(3, 97, 219, 1);
  static const Color blue150Color = Color.fromRGBO(0, 47, 108, 1);
  static const Color blue200Color = Color.fromRGBO(0, 45, 110, 1);
  static const Color blue300Color = Color.fromRGBO(57, 45, 93, 1);
  static const Color blueAccentColor = Color.fromRGBO(0, 180, 225, 1);
  static const Color turquoiseColor = Color.fromRGBO(0, 157, 175, 1);
  static const Color cyanColor = Color.fromRGBO(0, 175, 162, 1);
  static const Color sendMessageColor = Color.fromRGBO(229, 255, 253, 1);
  static const Color zoomColor = Color.fromRGBO(45, 140, 255, 1);

  static const Color grey25Color = Color.fromRGBO(248, 248, 248, 1);
  static const Color grey50Color = Color.fromRGBO(246, 246, 246, 1);
  static const Color grey75Color = Color.fromRGBO(241, 241, 241, 1);
  static const Color grey100Color = Color.fromRGBO(230, 230, 230, 1);
  static const Color grey200Color = Color.fromRGBO(165, 165, 165, 1);
  static const Color grey500Color = Color.fromRGBO(117, 120, 123, 1);

  static const Color greenColor = Color.fromRGBO(43, 159, 0, 1);
  static const Color markerGreenColor = Color.fromRGBO(0, 175, 162, 1);
  static const Color darkGreenColor = Color.fromRGBO(0, 110, 102, 1);

  static const Color orangeColor = Color.fromRGBO(255, 143, 28, 1);
  static const Color darkOrangeColor = Color.fromRGBO(255, 196, 0, 1);
  static const Color brightRedColor = Color.fromRGBO(255, 88, 93, 1);

  static const Color grey = Color.fromRGBO(0, 47, 108, 0.38);
  static const Color redColor = Color.fromRGBO(230, 69, 82, 1);
  static const Color notificationRedColor = Color.fromRGBO(255, 0, 0, 1);

  //!==========App Colors=============

  static const Color uiWhiteColor = Color.fromRGBO(255, 255, 255, 1);
  static const Color uiWhiteColorWith60Opacity =
      Color.fromRGBO(255, 255, 255, 0.60);
  static const Color uiWhiteColorWith15Opacity =
      Color.fromRGBO(255, 255, 255, 0.15);

  static const Color brandAzureColor = Color.fromRGBO(78, 134, 247, 1);
  static const Color brandMangoColor = Color.fromRGBO(245, 192, 68, 1);
  static const Color brandSpringGreenColor = Color.fromRGBO(91, 215, 126, 1);
  static const Color uiRedCTAColor = Color.fromRGBO(255, 119, 111, 1);
  static const Color uiTypographyPrimaryColor = Color.fromRGBO(14, 15, 18, 1);
  static const Color uiTypographySecondaryColor = Color.fromRGBO(85, 85, 85, 1);
  static const Color uiTypographyDisableColor =
      Color.fromRGBO(181, 181, 181, 1);
  static const Color uiTypographyGreyDarkerColor =
      Color.fromRGBO(214, 214, 214, 1);
  static const Color uiTypographyGreyLighterColor =
      Color.fromRGBO(244, 244, 244, 1);
  static const Color uiTypographyPlaceholderColor =
      Color.fromRGBO(116, 116, 116, 1);
  static const Color fillColorButtonIcon = Color.fromRGBO(0, 92, 156, 1);
  static const Color fillColorNavBar = Color.fromRGBO(238, 238, 238, 1);
  static const Color borderColorButtonIcon = Color.fromRGBO(112, 112, 112, 1);
  static const Color dividerColor = Color.fromRGBO(155, 164, 181, 1);
  static const Color cyanFontColor = Color.fromRGBO(113, 139, 198, 1);
  static const Color dropShadowColor = Color.fromRGBO(0, 0, 0, 0.16);
  static const Color navItemNotActiveColor = Color.fromRGBO(0, 92, 156, 1);
  static const Color drawerDividerColor = Color.fromRGBO(213, 213, 213, 1);

  static const Color linearGradientColor1 = Color.fromRGBO(255, 255, 255, 1);
  static const Color linearGradientColor2 = Color.fromRGBO(240, 240, 240, 1);
  static const Color linearGradientColor3 = Color.fromRGBO(221, 221, 221, 1);
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF" + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
