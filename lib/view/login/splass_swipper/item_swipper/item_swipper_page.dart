import 'package:app_3tv/common/utils/convert_h_w.dart';
import 'package:app_3tv/view/login/splass_swipper/splass_swipper_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'item_swipper_controller.dart';

class ItemSwipperPage extends GetWidget<ItemSwipperController>{
  final controller = Get.put(ItemSwipperController());

  @override
  Widget build(BuildContext context) {
    return 
     Obx(() =>  Column(
       children: [
         SizedBox(height: 50.h,),
         Row(
           children: [
             Image.asset('assets/images/g12.png', width: 80, height: 80,),
             SizedBox(width: 8.w,),
             Text("Tamang \n FoodService", textAlign:TextAlign.center,style: TextStyle(fontWeight: FontWeight.w700, fontSize: ConvertHW.removeHW("40sp2"), color: Colors.black), )
           ],
         ),
         SizedBox(height: 30.h,),
         Get.find<SplassSwiperController>().indexSwiper.value == 0?
         Image.asset('assets/images/splash2.png', width: Get.width -100.w,):
         Get.find<SplassSwiperController>().indexSwiper.value == 1?
         Image.asset('assets/images/splash3.png', width: Get.width -100.w,):
         Image.asset('assets/images/splash4.png', width: Get.width -100.w,),
         SizedBox(height: 30.h,),
         Text(
           Get.find<SplassSwiperController>().indexSwiper.value == 0?
           "All your favorites":
           Get.find<SplassSwiperController>().indexSwiper.value == 1?
           "Free delivery offers":
           "Choose your food"
           , style: TextStyle(color: Colors.black, fontSize: ConvertHW.removeHW("30sp2"), fontWeight: FontWeight.w700),),
         SizedBox(height: 20.h,),
         Center(
           child:Text(

             Get.find<SplassSwiperController>().indexSwiper.value == 0?
             'Order from the best local restaurants with easy, on-demand delivery.':
             Get.find<SplassSwiperController>().indexSwiper.value == 1?
             'Free delivery for new customers via Apple Pay and others payment methods.':
             'Easily find your type of food craving and you’ll get delivery in wide range.'


             ,textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20.sp),),

         ),
       ],
     ));
  }
}