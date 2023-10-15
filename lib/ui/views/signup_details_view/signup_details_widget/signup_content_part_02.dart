import 'package:flutter/material.dart';
import 'package:flutter_template/core/translation/translation_service.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/core/utils/string_utils.dart';
import 'package:flutter_template/ui/shared/colors.dart';
import 'package:flutter_template/ui/shared/custom_widgets/cta_button.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_text_form_workiom_item.dart';
import 'package:flutter_template/ui/views/signup_details_view/signup_details_controller.dart';
import 'package:get/get.dart';

class SignupContentPart02 extends StatelessWidget {
  const SignupContentPart02({
    super.key,
    required this.controller,
  });

  final SignupDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.signupFormKey2,
      child: Column(
        children: [
          CustomTextFormWorkiomItem(
            text: tr("login_singup_workspace_name"),
            placeholder: tr("login_singup_workspace_name_hint"),
            prefixSvgName: "ic_public",
            suffixWidget: CustomText(
              textType: TextStyleType.BODY,
              text: workspaceContinuation,
              letterSpacing: -0.24,
              color: AppColors.uiTypographyPlaceholderColor,
            ),
            textEditingController: controller.signupWorkSpaceController,
            // onTap: () {
            //   controller.checkIsWorkspaceNameAvailable();
            // },
            onChange: (v) {
              controller.submitButtonEnabled.value =
                  controller.signupFormKey2.currentState!.validate();
              // if (controller.signupFormKey2.currentState!.validate()) {
              //   controller.checkIsWorkspaceNameAvailable();
              // }
            },
            // onSubmit: (v) {
            //   if (!v.isValidWorkSpaceName) {
            //     controller.checkIsWorkspaceNameAvailable();
            //   }
            // },
            validator: (value) {
              if (value!.isEmpty || !value.isValidWorkSpaceName) {
                return "";
                // return tr('general_field_required');
              }
              return null;
            },
          ),
          verSpace(60, context),
          CustomTextFormWorkiomItem(
            text: tr("login_singup_first_name"),
            placeholder: tr("login_singup_first_name_hint"),
            prefixSvgName: "ic_enter_info",
            textEditingController: controller.signupFirstNameController,
            onChange: (v) {
              controller.submitButtonEnabled.value =
                  controller.signupFormKey2.currentState!.validate();
              // if (controller.signupFormKey2.currentState!.validate()) {
              //   controller.checkIsWorkspaceNameAvailable();
              // }
            },
            validator: (value) {
              if (value!.isEmpty || !value.isAlphabetOnly) {
                return "";
                // return tr('general_field_required');
              }
              return null;
            },
          ),
          verSpace(60, context),
          CustomTextFormWorkiomItem(
            text: tr("login_singup_last_name"),
            placeholder: tr("login_singup_last_name_hint"),
            prefixSvgName: "ic_enter_info",
            textEditingController: controller.signupLastNameController,
            onChange: (v) {
              controller.submitButtonEnabled.value =
                  controller.signupFormKey2.currentState!.validate();
              // if (controller.signupFormKey2.currentState!.validate()) {
              //   controller.checkIsWorkspaceNameAvailable();
              // }
            },
            validator: (value) {
              if (value!.isEmpty || !value.isAlphabetOnly) {
                return "";
                // return tr('general_field_required');
              }
              return null;
            },
          ),
          verSpace(30, context),
          Obx(
            () => CtaButton(
              buttonTypeEnum: ButtonTypeEnum.NORMAL,
              titleInCaps: false,
              title: tr("singup_view_create_workspace"),
              endSvgPath: 'assets/svgs/ic_enter.svg',
              isDisabled: !controller.submitButtonEnabled.value,
              onTap: () {
                controller.signupWorkSpaceController.text =
                    controller.signupWorkSpaceController.text.trim();
                controller.signupFirstNameController.text =
                    controller.signupFirstNameController.text.trim();
                controller.signupLastNameController.text =
                    controller.signupLastNameController.text.trim();
                if (controller.signupFormKey2.currentState!.validate()) {
                  controller.checkIsWorkspaceNameAvailable();
                  // controller.signup();
                  // controller.signupPartsEnum.value = SignupPartsEnum.SUCCESS;
                }
              },
              // onTap: () {
              //   controller.signupWorkSpaceController.text =
              //       controller.signupWorkSpaceController.text.trim();
              //   controller.signupFirstNameController.text =
              //       controller.signupFirstNameController.text.trim();
              //   controller.signupLastNameController.text =
              //       controller.signupLastNameController.text.trim();
              //   // if (controller.signupFormKey.currentState!.validate()) {
              //   //   Get.to(() => SignupView());
              //   // } else {}
              //   controller.signup();
              //   // controller.signupPartsEnum.value = SignupPartsEnum.SUCCESS;
              // },
            ),
          ),
        ],
      ),
    );
  }
}
