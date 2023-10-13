import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/colors.dart';

class CustomOtherLogin extends StatelessWidget {
  const CustomOtherLogin({
    super.key,
    required this.imageName,
    required this.onTap,
  });

  final String imageName;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsetsDirectional.all(
          screenWidthPercent(40, context),
        ),
        width: screenWidthPercent(7, context),
        height: screenWidthPercent(7, context),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: AppColors.fillColorButtonIcon,
          ),
          borderRadius: BorderRadiusDirectional.circular(13),
        ),
        child: SvgPicture.asset(
          'assets/svgs/$imageName.svg',
          // width: screenWidthPercent(1, context),
        ),
      ),
    );
  }
}
