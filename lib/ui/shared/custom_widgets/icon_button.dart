import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/colors.dart';

class CustomIconButton extends StatelessWidget {
  final String svgName;
  final Function onTap;

  final double? iconWidth;
  final double? iconHeight;
  final double? padding;

  final double? borderWidth;
  final Color? borderColor;
  final Color? iconColor;

  const CustomIconButton({
    Key? key,
    required this.svgName,
    required this.onTap,
    this.iconWidth = 20,
    this.iconHeight = 20,
    this.iconColor,
    this.borderWidth = 0,
    this.borderColor = AppColors.transparentColor,
    this.padding = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
          padding: EdgeInsets.all(padding!),
          width: screenWidthPercent(iconWidth!, context),
          height: screenWidthPercent(iconHeight!, context),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: borderWidth == 0
                ? null
                : Border.all(width: borderWidth!, color: borderColor!),
          ),
          child: SvgPicture.asset(
            'assets/svgs/$svgName.svg',
            color: iconColor,
          )),
    );
  }
}

class CustomBackButton extends StatelessWidget {
  final Function onTap;
  final Color? color;
  const CustomBackButton({
    Key? key,
    required this.onTap,
    this.color = AppColors.whiteColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: storage.getAppLanguage() == 'ar' ? 2 : 0,
      child: CustomIconButton(
        svgName: 'Back',
        onTap: () {
          onTap();
        },
        iconColor: color,
      ),
    );
  }
}

class CustomDeleteButton extends StatelessWidget {
  final Function onTap;

  const CustomDeleteButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      svgName: 'Trash',
      onTap: () {
        onTap();
      },
      iconHeight: screenWidthPercent(35, context),
      iconWidth: screenWidthPercent(35, context),
      borderColor: AppColors.mainOrangeColor,
      borderWidth: 1,
      iconColor: AppColors.mainOrangeColor,
      padding: screenWidthPercent(150, context),
    );
  }
}

class CustomAddButton extends StatelessWidget {
  final Function onTap;

  const CustomAddButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      svgName: 'Add',
      onTap: () {
        onTap();
      },
      iconHeight: screenWidthPercent(35, context),
      iconWidth: screenWidthPercent(35, context),
      borderColor: AppColors.mainOrangeColor,
      borderWidth: 1,
      iconColor: AppColors.mainOrangeColor,
      padding: screenWidthPercent(150, context),
    );
  }
}
