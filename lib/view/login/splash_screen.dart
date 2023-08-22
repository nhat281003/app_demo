import 'package:app_3tv/common/constants/image_const.dart';
import 'package:app_3tv/common/utils/convert_h_w.dart';
import 'package:app_3tv/common/widget/dialog_widget.dart';
import 'package:app_3tv/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    Container(
      margin: EdgeInsets.symmetric(horizontal: 8.w),
      child:
      SingleChildScrollView(
        child:
        Column(
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
            Image.asset('assets/images/Illustration.png', width: Get.width -100.w,),
            SizedBox(height: 30.h,),
            Text("Welcome", style: TextStyle(color: Colors.black, fontSize: ConvertHW.removeHW("30sp2"), fontWeight: FontWeight.w700),),
            SizedBox(height: 20.h,),
            Center(
              child:Text('It’s a pleasure to meet you. We are excited that you’re here so let’s get started!',textAlign: TextAlign.center, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400, fontSize: 20.sp),),

            ),
            SizedBox(height: 40.h,),
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
                  Get.toNamed(Routes.splash2);
                }, child: Text('GET STARTED', style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.w500),),),
            )
          ],
        ),
      ),
    );
  }
}
