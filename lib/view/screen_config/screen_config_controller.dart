import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScreenConfigController extends GetxController {
  bool isIpadLandScape = true;
  Size size = const Size(360, 690);
  bool isIphone = false;

  void setIsIphone(bool value) {
    isIphone = value;
    update();
  }


  void setSize(Size value) {
    size = value;
    update();
  }

  void setIsIpadLandScape(bool value) {
    isIpadLandScape = value;
    update();
  }
}
