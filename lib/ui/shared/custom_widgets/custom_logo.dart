// import 'package:flutter/material.dart';
// import 'package:flutter_template/core/utils/general_utils.dart';
// import 'package:flutter_template/ui/shared/custom_widgets/custom_small_button.dart';
// import 'package:flutter_template/ui/shared/custom_widgets/cutsom_app_language.dart';
// import 'package:get/get.dart';

// class CustomLogo extends StatelessWidget {
//   const CustomLogo({
//     super.key,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.showBackButton = false,
//   });
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final bool showBackButton;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       // alignment: AlignmentDirectional.center,
//       children: [
//         Padding(
//           padding: EdgeInsets.only(
//             top: screenWidthPercent(10, context),
//           ),
//           child: Center(
//             child: Image.asset(
//               'assets/images/logo.png',
//               width: screenWidthPercent(2, context),
//             ),
//           ),
//         ),
//         // SvgPicture.asset(
//         //   'assets/svgs/logo.svg',
//         //   width: screenWidthPercent(1, context),
//         // ),
//         PositionedDirectional(
//           top: 0,
//           start: 0,
//           child: showBackButton
//               ? CustomSmallButton(
//                   customSmallButtonTypeEnum: CustomSmallButtonTypeEnum.NORMAL,
//                   imageName: "ic_left-arrow-backup",
//                   onTap: () {
//                     Get.back();
//                   },
//                 )
//               : prefixIcon ?? CustomAppLanguage(),
//         ),
//         if (suffixIcon != null) ...[
//           PositionedDirectional(
//             top: 0,
//             end: 0,
//             child: suffixIcon!,
//           ),
//         ]
//       ],
//     );
//   }
// }
