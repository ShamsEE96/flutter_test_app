import 'package:flutter/material.dart';
import 'package:flutter_template/ui/shared/colors.dart';

class CustomLinearGradient extends StatelessWidget {
  const CustomLinearGradient({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // transform: GradientRotation(3.57792),
          begin: AlignmentDirectional.topCenter,
          end: AlignmentDirectional.bottomCenter,
          colors: [
            AppColors.linearGradientColor1,
            AppColors.linearGradientColor1,
            AppColors.linearGradientColor1,
            AppColors.linearGradientColor1,
            AppColors.linearGradientColor1,
            AppColors.linearGradientColor1,
            AppColors.linearGradientColor1,
            AppColors.linearGradientColor1,
            AppColors.linearGradientColor1,
            AppColors.linearGradientColor2,
            AppColors.linearGradientColor2,
            AppColors.linearGradientColor3,
          ],
        ),
      ),
      child: child,
    );
  }
}
