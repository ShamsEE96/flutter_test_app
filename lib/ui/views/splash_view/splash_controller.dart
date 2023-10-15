import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_template/core/services/base_controller.dart';
import 'package:flutter_template/core/translation/translation_service.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/custom_widgets/cta_button.dart';
import 'package:flutter_template/ui/shared/custom_widgets/loading_widget.dart';
import 'package:flutter_template/ui/shared/utils.dart';
import 'package:flutter_template/ui/views/signup_view/signup_view.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  SplashController(this.context) {}

  late BuildContext context;
  RxBool loading = false.obs;

  @override
  Future<void> onInit() async {
    var connect = await connectivityService.connectivity.checkConnectivity();
    await Future.delayed(Duration(seconds: 3));
    if (connect == ConnectivityResult.none) {
      showCheckConnectionDialog(
        context: context,
        widget: Obx(
          () {
            return loading.value
                ? LoadingWidget(center: false)
                : CtaButton(
                    buttonTypeEnum: ButtonTypeEnum.NORMAL,
                    title: tr("general_retry"),
                    titleInCaps: false,
                    onTap: () async {
                      loading.value = true;
                      connect = await connectivityService.connectivity
                          .checkConnectivity();
                      if (connect != ConnectivityResult.none) {
                        Get.back(closeOverlays: true);
                        loading.value = false;
                        onInit();
                      } else {
                        loading.value = false;
                      }
                    },
                  );
          },
        ),
      );
    } else {
      // if (storage.getFirstLaunch() && storage.getTokenInfo() == null) {
      currentTimeZone = await FlutterTimezone.getLocalTimezone();

      print(currentTimeZone);
      getPasswordComplexitySetting();
      // Get.off(() => SignupView());
      // } else
      // Get.off(
      //   () => storage.isLoggedIn ? MainView() : LandingView(),
      // );

      storage.setFirstLaunch(false);

      super.onInit();
    }
  }

  void getPasswordComplexitySetting() {
    runFutuerFunction(
      function: profileRepository.getPasswordComplexitySetting().then(
        (value) {
          value.fold(
            (l) {
              // CustomToasts.showMessage(
              //   message: "$l",
              //   messageType: MessageType.errorMessage,
              // );
            },
            (r) {
              storage.setPasswordComplexitySetting(r);
              Get.off(() => SignupView());
              // userProfileModel.value = r;
              // editUserDisplayNameController.text =
              //     userProfileModel.value.displayName ??
              //         userProfileModel.value.username ??
              //         "";
            },
          );
        },
      ),
    );
  }
}
