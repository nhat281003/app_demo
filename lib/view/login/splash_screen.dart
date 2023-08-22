import 'package:app_3tv/common/constants/image_const.dart';
import 'package:app_3tv/common/widget/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: Get.height,
            width: Get.width,
            child: Image.asset(
              ImageConst.BACKGROUND_APP,
              fit: BoxFit.cover,
            ),
          ),
          DialogWidget.loadingData(
              colorBackground: Colors.white.withOpacity(0.2))
        ],
      ),
    );
  }
}
