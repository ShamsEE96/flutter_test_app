import 'package:flutter/material.dart';
import 'package:flutter_template/ui/shared/colors.dart';

class CustomBasicView extends StatefulWidget {
  const CustomBasicView({
    super.key,
    this.body,
  });

  final Widget? body;

  @override
  State<CustomBasicView> createState() => _CustomBasicViewState();
}

class _CustomBasicViewState extends State<CustomBasicView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.uiWhiteColor,
      body: widget.body,
    );
  }
}
