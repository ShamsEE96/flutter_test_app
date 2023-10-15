import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/core/translation/translation_service.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_text.dart';
import 'package:get/get.dart';

class CustomLanguageDropdown extends StatefulWidget {
  const CustomLanguageDropdown({super.key});

  @override
  State<CustomLanguageDropdown> createState() => _CustomLanguageDropdownState();
}

class _CustomLanguageDropdownState extends State<CustomLanguageDropdown> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/svgs/ic_globe.svg',
          height: screenWidthPercent(26, context),
          width: screenWidthPercent(26, context),
        ),
        horSpace(60, context),
        Obx(
          () {
            return DropdownButton(
              value: languageService.appLanguage.value,
              items: [
                DropdownMenuItem(
                  child: CustomText(
                    textType: TextStyleType.CAPTION_1,
                    text: tr("language_en"),
                  ),
                  value: "en",
                ),
                DropdownMenuItem(
                  child: CustomText(
                    textType: TextStyleType.CAPTION_1,
                    text: tr("language_ar"),
                  ),
                  value: "ar",
                ),
                // DropdownMenuItem(
                //   child: CustomText(
                //     textType: TextStyleType.CAPTION_1,
                //     text: tr("language_tr"),
                //   ),
                //   value: "tr",
                // ),
              ],
              onChanged: (value) {
                storage.setAppLanguage(langCode: value!);
                languageService.refreshAppLanguage();
                Get.updateLocale(languageService.getLocale());
              },
            );
          },
        )
      ],
    );
  }
}
