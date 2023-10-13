import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/colors.dart';

enum CustomSmallButtonTypeEnum {
  SMALL, // EDIT
  NORMAL, // BACK
  BIG, // DELETE
}

class CustomSmallButton extends StatelessWidget {
  const CustomSmallButton({
    super.key,
    required this.imageName,
    required this.onTap,
    required this.customSmallButtonTypeEnum,
    this.width,
    this.height,
  });

  final String imageName;
  final Function onTap;
  final CustomSmallButtonTypeEnum customSmallButtonTypeEnum;
  final double? width;
  final double? height;

  Map<String, dynamic> chooseButtonType(BuildContext context) {
    switch (customSmallButtonTypeEnum) {
      case CustomSmallButtonTypeEnum.SMALL:
        return {
          "width": screenWidthPercent(13, context),
          "height": screenWidthPercent(13, context),
        };
      case CustomSmallButtonTypeEnum.NORMAL:
        return {
          "width": screenWidthPercent(10, context),
          "height": screenWidthPercent(10, context),
        };
      case CustomSmallButtonTypeEnum.BIG:
        return {
          "width": screenWidthPercent(7, context),
          "height": screenWidthPercent(7, context),
        };
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        width: chooseButtonType(context)["width"] ??
            width ??
            screenWidthPercent(10, context),
        height: chooseButtonType(context)["width"] ??
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
          quarterTurns:
              customSmallButtonTypeEnum == CustomSmallButtonTypeEnum.NORMAL &&
                      storage.getAppLanguage() == 'ar'
                  ? 2
                  : 0,
          child: SvgPicture.asset(
            'assets/svgs/$imageName.svg',
            color: AppColors.fillColorButtonIcon,
          ),
        ),
      ),
    );
  }
}
