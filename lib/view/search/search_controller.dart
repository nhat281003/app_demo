import 'package:app_3tv/view/search/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SearchControllers extends GetxController {
  var formatDate = DateFormat("hh:MM aa");
  TextEditingController textEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();
  var number = 0.obs;

  var listClient = [].obs;
  var listAdmin = [].obs;

  @override
  void onInit() {
    for (int i = 0; i < listMess.length; i++) {
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

  checkMess() {
    for (int i = 0; i < listClient.length; i++) {
      for (int j = 0; j < i; j++) {
        if (listClient[j] + 1 == listClient[i]) {
          print(listClient);
          print(listClient[i]);
          print(listClient[j]);
          if (listClient[j] == 0) {
            return BoxDecoration(
                color: listMess[i].type == "admin" ? Colors.grey.shade400 : Colors.deepPurple.shade800,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40), bottomLeft: Radius.circular(40), bottomRight: Radius.circular(0)));
          }
          if (listClient[i] == 1) {
            return BoxDecoration(
                color: listMess[i].type == "admin" ? Colors.grey.shade400 : Colors.deepPurple.shade800,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(0), bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)));
          } else {}
        }
      }
    }
  }
}
