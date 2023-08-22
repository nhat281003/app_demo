import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/global.dart';
import 'package:app_3tv/common/utils/open_url.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AvatarWidget extends StatelessWidget {
  AvatarWidget({
    Key? key,
    this.url,
    this.width = 80,
    this.height = 80,
    this.boxFit = BoxFit.cover,
    this.editAvatar,
    this.isEdit = false,
    this.disableView = false,
  }) : super(key: key);
  final String? url;
  final double? width;
  final double? height;
  final BoxFit? boxFit;
  Function? editAvatar;
  bool isEdit = false;
  bool disableView = false;

  getAvatar(context) {
    if (url != null && url!.isNotEmpty) {
      return GestureDetector(
        onTap: () {
          if (!disableView) OpenUrl.openImageViewer(context, url!);
        },
        child: SizedBox(
          width: width?.w,
            height: height?.w,
            child: CircleAvatar(
                backgroundImage: Image.network(
          url!,
          width: width?.w,
          height: height?.w,
          fit: boxFit,
          errorBuilder: (covariant, v, c) {
            return Image.asset(
              getAssetsIcon("ic_no_avatar.png"),
              width: width?.w,
              height: height?.w,
            );
          },
        ).image)),
      );
    } else {
      return GestureDetector(
        onTap: () {
          // OpenUrl.openImageViewer(context, AppCache().avatar!);
        },
        child: SizedBox(width: width?.w, height: height?.h,child:  CircleAvatar(
          backgroundImage: Image.asset(
            getAssetsIcon("ic_no_avatar.png"),
            width: width?.w,
            height: height?.w,
            fit: boxFit,
            errorBuilder: (covariant, v, c) {
              return Image.asset(
                getAssetsIcon("ic_no_avatar.png"),
                width: width?.w,
                height: height?.w,
              );
            },
            // loadingBuilder: (covariant, v, c) {
            //   return SizedBox(
            //       width: width,
            //       height: height,
            //       child: const Center(child: CupertinoActivityIndicator()));
            // },
          ).image,
        ),),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        getAvatar(context),
        if (isEdit)
          Positioned(
            right: 5,
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                editAvatar!.call();
              },
              child: Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.camera_alt_rounded,
                  size: 16,
                  color: ColorUtils.COLOR_BG_TOOLBAR,
                ),
              ),
            ),
          )
      ],
    );
  }
}
