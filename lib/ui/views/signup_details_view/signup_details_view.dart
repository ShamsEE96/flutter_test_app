import 'package:flutter/material.dart';
import 'package:flutter_template/core/enums/signup_parts_enum.dart';
import 'package:flutter_template/core/translation/translation_service.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_back_button.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_basic_view.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_footer_symbol.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_title_with_headline.dart';
import 'package:flutter_template/ui/views/signup_details_view/signup_details_controller.dart';
import 'package:flutter_template/ui/views/signup_details_view/signup_details_widget/signup_content_part_01.dart';
import 'package:flutter_template/ui/views/signup_details_view/signup_details_widget/signup_content_part_02.dart';
import 'package:flutter_template/ui/views/signup_details_view/signup_details_widget/signup_content_part_03.dart';
import 'package:flutter_template/ui/views/signup_view/signup_view.dart';
import 'package:get/get.dart';

class SignupDetailsView extends StatefulWidget {
  const SignupDetailsView({super.key});

  @override
  State<SignupDetailsView> createState() => _SignupDetailsViewState();
}

class _SignupDetailsViewState extends State<SignupDetailsView> {
  @override
  Widget build(BuildContext context) {
    SignupDetailsController controller = Get.put(SignupDetailsController());

    return WillPopScope(
      onWillPop: () async {
        Get.offAll(() => SignupView());
        return true;
      },
      child: CustomBasicView(
        body: Obx(
          () {
            return ListView(
              padding: EdgeInsetsDirectional.symmetric(
                vertical: screenHeightPercent(20, context),
                horizontal: screenWidthPercent(20, context),
              ),
              children: [
                if (controller.signupPartsEnum.value !=
                    SignupPartsEnum.SUCCESS) ...[
                  CustomBackButton(
                    customBackButtonTypeEnum: CustomBackButtonTypeEnum.NORMAL,
                    onTap: () {
                      Get.offAll(() => SignupView());
                    },
                  ),
                  verSpace(60, context),
                  CustomHeadlineWithTitle(
                    title: tr("singup_view_title_2"),
                    headline: tr("singup_view_headline_1"),
                  ),
                ],
                // verSpace(9, context),
                if (controller.signupPartsEnum.value ==
                    SignupPartsEnum.EMAIL) ...[
                  verSpace(9, context),
                  SignupContentPart01(controller: controller),
                  verSpace(7, context),
                ],
                if (controller.signupPartsEnum.value ==
                    SignupPartsEnum.WORKSPACE) ...[
                  verSpace(9, context),
                  SignupContentPart02(controller: controller),
                  verSpace(7, context),
                ],
                if (controller.signupPartsEnum.value ==
                    SignupPartsEnum.SUCCESS) ...[
                  verSpace(3, context),
                  SignupContentPart03(controller: controller),
                  verSpace(2.5, context),
                ],
                CustomFooterSymbol(),
              ],
            );
          },
        ),
      ),
    );
  }
}
