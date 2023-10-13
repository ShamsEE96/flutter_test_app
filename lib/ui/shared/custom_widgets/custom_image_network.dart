import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';

import '../colors.dart';

class CircularImageNetwork extends StatelessWidget {
  final String? imagePath;
  final double? imageSize;
  final bool? isActiveSign;
  final Function? imageonTap;
  final Function? imageCategoryonTap;
  //final PickedFile imageFile;
  final File? imageFile;
  final Uint8List bytes;
  final String? imageCategorySvgPath;
  final BoxFit? imgFit;
  final bool? isSquare;
  final double? elevation;
  final Color? shadowColor;
  final String? placeHolderSvgPath;
  final double? placeHolderSize;
  const CircularImageNetwork(
      {Key? key,
      this.placeHolderSize,
      this.shadowColor,
      this.placeHolderSvgPath,
      this.elevation,
      this.isSquare = false,
      this.isActiveSign,
      this.imageCategorySvgPath,
      this.imageonTap,
      this.imgFit,
      required this.imagePath,
      this.imageSize,
      this.imageFile,
      this.imageCategoryonTap,
      required this.bytes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      // onTap: imageonTap!,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: <Widget>[
          imageFile == null && bytes.length == 0
              ? Material(
                  elevation: elevation ?? 0,
                  borderRadius: BorderRadius.circular(
                    isSquare! ? size.width / 8 : 200,
                  ),
                  shadowColor:
                      shadowColor ?? AppColors.blackColor.withOpacity(0.2),
                  color: Colors.transparent,
                  child: Stack(
                    alignment: Alignment.center,
                    children: <Widget>[
                      ClipRRect(
                          borderRadius: BorderRadius.circular(
                            isSquare! ? size.width / 8 : 200,
                          ),
                          child: Image.network(
                            imagePath ?? '',
                            width: imageSize ?? 20.0,
                            height: imageSize ?? 20.0,
                            fit: BoxFit.fill,
                          )
                          //  Image.network(
                          //                         imagePath ?? '',
                          //                         width: imageSize ?? 20.0,
                          //                         height: imageSize ?? 20.0,
                          //                         fit: BoxFit.fill,

                          //                         // loadingBuilder: (BuildContext context, Widget child,
                          //                         //     ImageChunkEvent loadingProgress) {
                          //                         //   if ([null].contains(loadingProgress)) return child;
                          //                         //   return Center(
                          //                         //     child: getLoader()(
                          //                         //       value: loadingProgress.expectedTotalBytes !=
                          //                         //               null
                          //                         //           ? loadingProgress.cumulativeBytesLoaded /
                          //                         //               loadingProgress.expectedTotalBytes
                          //                         //           : null,
                          //                         //     ),
                          //                         //   );
                          //                         // },
                          //                       ),
                          ),
                    ],
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(
                    isSquare! ? size.width / 8 : 200,
                  ),
                  child: kIsWeb
                      ? Image.memory(
                          bytes,
                          fit: BoxFit.cover,
                          width: imageSize,
                          height: imageSize,
                        )

                      //  Image.network(
                      //     imageFile!.path,
                      //     fit: BoxFit.cover,
                      //     width: imageSize,
                      //     height: imageSize,
                      //   )
                      : Image.file(
                          File(imageFile!.path),
                          fit: BoxFit.cover,
                          width: imageSize,
                          height: imageSize,
                        ),
                ),
          if (isActiveSign != null)
            Center(
              child: Container(
                margin: EdgeInsetsDirectional.only(
                    end: imageSize! / 1.3, bottom: imageSize! / 1.5),
                width: size.shortestSide / 40,
                height: size.shortestSide / 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: AppColors.whiteColor),
                    shape: BoxShape.circle,
                    color: isActiveSign!
                        ? AppColors.greenColor
                        : AppColors.grey100Color),
              ),
            ),
          if (imageCategorySvgPath != null)
            InkWell(
              onTap: () {
                imageCategoryonTap!();
              },
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(size.width / 44),
                  margin: EdgeInsetsDirectional.only(
                      start: imageSize! / 1.3, top: imageSize! / 1.5),
                  width: size.shortestSide / 10,
                  height: size.shortestSide / 10,
                  decoration: BoxDecoration(
                    color: AppColors.blueAccentColor,
                    borderRadius: BorderRadius.circular(
                      size.width / 28,
                    ),
                  ),
                  child: SvgPicture.asset(
                    imageCategorySvgPath!,
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}

class ImageErrorBuilder extends StatelessWidget {
  const ImageErrorBuilder(
      {Key? key,
      required this.elevation,
      required this.shadowColor,
      required this.imageSize,
      required this.placeHolderSize,
      required this.placeHolderSvgPath,
      this.isSquare = false})
      : super(key: key);

  final double? elevation;
  final Color? shadowColor;
  final double? imageSize;
  final double? placeHolderSize;
  final String? placeHolderSvgPath;
  final bool? isSquare;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Material(
      elevation: elevation ?? 0,
      shadowColor: shadowColor ?? AppColors.blackColor.withOpacity(0.6),
      child: Container(
        width: imageSize,
        height: imageSize,
        decoration: BoxDecoration(
          color: AppColors.grey25Color,
          borderRadius: BorderRadius.circular(
            isSquare! ? size.width / 8 : 200,
          ),
        ),
        child: placeHolderSvgPath != null
            ? Center(
                child: SvgPicture.asset(
                placeHolderSvgPath!,
                width: placeHolderSize,
                height: placeHolderSize,
              ))
            : Container(
                color: AppColors.grey75Color,
                child: Center(
                    child: Image.asset(
                  'assets/pngs/error_image.png',
                  width: 56,
                  height: 56,
                )),
              ),
      ),
    );
  }
}

class FillImageNetwork extends StatelessWidget {
  final String? imageUrl;
  final double? imageSize;
  final Color? loadingIndicatorColor;
  final BoxFit? imgFit;
  final double? errorImageSize;
  final double? radius;
  const FillImageNetwork(
      {Key? key,
      this.errorImageSize,
      this.imageSize,
      this.imgFit,
      this.radius,
      required this.imageUrl,
      this.loadingIndicatorColor = AppColors.whiteColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius ?? 0),
      child: Image.network(
        imageUrl!,
        width: imageSize,
        height: imageSize,
        fit: imgFit ?? BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => Container(
          color: AppColors.grey75Color,
          child: Center(
              child: Image.asset(
            'assets/pngs/error_image.png',
            width: 56,
            height: 56,
          )),
        ),
        loadingBuilder: (BuildContext context, Widget child,
            ImageChunkEvent? loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            color: AppColors.whiteColor,
            alignment: Alignment.center,
            child: SpinKitDualRing(
              color: AppColors.zoomColor,
            ),
          );
        },
      ),
    );
  }
}

