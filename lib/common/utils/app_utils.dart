import 'package:app_3tv/common/constants/string_constant.dart';
import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/global.dart';
import 'package:app_3tv/common/utils/preference_utils.dart';
import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:app_3tv/common/widget/button_cusstom.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'date_time_utils.dart';


const debug = true;

class AppUtils {
  static AppUtils shared = AppUtils();
  bool isShowLoading = false;

  void showLoading() async {
    printLog("----showloading");
    int themeType = PreferenceUtils.getInt(StringConstant.SAVETHEME);
    EasyLoading.instance.loadingStyle =
        themeType != 0 ? EasyLoadingStyle.dark : EasyLoadingStyle.light;
    EasyLoading.show(status: "Đang tải...", dismissOnTap: true);
    // if (!isShowLoading) {
    //   isShowLoading = true;
    //   Future.delayed(
    //       Duration.zero,
    //       () => showDialog(
    //           context: Get.context!,
    //           barrierDismissible: false,
    //           useRootNavigator: false,
    //           builder: (c) {
    //             return WillPopScope(
    //                 onWillPop: () async => false, child: LoaddingWidget());
    //           }));
    // }
  }

  void hideLoading() async {
    EasyLoading.dismiss();
    // if (isShowLoading) {
    //   printLog("----hideloading");
    //   isShowLoading = false;
    //   AppUtils.shared.popView(context);
    // }
  }

  void printLog(Object object) {
    if (debug) print(object);
  }

  void popView(BuildContext context) {
    Navigator.pop(context);
  }

