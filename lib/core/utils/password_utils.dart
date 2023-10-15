import 'package:flutter_template/core/data/models/apis/password_complexity_setting_model.dart';
import 'package:flutter_template/core/enums/password_strength.dart';
import 'package:flutter_template/core/translation/translation_service.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:get/get.dart';

class PasswordUtils {
  PasswordUtils() {
    passwordComplexitySetting = storage.getPasswordComplexitySetting();
    passwordStrength.value = tr("singup_view_password_strength_weak");
    initConditionsCount();
  }
  PasswordComplexitySetting? passwordComplexitySetting;
  RxBool showPasswordValidationSettings = false.obs;
  RxString passwordStrength = "".obs;
  Rx<PasswordStrengthEnum> passwordStrengthEnum = PasswordStrengthEnum.WEAK.obs;
  int passwordConditionsCount = 0;
  RxInt passwordConditionsPassed = 0.obs;

  void initConditionsCount() {
    if (passwordComplexitySetting?.requiredLength != null) {
      passwordConditionsCount++;
    }
    if (passwordComplexitySetting?.requireDigit != null &&
        passwordComplexitySetting!.requireDigit!) {
      passwordConditionsCount++;
    }
    if (passwordComplexitySetting?.requireLowercase != null &&
        passwordComplexitySetting!.requireLowercase!) {
      passwordConditionsCount++;
    }
    if (passwordComplexitySetting?.requireNonAlphanumeric != null &&
        passwordComplexitySetting!.requireNonAlphanumeric!) {
      passwordConditionsCount++;
    }
    if (passwordComplexitySetting?.requireUppercase != null &&
        passwordComplexitySetting!.requireUppercase!) {
      passwordConditionsCount++;
    }
// passwordComplexitySetting?.requireLowercase==null?null:passwordComplexitySetting!.requireLowercase!?passwordConditionsCount++;
  }

  void checkPasswordIsEmpty({
    required String password,
  }) {
    password.isEmpty
        ? showPasswordValidationSettings.value = false
        : showPasswordValidationSettings.value = true;
  }

  String changePasswordConditionSvg({
    bool? condition,
  }) {
    if (condition != null) {
      if (condition) {
        return "ic_approve";
      } else {
        return "ic_reject";
      }
    }
    switch (passwordStrengthEnum.value) {
      case PasswordStrengthEnum.WEAK:
        passwordStrength.value = tr("singup_view_password_strength_weak");
        return "ic_reject";
      case PasswordStrengthEnum.NOT_STRONG:
        passwordStrength.value = tr("singup_view_password_strength_not_enough");
        return "ic_info";
      case PasswordStrengthEnum.STRONG:
        passwordStrength.value = tr("singup_view_password_strength_good");
        return "ic_approve";
    }
  }

  void validateRequiredLength(String? value) {
    passwordConditionsPassed.value = 0;
    if (value != null) {
      value.length < passwordComplexitySetting!.requiredLength!
          ? null
          : passwordConditionsPassed.value++;
    }
  }
}
