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
            padding: EdgeInsets.all(16.w),
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
          padding: EdgeInsets.symmetric(horizontal: 4.w),
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
                 Row(
                   mainAxisAlignment:controller.listMess[index].type == "admin"? MainAxisAlignment.start: MainAxisAlignment.end,
                   children: [
                   controller.listMess[index].type == "client" ?Container():
                   controller.listVisiable[index] == false ? SizedBox(width: 22.w,):
                   Visibility(
                      visible: controller.listVisiable[index],
                      child:  Container(
                    width: 20.h,
                    height: 20.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image:  DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(
                              controller.listMess[index].type == "client" ? "https://noithatbinhminh.com.vn/wp-content/uploads/2022/08/anh-dep-40.jpg":
                              "https://vapa.vn/wp-content/uploads/2022/12/anh-3d-thien-nhien.jpeg")
                      ),
                    ),
                  )),
                     SizedBox(width: 6.w,),
                     IntrinsicWidth(
                       child:  Container(
                         decoration: BoxDecoration(
                             color: controller.listMess[index].type == "client" ? Colors.blue : Colors.pinkAccent,
                             borderRadius:
                             BorderRadius.only(
                                 topLeft: Radius.circular(controller.listMess[index].type == "admin"? controller.checkMessClientTop(controller.listMess[index].position):40.r),
                                 topRight: Radius.circular(controller.listMess[index].type == "client"?controller.checkMessClientTop(controller.listMess[index].position): 40.r),
                                 bottomLeft: Radius.circular(controller.listMess[index].type == "admin"? controller.checkMessClientBottom(controller.listMess[index].position):40.r),
                                 bottomRight: Radius.circular(controller.listMess[index].type == "client"?controller.checkMessClientBottom(controller.listMess[index].position): 40.r
                                 ))
                         )
                         ,
                         padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 12.h),
                         child:  Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                           children: [
                             Expanded(child:Text(controller.listMess[index].mess, textAlign: controller.listMess[index].type == "admin"?
                             TextAlign.start:TextAlign.end ,style: TextStyle(color: Colors.white, fontSize: 14.sp, fontWeight: FontWeight.bold),),
                             ),
                           ],
                         ),
                       ),),
                     SizedBox(width: 6.w,),
                     controller.listMess[index].type == "admin"?
                     Container():
                     controller.listVisiable[index] == false ? SizedBox(width: 22.w,):
                    Visibility(
                        visible: controller.listVisiable[index],
                        child:  Container(
                      width: 20.h,
                      height: 20.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        image: const DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage("https://vapa.vn/wp-content/uploads/2022/12/anh-3d-thien-nhien.jpeg")
                        ),
                      ),
                    ))
                   ],
                 ),

                 SizedBox(height: 4.h,),
                 Visibility(
                   visible: controller.listVisiable[index],
                   child:
                   Row(
                     mainAxisAlignment:controller.listMess[index].type == "admin"? MainAxisAlignment.start: MainAxisAlignment.end,
                     children: [
                       SizedBox(width: 27.w,),
                            Text(controller.formatDate.format(DateTime.now()), style: TextStyle(color: Colors.grey , fontSize: 10.sp),),

                       SizedBox(width: 27.w,),
                     ],
                   )),
                 SizedBox(height: 4.h,)
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
                InkWell(
                  onTap: (){
                    controller.listAddMess.value =[];
                    controller.count.value = 0;
                    controller.countAd.value = controller.countAd.value +1 ;
                    controller.listAddMessAd.add(Item(type: "admin", mess: controller.textEditingController.value.text.toString(), position: Session.oneItem));
                    for(int i= 0 ; i< controller.listAddMessAd.length ; i++){
                      if(controller.listAddMessAd.length ==1 ){
                        controller.listMess.add(Item(type: "admin", mess: controller.textEditingController.value.text.toString(), position:Session.oneItem ));
                        controller.listVisiable.add(true);
                      }else
                      if(controller.listAddMessAd.length > 1) {
                        if(i == controller.listAddMessAd.length -1){
                          controller.listMess.add(Item(type: "admin", mess: controller.textEditingController.value.text.toString(), position:Session.emd ));
                          controller.listVisiable.add(true);
                        }else if(i != controller.listAddMessAd.length -1 && i == 0){
                          controller.listMess[ controller.listMess.length - controller.countAd.value+1].position = Session.start;
                          controller.listVisiable[ controller.listMess.length - controller.countAd.value+1] = false;

                        }else{
                          for(int i = 0; i < controller.listAddMessAd.length - 2; i++ ){
                            controller.listMess[ controller.listMess.length - controller.countAd.value+2+i].position = Session.center;
                            controller.listVisiable[ controller.listMess.length - controller.countAd.value+2+i] = false;
                          }
                        }
                      }
                    }
                    // controller.listVisiable.add(true);
                    controller.textEditingController.text = "";
                    controller.listAddMessAd.refresh();
                    controller.listMess.refresh();
                    controller.scrollController.jumpTo(controller.scrollController.position.maxScrollExtent+ 60.h);
                    controller.update();
                  },
                  child: Container(
                    height: 30.h,
                    width: 30.h,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade400,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child:  const Center(
                      child: Icon(Icons.send, color: Colors.white,size: 20,),
                    ),
                  ),),
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
                    controller.listAddMessAd.value =[];
                    controller.countAd.value = 0;
                    controller.count.value = controller.count.value +1 ;
                    controller.listAddMess.add(Item(type: "client", mess: controller.textEditingController.value.text.toString(), position: Session.oneItem));
                    for(int i= 0 ; i< controller.listAddMess.length ; i++){
                      if(controller.listAddMess.length ==1 ){
                       controller.listMess.add(Item(type: "client", mess: controller.textEditingController.value.text.toString(), position:Session.oneItem ));
                       controller.listVisiable.add(true);
                      }else
                        if(controller.listAddMess.length > 1) {
                        if(i == controller.listAddMess.length -1){
                          controller.listMess.add(Item(type: "client", mess: controller.textEditingController.value.text.toString(), position:Session.emd ));
                          controller.listVisiable.add(true);
                        }else if(i != controller.listAddMess.length -1 && i == 0){
                          controller.listMess[ controller.listMess.length - controller.count.value+1].position = Session.start;
                          controller.listVisiable[ controller.listMess.length - controller.count.value+1] = false;

                        }else{
                         for(int i = 0; i < controller.listAddMess.length - 2; i++ ){
                           controller.listMess[ controller.listMess.length - controller.count.value+2+i].position = Session.center;
                           controller.listVisiable[ controller.listMess.length - controller.count.value+2+i] = false;
                         }
                        }
                      }
                    }
                    // controller.listVisiable.add(true);
                    controller.textEditingController.text = "";
                    controller.listAddMess.refresh();
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