import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/core/enums/password_strength.dart';
import 'package:flutter_template/core/enums/signup_parts_enum.dart';
import 'package:flutter_template/core/translation/translation_service.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/colors.dart';
import 'package:flutter_template/ui/shared/custom_widgets/cta_button.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_progressindeicator.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_text_form_workiom_item.dart';
import 'package:flutter_template/ui/views/signup_details_view/signup_details_controller.dart';
import 'package:get/get.dart';

class SignupContentPart01 extends StatelessWidget {
  const SignupContentPart01({
    super.key,
    required this.controller,
  });

  final SignupDetailsController controller;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.signupFormKey1,
      child: Column(
        children: [
          CustomTextFormWorkiomItem(
            text: tr("singup_view_email"),
            placeholder: tr("singup_view_email_hint"),
            prefixSvgName: "ic_email",
            suffixSvgName: "x-circle",
            textEditingController: controller.signupEmailController,
            onTap: () {
              controller.signupEmailController.clear();
            },
            onChange: (v) {
              controller.submitButtonEnabled.value =
                  controller.signupFormKey1.currentState!.validate();
            },
            validator: (value) {
              print(value);
              if (value!.isEmpty || !value.isEmail) {
                return "";
                // return tr('general_field_required');
              }
              return null;
            },
          ),
          verSpace(60, context),
          Obx(
            () {
              return CustomTextFormWorkiomItem(
                text: tr("singup_view_password"),
                placeholder: tr("singup_view_password_hint"),
                showPassword: controller.passwordVisible.value,
                prefixSvgName: "ic_change_password",
                textEditingController: controller.signupPasswordController,
                keyboardType: TextInputType.visiblePassword,
                suffixWidget: !controller.passwordVisible.value
                    ? Icon(
                        Icons.visibility,
                        color: AppColors.uiTypographyPlaceholderColor,
                      )
                    : Icon(
                        Icons.visibility_off,
                        color: AppColors.redColor,
                      ),
                onTap: () {
                  controller.hidePassword(
                    password: controller.passwordVisible,
                    value: controller.passwordVisible.value,
                  );
                },
                onChange: (value) {
                  controller.passwordUtils.checkPasswordIsEmpty(
                      password: controller.signupPasswordController.text);
                  if (!(value.length <
                      controller.passwordUtils.passwordComplexitySetting!
                          .requiredLength!)) {
                    controller.passwordUtils.validateRequiredLength(value);
                    controller.passwordUtils.passwordStrengthEnum.value =
                        PasswordStrengthEnum.STRONG;
                  } else {
                    controller.passwordUtils.validateRequiredLength(value);
                    controller.passwordUtils.passwordStrengthEnum.value =
                        PasswordStrengthEnum.WEAK;
                  }
                  controller.submitButtonEnabled.value =
                      controller.signupFormKey1.currentState!.validate();
                },
                validator: (value) {
                  if (value!.length <
                      controller.passwordUtils.passwordComplexitySetting!
                          .requiredLength!)
                  // if (value!.length < (controller.passwordUtils.passwordComplexitySetting?.requiredLength??5))
                  {
                    return "";
                    // return tr('general_field_required');
                  }
                  return null;
                },
              );
            },
          ),
          Obx(
            () => CustomProgressIndicator(
              progress: double.parse(controller
                  .passwordUtils.passwordConditionsPassed.value
                  .toString()),
              stepsCount: controller.passwordUtils.passwordConditionsCount,
            ),
          ),
          Obx(
            () => Visibility(
              visible:
                  controller.passwordUtils.showPasswordValidationSettings.value,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        "assets/svgs/${controller.passwordUtils.changePasswordConditionSvg()}.svg",
                        // "assets/svgs/${widget.prefixSvgName}.svg",
                        // color: AppColors.uiTypographyPrimaryColor,
                        width: screenWidthPercent(18, context),
                      ),
                      horSpace(60, context),
                      CustomText(
                        textType: TextStyleType.BODY,
                        text: controller.passwordUtils.passwordStrength.value,
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  ),
                  Visibility(
                    visible: controller.passwordUtils.passwordComplexitySetting
                            ?.requiredLength !=
                        null,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          "assets/svgs/${controller.passwordUtils.changePasswordConditionSvg(condition: !(controller.signupPasswordController.text.length < controller.passwordUtils.passwordComplexitySetting!.requiredLength!))}.svg",
                          // "assets/svgs/${widget.prefixSvgName}.svg",
                          // color: AppColors.uiTypographyPrimaryColor,
                          width: screenWidthPercent(18, context),
                        ),
                        horSpace(60, context),
                        CustomText(
                          textType: TextStyleType.CAPTION_1,
                          text:
                              "${tr("singup_view_password_validation_must_have")} ${controller.passwordUtils.passwordComplexitySetting?.requiredLength} ${tr("singup_view_password_validation_characters_count")}",
                          // fontWeight: FontWeight.w500,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          verSpace(30, context),
          Obx(
            () => CtaButton(
              buttonTypeEnum: ButtonTypeEnum.NORMAL,
              titleInCaps: false,
              title: tr("login_singup_confirm_password"),
              endSvgPath: 'assets/svgs/ic_enter.svg',
              isDisabled: !controller.submitButtonEnabled.value,
              onTap: () {
                controller.signupEmailController.text =
                    controller.signupEmailController.text.trim();
                if (controller.signupFormKey1.currentState!.validate()) {
                  controller.signupPartsEnum.value = SignupPartsEnum.WORKSPACE;
                  controller.submitButtonEnabled.value = false;
                  controller.onReady();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
