import 'package:flutter/material.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/colors.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    Key? key,
    required this.title,
    this.textSize,
    this.textColor = AppColors.primaryFontColor,
    required this.onTap,
    this.fontWeight,
  }) : super(key: key);

  final String title;
  final double? textSize;
  final Color textColor;
  final Function onTap;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Text(
        title,
        style: TextStyle(
          decoration: TextDecoration.underline,
          color: textColor,
          fontSize: textSize ?? screenWidthPercent(25, context),
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
