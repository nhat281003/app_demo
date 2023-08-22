import 'package:app_3tv/common/constants/app_constants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class ShowFullCustomZoomImage {
  const ShowFullCustomZoomImage._privateConstructor();

  static const ShowFullCustomZoomImage _instance =
      ShowFullCustomZoomImage._privateConstructor();

  static ShowFullCustomZoomImage get instance => _instance;

  void showFullImage(BuildContext context, dynamic file,
      {required String type}) {
    showGeneralDialog(
        context: context,
        barrierColor: Colors.black,
        // Background color
        barrierDismissible: false,
        barrierLabel: 'Dialog',
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          return Stack(
            children: [
              Container(
                padding: EdgeInsets.zero,
                width: Get.width,
                height: Get.height,
                child: (type == AppConstant.IMAGE_FILE)
                    ? PhotoView(imageProvider: AssetImage(file))
                    : (type == AppConstant.IMAGE_ASSET)
                        ? Image.asset(
                            file,
                            fit: BoxFit.fitWidth,
                          )
                        : PhotoView(
                            imageProvider: CachedNetworkImageProvider(
                              file,
                            ),
                          ),
              ),
              GestureDetector(
                onTap: () => Get.back(),
                child: Container(
                    margin: const EdgeInsets.only(top: 90, left: 25),
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 1,
                              offset: Offset(0.3, 0.3))
                        ]),
                    child: const Icon(
                      Icons.clear,
                      color: Colors.black,
                    )),
              )
            ],
          );
        });
  }
}
