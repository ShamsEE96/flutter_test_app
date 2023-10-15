// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_template/core/utils/general_utils.dart';
// import 'package:flutter_template/ui/shared/colors.dart';

// class CustomTextFormWorkiom extends StatefulWidget {
//   const CustomTextFormWorkiom({
//     super.key,
//     this.validator,
//     // this.focusNode,
//     this.shadowColor = AppColors.transparentColor,
//     this.disableTextField = false,
//     this.prefixIcon = const SizedBox(),
//     this.prefixConstraint = const BoxConstraints(),
//     this.elevation = 0.0,
//     //this.focusNode,
//     this.readOnly = false,
//     this.helperMessageText = '',
//     this.helperMessageColor = AppColors.blueAccentColor,
//     this.centerPlaceHolder = false,
//     this.showPassword = false,
//     this.borderColor = AppColors.uiTypographyGreyDarkerColor,
//     this.fillColor = AppColors.uiWhiteColor,
//     this.onSubmit,
//     this.placeHolderCustomStyle,
//     this.textCustomStyle,
//     this.textEditingController,
//     this.textCapitalization = TextCapitalization.none,
//     this.keyboardType = TextInputType.text,
//     required this.placeHolder,
//     this.textInputAction = TextInputAction.done,
//     this.onChange,
//     this.inputFormatterList = const [],
//     this.maxLength = 50,
//     this.maxLines = 1,
//     this.autoFocus = false,
//     this.suffixWidget = const SizedBox(),
//   });

//   final double? elevation;
//   final TextCapitalization? textCapitalization;
//   final TextInputType? keyboardType;
//   final TextInputAction? textInputAction;
//   final String? placeHolder;
//   final TextStyle? placeHolderCustomStyle;
//   final TextEditingController? textEditingController;
//   final TextStyle? textCustomStyle;
//   final Widget? suffixWidget;
//   // final FocusNode? nextFocusNode;
//   // final FocusNode? focusNode;
//   final Function(String v)? onSubmit;
//   final Function(String v)? onChange;
//   final String? Function(String? v)? validator;
//   final bool? showPassword;
//   final Color? borderColor;
//   final Color? fillColor;
//   final bool? centerPlaceHolder;
//   final String? helperMessageText;
//   final Color? helperMessageColor;
//   final bool? readOnly;
//   final List<TextInputFormatter>? inputFormatterList;
//   final int? maxLength;
//   final bool? autoFocus;
//   final int? maxLines;
//   final Widget? prefixIcon;
//   final BoxConstraints? prefixConstraint;
//   final Color? shadowColor;
//   final bool? disableTextField;

//   @override
//   State<CustomTextFormWorkiom> createState() => _CustomTextFormWorkiomState();
// }

