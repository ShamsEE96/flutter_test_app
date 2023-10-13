// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_template/core/utils/general_utils.dart';
// import 'package:flutter_template/ui/shared/colors.dart';
// import 'package:flutter_template/ui/shared/custom_widgets/flutter_switch_package.dart';

// class CustomSwitch extends StatefulWidget {
//   CustomSwitch({
//     Key? key,
//     required this.switchValue,
//     this.onChanged,
//     this.activeImage,
//     this.unactiveImage,
//     this.width,
//     this.height,
//     this.toggleSize,
//     this.useFlutterSwitch = false,
//     this.valueIsRx = false,
//   }) : super(key: key);

//   final void Function(bool)? onChanged;
//   final String? activeImage;
//   final String? unactiveImage;
//   final bool useFlutterSwitch;
//   final double? width;
//   final double? height;
//   final double? toggleSize;
//   final bool valueIsRx;
//   // final ValueChanged<bool>? onChanged;
//   bool switchValue = false;

//   @override
//   _CustomSwitchState createState() => _CustomSwitchState();
// }

// class _CustomSwitchState extends State<CustomSwitch> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Container(
//         child: widget.useFlutterSwitch
//             ? FlutterSwitch(
//                 inactiveColor: AppColors.whiteColor,
//                 activeColor: AppColors.whiteColor,
//                 activeIcon: widget.activeImage != null
//                     ? CachedNetworkImage(
//                         imageUrl: widget.activeImage!,
//                         // fit: BoxFit.cover,
//                       )
//                     : null,
//                 inactiveIcon: widget.unactiveImage != null
//                     ? SvgPicture.asset(
//                         'assets/svgs/${widget.unactiveImage}.svg', //ic_direct_link
//                         color: AppColors.fillColorButtonIcon,
//                         fit: BoxFit.contain,
//                         width: screenWidthPercent(20, context),
//                       )
//                     : null,
//                 inactiveToggleBorder: Border.all(
//                   width: 1.5,
//                   color: AppColors.fillColorButtonIcon,
//                 ),
//                 inactiveSwitchBorder: Border.all(
//                   width: 1.5,
//                   color: AppColors.fillColorButtonIcon,
//                 ),
//                 activeSwitchBorder: Border.all(
//                   width: 1.5,
//                   color: AppColors.fillColorButtonIcon,
//                 ),
//                 activeToggleColor: AppColors.fillColorButtonIcon,
//                 // toggleColor: AppColors.AppWeeklyBlueColor,
//                 // activeToggleBorder: Border.all(
//                 //   width: 2,
//                 //   color: AppColors.transparentColor,
//                 // ),
//                 // inactiveToggleColor: AppColors.AppMonthlyBlueColor,
//                 width: widget.width ?? screenWidthPercent(9, context),
//                 height: widget.height ?? screenHeightPercent(28, context),
//                 toggleSize:
//                     widget.toggleSize ?? screenHeightPercent(28, context),
//                 padding: 0,
//                 value: widget.switchValue,
//                 // borderRadius: screenWidthPercent(22),
//                 onToggle: (bool value) {
//                   if (!widget.valueIsRx) {
//                     setState(() {
//                       widget.switchValue = value;
//                     });
//                   }
//                   if (widget.onChanged != null) {
//                     widget.onChanged!(value);
//                   }
//                 },
//               )
//             : Switch(
//                 activeColor: AppColors.fillColorButtonIcon,
//                 // inactiveColor: AppColors.whiteColor,
//                 value: widget.switchValue,
//                 inactiveThumbImage: widget.unactiveImage != null
//                     ? AssetImage("assets/images/${widget.unactiveImage}.png")
//                     : null,
//                 activeThumbImage: widget.activeImage != null
//                     ? CachedNetworkImageProvider(
//                         widget.activeImage!,
//                       )
//                     : null,
//                 onChanged: (bool value) {
//                   setState(() {
//                     widget.switchValue = value;
//                   });
//                   if (widget.onChanged != null) {
//                     widget.onChanged!(value);
//                   }
//                 },
//               ),
//       ),
//     );
//   }
// }
