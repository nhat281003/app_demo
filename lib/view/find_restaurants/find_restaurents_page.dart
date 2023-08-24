import 'package:app_3tv/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'find_restaurants_controller.dart';

class FindRestaurentsPage extends GetWidget<FindRestaurentsController>{
  final controller = Get.put(FindRestaurentsController());

  @override
  Widget build(BuildContext context) {
    return 
      Obx(() => Scaffold(
        body:
        Container(
          margin: EdgeInsets.only(top: 60.h),
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child:  Column(
            children: [
              Row(
                children: [
                  const Icon(CupertinoIcons.xmark),
                  Expanded(child: Container()),

                ],
              ),
              SizedBox(height: 30.h,),
              Text('Find restaurants near you ',textAlign: TextAlign.center, style:  TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 26.sp),),
              SizedBox(height: 20.h,),
              Text('Please enter your location or allow access to \n your location to find restaurants near you.',textAlign: TextAlign.center, style:  TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 16.sp),),
              SizedBox(height: 30.h,),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: const Color(0xFF46BB1B))
                ),
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(CupertinoIcons.location_fill, color: Color(0xFF46BB1B),),
                    SizedBox(width: 8.w,),
                    Text('Use current location', textAlign: TextAlign.center, style:  TextStyle(color:const Color(0xFF46BB1B), fontWeight: FontWeight.w400, fontSize: 16.sp),)
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              InkWell(
                onTap: (){
                  controller.isVisibiliti.value =! controller.isVisibiliti.value;
                },
                child:   Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(width: 0.5, color:Colors.grey)
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  child: Row(
                    children: [
                      SizedBox(width: 16.w,),
                      const Icon(CupertinoIcons.location_solid, color: Colors.grey,),
                      SizedBox(width: 8.w,),
                      Text('Enter a new address', style:  TextStyle(color:Colors.grey, fontWeight: FontWeight.w400, fontSize: 16.sp),)
                    ],
                  ),
                ),),
           Expanded(
               child:
           Visibility(
               visible: controller.isVisibiliti.value,
               child:
               ListView.builder(
                 padding: EdgeInsets.zero,
                 itemCount: 10,
                 shrinkWrap: true,
                 itemBuilder: (context, index) {
                   return
                    InkWell(
                      onTap: (){
                        Get.toNamed(Routes.home);
                      },
                      child:  Container(
                        margin: EdgeInsets.symmetric(vertical: 8.h),
                        child:  Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(CupertinoIcons.location_fill, color: Colors.grey,size: 20,),
                            SizedBox(width: 8.w,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("St Georgese Terrace, Perth", style:  TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 16.sp),),
                                SizedBox(height: 2.h,),
                                Text("Western Australia", style:  TextStyle(color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 12.sp),),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                 },)))

            ],
          ),
        ),
      ));
  }
}