// import 'package:task_manager/commom/utils/screen/screen.dart';
// import 'package:task_manager/commom/utils/textstyle.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:task_manager/view/mobile/home/dashboard/notify_work_controller.dart';
// import 'package:get/get.dart';
//
// class BottomNavigationView extends GetView<DashBoardController> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       bottom: false,
//       child: Transform.translate(
//         offset: Offset(0.0, 0.0),
//         child: Container(
//           height: 65.h ,
//           color: context.theme.bottomAppBarColor,
//           padding: EdgeInsets.only(bottom: Screen.bottomSafeHeight,top: 5.h),
//           // decoration: ShapeDecoration(
//           //   color: context.theme.bottomAppBarColor,
//           //   // shape: MyBorderShape(),
//           // ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               GestureDetector(
//                 behavior: HitTestBehavior.translucent,
//                 onTap: () {
//                   controller.setIndex(0);
//                 },
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     controller.currentIndex == 0
//                         ? Image.asset("assets/icons/tai_san1.png",
//                             color: context.theme.colorScheme.onBackground,
//                             width: 20.w,
//                             height: 20.h,
//                             fit: BoxFit.contain)
//                         : Image.asset("assets/icons/tai_san.png",
//                             color: context.theme.primaryColorLight,
//                             width: 20.w, height: 20.h, fit: BoxFit.contain),
//                     SizedBox(
//                       height: 3.h,
//                     ),
//                     Text("assets".tr,
//                         style: TextStyleUtils.sizeText10Weight400().copyWith(
//                             color: controller.currentIndex == 0
//                                 ? context.theme.colorScheme.onBackground
//                                 : context.theme.primaryColorLight))
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 behavior: HitTestBehavior.translucent,
//                 onTap: () {
//                   controller.setIndex(1);
//                 },
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     controller.currentIndex == 1
//                         ? Image.asset("assets/icons/watchlist1.png",
//                             color: context.theme.colorScheme.onBackground,
//                             width: 18.w,
//                             height: 20.h,
//                             fit: BoxFit.contain)
//                         : Image.asset("assets/icons/watchlist.png",
//                             color: context.theme.primaryColorLight,
//                             width: 18.w, height: 20.h, fit: BoxFit.contain),
//                     SizedBox(
//                       height: 3.h,
//                     ),
//                     Text("watchlist".tr,
//                         style: TextStyleUtils.sizeText10Weight400().copyWith(
//                             color: controller.currentIndex == 1
//                                 ? context.theme.colorScheme.onBackground
//                                 : context.theme.primaryColorLight))
//                   ],
//                 ),
//               ),
//               _buildMiddleTabItem(),
//               GestureDetector(
//                 behavior: HitTestBehavior.translucent,
//                 onTap: () {
//                   controller.setIndex(3);
//                 },
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     controller.currentIndex == 3
//                         ? Image.asset("assets/icons/so_lenh1.png",
//                             color: context.theme.colorScheme.onBackground,
//                             width: 19.w,
//                             height: 21.h,
//                             fit: BoxFit.contain)
//                         : Image.asset(
//                             "assets/icons/so_lenh.png",
//                             width: 19.w,
//                             height: 21.h,
//                             fit: BoxFit.contain,
//                             color: context.theme.primaryColorLight,
//                           ),
//                     SizedBox(
//                       height: 3.h,
//                     ),
//                     Text("command_book".tr,
//                         style: TextStyleUtils.sizeText10Weight400().copyWith(
//                             color: controller.currentIndex == 3
//                                 ? context.theme.colorScheme.onBackground
//                                 : context.theme.primaryColorLight))
//                   ],
//                 ),
//               ),
//               GestureDetector(
//                 behavior: HitTestBehavior.translucent,
//                 onTap: () {
//                   controller.setIndex(4);
//                 },
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: <Widget>[
//                     controller.currentIndex == 4
//                         ? Image.asset("assets/icons/vi_the1.png",
//                             color: context.theme.colorScheme.onBackground,
//                             width: 20.w,
//                             height: 20.h,
//                             fit: BoxFit.contain)
//                         : Image.asset("assets/icons/vi_the.png",
//                             color: context.theme.primaryColorLight,
//                             width: 20.w, height: 20.h, fit: BoxFit.contain),
//                     SizedBox(
//                       height: 3.h,
//                     ),
//                     Text(
//                       "position".tr,
//                       style: TextStyleUtils.sizeText10Weight400().copyWith(
//                           color: controller.currentIndex == 4
//                               ? context.theme.colorScheme.onBackground
//                               : context.theme.primaryColorLight),
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildMiddleTabItem() {
//     return SizedBox(
//       height: 60.h,
//       width: 50.h,
//     );
//   }
// }
// //
// // // ignore: must_be_immutable
// // class MyBorderShape extends ShapeBorder {
// //   @override
// //   EdgeInsetsGeometry get dimensions => EdgeInsets.zero;
// //
// //   @override
// //   Path getInnerPath(Rect rect, {TextDirection textDirection}) => null;
// //
// //   double holeSize = 70.h;
// //
// //   @override
// //   Path getOuterPath(Rect rect, {TextDirection textDirection}) {
// //     return Path.combine(
// //       PathOperation.difference,
// //       Path()
// //         ..addRRect(RRect.fromRectAndCorners(rect,
// //             topLeft: Radius.circular(26), topRight: Radius.circular(26)))
// //         ..close(),
// //       Path()
// //         ..addOval(Rect.fromCenter(
// //             center: rect.center.translate(
// //               0,
// //               -rect.height / 4,
// //             ),
// //             height: holeSize,
// //             width: holeSize))
// //         ..close(),
// //     );
// //   }
// //
// //   @override
// //   void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {}
// //
// //   @override
// //   ShapeBorder scale(double t) => this;
// // }