class CustomCachedNetworkImage extends StatefulWidget {
  final bool isDefaultImage;
  final String imageUrl;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final Widget? placeholder;
  final Widget? errorWidget;
  final double? width;
  final double? height;
  final BoxFit? imageFit;
  final EdgeInsetsGeometry? margin;
  CustomCachedNetworkImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.borderRadius,
    this.isDefaultImage = false,
    this.placeholder,
    this.errorWidget,
    this.margin,
    this.border,
    this.imageFit,
  }) : super(key: key);

  @override
  _CustomCachedNetworkImageState createState() =>
      _CustomCachedNetworkImageState();
}

class _CustomCachedNetworkImageState extends State<CustomCachedNetworkImage> {
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: widget.imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        margin:
            ![null].contains(widget.margin) ? widget.margin : EdgeInsets.all(0),
        width: widget.width,
        height: widget.height,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
          borderRadius: ![null].contains(widget.borderRadius)
              ? widget.borderRadius
              : BorderRadius.all(Radius.circular(0)),
          border: ![null].contains(widget.border)
              ? widget.border
              : Border.all(color: AppColors.transparentColor, width: 0),
        ),
      ),
      placeholder: (context, url) => ![null].contains(widget.placeholder)
          ? widget.placeholder!
          : Center(
              //
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: SpinKitCircle(
                  color: AppColors.zoomColor,
                ),
              ),
            ),
      errorWidget: (context, url, error) => ![null].contains(widget.errorWidget)
          ? widget.errorWidget!
          : Icon(Icons.error),
    );
  }
}
