import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'dashbroad_controller.dart';

class DashBroadPage extends GetWidget<DashBroadController>{
  final controller = Get.put(DashBroadController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60.h),
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child:

        SingleChildScrollView(
          child: Column(
            children: [
              Text('Delivery to', textAlign: TextAlign.center,style: TextStyle(color: ColorUtils.COLOR_TAM_ANG, fontSize: 16.sp,fontWeight: FontWeight.w400),),
              SizedBox(height: 4.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child:  Text('HayStreet, Perth',textAlign: TextAlign.center,  style: TextStyle(color:Colors.black, fontSize: 26.sp,fontWeight: FontWeight.w300),),),
                  Text('Filter',style: TextStyle(color: Colors.black, fontSize: 16.sp,fontWeight: FontWeight.w500) )
                ],
              ),
              SizedBox(height: 8.h,),
              Container(
                color: Colors.black12,
                width: double.infinity,
                height: 1,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 180.h,
                width: double.infinity,
                child: Swiper(
                  itemCount: 5,
                  autoplay: true,
                  autoplayDelay: 5000,
                  pagination:const SwiperPagination(
                      alignment: Alignment.bottomRight,
                      margin: EdgeInsets.all(10)
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage("https://vapa.vn/wp-content/uploads/2022/12/anh-3d-thien-nhien-004.jpg"))
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 16.h,),
              Row(
                children: [
                  Text('Featured Partners', style:  TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 26.sp),),
                  const Spacer(),
                  Text('See all', style:  TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.w400, fontSize: 16.sp),),
                ],
              ),
              SizedBox(
                height: 210.h,
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: (Get.width- 26.w)/2 ,
                      margin: EdgeInsets.only(right: 10.w),
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage("https://vapa.vn/wp-content/uploads/2022/12/anh-3d-thien-nhien-004.jpg")
                                )
                            ),
                          ),
                          SizedBox(height: 8.h,),
                          Text('Krispy Creme', style: TextStyle(color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w400),),
                          SizedBox(height: 4.h,),
                          Text('St Georgece Terrace, Perth', style: TextStyle(color: Colors.black45, fontSize: 14.sp, fontWeight: FontWeight.w400),),
                          Expanded(child: Container()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: ColorUtils.COLOR_TAM_ANG
                                ),
                                child: Text('4.5', textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.sp),),
                              ),
                              Text('25 min', textAlign: TextAlign.center,style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 12.sp),),
                              Text('Free ship', textAlign: TextAlign.center,style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 12.sp),)

                            ],
                          )




                        ],
                      ),
                    );
                  },),
              ),
              SizedBox(height: 16.h,),
              Container(
                height: 180.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: const DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage("https://vapa.vn/wp-content/uploads/2022/12/anh-3d-thien-nhien-004.jpg"))
                ),
              ),
              SizedBox(height: 16.h,),
              Row(
                children: [
                  Expanded(child: Text('Bun thap cam co Trang (Cafe Choi)', style:  TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 26.sp),)),
                  Text('See all', style:  TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.w400, fontSize: 16.sp),),
                ],
              ),
              SizedBox(height: 4.h,),
              SizedBox(
                height: 210.h,
                child: ListView.builder(
                  itemCount: 10,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      width: (Get.width- 26.w)/2 ,
                      margin: EdgeInsets.only(right: 10.w),
                      child: Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage("https://vapa.vn/wp-content/uploads/2022/12/anh-3d-thien-nhien-004.jpg")
                                )
                            ),
                          ),
                          SizedBox(height: 8.h,),
                          Text('Krispy Creme', style: TextStyle(color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w400),),
                          SizedBox(height: 4.h,),
                          Text('St Georgece Terrace, Perth', style: TextStyle(color: Colors.black45, fontSize: 14.sp, fontWeight: FontWeight.w400),),
                          Expanded(child: Container()),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: ColorUtils.COLOR_TAM_ANG
                                ),
                                child: Text('4.5', textAlign: TextAlign.center,style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12.sp),),
                              ),
                              Text('25 min', textAlign: TextAlign.center,style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 12.sp),),
                              Text('Free ship', textAlign: TextAlign.center,style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 12.sp),)

                            ],
                          )
                        ],
                      ),
                    );
                  },),
              ),
              SizedBox(height: 16.h,),
              Row(
                children: [
                  Expanded(child: Text('All Restaurants', style:  TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 26.sp),)),
                  Text('See all', style:  TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.w400, fontSize: 16.sp),),
                ],
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 4,
                itemBuilder: (context, index) {
                return
                 Container(
                   margin: EdgeInsets.symmetric(vertical: 8.h),
                   child:  Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Container(
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(12),
                         ),
                         height: 180.h,
                         width: double.infinity,
                         child: Swiper(
                           itemCount: 5,
                           autoplay: true,
                           autoplayDelay: 5000,
                           pagination:const SwiperPagination(
                               alignment: Alignment.bottomRight,
                               margin: EdgeInsets.all(10)
                           ),
                           itemBuilder: (context, index) {
                             return Container(
                               width: double.infinity,
                               decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(12),
                                   image: const DecorationImage(
                                       fit: BoxFit.fill,
                                       image: NetworkImage("https://vapa.vn/wp-content/uploads/2022/12/anh-3d-thien-nhien-004.jpg"))
                               ),
                             );
                           },
                         ),
                       ),
                       SizedBox(height: 12.h,),
                       Text('Cafe Choi', style: TextStyle(color: Colors.black, fontSize: 20.sp, fontWeight: FontWeight.w400),),
                       SizedBox(height: 4.h,),
                       Row(
                         children: [
                           Text('\$\$', textAlign: TextAlign.center,style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 12.sp),),
                           SizedBox(width: 12.w,),
                           Text('VietNamese', textAlign: TextAlign.center,style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 12.sp),),
                           SizedBox(width: 12.w,),
                           Text('Cafe Trang', textAlign: TextAlign.center,style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 12.sp),),
                           SizedBox(width: 12.w,),
                           Text('Cafe Choi', textAlign: TextAlign.center,style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 12.sp),)
                         ],
                       ),
                       SizedBox(height: 8.h,),
                       Row(
                         children: [
                           Text('4.5', textAlign: TextAlign.center,style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 12.sp,),),
                           SizedBox(width: 12.w,),
                           Row(
                             children: [
                               const Icon(Icons.star, color: ColorUtils.COLOR_TAM_ANG,),
                               SizedBox(width: 2.w,),
                               Text('200+ Ratings', textAlign: TextAlign.center,style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 12.sp),)
                             ],
                           ),
                           SizedBox(width: 12.w,),
                           Row(
                             children: [
                               const Icon(Icons.access_time_filled_outlined, color: Colors.grey,),
                               SizedBox(width: 2.w,),
                               Text('25 mins', textAlign: TextAlign.center,style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 12.sp),)
                             ],
                           ),
                           SizedBox(width: 12.w,),
                           Row(
                             children: [
                               const Icon(Icons.monetization_on, color: Colors.grey,),
                               SizedBox(width: 2.w,),
                               Text('Free', textAlign: TextAlign.center,style: TextStyle(color: Colors.black38, fontWeight: FontWeight.w400, fontSize: 12.sp),)
                             ],
                           ),
                         ],
                       )
                     ],
                   ),
                 );
              },),
              SizedBox(height: 30.h,)
            ],
          ),
        ),
      ),
    );
  }
}
