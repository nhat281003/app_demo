import 'dart:io';
import 'package:app_3tv/common/constants/size_utils.dart';
import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/convert_h_w.dart';
import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:app_3tv/common/widget/text_field_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'button_action.dart';

class DialogWidget {
  static openLoadingDialog() {
    return Get.dialog(
        barrierDismissible: false,
        barrierColor: Colors.black26,
        Center(
          child: SpinKitFadingCircle(
            color: Colors.white,
            size: ConvertHW.removeHW('50w20'),
          ),
        ));
  }

  static loadingData(
      {Color? colorBackground, Color? colorIconRotate, double? size}) {
    return Container(
      color: colorBackground ?? Colors.white,
      child: Center(
        child: SpinKitFadingCircle(
          color: colorIconRotate ?? ColorUtils.COLOR_SUB_GREEN,
          size: size ?? ConvertHW.removeHW('50w20'),
        ),
      ),
    );
  }

  static loadingBackground() {
    return Stack(
      children: [
        // SizedBox(
        //   height: Get.height,
        //   width: Get.width,
        //   child: Image.asset(
        //     ImageConst.BACKGROUND_FULL,
        //     fit: BoxFit.cover,
        //   ),
        // ),
        Container(
          color: Colors.white.withOpacity(0.2),
          child: Center(
            child: SpinKitFadingCircle(
              color: ColorUtils.COLOR_PRIMARY,
              size: ConvertHW.removeHW('50w20'),
            ),
          ),
        )
      ],
    );
  }

  static dismissLoading() {
    Get.back();
  }

