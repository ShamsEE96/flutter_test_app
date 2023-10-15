import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/colors.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_text.dart';

enum CustomAppUsedIn {
  GRID,
  LIST,
}

class CustomApp extends StatelessWidget {
  const CustomApp({
    super.key,
    required this.imageUrl,
    required this.name,
    this.showName = true,
    this.editMode = false,
    this.editOnTap,
    this.onTap,
  });

  final String imageUrl;
  final String name;
  final bool showName;
  final bool editMode;
  final Function? editOnTap;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              if (!editMode && onTap != null) onTap!();
            },
            child: Container(
              // padding: EdgeInsetsDirectional.all(screenWidthPercent(25, context)),
              clipBehavior: Clip.antiAlias,
              width: editMode
                  ? screenWidthPercent(5, context)
                  : screenWidthPercent(8, context),
              height: editMode
                  ? screenWidthPercent(5, context)
                  : screenWidthPercent(8, context),
              decoration: BoxDecoration(
                borderRadius: editMode
                    ? BorderRadiusDirectional.circular(20)
                    : BorderRadiusDirectional.circular(5),
                color: AppColors.whiteColor,
              ),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    imageUrl: imageUrl,
                    fit: BoxFit.cover,
                  ),
                  if (editMode) ...[
                    PositionedDirectional(
                      top: 0,
                      end: 0,
                      child: InkWell(
                        onTap: () {
                          if (editOnTap != null) editOnTap!();
                        },
                        child: Container(
                          width: screenWidthPercent(15, context),
                          height: screenWidthPercent(15, context),
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: screenWidthPercent(60, context),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.only(
                              bottomStart: Radius.circular(18),
                              topEnd: Radius.circular(18),
                            ),
                            color: AppColors.fillColorButtonIcon,
                          ),
                          child: SvgPicture.asset(
                            'assets/svgs/ic_edit.svg',
                            color: AppColors.whiteColor,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ),
          if (showName == true) ...[
            verSpace(100, context),
            CustomText(
              textType: TextStyleType.CUSTOM,
              text: name,
              color: AppColors.uiTypographyPrimaryColor,
              fontSize: screenWidthPercent(40, context),
              fontWeight: FontWeight.w400,
            ),
          ]
        ],
      ),
    );
  }
}
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:fluttergetxframework/UI/shared/colors.dart';
// import 'package:fluttergetxframework/UI/shared/custom_widgets/custom_text.dart';
// import 'package:fluttergetxframework/core/utils/general_utils.dart';

// enum CustomAppUsedIn {
//   GRID,
//   LIST,
// }

// class CustomApp extends StatelessWidget {
//   const CustomApp({
//     super.key,
//     required this.imageUrl,
//     required this.name,
//     this.showName = true,
//     this.editMode = false,
//     this.editOnTap,
//     this.onTap,
//   });
//   final String imageUrl;
//   final String name;
//   final bool showName;
//   final bool editMode;
//   final Function? editOnTap;
//   final Function? onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           InkWell(
//             onTap: () {
//               if (!editMode && onTap != null) onTap!();
//             },
//             child: Container(
//               // padding: EdgeInsetsDirectional.all(screenWidthPercent(25, context)),
//               clipBehavior: Clip.antiAlias,
//               width: editMode ? screenWidthPercent(5, context) : screenWidthPercent(8, context),
//               height: editMode ? screenWidthPercent(5, context) : screenWidthPercent(8, context),
//               decoration: BoxDecoration(
//                 borderRadius: editMode
//                     ? BorderRadiusDirectional.circular(20)
//                     : BorderRadiusDirectional.circular(5),
//                 color: AppColors.whiteColor,
//               ),
//               child: Stack(
//                 children: [
//                   CachedNetworkImage(
//                     imageUrl: imageUrl,
//                     fit: BoxFit.cover,
//                   ),
//                   if (editMode) ...[
//                     PositionedDirectional(
//                       top: 0,
//                       end: 0,
//                       child: InkWell(
//                         onTap: () {
//                           if (editOnTap != null) editOnTap!();
//                         },
//                         child: Container(
//                           width: screenWidthPercent(15, context),
//                           height: screenWidthPercent(15, context),
//                           padding: EdgeInsetsDirectional.symmetric(
//                             horizontal: screenWidthPercent(60, context),
//                           ),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadiusDirectional.only(
//                               bottomStart: Radius.circular(18),
//                               topEnd: Radius.circular(18),
//                             ),
//                             color: AppColors.fillColorButtonIcon,
//                           ),
//                           child: SvgPicture.asset(
//                             'assets/svgs/ic_edit.svg',
//                             color: AppColors.whiteColor,
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ]
//                 ],
//               ),
//             ),
//           ),
//           if (showName == true) ...[
//             verSpace(100, context),
//             CustomText(
//               textType: TextStyleType.CUSTOM,
//               text: name,
//               color: AppColors.primaryFontColor,
//               fontSize: screenWidthPercent(40, context),
//               fontWeight: FontWeight.w400,
//             ),
//           ]
//         ],
//       ),
//     );
//   }
// }
