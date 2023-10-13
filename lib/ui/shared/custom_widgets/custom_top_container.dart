import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/colors.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_text.dart';

enum CustomTopContainerType {
  START_TEXT,
  CENTER_TEXT,
  CUSTOM,
}

class CustomTopContainer extends StatelessWidget {
  const CustomTopContainer({
    super.key,
    required this.containerType,
    this.text,
    this.prefixImageName,
    this.suffixImageName,
    this.prefixOnTap,
    this.suffixOnTap,
    required this.showPrefixWidget,
    required this.showSuffixWidget,
    // required this.controller,
  });

  final CustomTopContainerType containerType;
  final String? text;
  final String? prefixImageName;
  final String? suffixImageName;
  final Function? prefixOnTap;
  final Function? suffixOnTap;
  final bool showPrefixWidget;
  final bool showSuffixWidget;
  // final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidthPercent(1, context),
      height: screenHeightPercent(10, context),
      padding: EdgeInsetsDirectional.all(
        screenHeightPercent(70, context),
      ),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
          // color: AppColors.grey,
          ),
      child: containerType == CustomTopContainerType.START_TEXT
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: showPrefixWidget,
                  child: InkWell(
                    onTap: () {
                      if (prefixOnTap != null) prefixOnTap!();
                    },
                    child: SvgPicture.asset(
                      'assets/svgs/$prefixImageName.svg',
                      width: screenWidthPercent(11, context),
                      height: screenWidthPercent(11, context),
                      color: AppColors.fillColorButtonIcon,
                    ),
                  ),
                ),
                // Obx(
                //   () {
                //     return Visibility(
                //       visible:
                //           controller.userProfileModel.value.apps!.isNotEmpty,
                //       child: CustomSwitch(
                //         useFlutterSwitch: true,
                //         valueIsRx: true,
                //         switchValue: controller.hasDirectLink.value,
                //         activeImage:
                //             controller.userProfileModel.value.directLinkLogo,
                //         unactiveImage: "ic_direct_link",
                //         width: screenWidthPercent(6, context),
                //         height: screenHeightPercent(20, context),
                //         toggleSize: screenHeightPercent(22, context),
                //         onChanged: (value) {
                //           if (!controller.hasDirectLink.value) {
                //             showUpdateDirectLinkBottomSheet(
                //               controller: controller,
                //               context: context,
                //             );
                //           } else {
                //             controller.updateDirectLink();
                //             // showDeleteAlertDialoug(
                //             //   title: "${tr("general_edit")}",
                //             //   middleText: tr("direct_link_edit_message"),
                //             //   confirmText: tr("general_edit")
                //             //       .toString()
                //             //       .capitalizeFirstofEach,
                //             //   cancelText: tr("general_delete")
                //             //       .toString()
                //             //       .capitalizeFirstofEach,
                //             //   onConfirm: () {
                //             //     Get.back(closeOverlays: true);
                //             //     showUpdateDirectLinkBottomSheet(
                //             //       controller: controller,
                //             //     );
                //             //   },
                //             //   onCancel: () {
                //             //     controller.updateDirectLink();
                //             //   },
                //             // );
                //           }
                //         },
                //       ),
                //     );
                //   },
                // ),
                if (showSuffixWidget) ...[
                  InkWell(
                    onTap: () {
                      if (suffixOnTap != null) suffixOnTap!();
                    },
                    child: SvgPicture.asset(
                      'assets/svgs/$suffixImageName.svg',
                      width: screenWidthPercent(11, context),
                      height: screenWidthPercent(11, context),
                      color: AppColors.fillColorButtonIcon,
                    ),
                  ),
                ],
              ],
            )
          : containerType == CustomTopContainerType.CENTER_TEXT
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: showPrefixWidget,
                      child: InkWell(
                        onTap: () {
                          if (prefixOnTap != null) prefixOnTap!();
                        },
                        child: SvgPicture.asset(
                          'assets/svgs/$prefixImageName.svg',
                          width: screenWidthPercent(11, context),
                          height: screenWidthPercent(11, context),
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomText(
                        textType: TextStyleType.TITLE,
                        text: text ?? "",
                        color: AppColors.grey,
                      ),
                    )
                  ],
                )
              : containerType == CustomTopContainerType.CUSTOM
                  ? Row()
                  : SizedBox(),
    );
  }
}
