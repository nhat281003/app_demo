import 'package:app_3tv/view/login/splass_swipper/item_swipper/item_swipper_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SplassSwiperController extends GetxController{
  RxInt indexSwiper = 0.obs;

  var listStatistical = <Widget>[
    ItemSwipperPage(),
    ItemSwipperPage(),
    ItemSwipperPage(),
  ];

}