
import 'package:app_3tv/common/constants/image_const.dart';
import 'package:app_3tv/common/constants/size_utils.dart';
import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/convert_h_w.dart';
import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class AppBarUtils {
  static AppBar appBar(
      BuildContext context, Widget title, List<Widget>? actions,
      {Color? textColor, Color? bg, Function? backFunction}) {
    Color txtColor = textColor ?? Colors.white;
    return AppBar(
      backgroundColor: ColorUtils.COLOR_PRIMARY,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  ImageConst.BACKGROUND_APP_BAR,
                ),
                fit: BoxFit.cover)
            ),
      ),
      toolbarHeight: 60.h,
      title: title,
      centerTitle: true,
      elevation: 0,
      leading: IconButton(
          onPressed: () {
            backFunction != null ? backFunction() : Get.back();
          },
          icon: Container(
            padding: const EdgeInsets.all(10),
            child: Icon(
              Icons.arrow_back_ios,
              size: ConvertHW.removeHW(SizeUtils.PADDING_LEFT_BUTTON_BACK),
              color: txtColor,
            ),
          )),
      actions: ((actions != null) && actions.isNotEmpty)
          ? actions
          : [
              Container(
                padding: const EdgeInsets.all(10),
                child: Icon(
                  Icons.arrow_back_ios,
                  size: ConvertHW.removeHW(SizeUtils.PADDING_LEFT_BUTTON_BACK),
                  color: Colors.white.withOpacity(0),
                ),
              )
            ],
    );
  }

  static Widget titleAppBar(String title, {int? type, Color? textColor}) {
    String name = (type == 1) ? title : title;
    return Text(name,
        textAlign: TextAlign.center,
        maxLines: 2,
        style: TextStyleUtils.textAppBarPrimary());
  }

  static Widget iconAction(IconData iconData, Function function,
      {Color? color}) {
    Color colorIcon = color ?? Colors.white;
    return IconButton(
        icon: Icon(
          iconData,
          color: colorIcon,
          size: SizeUtils.sizeIconFilter,
        ),
        onPressed: () {
          function();
        });
  }
}
