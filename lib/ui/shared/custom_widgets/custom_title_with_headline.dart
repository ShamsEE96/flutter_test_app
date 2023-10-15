import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_text.dart';

class CustomHeadlineWithTitle extends StatelessWidget {
  const CustomHeadlineWithTitle({
    super.key,
    required this.title,
    required this.headline,
    this.showImage = true,
    this.imageName = "ic_waving_emote",
  });

  final String title;
  final String headline;
  final bool showImage;
  final String? imageName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          textType: TextStyleType.TITLE_2,
          text: title,
        ),
        verSpace(90, context),
        Row(
          children: [
            CustomText(
              textType: TextStyleType.HEADLINE_REG,
              text: headline,
            ),
            horSpace(60, context),
            if (showImage) ...[
              SvgPicture.asset(
                'assets/svgs/$imageName.svg',
                width: screenWidthPercent(21, context),
              )
            ]
          ],
        )
      ],
    );
  }
}
