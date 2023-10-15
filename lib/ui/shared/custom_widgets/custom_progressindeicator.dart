import 'package:flutter/material.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/colors.dart';

class CustomProgressIndicator extends StatefulWidget {
  const CustomProgressIndicator({
    Key? key,
    this.colorBackground,
    this.activeColor,
    this.containerHeight,
    this.containerWidth,
    required this.progress,
    required this.stepsCount,
  }) : super(key: key);

  final Color? colorBackground;
  final Color? activeColor;
  final double? containerHeight;
  final double? containerWidth;
  final double progress;
  final int stepsCount;

  @override
  _CustomProgressIndicatorState createState() =>
      _CustomProgressIndicatorState();
}

class _CustomProgressIndicatorState extends State<CustomProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    // double percentage = widget.progress;
    double value = widget.progress * (1 / widget.stepsCount);
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
        vertical: screenHeightPercent(35, context),
      ),
      child: Container(
        height: widget.containerHeight ?? screenWidthPercent(40, context),
        width: widget.containerWidth,
        decoration: BoxDecoration(
          color:
              widget.colorBackground ?? AppColors.uiTypographyGreyLighterColor,
          borderRadius: BorderRadius.circular(
            widget.containerHeight ?? 90,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            widget.containerHeight ?? 90,
          ),
          child: LinearProgressIndicator(
            value: value,
            // value: widget.progress * (1 / widget.stepsCount),
            backgroundColor: widget.colorBackground ??
                AppColors.uiTypographyGreyLighterColor,
            valueColor: AlwaysStoppedAnimation<Color>(
              widget.activeColor ??
                  (value == 1
                      ? AppColors.brandSpringGreenColor
                      : AppColors.brandMangoColor),
            ),
          ),
        ),
      ),
    );
  }
}
