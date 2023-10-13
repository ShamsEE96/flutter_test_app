import 'package:flutter/material.dart';
import 'package:flutter_template/core/services/base_controller.dart';
import 'package:get/get.dart';

class SplashController extends BaseController {
  SplashController(this.context) {}

  late BuildContext context;
  RxBool loading = false.obs;

  @override
  Future<void> onInit() async {
    // var connect = await connectivityService.connectivity.checkConnectivity();
    // print(connect);

    // await Future.delayed(Duration(seconds: 3));
    // if (connect == ConnectivityResult.none) {
    //   showCheckConnectionDialog(
    //     context: context,
    //     widget: Obx(
    //       () {
    //         return loading.value
    //             ? LoadingWidget(center: false)
    //             : CtaButton(
    //                 buttonTypeEnum: ButtonTypeEnum.NORMAL,
    //                 title: tr("general_retry"),
    //                 titleInCaps: false,
    //                 onTap: () async {
    //                   loading.value = true;
    //                   connect = await connectivityService.connectivity
    //                       .checkConnectivity();
    //                   if (connect != ConnectivityResult.none) {
    //                     Get.back(closeOverlays: true);
    //                     loading.value = false;
    //                     onInit();
    //                   } else {
    //                     loading.value = false;
    //                   }
    //                 },
    //               );
    //       },
    //     ),
    //   );
    // } else {
    //   if (deepLinkService.appLink != null) {
    //     deepLinkService.openAppLink(deepLinkService.appLink!);
    //   } else if (storage.getFirstLaunch() && storage.getTokenInfo() == null) {
    //     Get.off(() => LandingView());
    //   } else
    //     Get.off(
    //       () => storage.isLoggedIn ? MainView() : LandingView(),
    //     );

    //   storage.setFirstLaunch(false);

    super.onInit();
  }
}