// class _CustomTextFormWorkiomState extends State<CustomTextFormWorkiom> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         if (widget.prefixIcon != null)
//           Padding(
//             padding: EdgeInsetsDirectional.only(
//               start: screenWidthPercent(40, context),
//             ),
//             child: widget.prefixIcon!,
//           ),
//         SizedBox(
//           width: 20,
//         ),
//         Expanded(
//           child: TextFormField(
//             // autovalidateMode: AutovalidateMode.always,
//             // focusNode: widget.focusNode ?? FocusNode(),
//             scrollPadding: const EdgeInsets.all(92),
//             validator: widget.validator,
//             onFieldSubmitted: widget.onSubmit,
//             readOnly: widget.readOnly!,
//             autofocus: widget.autoFocus!,
//             textAlign:
//                 widget.centerPlaceHolder! ? TextAlign.center : TextAlign.start,
//             cursorColor: AppColors.uiTypographyGreyDarkerColor,
//             controller: widget.textEditingController,
//             textInputAction: widget.textInputAction!,
//             keyboardType: widget.keyboardType!,
//             textCapitalization:
//                 widget.textCapitalization ?? TextCapitalization.sentences,
//             obscureText:
//                 widget.keyboardType! == TextInputType.visiblePassword &&
//                     !widget.showPassword!,
//             onChanged: widget.onChange,
//             // onChanged: (value) {
//             //   if (!(widget.keyboardType! ==
//             //           TextInputType.visiblePassword &&
//             //       !widget.showPassword!)) {
//             //     if (widget.textEditingController != null) {
//             //       widget.textEditingController!.text = value.trim();
//             //     }
//             //   }
//             //   if (widget.onChange != null) widget.onChange!(value);
//             // },
//             inputFormatters: widget.inputFormatterList!,
//             maxLength: widget.maxLength!,
//             maxLines: widget.keyboardType! == TextInputType.visiblePassword
//                 ? 1
//                 : widget.maxLines!,
//             style: TextStyle(
//               height: 1.2,
//               letterSpacing: -0.24,
//               color: AppColors.uiTypographyPrimaryColor,
//               fontSize: screenWidthPercent(24, context),
//               // fontSize: 15,
//               fontWeight: FontWeight.w400,
//             ),
//             decoration: InputDecoration(
//               counter: SizedBox(
//                 width: 0,
//                 height: 0,
//               ),
//               border: UnderlineInputBorder(),
//               focusedBorder: InputBorder.none,
//               enabledBorder: InputBorder.none,
//               isCollapsed: true,
//               errorBorder: InputBorder.none,
//               // contentPadding: EdgeInsetsDirectional.symmetric(
//               //   vertical: screenHeightPercent(300, context),
//               // ),
//               // contentPadding: EdgeInsets.only(bottom: -10),
//               disabledBorder: InputBorder.none,
//               errorStyle: TextStyle(height: 0, fontSize: 11),
//               hintText: widget.placeHolder!,
//               hintStyle: TextStyle(
//                 height: 1.2,
//                 letterSpacing: -0.24,
//                 color: AppColors.uiTypographySecondaryColor,
//                 fontSize: screenWidthPercent(24, context),
//                 // fontSize: 15,
//                 fontWeight: FontWeight.w400,
//               ),
//               suffixIcon: widget.suffixWidget,
//             ),
//           ),
//         ),
//         // SizedBox(
//         //   width: 20,
//         // ),
//         // if (widget.suffixWidget != null)
//         //   Padding(
//         //     padding: EdgeInsetsDirectional.only(
//         //       end: screenWidthPercent(40, context),
//         //     ),
//         //     child: widget.suffixWidget,
//         //   ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/core/utils/general_utils.dart';
import 'package:flutter_template/ui/shared/colors.dart';

class CustomTextFormWorkiom extends StatefulWidget {
  const CustomTextFormWorkiom({
    super.key,
    this.validator,
    // this.focusNode,
    // this.shadowColor = AppColors.transparentColor,
    this.disableTextField = false,
    this.prefixIcon = const SizedBox(),
    this.prefixConstraint = const BoxConstraints(),
    this.elevation = 0.0,
    //this.focusNode,
    this.readOnly = false,
    this.helperMessageText = '',
    this.helperMessageColor = AppColors.blueAccentColor,
    this.centerPlaceHolder = false,
    this.showPassword = false,
    this.borderColor = AppColors.uiTypographyGreyDarkerColor,
    this.fillColor = AppColors.uiWhiteColor,
    this.onSubmit,
    this.placeHolderCustomStyle,
    this.textCustomStyle,
    this.textEditingController,
    this.textCapitalization = TextCapitalization.none,
    this.keyboardType = TextInputType.text,
    required this.placeHolder,
    this.textInputAction = TextInputAction.done,
    this.onChange,
    this.inputFormatterList = const [],
    this.maxLength = 50,
    this.maxLines = 1,
    this.autoFocus = false,
    this.suffixWidget = const SizedBox(),
  });

