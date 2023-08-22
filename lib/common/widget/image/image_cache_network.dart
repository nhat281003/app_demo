import 'package:app_3tv/common/widget/dialog_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageCacheNetwork extends StatelessWidget {
  const ImageCacheNetwork(
      {Key? key,
      required this.urlImage,
      required this.width,
      required this.height,
      this.boxFit,
      this.isCircle})
      : super(key: key);
  final String urlImage;
  final double? width;
  final double? height;
  final BoxFit? boxFit;
  final bool? isCircle;

  @override
  Widget build(BuildContext context) {
    if (urlImage.isNotEmpty) {
      if (isCircle != null) {
        return ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          child: CachedNetworkImage(
              fit: boxFit ?? BoxFit.cover,
              width: width,
              height: height,
              imageUrl: urlImage,
              placeholder: (context, url) => Center(
                    child: Image.asset(
                      "assets/images/loading.gif",
                      fit: BoxFit.cover,
                    ),
                  ),
              errorWidget: (context, url, error) {
                return ImageCacheNetwork(
                  urlImage:
                      'https://static.thenounproject.com/png/741653-200.png',
                  width: width,
                  height: height,
                );
              }),
        );
      } else {
        return CachedNetworkImage(
            fit: boxFit ?? BoxFit.cover,
            width: width,
            height: height,
            imageUrl: urlImage,
            placeholder: (context, url) => DialogWidget.loadingData(
                colorIconRotate: Colors.black26,
                size: 30.sp,
                colorBackground: Colors.transparent),
            errorWidget: (context, url, error) {
              return ImageCacheNetwork(
                urlImage:
                    'https://static.thenounproject.com/png/741653-200.png',
                width: width,
                height: height,
              );
            });
      }
    } else {
      return const SizedBox();
    }
  }
}
