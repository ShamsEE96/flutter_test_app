// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_template/core/translation/translation_service.dart';
// import 'package:flutter_template/core/utils/general_utils.dart';
// import 'package:flutter_template/ui/shared/custom_widgets/custom_text.dart';

// class PasswordValidationWidget extends StatefulWidget {
//   const PasswordValidationWidget({
//     super.key,
//     this.visible = true,
//     this.prefixSvgName,
//     this.suffixSvgName,
//   });

//   final bool visible;
//   final String? prefixSvgName;
//   final String? suffixSvgName;

//   @override
//   State<PasswordValidationWidget> createState() =>
//       _PasswordValidationWidgetState();
// }

// class _PasswordValidationWidgetState extends State<PasswordValidationWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return Visibility(
//       visible: true,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               SvgPicture.asset(
//                 // "assets/svgs/ic_info.svg",
//                 "assets/svgs/${widget.prefixSvgName}.svg",
//                 // color: AppColors.uiTypographyPrimaryColor,
//                 width: screenWidthPercent(18, context),
//               ),
//               horSpace(60, context),
//               CustomText(
//                 textType: TextStyleType.BODY,
//                 text: tr("singup_view_password_strength_weak"),
//                 fontWeight: FontWeight.w500,
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
