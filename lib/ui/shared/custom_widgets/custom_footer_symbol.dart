import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/core/translation/translation_service.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/colors.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_text.dart';

class CustomFooterSymbol extends StatelessWidget {
  const CustomFooterSymbol({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          textType: TextStyleType.BODY,
          text: "${tr("footer_line")}",
          color: AppColors.uiTypographySecondaryColor,
        ),
        horSpace(60, context),
        Transform.flip(
          flipX: false,
          // flipX: languageService.appLanguage.value == "ar" ? true : false,
          child: SvgPicture.asset(
            'assets/svgs/logo_full.svg',
            // height: screenWidthPercent(24, context),
            // width: screenWidthPercent(24, context),
          ),
        )
      ],
    );
  }
}
