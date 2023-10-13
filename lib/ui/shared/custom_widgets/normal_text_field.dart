import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_template/core/utils/general_utils.dart';

import '../colors.dart';
import 'custom_text_field.dart';

class NormalTextField extends StatefulWidget {
  final double? evevation;
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
  final List<SuffixItem>? suffixListItem;
  final String? helperMessageText;
  final Color? helperMessageColor;
  final bool? readOnly;
  final List<TextInputFormatter>? inputFormatterList;
  final int? maxLength;
  final bool? autoFocus;
  final int? maxLines;
  final bool? underLineBorderMode;
  final Widget? prefixIcon;
  final BoxConstraints? prefixConstraint;
  final Color? shadowColor;
  final bool? disableTextField;
  // final FocusNode? focusNode;

  const NormalTextField(
      {Key? key,
      this.evevation,
      // this.focusNode,
      this.textCapitalization,
      this.keyboardType,
      this.textInputAction,
      this.placeHolder,
      this.placeHolderCustomStyle,
      this.textEditingController,
      this.textCustomStyle,
      // this.nextFocusNode,
      // this.focusNode,
      this.onSubmit,
      this.onChange,
      this.validator,
      this.showPassword,
      this.borderColor,
      this.fillColor,
      this.centerPlaceHolder,
      this.suffixListItem,
      this.helperMessageText,
      this.helperMessageColor,
      this.readOnly,
      this.inputFormatterList,
      this.maxLength,
      this.autoFocus,
      this.maxLines,
      this.underLineBorderMode,
      this.prefixIcon,
      this.prefixConstraint,
      this.shadowColor,
      this.disableTextField,
      this.suffixWidget = const SizedBox()})
      : super(key: key);

  @override
  _NormalTextFieldState createState() => _NormalTextFieldState();
}

class _NormalTextFieldState extends State<NormalTextField> {
  @override
  void didChangeDependencies() {
    // if (Platform.isIOS) {
    //   SchedulerBinding.instance.addPostFrameCallback((_) {
    //     var keyboardVisibilityController = KeyboardVisibilityController();

    //     keyboardVisibilityController.onChange.listen(
    //       (bool visible) {
    //         if (!mounted) return;
    //         visible
    //             ? IosKeyboardDoneButtonService.showOverlay(context)
    //             : IosKeyboardDoneButtonService.removeOverlay();
    //       },
    //     );
    //   });
    // }

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // if (Platform.isIOS) IosKeyboardDoneButtonService.removeOverlay();
    super.dispose();
  }

  String _currentValidateMessage = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IgnorePointer(
          ignoring: _allClickableMode(),
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: widget.suffixListItem != null &&
                      widget.suffixListItem!.isNotEmpty
                  ? 5
                  : 6,
              horizontal: screenWidthPercent(100, context),
            ),
            decoration: BoxDecoration(
              boxShadow: widget.underLineBorderMode!
                  ? []
                  : [
                      BoxShadow(
                        color: AppColors.grey500Color.withOpacity(0.2),
                        // offset: Offset(0, 7),
                        // blurRadius: widget.evevation! + 11,
                      )
                    ],
              color: widget.fillColor,
              borderRadius: widget.underLineBorderMode!
                  ? null
                  : BorderRadius.circular(13),
              border: widget.underLineBorderMode!
                  ? Border(
                      bottom: BorderSide(color: widget.borderColor!, width: 1),
                    )
                  : Border.all(color: widget.borderColor!, width: 1),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                if (widget.prefixIcon != null)
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      start: screenWidthPercent(40, context),
                    ),
                    child: widget.prefixIcon!,
                  ),
                SizedBox(
                  width: 20,
                ),
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
                      cursorColor: AppColors.blueAccentColor,
                      controller: widget.textEditingController,
                      textInputAction: widget.textInputAction!,
                      keyboardType: widget.keyboardType!,
                      textCapitalization: widget.textCapitalization ??
                          TextCapitalization.sentences,
                      obscureText: widget.keyboardType! ==
                              TextInputType.visiblePassword &&
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
                        height: 1.5,
                        color: AppColors.redColor,
                        fontSize: screenWidthPercent(35, context),
                        fontWeight: FontWeight.w400,
                      )
                          .merge(
                            widget.textCustomStyle!.copyWith(inherit: true),
                          )
                          .merge(
                            widget.textCustomStyle!.copyWith(inherit: true),
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
                            color: AppColors.grey500Color,
                            fontSize: screenWidthPercent(32, context),
                            fontWeight: FontWeight.w600,
                          ).merge(
                            widget.placeHolderCustomStyle!
                                .copyWith(inherit: true),
                          ))),
                ),
                SizedBox(
                  width: 20,
                ),
                if (widget.suffixWidget != null)
                  Padding(
                    padding: EdgeInsetsDirectional.only(
                      end: screenWidthPercent(40, context),
                    ),
                    child: widget.suffixWidget,
                  ),
              ],
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: screenWidthPercent(32, context)),
          child: Text(
            ![null].contains(_currentValidateMessage) &&
                    _currentValidateMessage.isNotEmpty
                ? _currentValidateMessage
                : widget.helperMessageText!,
            maxLines: 1,
            style: TextStyle(
                fontSize: screenWidthPercent(32, context),
                height: 1.3,
                color: ![null].contains(_currentValidateMessage)
                    ? AppColors.redColor
                    : widget.helperMessageColor!),
          ),
        )
      ],
    );
  }

  bool _allClickableMode() =>
      widget.readOnly! &&
      widget.suffixListItem != null &&
      widget.suffixListItem!.length == 1;
}

class NewTextField extends StatelessWidget {
  final String? Function(String?)? validator;
  final Function(String?)? onSubmit;

  const NewTextField({Key? key, this.validator, this.onSubmit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      onFieldSubmitted: onSubmit,
    );
  }
}
