//
// import 'package:task_manager/commom/utils/textstyle.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:task_manager/commom/utils/color_utils.dart';
// import 'package:get/get.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// class DialogUpdateNewVersion extends StatelessWidget {
// final String url;
// final bool isForceUpdate;
// final String content;
//   const DialogUpdateNewVersion({Key key, this.url, this.isForceUpdate, this.content}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Dialog(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(7),
//         ),
//         elevation: 0.0,
//         backgroundColor: Colors.transparent,
//         child: Container(
//           decoration: new BoxDecoration(
//             color: Colors.white,
//             shape: BoxShape.rectangle,
//             borderRadius: BorderRadius.circular(7),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black26,
//                 blurRadius: 7,
//                 offset: const Offset(0.0, 10.0),
//               ),
//             ],
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height: 16.h),
//                   Icon(Icons.error_rounded,
//                       color: ColorUtils.BG_BUTTON_SELL, size: 40.sp),
//                   Padding(
//                     padding: EdgeInsets.only(left: 24.w, right: 24.w, top: 21.h, bottom: 21.h),
//                     child: Text(content,
//                         textAlign: TextAlign.center,
//                         style: TextStyleUtils.sizeText13Weight700().copyWith(color: ColorUtils.COLOR_TEXT_BLACK87)),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Visibility(
//                         visible: !isForceUpdate ,
//                         child: InkWell(
//                           onTap: () {
//                             Get.back();
//                           },
//                           child: Container(
//                             alignment: Alignment.center,
//                             height: 30.h,
//                             width: 104.w,
//                             decoration: new BoxDecoration(
//                                 color: ColorUtils.BG_BUTTON_SELL,
//                                 borderRadius: BorderRadius.circular(8)),
//                             child: Text("close".tr,
//                                 textAlign: TextAlign.center,
//                                 style: TextStyleUtils.sizeText13Weight500()
//                                     .copyWith(color: ColorUtils.BG_BASE1)),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: !isForceUpdate ? 16.w : 0),
//                       InkWell(
//                         onTap: () => launchURL(url),
//                         child: Container(
//                           alignment: Alignment.center,
//                           height: 30.h,
//                           width: 104.w,
//                           decoration: new BoxDecoration(
//                               color: ColorUtils.BG_COLOR,
//                               borderRadius: BorderRadius.circular(8)),
//                           child: Text("update_now".tr,
//                               textAlign: TextAlign.center,
//                               style: TextStyleUtils.sizeText13Weight500()
//                                   .copyWith(color: ColorUtils.BG_BASE1)),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 21.h,
//                   ),
//                 ]),
//           ),
//         ),
//       ),
//     );
//   }
//   launchURL(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
//
// }
