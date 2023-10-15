import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/colors.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_text.dart';

enum CustomBackButtonTypeEnum {
  SMALL, // EDIT
  NORMAL, // BACK
  BIG, // DELETE
}

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
    required this.customBackButtonTypeEnum,
    this.imageName = "ic_arrow_left",
    required this.onTap,
    this.showText = false,
    this.text,
    this.insideContainer = false,
    this.width,
    this.height,
    this.color = AppColors.brandAzureColor,
  });

  final String imageName;
  final String? text;
  final Color? color;
  final Function onTap;
  final CustomBackButtonTypeEnum customBackButtonTypeEnum;
  final double? width;
  final double? height;
  final bool showText;
  final bool insideContainer;

  Map<String, dynamic> chooseButtonType(BuildContext context) {
    switch (customBackButtonTypeEnum) {
      case CustomBackButtonTypeEnum.SMALL:
        return {
          "width": screenWidthPercent(13, context),
          "height": screenWidthPercent(13, context),
        };
      case CustomBackButtonTypeEnum.NORMAL:
        return {
          "width": screenWidthPercent(10, context),
          "height": screenWidthPercent(10, context),
          "showText": showText,
        };
      case CustomBackButtonTypeEnum.BIG:
        return {
          "width": screenWidthPercent(7, context),
          "height": screenWidthPercent(7, context),
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> enumResult = chooseButtonType(context);

    return InkWell(
      onTap: () {
        onTap();
      },
      child: insideContainer
          ? Container(
              width: enumResult["width"] ??
                  width ??
                  screenWidthPercent(10, context),
              height: enumResult["width"] ??
                  height ??
                  screenWidthPercent(10, context),
              padding: EdgeInsetsDirectional.all(
                screenWidthPercent(50, context),
              ),
              decoration: BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadiusDirectional.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackColor.withOpacity(0.16),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: RotatedBox(
                quarterTurns: customBackButtonTypeEnum ==
                            CustomBackButtonTypeEnum.NORMAL &&
                        storage.getAppLanguage() == 'ar'
                    ? 2
                    : 0,
                child: SvgPicture.asset(
                  'assets/svgs/$imageName.svg',
                  color: color,
                ),
              ),
            )
          : Row(
              children: [
                RotatedBox(
                  quarterTurns: customBackButtonTypeEnum ==
                              CustomBackButtonTypeEnum.NORMAL &&
                          storage.getAppLanguage() == 'ar'
                      ? 2
                      : 0,
                  child: SvgPicture.asset(
                    'assets/svgs/$imageName.svg',
                    color: AppColors.brandAzureColor,
                  ),
                ),
                horSpace(40, context),
                if (showText) ...[
                  CustomText(
                    textType: TextStyleType.HEADLINE_REG,
                    text: text ?? "",
                    color: color!,
                  ),
                ]
              ],
            ),
    );
  }
}
