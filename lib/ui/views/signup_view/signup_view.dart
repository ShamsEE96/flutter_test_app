import 'package:flutter/material.dart';
import 'package:flutter_template/core/translation/translation_service.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/colors.dart';
import 'package:flutter_template/ui/shared/custom_widgets/cta_button.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_back_button.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_basic_view.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_footer_symbol.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_language_dropdown.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_title_with_headline.dart';
import 'package:flutter_template/ui/shared/custom_widgets/text_button.dart';
import 'package:flutter_template/ui/views/signup_details_view/signup_details_view.dart';
import 'package:get/get.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    // SignupController controller = Get.put(SignupController());

    return CustomBasicView(
      body: Padding(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: screenHeightPercent(30, context),
          horizontal: screenWidthPercent(20, context),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                top: screenHeightPercent(100, context),
              ),
              child: CustomBackButton(
                customBackButtonTypeEnum: CustomBackButtonTypeEnum.NORMAL,
                showText: true,
                text: tr("general_sign_in"),
                onTap: () {},
              ),
            ),
            verSpace(60, context),
            CustomHeadlineWithTitle(
              title: tr("singup_view_title_1"),
              headline: tr("singup_view_headline_1"),
            ),
            Spacer(),
            ListView(
              shrinkWrap: true,
              padding: EdgeInsetsDirectional.all(0),
              children: [
                // Padding(
                //   padding: EdgeInsetsDirectional.only(
                //       top: screenHeightPercent(100, context)),
                //   child: CustomBackButton(
                //     customBackButtonTypeEnum: CustomBackButtonTypeEnum.NORMAL,
                //     showText: true,
                //     text: tr("general_sign_in"),
                //     onTap: () {},
                //   ),
                // ),
                // verSpace(60, context),
                // CustomHeadlineWithTitle(
                //   title: tr("singup_view_title_1"),
                //   headline: tr("singup_view_headline_1"),
                // ),
                // verSpace(7, context),
                CtaButton(
                  buttonTypeEnum: ButtonTypeEnum.NORMAL,
                  titleInCaps: false,
                  title: tr("singup_view_with_google"),
                  centerSvgPath: 'assets/svgs/ic_google.svg',
                  fillColor: AppColors.uiTypographyGreyLighterColor,
                  textColor: AppColors.uiTypographyPrimaryColor,
                  onTap: () {},
                ),
                Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                    vertical: screenHeightPercent(30, context),
                  ),
                  child: CustomText(
                    textType: TextStyleType.CAPTION_1,
                    text: tr("general_or"),
                  ),
                ),
                CtaButton(
                  buttonTypeEnum: ButtonTypeEnum.NORMAL,
                  titleInCaps: false,
                  title: tr("singup_view_with_email"),
                  endSvgPath: 'assets/svgs/ic_enter.svg',
                  onTap: () {
                    Get.to(() => SignupDetailsView());
                  },
                ),
                verSpace(90, context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      textType: TextStyleType.FOOTNOTE,
                      text: "${tr("singup_view_footer_line1")} ",
                    ),
                    CustomTextButton(
                      title: "${tr("singup_view_footer_line2_terms")}",
                      onTap: () {},
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      textType: TextStyleType.FOOTNOTE,
                      text: "${tr("singup_view_footer_line2_and")} ",
                    ),
                    CustomTextButton(
                      title: "${tr("singup_view_footer_line2_policy")}",
                      onTap: () {},
                    ),
                  ],
                ),
                // verSpace(6, context),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     CustomLanguageDropdown(),
                //     verSpace(40, context),
                //     CustomFooterSymbol(),
                //   ],
                // ),
              ],
            ),
            Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomLanguageDropdown(),
                verSpace(40, context),
                CustomFooterSymbol(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_template/core/translation/translation_service.dart';
// import 'package:flutter_template/core/utils/general_utils.dart';
// import 'package:flutter_template/ui/shared/colors.dart';
// import 'package:flutter_template/ui/shared/custom_widgets/cta_button.dart';
// import 'package:flutter_template/ui/shared/custom_widgets/custom_back_button.dart';
// import 'package:flutter_template/ui/shared/custom_widgets/custom_footer_symbol.dart';
// import 'package:flutter_template/ui/shared/custom_widgets/custom_language_dropdown.dart';
// import 'package:flutter_template/ui/shared/custom_widgets/custom_text.dart';
// import 'package:flutter_template/ui/shared/custom_widgets/text_button.dart';
// import 'package:flutter_template/ui/views/signup_details_view/signup_details_view.dart';
// import 'package:flutter_template/ui/views/signup_view/signup_controller.dart';
// import 'package:get/get.dart';

// class SignupView extends StatefulWidget {
//   const SignupView({super.key});

//   @override
//   State<SignupView> createState() => _SignupViewState();
// }

// class _SignupViewState extends State<SignupView> {
//   @override
//   Widget build(BuildContext context) {
//     SignupController controller = Get.put(SignupController());

//     return SafeArea(
//       child: Scaffold(
//         body: ListView(
//           padding: EdgeInsetsDirectional.symmetric(
//             vertical: screenHeightPercent(30, context),
//             horizontal: screenWidthPercent(20, context),
//           ),
//           children: [
//             CustomBackButton(
//               customBackButtonTypeEnum: CustomBackButtonTypeEnum.NORMAL,
//               showText: true,
//               text: tr("general_sign_in"),
//               onTap: () {},
//             ),
//             verSpace(60, context),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 CustomText(
//                   textType: TextStyleType.TITLE_2,
//                   text: tr("singup_view_title_1"),
//                 ),
//                 verSpace(90, context),
//                 Row(
//                   children: [
//                     CustomText(
//                       textType: TextStyleType.HEADLINE_REG,
//                       text: tr("singup_view_headline_1"),
//                     ),
//                     horSpace(60, context),
//                     SvgPicture.asset(
//                       'assets/svgs/ic_waving_emote.svg',
//                       width: screenWidthPercent(21, context),
//                     )
//                   ],
//                 )
//               ],
//             ),
//             verSpace(7, context),
//             CtaButton(
//               buttonTypeEnum: ButtonTypeEnum.NORMAL,
//               titleInCaps: false,
//               title: tr("singup_view_with_google"),
//               centerSvgPath: 'assets/svgs/ic_google.svg',
//               fillColor: AppColors.uiTypographyGreyLighterColor,
//               textColor: AppColors.uiTypographyPrimaryColor,
//               onTap: () {},
//             ),
//             Padding(
//               padding: EdgeInsetsDirectional.symmetric(
//                 vertical: screenHeightPercent(30, context),
//               ),
//               child: CustomText(
//                 textType: TextStyleType.CAPTION_1,
//                 text: tr("general_or"),
//               ),
//             ),
//             CtaButton(
//               buttonTypeEnum: ButtonTypeEnum.NORMAL,
//               titleInCaps: false,
//               title: tr("singup_view_with_email"),
//               endSvgPath: 'assets/svgs/ic_enter.svg',
//               onTap: () {
//                 Get.to(() => SignupDetailsView());
//               },
//             ),
//             verSpace(90, context),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CustomText(
//                   textType: TextStyleType.FOOTNOTE,
//                   text: "${tr("singup_view_footer_line1")} ",
//                 ),
//                 CustomTextButton(
//                   title: "${tr("singup_view_footer_line2_terms")}",
//                   onTap: () {},
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CustomText(
//                   textType: TextStyleType.FOOTNOTE,
//                   text: "${tr("singup_view_footer_line2_and")} ",
//                 ),
//                 CustomTextButton(
//                   title: "${tr("singup_view_footer_line2_policy")}",
//                   onTap: () {},
//                 ),
//               ],
//             ),
//             verSpace(6, context),
//             Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 CustomLanguageDropdown(),
//                 verSpace(40, context),
//                 CustomFooterSymbol(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
