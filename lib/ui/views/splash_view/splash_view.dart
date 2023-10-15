import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/colors.dart';
import 'package:flutter_template/ui/views/splash_view/splash_controller.dart';

import 'package:get/get.dart';

class SplashView extends StatefulWidget {
  SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  // SplashController splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    SplashController splashController = Get.put(SplashController(context));
    splashController.onInit();
    return Scaffold(
      backgroundColor: AppColors.uiWhiteColor,
      body: Stack(
        alignment: AlignmentDirectional.center,
        fit: StackFit.expand,
        children: [
          PositionedDirectional(
            top: screenHeightPercent(3, context),
            child: Container(
              //   margin: EdgeInsetsDirectional.symmetric(
              //     horizontal: screenWidthPercent(8),
              //   ),
              child: SvgPicture.asset(
                'assets/svgs/logo_full.svg',
                width: screenWidthPercent(1.25, context),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.only(
                top: screenHeightPercent(1.5, context),
              ),
              child: SpinKitCircle(
                color: AppColors.brandAzureColor,
                size: screenWidthPercent(6, context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
