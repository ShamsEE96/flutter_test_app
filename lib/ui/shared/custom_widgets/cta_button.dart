import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/core/utils/general_utils.dart';

import '../colors.dart';

enum ButtonTypeEnum {
  PROFILE,
  NORMAL,
  SMALL,
  CUSTOM,
}

class CtaButton extends StatelessWidget {
  final ButtonTypeEnum? buttonTypeEnum;

  final String title;
  final Function onTap;
  final double? textSize;
  final bool? isDisabled;
  final bool? isBusy;
  final Color? borderColor;
  final Color? fillColor;
  final Color? disableColor;
  final double? borderThickness;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? textColor;
  final VisualDensity? visualDensity;
  final FontWeight? textWeight;
  final String? startSvgPath;
  final String? endSvgPath;
  final String? centerSvgPath;
  final Color? centerSvgColor;
  final bool? stadiumShape;
  final double? width;
  final double? height;
  final bool titleInCaps;
  final bool enableOverflow;

  const CtaButton({
    Key? key,
    this.buttonTypeEnum,
    this.centerSvgColor,
    this.margin,
    this.centerSvgPath,
    this.visualDensity,
    this.textWeight,
    required this.title,
    required this.onTap,
    this.startSvgPath,
    this.textSize,
    this.isDisabled = false,
    this.isBusy = false,
    this.borderColor,
    this.fillColor,
    this.borderThickness = 1,
    this.padding,
    this.textColor,
    this.disableColor,
    this.stadiumShape = false,
    this.width,
    this.height,
    this.titleInCaps = true,
    this.enableOverflow = false,
    this.endSvgPath,
  }) : super(key: key);

