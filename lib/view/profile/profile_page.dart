import 'package:app_3tv/view/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController>{
  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withRed(0),
        title: const Text('Back', style:  TextStyle(color: Colors.white),),
      ),
      body:
      Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Popular list", style:  TextStyle(color: Colors.black,fontWeight: FontWeight.w600, fontSize: 18.sp),),
            SizedBox(height: 10.h,),
            Expanded(child: GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                crossAxisCount: 2,
                mainAxisExtent: 220.h
                  ),
              itemCount: controller.list.results?.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(8.w),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius:4,
                          offset: const Offset(3, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8),
                    image:  DecorationImage(
                      image: NetworkImage(controller.list.results![index].posterPath!,
                      ),
                      fit: BoxFit.cover,
                    )
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                          bottom: 0,
                          left: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(controller.list.results![index].releaseDate!.substring(0,4), style:  TextStyle(color: Colors.white, fontSize: 12.sp, fontWeight: FontWeight.w400),),
                              RichText(text: TextSpan(
                                  text: controller.list.results![index].title?.toUpperCase(),
                                  style: TextStyle(color: Colors.white, fontSize: 15.sp, fontWeight: FontWeight.w500)
                              )),
                            ],)),

                      Positioned(
                          top: 0,
                          right: 0,
                          child:Container(
                            alignment: Alignment.center,
                            height: 36,
                            width: 36,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(36),
                              gradient: const LinearGradient(
                                colors:[
                                  Colors.yellow,
                                  Colors.orange,
                                  Colors.red,
                                ]
                              )
                            ),
                            child:
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(controller.list.results![index].voteAverage.toString().substring(0,1),style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.sp) ),
                                Text(controller.list.results![index].voteAverage.toString().substring(2,3),style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10.sp) ),
                              ],
                            )

                          ))


                    ],
                  ),
                );
              },))
          ],
        ),

      ),
    );
  }
}