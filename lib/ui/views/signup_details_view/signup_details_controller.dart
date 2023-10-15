import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/data/models/signup_info_model.dart';
import 'package:flutter_template/core/enums/signup_parts_enum.dart';
import 'package:flutter_template/core/services/base_controller.dart';
import 'package:flutter_template/core/translation/translation_service.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/core/utils/password_utils.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_toasts.dart';
import 'package:get/get.dart';

class SignupDetailsController extends BaseController {
  final GlobalKey<FormState> signupFormKey1 = GlobalKey<FormState>();
  final GlobalKey<FormState> signupFormKey2 = GlobalKey<FormState>();
  TextEditingController signupEmailController = TextEditingController(
      text: kDebugMode ? 'abdulrahman.shamse@gmail.com' : '');
  TextEditingController signupPasswordController =
      TextEditingController(text: kDebugMode ? "Shams@1234" : '');
  TextEditingController signupWorkSpaceController =
      TextEditingController(text: kDebugMode ? 'BabySteps' : '');
  TextEditingController signupFirstNameController =
      TextEditingController(text: kDebugMode ? 'AbdulRahman' : '');
  TextEditingController signupLastNameController =
      TextEditingController(text: kDebugMode ? "ShamsEE" : '');

  RxBool passwordVisible = false.obs;
  RxBool submitButtonEnabled = false.obs;
  Rx<SignupPartsEnum> signupPartsEnum = SignupPartsEnum.EMAIL.obs;
  PasswordUtils passwordUtils = PasswordUtils();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    if (kDebugMode) {
      switch (signupPartsEnum.value) {
        case SignupPartsEnum.EMAIL:
          passwordUtils.checkPasswordIsEmpty(
              password: signupPasswordController.text);
          submitButtonEnabled.value = signupFormKey1.currentState!.validate();
          break;
        case SignupPartsEnum.WORKSPACE:
          submitButtonEnabled.value = false;
          // submitButtonEnabled.value = signupFormKey2.currentState!.validate();
          break;
        case SignupPartsEnum.SUCCESS:
          break;
      }
    }
    super.onReady();
  }

  void hidePassword({
    required RxBool password,
    required bool value,
  }) {
    password.value = !value;
  }

  void checkIsWorkspaceNameAvailable() {
    signupWorkSpaceController.text = signupWorkSpaceController.text.trim();
    runFutureFunctionWithFullLoading(
      function: accountRepository
          .isTenantAvailable(
        workspaceName: signupWorkSpaceController.text,
      )
          .then((value) {
        value.fold((l) {
          CustomToasts.showMessage(
            message: '$l',
            messageType: MessageType.errorMessage,
          );
        }, (r) {
          if (r.tenantId == null) {
            // CustomToasts.showMessage(
            //   message: tr("login_singup_workspace_name_avalaible_success"),
            //   // message: tr('toast_general_success'),
            //   messageType: MessageType.successMessage,
            // );
            signup();
          } else {
            CustomToasts.showMessage(
              message: tr("login_singup_workspace_name_avalaible_error"),
              // message: tr('toast_general_success'),
              messageType: MessageType.errorMessage,
            );
          }
        });
      }),
    );
  }

  void signup() {
    // if (signupFormKey.currentState!.validate()) {

    runFutureFunctionWithFullLoading(
      function: tenantRegistrationRepository
          .registerTenant(
        email: signupEmailController.text,
        firstName: signupFirstNameController.text,
        lastName: signupLastNameController.text,
        password: signupPasswordController.text,
        workspaceName: signupWorkSpaceController.text,
      )
          .then((value) {
        value.fold((l) {
          CustomToasts.showMessage(
            message: '$l',
            messageType: MessageType.errorMessage,
          );
        }, (r) {
          storage.setSignupInfo(
            SignupInfoModel(
              adminEmailAddress: signupEmailController.text.trim(),
              adminFirstName: signupFirstNameController.text.trim(),
              adminLastName: signupLastNameController.text.trim(),
              adminPassword: signupPasswordController.text.trim(),
              editionId: 1,
              name: signupWorkSpaceController.text.trim(),
              tenancyName: signupWorkSpaceController.text.trim(),
            ),
          );
          CustomToasts.showMessage(
            message: "$r",
            // message: tr('toast_general_success'),
            messageType: MessageType.successMessage,
          );
          login();
          // signupPartsEnum.value = SignupPartsEnum.SUCCESS;
        });
      }),
    );
  }

  void login() {
    // if (signupFormKey.currentState!.validate()) {

    var signupInfo = storage.getSignupInfo();

    runFutuerFunction(
      function: tokenAuthRepository
          .authenticate(
        email: signupInfo!.adminEmailAddress!,
        password: signupInfo.adminPassword!,
        workspaceName: signupInfo.tenancyName!,
      )
          .then((value) {
        value.fold((l) {
          CustomToasts.showMessage(
            message: '$l',
            messageType: MessageType.errorMessage,
          );
        }, (r) {
          storage.setTokenInfo(r);
          CustomToasts.showMessage(
            message: "${r.accessToken}",
            // message: tr('toast_general_success'),
            messageType: MessageType.successMessage,
          );
          getLoginInformation();
          // signupPartsEnum.value = SignupPartsEnum.SUCCESS;
        });
      }),
    );
  }

  void getLoginInformation() {
    runFutuerFunction(
      function: sessionRepository.getCurrentLoginInformations().then((value) {
        value.fold((l) {
          CustomToasts.showMessage(
            message: '$l',
            messageType: MessageType.errorMessage,
          );
        }, (r) {
          CustomToasts.showMessage(
            message: "${r.user}" + "\n" + " ${r.tenant}",
            // message: tr('toast_general_success'),
            messageType: MessageType.successMessage,
          );
          signupPartsEnum.value = SignupPartsEnum.SUCCESS;
        });
      }),
    );
  }
}
