import 'package:app_3tv/routes/app_routes.dart';
import 'package:app_3tv/view/login/splass_swipper/splass_swipper_controller.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplassSwipperPage extends GetView<SplassSwiperController> {
  final controller = Get.put(SplassSwiperController());

  @override
  Widget build(BuildContext context) {
    return
      GetBuilder<SplassSwiperController>(builder: (controller) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 8.w),
          child:
          Column(
            children: [
              Expanded(child:  Swiper(
                duration: 800,
                autoplay: true,
                onIndexChanged: (value) {
                  controller.indexSwiper.value = value;
                },
                itemCount:controller.listStatistical.length,
                itemBuilder: (context, index) {
                  return controller.listStatistical[index];
                },

              )),
              SizedBox(height: 20.h,),
              SizedBox(
                height: 6.h,
                child:  ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return
                     Obx(() =>  Container(
                       margin: EdgeInsets.symmetric(horizontal: 4.w),
                       decoration: BoxDecoration(
                           color:controller.indexSwiper.value == index?  const Color.fromRGBO(70, 187, 27,1): Colors.grey ,
                           borderRadius: BorderRadius.circular(8)
                       ),
                       height: 2.h,
                       width: 10.w,
                     ));
                  },),
              ),
              SizedBox(height: 20.h,),
              Container(
                height: 54.h,
                padding: EdgeInsets.all(8.h),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:const Color.fromRGBO(70, 187, 27,1) ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )
                  ),
                  onPressed: (){
                    Get.toNamed(Routes.findRestaurents);
                  }, child: Text('GET STARTED', style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w500),),),
              )
            ],
          ),
        );
      },);
  }
}
