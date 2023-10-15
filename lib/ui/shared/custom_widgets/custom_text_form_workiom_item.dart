import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/colors.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_text.dart';
import 'package:flutter_template/ui/shared/custom_widgets/custom_text_form_workiom.dart';

class CustomTextFormWorkiomItem extends StatefulWidget {
  const CustomTextFormWorkiomItem({
    super.key,
    required this.text,
    required this.placeholder,
    required this.prefixSvgName,
    this.suffixSvgName,
    this.showPassword = false,
    this.textEditingController,
    this.validator,
    this.onTap,
    this.suffixWidget,
    this.keyboardType = TextInputType.text,
    this.onChange,
    this.onSubmit,
  });

  final String text;
  final String placeholder;
  final String? prefixSvgName;
  final String? suffixSvgName;
  final bool? showPassword;
  final TextEditingController? textEditingController;
  final String? Function(String? value)? validator;
  final void Function()? onTap;
  final Widget? suffixWidget;
  final TextInputType? keyboardType;
  final Function(String v)? onChange;
  final Function(String v)? onSubmit;

  @override
  State<CustomTextFormWorkiomItem> createState() =>
      _CustomTextFormWorkiomItemState();
}

class _CustomTextFormWorkiomItemState extends State<CustomTextFormWorkiomItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          textType: TextStyleType.BODY,
          text: widget.text,
        ),
        verSpace(60, context),
        CustomTextFormWorkiom(
          showPassword: widget.showPassword,
          placeHolder: widget.placeholder,
          textEditingController: widget.textEditingController,
          onChange: widget.onChange,
          onSubmit: widget.onSubmit,
          validator: widget.validator,
          keyboardType: widget.keyboardType,
          prefixIcon: SvgPicture.asset(
            "assets/svgs/${widget.prefixSvgName}.svg",
            color: AppColors.uiTypographyPrimaryColor,
            width: screenWidthPercent(18, context),
          ),
          suffixWidget:
              widget.suffixWidget == null && widget.suffixSvgName == null
                  ? null
                  : InkWell(
                      onTap: () {
                        if (widget.onTap != null) widget.onTap!();
                      },
                      child: widget.suffixWidget != null
                          ? widget.suffixWidget
                          : widget.suffixSvgName != null
                              ? SvgPicture.asset(
                                  "assets/svgs/${widget.suffixSvgName}.svg",
                                  color: AppColors.uiTypographyPlaceholderColor,
                                  width: screenWidthPercent(14, context),
                                )
                              : null,
                    ),
        ),
      ],
    );
  }
}
