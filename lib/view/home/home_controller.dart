import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  PageController pageController = PageController();
  int selected = 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void jumpToPage(int value) {
    pageController.jumpToPage(value);
    setSelected(value);
    update();
  }

  void setSelected(int value) {
    selected = value;
    update();
  }
}
