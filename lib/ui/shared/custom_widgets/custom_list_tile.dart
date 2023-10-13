import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/colors.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_text.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    this.prefixImageName,
    this.text,
    this.onTap,
    this.textColor,
    this.prefixImageColor,
    this.fontSize,
    this.fontWeight,
    this.textAlign,
    this.settingsPage = false,
  });

  final Function? onTap;
  final String? text;
  final double? fontSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final String? prefixImageName;
  final Color? prefixImageColor;
  final TextAlign? textAlign;
  final bool settingsPage;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 5,
      contentPadding: settingsPage
          ? EdgeInsetsDirectional.symmetric(
              horizontal: screenWidthPercent(10, context),
            )
          : null,
      leading: SvgPicture.asset(
        "assets/svgs/$prefixImageName.svg",
        width: screenWidthPercent(12, context),
        height: screenWidthPercent(12, context),
        color: prefixImageColor ?? AppColors.fillColorButtonIcon,
        fit: BoxFit.cover,
      ),
      title: CustomText(
        textType: TextStyleType.CUSTOM,
        text: text ?? "",
        color: textColor ?? AppColors.fillColorButtonIcon,
        fontWeight: fontWeight ?? FontWeight.w500,
        fontSize: fontSize ?? screenWidthPercent(25, context),
        // fontSize: fontSize ?? screenHeightPercent(45, context),
        textAlign: textAlign ?? TextAlign.start,
      ),
      onTap: () {
        if (onTap != null) onTap!();
      },
    );
  }
}