  void showToast(String content, {Color? backgroundColor, Color? textColor}) {
    FocusManager.instance.primaryFocus?.unfocus();
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: content,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor:
            backgroundColor ?? ColorUtils.COLOR_BG_TOOLBAR.withOpacity(0.8),
        textColor: textColor ?? Colors.white,
        fontSize: 14);
  }

  void snackbarSuccess(String title, String content) {
    Get.snackbar(title, content,
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        icon: Icon(Icons.check_circle),
        backgroundColor: Colors.green);
  }

  String formatMonney(num number) {
    double money = number.toDouble();
    final oCcy = NumberFormat("#,##0", "vi_VN");
    if (number > 1000000) {
      money = number / 1000000;
      var moneyStr = money.toStringAsFixed(2);
      List<String> substr = moneyStr.split('.');
      if (substr.isNotEmpty) {
        return "${percentFormatter.format(money)} ${"tr".tr}";
      }
      return "${money.toInt()} ${"tr".tr}";
    }
    return oCcy.format(money);
  }

  String? formatDouble(num? number) {
    if (number == 0 || number == null) return "0";
    int decimalsF = 0;

    var moneyStr = number.toStringAsFixed(2);
    List<String> substr = moneyStr.split('.');
    if (substr.isNotEmpty) {
      decimalsF = int.tryParse(substr[1])!;
      if (decimalsF > 0 && decimalsF % 10 != 0) {
        return "${number.toStringAsFixed(2)}";
      } else if (decimalsF > 0 && decimalsF % 10 == 0) {
        return "${number.toStringAsFixed(1)}";
      } else {
        return "${number.toInt()}";
      }
    }
  }

  void snackbarError(String title, String? content) {
    Get.snackbar(title, content ?? "Có lỗi ngoại lệ",
        snackPosition: SnackPosition.TOP,
        colorText: Colors.white,
        duration: const Duration(seconds: 3),
        animationDuration: const Duration(seconds: 1),
        icon: const Icon(Icons.warning_amber_rounded),
        backgroundColor: Colors.red);
  }

  void cusstomBottomSheet(
      {required Widget childBottomSheet,
      double? height,
      Function()? fnClear,
      Function()? fnApply}) {
    Get.bottomSheet(
      InkWell(
        onTap: () => dismissKeyboard(),
        child: Container(
          padding: MediaQuery.of(Get.context!).viewInsets,
          height: height,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0))),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(Get.context!).viewInsets.bottom),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 4.h,
                        width: 40.w,
                        decoration: BoxDecoration(
                            color: ColorUtils.BG_INACTIVE_BUTTON,
                            borderRadius: BorderRadius.circular(12)),
                      ),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    Text(
                      "filter".tr,
                      style: TextStyleUtils.sizeText16Weight400(),
                    ),
                    const SizedBox(
                      height: 21,
                    ),
                    childBottomSheet,
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ButtonCustom(
                                onTap: fnClear,
                                height: 23.h,
                                textContent: 'clear_filter'.tr,
                                color: ColorUtils.BG_INACTIVE_BUTTON,
                                style: TextStyleUtils.sizeText11Weight500())),
                        const SizedBox(
                          width: 25,
                        ),
                        Expanded(
                            child: ButtonCustom(
                          onTap: fnApply,
                          height: 23.h,
                          textContent: 'apply'.tr,
                          color: ColorUtils.colorOrange,
                          style: TextStyleUtils.sizeText11Weight500()
                              ?.copyWith(color: Colors.white),
                        ))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      isDismissible: true,
      isScrollControlled: true,
      enableDrag: false,
    );
  }

  String k_m_b_generator(num) {
    if (num > 999 && num < 99999) {
      return "${(num / 1000).toStringAsFixed(1)} K";
    } else if (num > 99999 && num < 999999) {
      return "${(num / 1000).toStringAsFixed(0)} K";
    } else if (num > 999999 && num < 999999999) {
      return "${(num / 1000000).toStringAsFixed(1)} M";
    } else if (num > 999999999) {
      return "${(num / 1000000000).toStringAsFixed(1)} B";
    } else {
      return num.toString();
    }
  }

  void showDialog({
    String? title,
    Widget? content,
    String? textLeft = "cancel",
    String? textRight = "close",
    Function()? confirmOnTap,
  }) {
    Get.dialog(
      AlertDialog(
        title: Text(
          title ?? "",
          style: TextStyleUtils.sizeText19Weight500()
              ?.copyWith(color: Colors.black),
        ),
        content: content,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              (textLeft != null)
                  ? ButtonCustom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 16),
                      textContent: textLeft.tr,
                      color: ColorUtils.colorOrange,
                      borderRadius: 4,
                      onTap: () {
                        Get.back();
                      },
                      style: TextStyleUtils.sizeText12Weight600()
                          ?.copyWith(color: Colors.white),
                    )
                  : Container(),
              const SizedBox(width: 12),
              (textRight != null)
                  ? ButtonCustom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 16),
                      textContent: textRight.tr,
                      color: ColorUtils.BG_COLOR,
                      borderRadius: 4,
                      onTap: confirmOnTap,
                      style: TextStyleUtils.sizeText12Weight600()
                          ?.copyWith(color: Colors.white),
                    )
                  : Container(),
            ],
          )
        ],
      ),
    );
  }

  Widget buildCusstomSelectDate(
      {required String dateTime, required Function() onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          height: 23.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(color: Colors.green, spreadRadius: 1),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                DateTimeUtils.formatTime(dateTime, format: "dd/MM/yyyy"),
                style: TextStyleUtils.sizeText13Weight400()
                    ?.copyWith(color: ColorUtils.COLOR_TEXT_BLACK87),
              ),
              Image.asset(
                "assets/icons/ic_calendar.png",
                width: 16.w,
                height: 16.h,
                fit: BoxFit.contain,
              )
            ],
          )),
    );
  }

  static const _locale = 'en';

  String formatNumber(String s) =>
      NumberFormat.decimalPattern(_locale).format(num.parse(s));

  final currencyFormatter = NumberFormat('#,###');
  final percentFormatter = NumberFormat('#,###.##');
  final roundingFormatter = NumberFormat('#,###,000');
  final exercisePrice = NumberFormat('#,###0.00');

  static String currencyFormatterf(num? number) {
    if (number == null) {
      return "";
    }
    if (number == 0) {
      return 0.toString();
    }
    var inputFormat = NumberFormat('#,###');
    return inputFormat.format(number);
  }

  static String currencyKL(num? number) {
    if (number == null) {
      return 0.toString();
    }
    if (number == 0) {
      return 0.toString();
    }
    var inputFormat = NumberFormat('#,###');
    return inputFormat.format(number);
  }

  static String percentFormatterf(num? number, {formatDecimal = "#,###"}) {
    if (number == null) {
      return "-";
    }
    if (number == 0) {
      return 0.toString();
    }
    var inputFormat = NumberFormat(formatDecimal);
    return inputFormat.format(number);
  }

  static String decimalRangeFormatter(
    num? valueFormat,
    int decimalNumber, {
    String? sPattern = "#", // sPattern = "0" hoặc "#"
  }) {
    if (valueFormat == null) {
      return "";
    }
    if (valueFormat == 0) {
      return 0.toString();
    }
    var inputFormat = NumberFormat('#,##0.${sPattern! * decimalNumber}');
    return inputFormat.format(valueFormat);
  }
}
