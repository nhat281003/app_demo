import 'package:app_3tv/common/constants/app_constants.dart';
import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:app_3tv/common/widget/image/image_cache_network.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ShowFullImage {
  const ShowFullImage._privateConstructor();

  static const ShowFullImage _instance = ShowFullImage._privateConstructor();

  static ShowFullImage get instance => _instance;

  void showFullImage(dynamic file,
      {required String type,
      String? title,
      String? content,
      int? index,
      int? length,
      Function? functionDownload,
      Function? functionShare,
      Function? functionDelete}) {
    showGeneralDialog(
        context: Get.context!,
        barrierColor: Colors.black,
        // Background color
        barrierDismissible: false,
        barrierLabel: 'Dialog',
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (BuildContext context, Animation<double> animation,
            Animation<double> secondaryAnimation) {
          double marginTop = 40.h;
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  padding: EdgeInsets.zero,
                  width: Get.width,
                  height: Get.height,
                  child: (type == AppConstant.IMAGE_FILE)
                      ? Image.file(
                          file,
                          fit: BoxFit.fitWidth,
                        )
                      : (type == AppConstant.IMAGE_ASSET)
                          ? Image.asset(
                              file,
                              fit: BoxFit.fitWidth,
                            )
                          : ImageCacheNetwork(
                              urlImage: file,
                              width: Get.width,
                              height: null,
                              boxFit: BoxFit.fitWidth,
                            ),
                ),
                if (title != null || content != null)
                  Column(
                    children: [
                      const Spacer(),
                      Container(
                        constraints: BoxConstraints(
                            minHeight: Get.height * 0.14, maxHeight: 400),
                        child: Column(
                          children: [
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              width: Get.width,
                              color: Colors.black.withOpacity(0.5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  if (title != null)
                                    Text(
                                      title,
                                      style:
                                          TextStyleUtils.sizeText16Weight600()
                                              ?.copyWith(
                                                  color: Colors.white,
                                                  height: 1.3),
                                    ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  if (content != null)
                                    Text(
                                      content,
                                      style:
                                          TextStyleUtils.sizeText14Weight400()
                                              ?.copyWith(
                                                  color: Colors.white,
                                                  height: 1.3),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                Container(
                  margin: EdgeInsets.only(top: marginTop),
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Container(
                                height: 37,
                                width: 37,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30)),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black26,
                                          blurRadius: 1,
                                          offset: Offset(0.3, 0.3))
                                    ]),
                                child: const Icon(
                                  Icons.clear,
                                  color: Colors.black,
                                )),
                          ),
                          if (index != null && length != null)
                            Text(
                              '$index/$length',
                              style: TextStyle(
                                  color: Colors.black, fontSize: 18.sp),
                            ),
                          const SizedBox(
                            width: 37,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.only(bottom: 30),
                        width: Get.width * 0.7,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            if (functionDownload != null)
                              GestureDetector(
                                onTap: () => functionDownload(),
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 37,
                                    width: 37,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 1,
                                              offset: Offset(0.3, 0.3))
                                        ]),
                                    child: const Icon(Icons.file_download)),
                              ),
                            if (functionDelete != null)
                              GestureDetector(
                                onTap: () => functionDelete(),
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 37,
                                    width: 37,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30)),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.black26,
                                              blurRadius: 1,
                                              offset: Offset(0.3, 0.3))
                                        ]),
                                    child: const Icon(Icons.delete)),
                              ),
                            const SizedBox(),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  // void showFullImageScrollHorizontal(List<String> listUrl,
  //     {int? index, required ScrollController scrollController}) {
  //   final homeControllerFind = Get.find<HomeController>();
  //   final detailImageControllerFind = Get.find<DetailImageController>();
  //   showGeneralDialog(
  //       context: Get.context!,
  //       barrierColor: Colors.black,
  //       // Background color
  //       barrierDismissible: false,
  //       barrierLabel: 'Dialog',
  //       transitionDuration: const Duration(milliseconds: 400),
  //       pageBuilder: (BuildContext context, Animation<double> animation,
  //           Animation<double> secondaryAnimation) {
  //         double marginTop = 40.h;
  //         return Scaffold(
  //           body: SizedBox(
  //             height: Get.height,
  //             width: Get.width,
  //             child: ListView.builder(
  //                 controller: scrollController,
  //                 scrollDirection: Axis.horizontal,
  //                 itemCount: listUrl.length,
  //                 itemBuilder: (context, indexIn) {
  //                   return Stack(
  //                     children: [
  //                       Container(
  //                         padding: EdgeInsets.zero,
  //                         width: Get.width,
  //                         height: Get.height,
  //                         child: ImageCacheNetwork(
  //                           urlImage: listUrl[indexIn],
  //                           width: Get.width,
  //                           height: null,
  //                           boxFit: BoxFit.fitWidth,
  //                         ),
  //                       ),
  //                       Container(
  //                         width: Get.width,
  //                         margin: EdgeInsets.only(top: marginTop),
  //                         padding: const EdgeInsets.symmetric(horizontal: 25),
  //                         child: Column(
  //                           children: [
  //                             Row(
  //                               crossAxisAlignment: CrossAxisAlignment.center,
  //                               mainAxisAlignment:
  //                                   MainAxisAlignment.spaceBetween,
  //                               children: [
  //                                 GestureDetector(
  //                                   onTap: () => Get.back(),
  //                                   child: Container(
  //                                       height: 37,
  //                                       width: 37,
  //                                       decoration: const BoxDecoration(
  //                                           borderRadius: BorderRadius.all(
  //                                               Radius.circular(30)),
  //                                           color: Colors.white,
  //                                           boxShadow: [
  //                                             BoxShadow(
  //                                                 color: Colors.black26,
  //                                                 blurRadius: 1,
  //                                                 offset: Offset(0.3, 0.3))
  //                                           ]),
  //                                       child: const Icon(
  //                                         Icons.clear,
  //                                         color: Colors.black,
  //                                       )),
  //                                 ),
  //                                 if (index != null)
  //                                   Text(
  //                                     '${indexIn + 1}/${listUrl.length}',
  //                                     style: TextStyle(
  //                                         color: Colors.black, fontSize: 18.sp),
  //                                   ),
  //                                 const SizedBox(
  //                                   width: 37,
  //                                 ),
  //                               ],
  //                             ),
  //                             const Spacer(),
  //                             Container(
  //                               padding: const EdgeInsets.only(bottom: 30),
  //                               width: Get.width * 0.7,
  //                               child: Row(
  //                                 mainAxisAlignment:
  //                                     MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   const SizedBox(),
  //                                   GestureDetector(
  //                                     onTap: () {
  //                                       SaveImage.instance
  //                                           .saveNetworkImage(listUrl[indexIn]);
  //                                     },
  //                                     child: Container(
  //                                         alignment: Alignment.center,
  //                                         height: 37,
  //                                         width: 37,
  //                                         decoration: const BoxDecoration(
  //                                             borderRadius: BorderRadius.all(
  //                                                 Radius.circular(30)),
  //                                             color: Colors.white,
  //                                             boxShadow: [
  //                                               BoxShadow(
  //                                                   color: Colors.black26,
  //                                                   blurRadius: 1,
  //                                                   offset: Offset(0.3, 0.3))
  //                                             ]),
  //                                         child:
  //                                             const Icon(Icons.file_download)),
  //                                   ),
  //                                   if (homeControllerFind.profileModel.type ==
  //                                       AppConstant.ADMIN)
  //                                     GestureDetector(
  //                                       onTap: () {
  //                                         DialogWidget.showDialogConfirmBase(
  //                                             functionSuccess: () async {
  //                                               await detailImageControllerFind
  //                                                   .deleteOneImage(
  //                                                       listUrl[indexIn])
  //                                                   .then((value) {
  //                                                 if (value) {
  //                                                   Get.back();
  //                                                 }
  //                                               });
  //                                             },
  //                                             textCancel: 'Hủy',
  //                                             titleHeader: 'Xóa ảnh',
  //                                             textSuccess: 'Xóa',
  //                                             contentPrimary:
  //                                                 'Bạn có muốn xóa ảnh này?',
  //                                             contentSub: '');
  //                                       },
  //                                       child: Container(
  //                                           alignment: Alignment.center,
  //                                           height: 37,
  //                                           width: 37,
  //                                           decoration: const BoxDecoration(
  //                                               borderRadius: BorderRadius.all(
  //                                                   Radius.circular(30)),
  //                                               color: Colors.white,
  //                                               boxShadow: [
  //                                                 BoxShadow(
  //                                                     color: Colors.black26,
  //                                                     blurRadius: 1,
  //                                                     offset: Offset(0.3, 0.3))
  //                                               ]),
  //                                           child: const Icon(Icons.delete)),
  //                                     ),
  //                                   const SizedBox(),
  //                                 ],
  //                               ),
  //                             )
  //                           ],
  //                         ),
  //                       )
  //                     ],
  //                   );
  //                 }),
  //           ),
  //         );
  //       });
  // }
}
