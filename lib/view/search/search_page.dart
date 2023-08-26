
import 'package:app_3tv/view/search/item.dart';
import 'package:app_3tv/view/search/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchPage extends GetView<SearchControllers>{
  final controller = Get.put(SearchControllers());

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body:
      Column(
        children: [
          SizedBox(height: Get.height /16),
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16.h),
            child: Row(
              children: [
                const Icon(Icons.arrow_back_rounded, color: Colors.grey,),
                Expanded(child: Text("nguyen minh nhat",textAlign: TextAlign.center , style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.sp),)),
                const Icon(Icons.wifi_calling_3, color: Colors.red,),
              ],
            ),
          ),
      Expanded(child:
      SingleChildScrollView(
        child:
        Container(
          color: Colors.white70,
          padding: EdgeInsets.symmetric(horizontal: 16.h),
          child: 
         Obx(() =>  ListView.builder(
           controller: controller.scrollController,
           padding: EdgeInsets.zero,
           physics: const NeverScrollableScrollPhysics(),
           shrinkWrap: true,
           itemCount: controller.listMess.length,
           itemBuilder: (context, index) {
             return Column(
               crossAxisAlignment:controller.listMess[index].type == "admin"? CrossAxisAlignment.start: CrossAxisAlignment.end,
               children: [
                 IntrinsicWidth(child:  Container(
                   decoration: BoxDecoration(
                     color:controller.listMess[index].type == "admin"?Colors.grey.shade400:  Colors.deepPurple.shade800,
                     borderRadius:  const BorderRadius.only(
                         topLeft: Radius.circular(40),

                         topRight: Radius.circular(40),

                         bottomLeft: Radius.circular(40),

                         bottomRight: Radius.circular(40)
                     )
                   ),
                   padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.h),
                   child:  Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       controller.listMess[index].type == "client" ?Container(): Container(
                         width: 40.h,
                         height: 40.h,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(40),
                           image:  DecorationImage(
                               fit: BoxFit.fill,
                               image: NetworkImage(
                                   controller.listMess[index].type == "client" ? "https://noithatbinhminh.com.vn/wp-content/uploads/2022/08/anh-dep-40.jpg":
                                   "https://vapa.vn/wp-content/uploads/2022/12/anh-3d-thien-nhien.jpeg")
                           ),
                         ),
                       ),
                       SizedBox(width: 12.w,),
                       Expanded(child:Text(controller.listMess[index].mess!, textAlign: controller.listMess[index].type == "admin"?
                       TextAlign.start:TextAlign.end ,style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold),),
                       ),
                       SizedBox(width: 12.w,),
                      controller.listMess[index].type == "admin"?
                      Container(): Container(
                         width: 40.h,
                         height: 40.h,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(40),
                           image: const DecorationImage(
                               fit: BoxFit.fill,
                               image: NetworkImage("https://vapa.vn/wp-content/uploads/2022/12/anh-3d-thien-nhien.jpeg")
                           ),
                         ),
                       )
                     ],
                   ),
                 ),),
                 SizedBox(height: 4.h,),
               controller.listMess[controller.listMess.length -1].type ==  controller.listMess[controller.listMess.length -2].type?
              const Text(""):
              Text(controller.formatDate.format(DateTime.now()), style: TextStyle(color: Colors.grey , fontSize: 10.sp),),

                 controller.listMess[controller.listMess.length -1].type ==  controller.listMess[controller.listMess.length -2].type?
                 const SizedBox(): SizedBox(height: 10.h,)
               ],
             )
             ;
           },)),
        ),
      )),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.grey.shade300
            ),
            padding: EdgeInsets.symmetric(horizontal: 16.w,),
            child: Row(
              children: [
                Expanded(child:
                TextField(
                  controller: controller.textEditingController,
                  decoration: const InputDecoration(
                    hintText: "Thằng nào có tiền , Nạp tiền vào Donate cho tao",
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.italic
                    ),
                    border: InputBorder.none
                  ),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500
                  ),)),
                InkWell(
                  onTap: (){
                    controller.listMess.add(Item(type: "client", mess: controller.textEditingController.value.text.toString()));
                    controller.textEditingController.text = "";
                    controller.listMess.refresh();
                    controller.scrollController.jumpTo(controller.scrollController.position.maxScrollExtent+ 60.h);
                    controller.update();
                  },
                  child: Container(
                  height: 30.h,
                  width: 30.h,
                  decoration: BoxDecoration(
                      color: Colors.red.shade400,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  child:  const Center(
                    child: Icon(Icons.send, color: Colors.white,size: 20,),
                  ),
                ),)

              ],
            ),
          ),

          SizedBox(height: Get.height /16+10.h),
        ],
      ),
      );
  }
  
}