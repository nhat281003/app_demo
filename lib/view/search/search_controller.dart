import 'package:app_3tv/view/search/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchControllers extends GetxController {
  var formatDate = DateFormat("hh:MM aa");
  TextEditingController textEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();
  var number = 0.obs;
  var listClient = [].obs;
  var listAdmin = [].obs;
  var listVisiable = [].obs;
  var count = 0.obs;
  var countAd = 0.obs;
  var listAddMess = <Item>[].obs;
  var listAddMessAd = <Item>[].obs;

  @override
  void onInit() {
    for (int i = 0; i < listMess.length; i++) {
      listVisiable.add(false);
      if(listMess[i].position == Session.emd || listMess[i].position == Session.oneItem){
        listVisiable[i] = true;
      }
      if (listMess[i].type == "client") {
        listClient.add(i);
      }
      if (listMess[i].type == "admin") {
        listAdmin.add(i);
      }
    }
    print(listClient);
    super.onInit();
  }

  var listMess = [
    Item(type: "client", mess: "aloahsda", position: Session.start),
    Item(type: "client", mess: "sdfsdfsdfs", position: Session.emd),
    Item(type: "admin", mess: "alodfsdfsdfsdfsdahsda", position: Session.oneItem),
    Item(type: "client", mess: "alofsdfsdahsda", position: Session.start),
    Item(type: "client", mess: "alofsdfsdahsda", position: Session.center),
    Item(type: "client", mess: "123", position: Session.emd),
    Item(type: "admin", mess: "alsdfsdoahfsdfsdfsdfsda", position: Session.start),
    Item(type: "admin", mess: "aloahsda", position: Session.emd),
    Item(type: "client", mess: "aloahsdfsdfsda", position: Session.oneItem),
    Item(type: "admin", mess: "aloahssdfsdfda", position: Session.oneItem),
  ].obs;

  checkMessClientTop(Session session) {
    if (session == Session.start) {
      return 40.r;
    } else if (session == Session.emd) {
      return 12.r;
    } else if (session == Session.oneItem) {
      return 40.r;
    } else {
      return 12.r;
    }
  }

  checkMessClientBottom(Session session) {
    if (session == Session.start) {
      return 12.r;
    } else if (session == Session.emd) {
      return 40.r;
    } else if (session == Session.oneItem) {
      return 40.r;
    } else {
      return 12.r;
    }
  }
  addPosition(){
 for(int i = 0; i< listMess.length; i++){
   if(listAddMess.length ==1){
     listAddMess.add(Item(type: "client", mess:textEditingController.text.toString(), position: Session.oneItem));
     listMess.add(Item(type: "client", mess:listAddMess[i].mess, position: listAddMess[i].position));
   }else if( i != listAddMess.length-1){
     listAddMess.add(Item(type: "client", mess:textEditingController.text.toString(), position: Session.start));
     listMess.add(Item(type: "client", mess:listAddMess[i].mess, position: listAddMess[i].position));

   }else if(i == listAddMess.length-1){
     listAddMess.add(Item(type: "client", mess:textEditingController.text.toString(), position: Session.emd));
     listMess.add(Item(type: "client", mess:listAddMess[i].mess, position: listAddMess[i].position));

   }else{
     listAddMess.add(Item(type: "client", mess:textEditingController.text.toString(), position: Session.center));
     listMess.add(Item(type: "client", mess:listAddMess[i].mess, position: listAddMess[i].position));

   }
 }
  }
}
