import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/core/data/models/file_type_model.dart';
import 'package:flutter_template/core/enums/file_type.dart';
import 'package:flutter_template/core/translation/translation_service.dart';
import 'package:flutter_template/core/utils/file_utils.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/colors.dart';
import 'package:flutter_template/ui/shared/custom_widgets/cta_button.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_popup_with_blur.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

void onClickedShowDialog(
  BuildContext context,
  Widget child, {
  bool close = false,
  Function(dynamic)? result,
}) {
  showDialog(
    barrierDismissible: close,
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: child,
      );
    },
  ).then((value) {
    if (result != null) {
      result(value);
    }
  });
}

void showCustomDialog(
    {required String title,
    required String description,
    String? subDescription,
    Color? titleColor = AppColors.redColor,
    Color? descriptionColor = AppColors.whiteColor,
    Function? submitClick,
    Function? cancelClick,
    String? confirmText,
    String? cancelText,
    bool isSuccsess = false,
    bool isAttention = false}) {
  Get.defaultDialog(
    backgroundColor: AppColors.secondaryBackgroundColor,
    radius: 10,
    title: title,
    titleStyle: TextStyle(
      color: titleColor,
      fontWeight: FontWeight.bold,
      fontSize: 21,
    ),
    content: Column(children: [
      Text(
        description,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.whiteColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      if (subDescription != null)
        Container(
          width: 250,
          margin: EdgeInsets.only(top: 15),
          child: Text(
            subDescription,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        )
    ]),
    confirm: isAttention || isSuccsess
        ? SizedBox()
        : CtaButton(
            title: cancelText ?? tr('general_no'),
            onTap: () {
              if (cancelClick != null) {
                cancelClick();
              }
              Get.back();
            },
          ),
    cancel: isAttention
        ? CtaButton(
            title: tr('general_ok'),
            onTap: () {
              Get.back();
              if (submitClick != null) {
                submitClick();
              }
            },
          )
        : CtaButton(
            title: confirmText != null
                ? confirmText
                : isSuccsess
                    ? tr('general_ok')
                    : tr('general_yes'),
            onTap: () {
              Get.back();
              if (submitClick != null) {
                submitClick();
              }
            },
          ),
  );
}

void showErrorsDialog(
    {required String title,
    required List<String> errors,
    Color? titleColor = AppColors.orangeColor,
    Color? descriptionColor = AppColors.grey,
    Function? submitClick,
    Function? cancelClick,
    bool isSuccsess = false,
    bool isAttention = false}) {
  Get.defaultDialog(
    radius: 10,
    title: title,
    titleStyle: TextStyle(
      color: titleColor,
      fontWeight: FontWeight.bold,
      fontSize: 21,
    ),
    content: Container(
      width: 400,
      height: 175,
      child: ListView.separated(
        separatorBuilder: (context, index) => Container(
          margin: EdgeInsets.symmetric(vertical: 5),
          width: 300,
          height: 1,
          color: AppColors.blackColor,
        ),
        shrinkWrap: true,
        itemCount: errors.length,
        itemBuilder: (BuildContext context, int index) {
          return Text(
            errors[index],
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          );
        },
      ),
    ),
    confirm: isAttention || isSuccsess
        ? SizedBox()
        : CtaButton(
            title: tr('general_no'),
            onTap: () {
              if (cancelClick != null) {
                cancelClick();
              }
              Get.back();
            },
            fillColor: const Color.fromARGB(255, 104, 109, 111),
          ),
    cancel: isAttention
        ? CtaButton(
            title: tr('general_ok'),
            onTap: () {
              Get.back();
              if (submitClick != null) {
                submitClick();
              }
            },
          )
        : CtaButton(
            title: isSuccsess ? tr('general_ok') : tr('general_yes'),
            onTap: () {
              Get.back();
              if (submitClick != null) {
                submitClick();
              }
            },
          ),
  );
}

void showAlertDialog({
  required String description,
  Color? descriptionColor = AppColors.grey,
  Function? submitClick,
}) {
  Get.defaultDialog(
    backgroundColor: AppColors.secondaryBackgroundColor,
    radius: 10,
    title: tr('general_attention'),
    titleStyle: TextStyle(
      color: AppColors.redColor,
      fontWeight: FontWeight.bold,
      fontSize: 21,
    ),
    middleText: description,
    middleTextStyle: TextStyle(
      color: AppColors.whiteColor,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
    confirm: CtaButton(
      title: tr('general_yes'),
      onTap: () {
        Get.back();
        if (submitClick != null) {
          submitClick();
        }
      },
    ),
  );
}

void showDeleteAlertDialoug({
  String? title,
  String? middleText,
  Function? onCancel,
  Function? onConfirm,
  String? cancelText,
  String? confirmText,
  required BuildContext context,
}) {
  Get.defaultDialog(
    title: title ?? "",
    middleText: middleText ?? "",
    cancel: CtaButton(
      buttonTypeEnum: ButtonTypeEnum.NORMAL,
      onTap: () {
        if (onCancel != null) onCancel();
      },
      width: screenWidthPercent(3, context),
      // height: screenHeightPercent(13, context, context),
      title: cancelText ?? tr("general_no"),
      fillColor: AppColors.redColor,
    ),
    confirm: CtaButton(
      buttonTypeEnum: ButtonTypeEnum.NORMAL,
      onTap: () {
        if (onConfirm != null) onConfirm();
      },
      width: screenWidthPercent(3, context),
      // height: screenHeightPercent(13, context, context),
      title: confirmText ?? tr("general_yes"),
    ),
  );
}

Future<dynamic> showDatePopup({
  required Widget child,
  required Function() onClickOk,
  required BuildContext context,
}) {
  return showCupertinoModalPopup(
    context: context,
    barrierColor: Colors.transparent,
    builder: (context) {
      return Center(
        child: Container(
          height: 330,
          width: 400,
          child: CupertinoActionSheet(
            actions: [
              SizedBox(width: 250, height: 200, child: child),
              Material(
                child: CtaButton(
                  title: tr("general_ok"),
                  onTap: onClickOk,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showImagePickerBottomSheet({
  required FileTypeModel fileTypeModel,
  required Function(FileTypeModel) onSelected,
  int? imageQuality,
}) {
  Get.bottomSheet(
    CustomPopupWithBlurWidget(
      customBlurChildType: CustomBlurChildType.BOTTOMSHEET,
      child: Container(
        // width: screenWidthPercent(1, context),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(20),
            topEnd: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(
                Icons.camera_alt,
                color: AppColors.fillColorButtonIcon,
              ),
              title: CustomText(
                textType: TextStyleType.HEADLINE_REG,
                text: tr('image_picker_camera'),
                textAlign: TextAlign.start,
                color: AppColors.uiTypographyPrimaryColor,
              ),
              onTap: () {
                FileUtil.pickFile(
                  type: FileTypeEnum.CAMERA,
                  imageQuality: imageQuality,
                ).then(
                  (value) => onSelected(value),
                );
                Get.back();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.image,
                color: AppColors.fillColorButtonIcon,
              ),
              title: CustomText(
                textType: TextStyleType.HEADLINE_REG,
                text: tr('image_picker_gallery'),
                textAlign: TextAlign.start,
                color: AppColors.uiTypographyPrimaryColor,
              ),
              onTap: () {
                FileUtil.pickFile(
                  type: FileTypeEnum.GALLERY,
                  imageQuality: imageQuality,
                ).then(
                  (value) => onSelected(value),
                );
                Get.back();
              },
            ),
          ],
        ),
      ),
    ),
  );
}

// void showLanguageBottomSheet({
//   bool sendApiLanguageChange = false,
//   Function? extraFunction,
//   required BuildContext context,
// }) {
//   Get.bottomSheet(
//     CustomPopupWithBlurWidget(
//       customBlurChildType: CustomBlurChildType.BOTTOMSHEET,
//       child: Container(
//         // width: screenWidthPercent(1, context),
//         decoration: BoxDecoration(
//           color: AppColors.whiteColor,
//           borderRadius: BorderRadiusDirectional.only(
//             topStart: Radius.circular(20),
//             topEnd: Radius.circular(20),
//           ),
//         ),
//         child: ListView(
//           padding: EdgeInsetsDirectional.symmetric(
//             horizontal: screenWidthPercent(10, context),
//             vertical: screenWidthPercent(25, context),
//           ),
//           shrinkWrap: true,
//           children: [
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 InkWell(
//                   onTap: () {
//                     Get.back();
//                   },
//                   child: RotatedBox(
//                     quarterTurns: -1,
//                     child: SvgPicture.asset(
//                       'assets/svgs/ic_left-arrow-backup.svg',
//                       color: AppColors.fillColorButtonIcon,
//                       width: screenWidthPercent(15, context),
//                       height: screenWidthPercent(15, context),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//             CustomText(
//               textType: TextStyleType.TITLE,
//               text: tr('choose_language'),
//               color: AppColors.primaryFontColor,
//               // fontWeight: FontWeight.w900,
//               // fontSize: screenHeightPercent(20, context),
//             ),
//             verSpace(30, context),
//             ListTile(
//               leading: Container(
//                 padding:
//                     EdgeInsetsDirectional.all(screenWidthPercent(35, context)),
//                 clipBehavior: Clip.antiAlias,
//                 width: screenWidthPercent(5, context),
//                 height: screenWidthPercent(5, context),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadiusDirectional.circular(20),
//                   color: AppColors.whiteColor,
//                   border: Border.all(
//                     width: 1,
//                     color: languageService.appLanguage == "en"
//                         ? AppColors.fillColorButtonIcon
//                         : AppColors.primaryFontColor,
//                   ),
//                 ),
//                 child: SvgPicture.asset(
//                   "assets/svgs/flag_gb.svg",
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               title: CustomText(
//                 textType: TextStyleType.SUBTITLE,
//                 text: tr('language_en'),
//                 color: languageService.appLanguage == "en"
//                     ? AppColors.fillColorButtonIcon
//                     : AppColors.primaryFontColor,
//                 // fontWeight: FontWeight.bold,
//                 // fontSize: screenHeightPercent(32, context),
//                 textAlign: TextAlign.start,
//               ),
//               onTap: () {
//                 storage.setAppLanguage(langCode: 'en');
//                 // languageService.refreshAppLanguage();
//                 Get.updateLocale(languageService.getLocale());
//                 if (sendApiLanguageChange)
//                   languageService.setLanguageApi(language: 'en');
//                 Get.back();
//                 if (extraFunction != null) extraFunction();
//               },
//             ),
//             verSpace(30, context),
//             ListTile(
//               leading: Container(
//                 padding: EdgeInsetsDirectional.all(
//                   screenWidthPercent(35, context),
//                 ),
//                 clipBehavior: Clip.antiAlias,
//                 width: screenWidthPercent(5, context),
//                 height: screenWidthPercent(5, context),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadiusDirectional.circular(20),
//                   color: AppColors.whiteColor,
//                   border: Border.all(
//                     width: 1,
//                     color: languageService.appLanguage == "ar"
//                         ? AppColors.fillColorButtonIcon
//                         : AppColors.primaryFontColor,
//                   ),
//                 ),
//                 child: SvgPicture.asset(
//                   "assets/svgs/flag_ae.svg",
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               title: CustomText(
//                 textType: TextStyleType.SUBTITLE,
//                 text: tr('language_ar'),
//                 color: languageService.appLanguage == "ar"
//                     ? AppColors.fillColorButtonIcon
//                     : AppColors.primaryFontColor,
//                 // fontWeight: FontWeight.bold,
//                 // fontSize: screenHeightPercent(32, context),
//                 textAlign: TextAlign.start,
//               ),
//               onTap: () {
//                 storage.setAppLanguage(langCode: 'ar');
//                 // languageService.refreshAppLanguage();
//                 Get.updateLocale(languageService.getLocale());
//                 if (sendApiLanguageChange)
//                   languageService.setLanguageApi(language: 'ar');
//                 Get.back();
//                 if (extraFunction != null) extraFunction();
//               },
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }

void showDeleteAccountBottomSheet({
  // required String AppLinkLogo,
  // required String AppLinkName,
  // required TextEditingController textEditingController,
  required Function confirmOnTap,
  required Function cancelOnTap,
  // bool addMode = false,
  required BuildContext context,
}) {
  Get.bottomSheet(
    CustomPopupWithBlurWidget(
      customBlurChildType: CustomBlurChildType.BOTTOMSHEET,
      child: Container(
        // width: screenWidthPercent(1, context),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(20),
            topEnd: Radius.circular(20),
          ),
          border: Border.all(
            width: 1,
            color: AppColors.borderColorButtonIcon,
          ),
        ),
        child: ListView(
          padding: EdgeInsetsDirectional.symmetric(
            horizontal: screenWidthPercent(10, context),
            vertical: screenWidthPercent(25, context),
          ),
          shrinkWrap: true,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: SvgPicture.asset(
                      'assets/svgs/ic_left-arrow-backup.svg',
                      color: AppColors.fillColorButtonIcon,
                      width: screenWidthPercent(15, context),
                      height: screenWidthPercent(15, context),
                    ),
                  ),
                )
              ],
            ),
            CustomText(
              textType: TextStyleType.TITLE_2,
              text: tr('general_delete_account_warrning'),
              color: AppColors.redColor,
              // fontWeight: FontWeight.w900,
              // fontSize: screenHeightPercent(20, context),
            ),
            verSpace(30, context),
            CustomText(
              textType: TextStyleType.BODY,
              text: tr('general_delete_account_warrning_massege'),
              color: AppColors.uiTypographyPrimaryColor,
              // fontWeight: FontWeight.w500,
              // fontSize: screenHeightPercent(40, context),
            ),
            verSpace(30, context),
            Center(
              child: Row(
                children: [
                  Expanded(
                    // flex: 2,
                    child: CtaButton(
                      title: tr('general_cancel'),
                      buttonTypeEnum: ButtonTypeEnum.NORMAL,
                      onTap: () {
                        cancelOnTap();
                      },
                      textSize: screenWidthPercent(21, context),
                      width: screenWidthPercent(1.25, context),
                      height: screenHeightPercent(13, context),
                      textWeight: FontWeight.bold,
                      fillColor: AppColors.whiteColor,
                      textColor: AppColors.fillColorButtonIcon,
                      borderColor: AppColors.fillColorButtonIcon,
                    ),
                  ),
                  horSpace(20, context),
                  Expanded(
                    // flex: 2,
                    child: CtaButton(
                      title: tr('general_confirm'),
                      buttonTypeEnum: ButtonTypeEnum.NORMAL,
                      onTap: () {
                        confirmOnTap();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

void showCheckConnectionDialog({
  // required bool isLoading,
  // required Function? onTap,
  required Widget widget,
  required BuildContext context,
}) {
  // RxBool loading = isLoading.obs;
  Get.dialog(
    CustomPopupWithBlurWidget(
      customBlurChildType: CustomBlurChildType.DIALOUG,
      child: Container(
        width: screenHeightPercent(2, context),
        height: screenHeightPercent(2, context),
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadiusDirectional.all(
            Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Lottie.asset(
              'assets/animations/animation_no_connection.json',
              width: screenWidthPercent(1.25, context),
              height: screenHeightPercent(3.5, context),
            ),
            verSpace(40, context),
            Material(
              color: AppColors.whiteColor,
              child: CustomText(
                textType: TextStyleType.BODY,
                text: tr("check_connection"),
                color: AppColors.uiTypographyPrimaryColor,
              ),
            ),
            verSpace(40, context),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidthPercent(10, context),
              ),
              child: widget,
            ),
          ],
        ),
      ),
    ),
  );
}