  static void showDialogConfirmBase({
    required String titleHeader,
    String? textCancel,
    required String textSuccess,
    required String contentPrimary,
    required String contentSub,
    TextEditingController? textEditingController,
    Function? functionSuccess,
    String? typeScreen,
    String? titleText,
    String? hintText,
    String? iconAsset,
  }) {
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: ()=> FocusScope.of(Get.context!).unfocus(),
              child: Container(
                width: Get.width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding:  const EdgeInsets.symmetric(
                          vertical: 4, horizontal: SizeUtils.PADDING_DIALOG),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: ColorUtils.COLOR_PRIMARY
                            .withOpacity(SizeUtils.OPACITY_COLOR_DIALOG),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 22.sp,
                            width: 22.sp,
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                color: Colors.grey.withOpacity(0)),
                            child: Icon(
                              Icons.close,
                              color: Colors.grey.withOpacity(0),
                              size: 14.sp,
                            ),
                          ),
                          Text(
                            titleHeader,
                            style: TextStyleUtils.sizeText16Weight700()
                                ?.copyWith(color: ColorUtils.COLOR_PRIMARY),
                          ),
                          GestureDetector(
                            onTap: () => Get.back(),
                            child: Container(
                              height: 22.sp,
                              width: 22.sp,
                              margin: const EdgeInsets.only(bottom: 15),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      const BorderRadius.all(Radius.circular(5)),
                                  color: Colors.grey.withOpacity(0.4)),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 14.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 4,
                          ),
                          if (contentSub.isEmpty)
                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                width: double.infinity,
                                child: Text(
                                  contentPrimary,
                                  style: TextStyleUtils.sizeText14Weight600(),
                                  textAlign: TextAlign.center,
                                ))
                          else
                            Text(
                              contentPrimary,
                              style: TextStyleUtils.sizeText14Weight600(),
                            ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            contentSub,
                            style: TextStyleUtils.sizeText14Weight400(),
                          ),
                          if (contentSub.isNotEmpty)
                            const SizedBox(
                              height: 10,
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (textCancel != null)
                                Expanded(
                                  child: ButtonAction(
                                    name: textCancel,
                                    colorBackground: Colors.grey,
                                    function: () => Get.back(),
                                    width: null,
                                    height: 35,
                                  ),
                                ),
                              if (textCancel != null)
                                const SizedBox(
                                  width: 15,
                                ),
                              Expanded(
                                child: ButtonAction(
                                  name: textSuccess,
                                  colorBackground: ColorUtils.COLOR_PRIMARY,
                                  function: () => functionSuccess != null
                                      ? functionSuccess()
                                      : Get.back(),
                                  width: null,
                                  height: 35,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    //Buttons
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static showToast(String? message,
      {Color? colorBackground, Color? colorText, int? timeShow}) {
    if (message == null) return;
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: colorBackground ?? Colors.black,
        textColor: colorText ?? Colors.white,
        timeInSecForIosWeb: 2,
        fontSize: 16.0);
  }

  static void notOpenFile() {
    showToast('Có lỗi xảy ra. Vui lòng thử lại', colorBackground: Colors.red);
  }

  static Widget getDialogConfirm(String title, Widget content,
      {String? btnLeft,
      String? btnRight,
      Color? colorBtnOk,
      Color? colorTextBtnOk,
      Function? funcLeft,
      Function? funcRight}) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorUtils.COLOR_WHITE,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(7.0),
          topRight: Radius.circular(7.0),
          bottomRight: Radius.circular(7.0),
          bottomLeft: Radius.circular(7.0),
        ),
      ),
      margin: EdgeInsets.only(
          left: 16, right: 16, bottom: Platform.isAndroid ? 65.h : 36.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: Get.width,
            padding: const EdgeInsets.symmetric(
                horizontal: 8, vertical: SizeUtils.PADDING_DIALOG),
            decoration: const BoxDecoration(
              color: ColorUtils.COLOR_BG_TOOLBAR,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(7.0),
                topRight: Radius.circular(7.0),
              ),
            ),
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: title,
                      style: const TextStyle(
                        color: ColorUtils.COLOR_WHITE,
                        fontWeight: FontWeight.w700,
                      )),
                ],
              ),
              textHeightBehavior:
                  const TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: content,
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  funcLeft?.call();
                },
                child: Container(
                    height: 56.h,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: const BoxDecoration(
                      color: Color(0xffE4EEF7),
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(7.0)),
                    ),
                    child: Center(
                      child: Text(btnLeft ?? "Hủy",
                          style: const TextStyle(
                            fontSize: 14,
                            color: ColorUtils.COLOR_BG_TOOLBAR,
                            fontWeight: FontWeight.w700,
                          )),
                    )),
              )),
              Expanded(
                  child: GestureDetector(
                child: Container(
                    height: 56.h,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    decoration: BoxDecoration(
                      color: colorBtnOk ?? ColorUtils.COLOR_WORK_TYPE_3,
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(7.0)),
                    ),
                    child: Center(
                      child: Text(btnRight ?? "Xác nhận",
                          style: TextStyle(
                            fontSize: 14,
                            color: colorTextBtnOk ?? ColorUtils.COLOR_WHITE,
                            fontWeight: FontWeight.w700,
                          )),
                    )),
                onTap: () {
                  funcRight?.call();
                },
              ))
            ],
          ),
        ],
      ),
    );
  }

  static Widget inputFieldMultiLineWidget(
      {required TextEditingController controllerText,
      required String hinText,
      required dynamic controller,
      double? height,
      int? maxLine,
      EdgeInsetsGeometry? isMargin}) {
    return Container(
        margin: isMargin ??
            const EdgeInsets.symmetric(
                vertical: 10, horizontal:  SizeUtils.PADDING_PRIMARY),
        height: height ?? 140,
        child: TextFieldCustom(
          hinText: hinText,
          controller: controllerText,
          borderRadius: 8,
          maxLines: maxLine ?? 8,
          hintStyle: TextStyleUtils.sizeText14Weight400()
              ?.copyWith(color: Colors.grey),
          inputStyle: TextStyleUtils.sizeText14Weight400()
              ?.copyWith(color: Colors.black),
          suffixIcon: Visibility(
            visible: controllerText.text.isNotEmpty,
            child: IconButton(
              icon: const Icon(
                Icons.clear,
                color: ColorUtils.COLOR_PRIMARY,
                size: 17,
              ),
              onPressed: () {
                controllerText.clear();
                if (controller != null) {
                  controller.update();
                }
              },
            ),
          ),
          onChange: (value) {
            if (controller != null) {
              controller.update();
            }
          },
        ));
  }

  static void showDialogLogOut({required Function functionSuccess}) {
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: Get.width,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        vertical: 6, horizontal: SizeUtils.PADDING_DIALOG),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: ColorUtils.COLOR_PRIMARY
                          .withOpacity(SizeUtils.OPACITY_COLOR_BACKGROUND_HOME),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 15.sp,
                          width: 15.sp,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              color: Colors.grey.withOpacity(0)),
                          child: Icon(
                            Icons.close,
                            color: Colors.grey.withOpacity(0),
                            size: 10.sp,
                          ),
                        ),
                        Text(
                          "Đăng xuất",
                          style: TextStyleUtils.sizeText14Weight700()
                              ?.copyWith(color: ColorUtils.COLOR_PRIMARY),
                        ),
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            height: 15.sp,
                            width: 15.sp,
                            margin: const EdgeInsets.only(bottom: 15),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                color: Colors.grey.withOpacity(0.4)),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 10.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: SizeUtils.PADDING_DIALOG),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Bạn có muốn đăng xuất tài khoản khỏi ứng dụng?',
                          style: TextStyleUtils.sizeText13Weight400(),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ButtonAction(
                                name: 'Đóng',
                                colorBackground: Colors.grey,
                                function: () => Get.back(),
                                width: null,
                                height: 35,
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: ButtonAction(
                                name: 'Đồng ý',
                                colorBackground: ColorUtils.COLOR_PRIMARY,
                                function: () => functionSuccess(),
                                width: null,
                                height: 35,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  //Buttons
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static getEmpty() {
    return Container(
      alignment: Alignment.center,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        // Image.asset(
        //   ImageConst.ICON_NO_DATA,
        //   width: 110,
        //   height: 110,
        // ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Không có dữ liệu!",
          style: TextStyle(
              fontSize: SizeUtils.size20,
              color: ColorUtils.COLOR_SUB_PRIMARY,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 30.h,
        )
      ]),
    );
  }
}