  final double? elevation;
  final TextCapitalization? textCapitalization;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? placeHolder;
  final TextStyle? placeHolderCustomStyle;
  final TextEditingController? textEditingController;
  final TextStyle? textCustomStyle;
  final Widget? suffixWidget;
  // final FocusNode? nextFocusNode;
  // final FocusNode? focusNode;
  final Function(String v)? onSubmit;
  final Function(String v)? onChange;
  final String? Function(String? v)? validator;
  final bool? showPassword;
  final Color? borderColor;
  final Color? fillColor;
  final bool? centerPlaceHolder;
  final String? helperMessageText;
  final Color? helperMessageColor;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatterList;
  final int? maxLength;
  final bool? autoFocus;
  final int? maxLines;
  final Widget? prefixIcon;
  final BoxConstraints? prefixConstraint;
  // final Color? shadowColor;
  final bool? disableTextField;

  @override
  State<CustomTextFormWorkiom> createState() => _CustomTextFormWorkiomState();
}

class _CustomTextFormWorkiomState extends State<CustomTextFormWorkiom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (widget.prefixIcon != null)
          Padding(
            padding: EdgeInsetsDirectional.only(
                // start: screenWidthPercent(40, context),
                ),
            child: widget.prefixIcon!,
          ),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
              // vertical: 6,
              horizontal: screenWidthPercent(100, context),
            ),
            decoration: BoxDecoration(
                color: widget.fillColor,
                border: Border(
                  bottom: BorderSide(
                    color: widget.borderColor!,
                    width: 1,
                  ),
                )),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    // autovalidateMode: AutovalidateMode.always,
                    // focusNode: widget.focusNode ?? FocusNode(),
                    scrollPadding: const EdgeInsets.all(92),
                    validator: widget.validator,
                    onFieldSubmitted: widget.onSubmit,
                    readOnly: widget.readOnly!,
                    autofocus: widget.autoFocus!,
                    textAlign: widget.centerPlaceHolder!
                        ? TextAlign.center
                        : TextAlign.start,
                    cursorColor: AppColors.uiTypographyGreyDarkerColor,
                    controller: widget.textEditingController,
                    textInputAction: widget.textInputAction!,
                    keyboardType: widget.keyboardType!,
                    textCapitalization: widget.textCapitalization ??
                        TextCapitalization.sentences,
                    obscuringCharacter: "*",
                    obscureText:
                        widget.keyboardType! == TextInputType.visiblePassword &&
                            !widget.showPassword!,
                    onChanged: widget.onChange,
                    // onChanged: (value) {
                    //   if (!(widget.keyboardType! ==
                    //           TextInputType.visiblePassword &&
                    //       !widget.showPassword!)) {
                    //     if (widget.textEditingController != null) {
                    //       widget.textEditingController!.text = value.trim();
                    //     }
                    //   }
                    //   if (widget.onChange != null) widget.onChange!(value);
                    // },
                    inputFormatters: widget.inputFormatterList!,
                    maxLength: widget.maxLength!,
                    maxLines:
                        widget.keyboardType! == TextInputType.visiblePassword
                            ? 1
                            : widget.maxLines!,
                    style: TextStyle(
                      height: 1.2,
                      letterSpacing: -0.24,
                      color: AppColors.uiTypographyPrimaryColor,
                      fontSize: screenWidthPercent(24, context),
                      // fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      counter: SizedBox(
                        width: 0,
                        height: 0,
                      ),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      isCollapsed: true,
                      errorBorder: InputBorder.none,
                      contentPadding: EdgeInsetsDirectional.symmetric(
                        vertical: screenHeightPercent(300, context),
                      ),
                      // contentPadding: EdgeInsets.only(bottom: -10),
                      disabledBorder: InputBorder.none,
                      errorStyle: TextStyle(height: 0, fontSize: 11),
                      hintText: widget.placeHolder!,
                      hintStyle: TextStyle(
                        height: 1.2,
                        letterSpacing: -0.24,
                        color: AppColors.uiTypographySecondaryColor,
                        fontSize: screenWidthPercent(24, context),
                        // fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                if (widget.suffixWidget != null)
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      // end: screenWidthPercent(60, context),
                      bottom: screenWidthPercent(60, context),
                    ),
                    child: widget.suffixWidget,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
