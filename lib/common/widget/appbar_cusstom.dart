import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../utils/screen/screen.dart';

class AppBarCustom extends StatelessWidget {
  AppBarCustom(
      {Key? key,
      this.iconNotify = true,
      this.centerTitle,
      this.leadingIcon,
      this.leadingFunction,
      this.actionIcon,
      this.actionFunction,
      this.width,
      this.height,
      this.elevation,
      this.notifyMark,
      this.id,
      this.backgroundColor = Colors.transparent,
      this.leadingWidget,
      this.automaticallyImplyLeading = false})
      : super(key: key);
  final Widget? centerTitle;
  final String? leadingIcon;
  final Function()? leadingFunction;
  final String? actionIcon;
  final Function()? actionFunction;
  final double? width;
  final double? height;
  final double? elevation;
  final bool iconNotify;
  final String? notifyMark;
  final Color? backgroundColor;
  final Widget? leadingWidget;
  dynamic id;
  final bool automaticallyImplyLeading;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Screen.appBarHeight,
      child: AppBar(
        automaticallyImplyLeading: automaticallyImplyLeading,
        backgroundColor: backgroundColor,
        leading: IconButton(
          onPressed: leadingFunction,
          icon: leadingWidget ??
              IconButton(
                  onPressed: () => Get.back(id: id),
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  )),
        ),
        centerTitle: true,
        title: centerTitle,
        actions: [
          iconNotify
              ? Obx(() {
                  return Stack(
                    children: <Widget>[
                      IconButton(onPressed: () {}, icon: Image.asset("assets/icons/ic_noti.png", width: 19.w, height: 30.h, fit: BoxFit.contain)),
                      // Get.find<NotifyController>().notiUnread.value != 0
                      //     ? Positioned(
                      //         top: 14,
                      //         right: 12,
                      //         child: Container(
                      //           padding: const EdgeInsets.all(1),
                      //           decoration: BoxDecoration(
                      //             color: Colors.red,
                      //             borderRadius: BorderRadius.circular(6),
                      //           ),
                      //           constraints: const BoxConstraints(
                      //             minWidth: 12,
                      //             minHeight: 12,
                      //           ),
                      //           child: Center(
                      //             child: Text(
                      //               "${Get.find<NotifyController>().notiUnread.value}",
                      //               style: const TextStyle(
                      //                 color: Colors.white,
                      //                 fontSize: 8,
                      //               ),
                      //               textAlign: TextAlign.center,
                      //             ),
                      //           ),
                      //         ),
                      //       )
                      //     : const SizedBox()
                    ],
                  );
                })
              : actionIcon != null
                  ? IconButton(
                      onPressed: actionFunction,
                      icon: Image.asset("assets/icons/${actionIcon!}", width: 19.w, height: 30.h, fit: BoxFit.contain),
                    )
                  : const SizedBox(),
        ],
        elevation: elevation,
      ),
    );
  }
}