  Map<String, dynamic> chooseButtonType(BuildContext context) {
    switch (buttonTypeEnum!) {
      case ButtonTypeEnum.NORMAL:
        return {
          "width": screenWidthPercent(1.25, context),
          "height": screenHeightPercent(13, context),
          "fillColor": AppColors.brandAzureColor,
          "textColor": AppColors.whiteColor,
          "borderColor": borderColor,
          "textSize": screenWidthPercent(24, context),
          // "textSize": screenHeightPercent(32, context),
          "textWeight": textWeight ?? FontWeight.w500,
        };

      case ButtonTypeEnum.SMALL:
        return {
          "width": screenWidthPercent(1.2, context),
          "height": screenHeightPercent(12, context),
          "fillColor": AppColors.fillColorButtonIcon,
          "textColor": AppColors.whiteColor,
          "borderColor": borderColor,
          "textSize": screenWidthPercent(21, context),
          "textWeight": FontWeight.bold,
        };

      case ButtonTypeEnum.PROFILE:
        return {
          "width": screenWidthPercent(1.25, context),
          "height": screenHeightPercent(13, context),
          "fillColor": AppColors.whiteColor.withOpacity(0.93),
          "textColor": AppColors.fillColorButtonIcon,
          "borderColor": AppColors.fillColorButtonIcon.withOpacity(0.52),
          "textSize": screenWidthPercent(21, context),
          "textWeight": FontWeight.bold,
        };
      case ButtonTypeEnum.CUSTOM:
        return {
          "width": width,
          "height": height,
          "fillColor": fillColor,
          "textColor": textColor,
          "borderColor": borderColor,
          "textSize": textSize,
          "textWeight": textWeight,
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> enumResult = chooseButtonType(context);

    return SizedBox(
      // width: width ?? enumResult["width"] ?? screenWidthPercent(1.2, context),
      height:
          height ?? enumResult["height"] ?? screenHeightPercent(12, context),
      child: Padding(
        padding: margin ?? EdgeInsets.all(0),
        child: Opacity(
          opacity: 1,
          // opacity: isDisabled! ? 0.5 : 1,
          child: Material(
            color: AppColors.transparentColor,
            elevation: 0,
            shadowColor: AppColors.blackColor.withOpacity(0.2),
            child: Opacity(
              opacity: isBusy! ? 0.5 : 1,
              child: ElevatedButton(
                //    visualDensity: visualDensity,
                onPressed: isBusy! || isDisabled!
                    ? () {}
                    : () {
                        onTap();
                      },
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  visualDensity: visualDensity,
                  backgroundColor: isDisabled!
                      ? disableColor ?? AppColors.uiTypographyDisableColor
                      : fillColor ?? enumResult["fillColor"],
                  shape: stadiumShape!
                      ? StadiumBorder()
                      : RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                          side: BorderSide(
                            width: borderThickness!,
                            color: isDisabled!
                                ? disableColor ??
                                    AppColors.uiTypographyDisableColor
                                : borderColor ??
                                    fillColor ??
                                    AppColors.brandAzureColor,
                          ),
                        ),
                  padding: padding ?? EdgeInsets.symmetric(vertical: 0),
                  disabledBackgroundColor:
                      disableColor ?? AppColors.uiTypographyDisableColor,
                  disabledForegroundColor:
                      disableColor ?? AppColors.uiTypographyDisableColor,
                  side: stadiumShape!
                      ? BorderSide(
                          width: borderThickness!,
                          color: isDisabled!
                              ? disableColor ??
                                  AppColors.uiTypographyDisableColor
                              : borderColor ??
                                  fillColor ??
                                  AppColors.brandAzureColor,
                        )
                      : null,
                ),

                // splashColor: fillColor,
                // disabledColor: disableColor ?? AppColors.grey200Color,
                //

                //     borderRadius: BorderRadius.circular(size.shortestSide / 24)),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: centerSvgPath != null &&
                              startSvgPath == null
                          ? MainAxisAlignment.center
                          : centerSvgPath == null &&
                                  (startSvgPath != null || endSvgPath != null)
                              ? MainAxisAlignment.spaceBetween
                              : MainAxisAlignment.center,
                      children: [
                        if (endSvgPath != null) ...[
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: screenWidthPercent(24, context),
                              // horizontal: size.width / 24,
                            ),
                            child: SizedBox(
                              width: enumResult["textSize"] ??
                                  textSize ??
                                  screenWidthPercent(25, context),
                            ),
                          ),
                        ],
                        if (centerSvgPath != null)
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: SvgPicture.asset(
                              centerSvgPath ?? '',
                              color: centerSvgColor,
                              width: enumResult["textSize"] ??
                                  textSize ??
                                  screenWidthPercent(25, context),
                              // width: screenWidthPercent(14, context),
                              // width: size.width / 14,
                            ),
                          ),
                        SizedBox(
                          width: (buttonTypeEnum == ButtonTypeEnum.CUSTOM ||
                                      buttonTypeEnum ==
                                          ButtonTypeEnum.NORMAL) &&
                                  enableOverflow == false
                              ? null
                              : screenWidthPercent(1.75, context),
                          child: Text(
                            buttonTypeEnum == ButtonTypeEnum.NORMAL &&
                                    titleInCaps == false
                                ? title
                                : buttonTypeEnum == ButtonTypeEnum.PROFILE &&
                                        titleInCaps == false
                                    ? title
                                    : buttonTypeEnum == ButtonTypeEnum.CUSTOM &&
                                            titleInCaps == false
                                        ? title
                                        : title.toUpperCase(),
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            // overflow:
                            //     enableOverflow ? TextOverflow.ellipsis : null,
                            style: TextStyle(
                              fontWeight: enumResult["textWeight"] ??
                                  textWeight ??
                                  FontWeight.w400,
                              fontSize: enumResult["textSize"] ??
                                  textSize ??
                                  screenWidthPercent(25, context),
                              // size.width / 25,
                              color: textColor ?? enumResult['textColor'],
                              // overflow:
                              //     enableOverflow ? TextOverflow.ellipsis : null,
                            ),
                          ),
                        ),
                        if (endSvgPath != null) ...[
                          Padding(
                            padding: EdgeInsetsDirectional.symmetric(
                              horizontal: screenWidthPercent(24, context),
                              // horizontal: size.width / 24,
                            ),
                            child: Container(
                              padding: EdgeInsetsDirectional.symmetric(
                                // vertical: screenWidthPercent(24, context),
                                vertical: screenWidthPercent(90, context),
                                horizontal: screenWidthPercent(90, context),
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.uiWhiteColorWith15Opacity,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: SvgPicture.asset(
                                endSvgPath ?? '',
                                width: enumResult["textSize"] ??
                                    textSize ??
                                    screenWidthPercent(25, context),
                                color: AppColors.uiWhiteColorWith60Opacity,
                                // width: screenHeightPercent(14, context),
                                // width: size.height / 14,
                              ),
                            ),
                          )
                        ]
                      ],
                    ),
                    if (startSvgPath != null)
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenWidthPercent(24, context),
                          // horizontal: size.width / 24,
                        ),
                        child: SvgPicture.asset(
                          startSvgPath ?? '',
                          width: enumResult["textSize"] ??
                              textSize ??
                              screenWidthPercent(25, context),
                          // width: screenHeightPercent(14, context),
                          // width: size.height / 14,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
