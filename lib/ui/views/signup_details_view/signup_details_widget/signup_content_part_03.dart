import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/core/translation/translation_service.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_template/ui/views/signup_details_view/signup_details_controller.dart';

class SignupContentPart03 extends StatelessWidget {
  const SignupContentPart03({
    super.key,
    required this.controller,
  });

  final SignupDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: screenWidthPercent(12, context),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                textType: TextStyleType.TITLE_2,
                text: tr("singup_view_title_4"),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomText(
                textType: TextStyleType.TITLE_2,
                text: tr("app_name"),
              ),
              SvgPicture.asset(
                'assets/svgs/logo_symbol.svg',
                width: screenWidthPercent(12, context),
              )
            ],
          )
        ],
      ),
    );
  }
}
