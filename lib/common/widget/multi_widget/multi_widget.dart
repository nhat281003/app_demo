
import 'package:app_3tv/common/constants/size_utils.dart';
import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/convert_h_w.dart';
import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:app_3tv/common/widget/dialog_widget.dart';
import 'package:app_3tv/common/widget/input_field_custom.dart';
import 'package:app_3tv/data/model/textfield/title_textfield_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MultiWidget {
  static Widget iconBack(
      {double marginTop = 0,
      Function? function,
      Color color = Colors.white,
      double paddingLeft = 0}) {
    return Container(
      margin: EdgeInsets.only(top: marginTop, left: paddingLeft),
      child: InkWell(
        onTap: () {
          if (function != null) {
            function();
          } else {
            Get.back();
          }
        },
        child: Container(
          padding: const EdgeInsets.only(right: 10, top: 10),
          child: Icon(Icons.arrow_back_ios,
              color: color,
              size: ConvertHW.removeHW(SizeUtils.PADDING_LEFT_BUTTON_BACK)),
        ),
      ),
    );
  }

  static Widget divideWidget() {
    return Container(
      height: 0.4,
      width: Get.width,
      color: Colors.grey,
    );
  }

  static Widget titleInputWidget(
      dynamic controller, TitleTextFieldModel titleModel) {
    double heightContainer = ConvertHW.removeHW('38h10');
    return Padding(
      padding: EdgeInsets.only(top: ConvertHW.removeHW('15h5')),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (titleModel.title != null)
            RichText(
                text: TextSpan(
                    text: titleModel.title,
                    style: TextStyleUtils.sizeText14Weight500()?.copyWith(fontSize: ConvertHW.removeHW('14sp3')),
                    children: [
                  if (titleModel.isRequired ?? false)
                    TextSpan(
                      text: '(*)',
                      style: TextStyleUtils.sizeText14Weight500()
                          ?.copyWith(color: Colors.red,fontSize: ConvertHW.removeHW('14sp3')),
                    )
                ])),
          if (titleModel.title != null)
            const SizedBox(
              height: 7,
            ),
          if (titleModel.widget != null)
            Container(
              height: heightContainer,
              margin: const EdgeInsets.only(bottom: 8, top: 5),
              decoration: BoxDecoration(
                  color: ColorUtils.COLOR_SUB_BLUE.withOpacity(0.06),
                  borderRadius: BorderRadius.all(Radius.circular(7.r))),
              child: Row(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: ConvertHW.removeHW('12w2')),
                      Image.asset(
                        titleModel.iconAsset!,
                        width: ConvertHW.removeHW('17w5'),
                        height: ConvertHW.removeHW('17w5'),
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: ConvertHW.removeHW('7w2')),
                      Container(
                        margin:
                            EdgeInsets.only(right: ConvertHW.removeHW('8w3')),
                        width: 1,
                        height: ConvertHW.removeHW('18sp'),
                        color: ColorUtils.COLOR_PRIMARY,
                      )
                    ],
                  ),
                  titleModel.widget!
                ],
              ),
            )
          else if (titleModel.isPassword ?? false)
            SizedBox(
              height: heightContainer,
              child: InputFieldCustom1(titleModel.editingController,
                  !titleModel.isShowPassword, titleModel.hintText, '',
                  backgroundColor: ColorUtils.COLOR_SUB_BLUE.withOpacity(0.06),
                  colorFocus: ColorUtils.COLOR_SUB_BLUE.withOpacity(0.5),
                  maxLine: 1,
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: ConvertHW.removeHW('12w3')),
                      Image.asset(
                        titleModel.iconAsset!,
                        width: ConvertHW.removeHW('18w5'),
                        height: ConvertHW.removeHW('18w5'),
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: ConvertHW.removeHW('7w2')),
                      Container(
                        margin:
                            EdgeInsets.only(right: ConvertHW.removeHW('8w2')),
                        width: 1,
                        height: ConvertHW.removeHW('18sp'),
                        color: ColorUtils.COLOR_SUB_GREEN,
                      )
                    ],
                  ),
                  onSubmitted: () {},
                  onTap: () {},
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          titleModel.isShowPassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: ColorUtils.COLOR_TEXT_14,
                        ),
                        onPressed: () {
                          titleModel.isShowPassword =
                              !titleModel.isShowPassword;
                          controller.update();
                        },
                      ),
                      Visibility(
                        visible: titleModel.editingController.text.isNotEmpty,
                        child: IconButton(
                          icon: Icon(
                            Icons.clear,
                            color: Colors.red,
                            size: ConvertHW.removeHW('20sp5'),
                          ),
                          onPressed: () {
                            titleModel.editingController.clear();
                            controller.update();
                          },
                        ),
                      ),
                    ],
                  ), onChange: (value) {
                controller.update();
              },
                  colorBorder: Colors.white.withOpacity(0),
                  shadow: false,
                  isEnabledEdit: true,
                  textInputType: TextInputType.text,
                  autoFocus: false),
            )
          else
            SizedBox(
              height: (titleModel.maxLine ?? 1) * heightContainer,
              child: InputFieldCustom1(
                  titleModel.editingController, false, titleModel.hintText, '',
                  colorFocus: ColorUtils.COLOR_SUB_BLUE.withOpacity(0.5),
                  backgroundColor: ColorUtils.COLOR_SUB_BLUE.withOpacity(0.06),
                  prefixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(width: ConvertHW.removeHW('12w3')),
                      Image.asset(
                        titleModel.iconAsset!,
                        width: ConvertHW.removeHW('18w5'),
                        height: ConvertHW.removeHW('18w5'),
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: ConvertHW.removeHW('7w2')),
                      Container(
                        margin:
                            EdgeInsets.only(right: ConvertHW.removeHW('7w2')),
                        width: 1,
                        height: ConvertHW.removeHW('18sp') *
                            (titleModel.maxLine ?? 1),
                        color: ColorUtils.COLOR_SUB_GREEN,
                      )
                    ],
                  ),
                  onTap: () {},
                  suffixIcon: Visibility(
                    visible: titleModel.editingController.text.isNotEmpty,
                    child: IconButton(
                      icon: Icon(
                        Icons.clear,
                        color: ColorUtils.COLOR_SUB_GREEN,
                        size: ConvertHW.removeHW('20sp5'),
                      ),
                      onPressed: () {
                        titleModel.editingController.clear();
                        controller.update();
                      },
                    ),
                  ), onChange: (value) {
                controller.update();
              },
                  colorBorder: Colors.white.withOpacity(0),
                  shadow: false,
                  isEnabledEdit: true,
                  textInputType: TextInputType.text,
                  autoFocus: false,
                  maxLine: titleModel.maxLine,
                maxLength: titleModel.maxLength
              ),
            ),
        ],
      ),
    );
  }

  static void requiredText() {
    DialogWidget.showToast('Vui lòng nhập đầy đủ thông tin có dấu \'*\'',
        colorText: Colors.white, colorBackground: Colors.red);
  }

  static void requiredNumber({String? textError}) {
    DialogWidget.showToast( textError ?? 'Vui lòng nhập đúng định dạng số từ 0-9 gồm 10 số',
        colorText: Colors.white, colorBackground: Colors.red);
  }

  static void requiredEmail({String? textError}) {
    DialogWidget.showToast(
        textError ?? 'Vui lòng nhập email đúng định dạng',
        colorText: Colors.white,
        colorBackground: Colors.red);
  }

  static void sendEmailSuccess({String? textError}) {
    DialogWidget.showToast( textError ?? 'Mã xác nhận đã được gửi đến email của bạn',
        colorText: Colors.white, colorBackground: Colors.green);
  }
}
