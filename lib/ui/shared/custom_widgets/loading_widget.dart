import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/colors.dart';

class LoadingWidget extends StatelessWidget {
  LoadingWidget({
    Key? key,
    required this.center,
  }) : super(key: key);

  final bool center;

  @override
  Widget build(BuildContext context) {
    return center
        ? Center(
            child: SpinKitDancingSquare(
              color: AppColors.brandAzureColor,
              size: screenWidthPercent(6, context),
              //  type: SpinKitWaveType.center,
            ),
          )
        : SpinKitDancingSquare(
            color: AppColors.brandAzureColor,
            size: screenWidthPercent(6, context),
            //   type: SpinKitWaveType.center,
          );
  }
}
