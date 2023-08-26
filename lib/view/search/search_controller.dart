import 'package:app_3tv/view/search/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchControllers extends GetxController{
  var formatDate = DateFormat("hh:MM aa");
  TextEditingController textEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();
  var number = 0.obs;
  var listMess =[
    Item(type: "client", mess: "aloahsda"),
    Item(type: "client", mess: "sdfsdfsdfs"),
    Item(type: "admin", mess: "alodfsdfsdfsdfsdahsda"),
    Item(type: "client", mess: "alofsdfsdahsda"),
    Item(type: "client", mess: "alofsdfsdfahsda"),
    Item(type: "admin", mess: "alsdfsdoahfsdfsdfsdfsda"),
    Item(type: "admin", mess: "aloahsda"),
    Item(type: "client", mess: "aloahsdfsdfsda"),
    Item(type: "admin", mess: "aloahssdfsdfda"),

  ].obs;

  checkRadius(index){
    if(listMess[index].type == 'admin'){
      number.value = index;
      for(int i = number.value +1; i< number.value; i++){

      }
    }else{
      for(int i = 0; i< number.value; i++){

      }
    }


  }

}