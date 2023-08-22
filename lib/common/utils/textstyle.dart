
import 'package:app_3tv/common/utils/preference_utils.dart';
import 'package:app_3tv/common/utils/theme/theme_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constants/string_constant.dart';
import 'color_utils.dart';
import 'convert_h_w.dart';
import 'number_constant.dart';


class TextStyleUtils {
  static String fontName = 'Poppins';
  static TextStyle? textAbout() {
    return Theme.of(Get.context!)
        .textTheme
        .displayLarge
        ?.copyWith(fontSize: cmn_11.sp, fontFamily: fontName);
  }

  //TextStyle?9
  static TextStyle? sizeText9Weight400() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('9sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static TextStyle? sizeText9Weight500() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('9sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w500,
        color: Colors.black);
  }

  //TextStyle?10
  static TextStyle? sizeText10Weight300() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('10sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w300,
        color: Colors.black);
  }

  static TextStyle? sizeText10Weight400() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('10sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static TextStyle? sizeText10Weight500() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('10sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w500,
        color: Colors.black);
  }

  static TextStyle? sizeText10Weight600() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('10sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w600,
        color: Colors.black);
  }

  static TextStyle? sizeText10Weight700() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('10sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w700,
        color: Colors.black);
  }

  //TextStyle?11
  static TextStyle? sizeText11Weight300() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('11sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w300,
        color: Colors.black);
  }

  static TextStyle? sizeText11Weight400() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('11sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static TextStyle? sizeText11Weight500() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('11sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w500,
        color: Colors.black);
  }

  static TextStyle? sizeText11Weight600() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('11sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w600,
        color: Colors.black);
  }

  static TextStyle? sizeText11Weight700() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('11sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w700,
        color: Colors.black);
  }

  //TextStyle?12
  static TextStyle? sizeText12Weight300() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('12sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w300,
        color: Colors.black);
  }

  static TextStyle? sizeText12Weight400() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
          fontSize: ConvertHW.removeHW('12sp0'),
          fontFamily: fontName,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        );
  }

  static TextStyle? sizeText12Weight500() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('12sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w500,
        color: Colors.black);
  }

  static TextStyle? sizeText12Weight600() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('12sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w600,
        color: Colors.black);
  }

  static TextStyle? sizeText12Weight700() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('12sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w700,
        color: Colors.black);
  }

  //TextStyle?13
  static TextStyle? sizeText13Weight300() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('13sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w300,
        color: Colors.black);
  }

  static TextStyle? sizeText13Weight400() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('13sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static TextStyle? sizeText13Weight500() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('13sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w500,
        color: Colors.black);
  }

  static TextStyle? sizeText13Weight600() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('13sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w600,
        color: Colors.black);
  }

  static TextStyle? sizeText13Weight700() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('13sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w700,
        color: Colors.black);
  }

  //TextStyle?14
  static TextStyle? sizeText14Weight300() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('14sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w300,
        color: Colors.black);
  }

  static TextStyle? sizeText14Weight400() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('14sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static TextStyle? sizeText14Weight500() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('14sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w500,
        color: Colors.black);
  }

  static TextStyle? sizeText14Weight600() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('14sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w600,
        color: Colors.black);
  }

  static TextStyle? sizeText14Weight700() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('14sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w700,
        color: Colors.black);
  }

  //TextStyle?15
  static TextStyle? sizeText15Weight300() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('15sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w300,
        color: Colors.black);
  }

  static TextStyle? sizeText15Weight400() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('15sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static TextStyle? sizeText15Weight500() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('15sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w500,
        color: Colors.black);
  }

  static TextStyle? sizeText15Weight600() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('15sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w600,
        color: Colors.black);
  }

  static TextStyle? sizeText15Weight700() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('15sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w700,
        color: Colors.black);
  }

  //TextStyle?16
  static TextStyle? sizeText16Weight300() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('16sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w300,
        color: Colors.black);
  }

  static TextStyle? sizeText16Weight400() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('16sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static TextStyle? sizeText16Weight500() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('16sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w500,
        color: Colors.black);
  }

  static TextStyle? sizeText16Weight600() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('16sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w600,
        color: Colors.black);
  }

  static TextStyle? sizeText16Weight700() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('16sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w700,
        color: Colors.black);
  }

  //TextStyle?17
  static TextStyle? sizeText17Weight300() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('17sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w300,
        color: Colors.black);
  }

  static TextStyle? sizeText17Weight400() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('17sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static TextStyle? sizeText17Weight500() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('17sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w500,
        color: Colors.black);
  }

  static TextStyle? sizeText17Weight600() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('17sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w600,
        color: Colors.black);
  }

  static TextStyle? sizeText17Weight700() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('17sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w700,
        color: Colors.black);
  }

  //TextStyle?18
  static TextStyle? sizeText18Weight300() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('18sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w300,
        color: Colors.black);
  }

  static TextStyle? sizeText18Weight400() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('18sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static TextStyle? sizeText18Weight500() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('18sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w500,
        color: Colors.black);
  }

  static TextStyle? sizeText18Weight600() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('18sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w600,
        color: Colors.black);
  }

  static TextStyle? sizeText18Weight700() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('18sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w700,
        color: Colors.black);
  }

  //TextStyle?19
  static TextStyle? sizeText19Weight300() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('19sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w300,
        color: Colors.black);
  }

  static TextStyle? sizeText19Weight400() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('19sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static TextStyle? sizeText19Weight500() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('19sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w500,
        color: Colors.black);
  }

  static TextStyle? sizeText19Weight600() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('19sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w600,
        color: Colors.black);
  }

  static TextStyle? sizeText19Weight700() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('19sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w700,
        color: Colors.black);
  }

  //TextStyle?20
  static TextStyle? sizeText20Weight300() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('20sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w300,
        color: Colors.black);
  }

  static TextStyle? sizeText20Weight400() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('20sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w400,
        color: Colors.black);
  }

  static TextStyle? sizeText20Weight500() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('20sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w500,
        color: Colors.black);
  }

  static TextStyle? sizeText20Weight600() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('20sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w600,
        color: Colors.black);
  }

  static TextStyle? sizeText20Weight700() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('20sp0'),
        fontFamily: fontName,
        fontWeight: FontWeight.w700,
        color: Colors.black);
  }

  static TextStyle titleBold14Weigh500 = TextStyle(
    fontSize: ConvertHW.removeHW('14sp0'),
    fontFamily: fontName,
    color: ColorUtils.COLOR_TEXT_BLACK87,
    fontWeight: FontWeight.w500,
  );

  static void changeTheme(ThemeData theme, ThemeType type) {
    Get.changeTheme(theme);
    Get.changeThemeMode(ThemeMode.light);
    PreferenceUtils.setInt(StringConstant.SAVETHEME, type.index);
  }

  static TextStyle? textAppBarPrimary() {
    return Theme.of(Get.context!).textTheme.displayLarge?.copyWith(
        fontSize: ConvertHW.removeHW('17sp8'),
        fontFamily: fontName,
        fontWeight: FontWeight.w600,
        color: Colors.white);
  }
}
