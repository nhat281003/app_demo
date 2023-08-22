
import 'package:app_3tv/common/constants/image_const.dart';
import 'package:app_3tv/common/constants/size_utils.dart';
import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/convert_h_w.dart';
import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:app_3tv/common/widget/button_action.dart';
import 'package:app_3tv/common/widget/input_field_custom.dart';
import 'package:app_3tv/routes/app_routes.dart';
import 'package:app_3tv/view/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final double radiusLogin = 14;
  final double radiusButton = 8;
  final SizedBox heightSizedBox = SizedBox(
    height: ConvertHW.removeHW('15h10'),
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (loginController) {
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        ImageConst.BACKGROUND_LOGIN_COLOR,
                      ),
                      fit: BoxFit.fill)),
              child: Column(
                children: [
                  Container(
                      padding:
                          EdgeInsets.only(top: ConvertHW.removeHW('75h10')),
                      height: Get.height * 0.25,
                      child: Image.asset(
                        ImageConst.IMAGE_LOGO,
                        width: ConvertHW.removeHW('190w40'),
                        fit: BoxFit.fitWidth,
                      )),
                  Container(
                    height: Get.height * 0.75,
                    padding:  EdgeInsets.symmetric(
                        horizontal: SizeUtils.PADDING_PRIMARY, vertical: 25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(radiusLogin),
                        topRight: Radius.circular(radiusLogin),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Đăng nhập',
                              style: TextStyleUtils.sizeText20Weight700()?.copyWith(
                                  fontSize: ConvertHW.removeHW('25sp10')),
                            ),
                            heightSizedBox,
                            InputFieldCustom1(
                              loginController.emailController,
                              false,
                              'Email',
                              '',
                              colorFocus:
                                  ColorUtils.COLOR_SUB_BLUE.withOpacity(0.5),
                              backgroundColor:
                                  ColorUtils.COLOR_BG_TEXT_FIELD,
                              prefixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(width: ConvertHW.removeHW('12w3')),
                                  Image.asset(
                                    ImageConst.ICON_EMAIL_LOGIN,
                                    width: ConvertHW.removeHW('18w5'),
                                    height: ConvertHW.removeHW('18w5'),
                                    fit: BoxFit.contain,
                                  ),
                                  SizedBox(width: 7.w),
                                  Container(
                                    margin: EdgeInsets.only(right: 8.w),
                                    width: 1,
                                    height: ConvertHW.removeHW('18sp'),
                                    color: ColorUtils.COLOR_SUB_GREEN,
                                  )
                                ],
                              ),
                              onTap: () {

                              },
                              suffixIcon: Visibility(
                                visible:
                                    loginController.emailController.text.isNotEmpty,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.clear,
                                    color: ColorUtils.COLOR_SUB_PRIMARY,
                                    size: ConvertHW.removeHW('20sp5'),
                                  ),
                                  onPressed: () {
                                    loginController.emailController.clear();
                                    loginController.update();
                                  },
                                ),
                              ),
                              onChange: (value) {
                                loginController.update();
                              },
                              colorBorder: Colors.white.withOpacity(0),
                              shadow: false,
                              isEnabledEdit: true,
                              textInputType: TextInputType.text,
                              autoFocus: false,
                            ),
                            heightSizedBox,
                            InputFieldCustom1(
                                loginController.passwordController,
                                !loginController.isShowPassWord,
                                'Mật khẩu',
                                '',
                                backgroundColor:
                                    ColorUtils.COLOR_BG_TEXT_FIELD,
                                colorFocus:
                                    ColorUtils.COLOR_SUB_BLUE.withOpacity(0.5),
                                prefixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    SizedBox(width: ConvertHW.removeHW('12w3')),
                                    Image.asset(
                                      ImageConst.ICON_MK_LOGIN,
                                      width: ConvertHW.removeHW('18w5'),
                                      height: ConvertHW.removeHW('18w5'),
                                      fit: BoxFit.contain,
                                    ),
                                    SizedBox(width: 7.w),
                                    Container(
                                      margin: EdgeInsets.only(right: 8.w),
                                      width: 1,
                                      height: ConvertHW.removeHW('18sp'),
                                      color: ColorUtils.COLOR_SUB_GREEN,
                                    )
                                  ],
                                ),
                                onSubmitted: () {

                                },
                                onTap: () {

                                },
                                suffixIcon: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      icon: Icon(
                                        loginController.isShowPassWord
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: ColorUtils.COLOR_SUB_PRIMARY,
                                      ),
                                      onPressed: () {
                                        loginController.isShowPassWord =
                                            !loginController.isShowPassWord;
                                        loginController.update();
                                      },
                                    ),
                                    Visibility(
                                      visible: loginController
                                          .passwordController.text.isNotEmpty,
                                      child: IconButton(
                                        icon: Icon(
                                          Icons.clear,
                                          color: ColorUtils.COLOR_SUB_PRIMARY,
                                          size: ConvertHW.removeHW('20sp5'),
                                        ),
                                        onPressed: () {
                                          loginController.passwordController
                                              .clear();
                                          loginController.update();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                                onChange: (value) {
                                  loginController.update();
                                },
                                colorBorder: Colors.white.withOpacity(0),
                                shadow: false,
                                isEnabledEdit: true,
                                textInputType: TextInputType.text,
                                autoFocus: false),
                            heightSizedBox,
                            GestureDetector(
                                onTap: () => Get.toNamed(Routes.forgotPassword),
                                child: Text('Quên mật khẩu?',
                                    style: TextStyleUtils.sizeText14Weight400()
                                        ?.copyWith(
                                        color: ColorUtils.COLOR_SUB_GREEN,fontSize: ConvertHW.removeHW('14sp4')))),
                            const SizedBox(
                              height: 10,
                            ),
                            ButtonAction(
                              name: 'Đăng nhập',
                              //colorBackground: ColorUtils.COLOR_SUB_PRIMARY,
                              function: () async {
                                FocusManager.instance.primaryFocus?.unfocus();
                              },
                              width: Get.width,
                              radius: radiusButton,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Nếu chưa có tài khoản? Đăng ký ',
                                    style: TextStyleUtils.sizeText14Weight400()?.copyWith(fontSize: ConvertHW.removeHW('14sp4'))),
                                GestureDetector(
                                  onTap: () => Get.toNamed(Routes.register),
                                  child: Text(
                                    'tại đây',
                                    style: TextStyleUtils.sizeText14Weight600()
                                        ?.copyWith(
                                        color: ColorUtils.COLOR_LINK_TEXT,
                                        decoration: TextDecoration.underline,fontSize: ConvertHW.removeHW('14sp4')),
                                  ),
                                )
                              ],
                            ),
                            const SizedBox(height: 35,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(ImageConst.IMAGE_LOGO_1, width: ConvertHW.removeHW('83w40'), height: ConvertHW.removeHW('83w40'),),
                                 SizedBox(width: ConvertHW.removeHW('30w20')),
                                Image.asset(ImageConst.IMAGE_LOGO_2, width: ConvertHW.removeHW('83w40'), height: ConvertHW.removeHW('83w40'),),
                              ],
                            ),
                          ],
                        ),
                        Text('Phiên bản 1.1',
                          style: TextStyleUtils.sizeText13Weight500()?.copyWith(fontSize: ConvertHW.removeHW('13sp4'))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
