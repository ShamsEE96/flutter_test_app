// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_template/core/utils/general_utils.dart';
// import 'package:flutter_template/ui/shared/colors.dart';
// import 'package:flutter_template/ui/shared/utils.dart';

// class CustomAppLanguage extends StatefulWidget {
//   const CustomAppLanguage({
//     super.key,
//     this.extraFunction,
//   });

//   final Function? extraFunction;

//   @override
//   State<CustomAppLanguage> createState() => _CustomAppLanguageState();
// }

// class _CustomAppLanguageState extends State<CustomAppLanguage> {
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         showLanguageBottomSheet(
//           extraFunction: widget.extraFunction,
//           context: context,
//         );
//       },
//       child: SvgPicture.asset(
//         'assets/svgs/ic_language.svg',
//         color: AppColors.fillColorButtonIcon,
//         width: screenWidthPercent(12, context),
//         height: screenWidthPercent(12, context),
//       ),
//     );
//   }
// }
