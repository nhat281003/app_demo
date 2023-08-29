import 'package:app_3tv/data/model/profilees/profiless.dart';
import 'package:app_3tv/data/repository/profile_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  ProfileRepo profileRepo = ProfileRepo();
  var list = Profile();
  var listItem = <Results>[].obs;
  var listItemLoadMore = <Results>[].obs;
  var scrollController = ScrollController();
  var count = 2.obs;


  @override
  void onInit() {
    getProfile();
    scrollController = ScrollController()..addListener(_loadmore);
    super.onInit();
  }

  getProfile(){
    profileRepo.getProfileDio(1).then((value) {
      list = value!;
      listItem.value = list.results!;

    },);
  }


  _loadmore(){
    if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
      if(listItem.isNotEmpty){
        count ++;
      }
      profileRepo.getProfileDio(count).then((value) {
        listItemLoadMore.value = [];
        list = value!;
        listItemLoadMore.value = list.results!;
        listItem.addAll(listItemLoadMore);
        listItem.refresh();

      },);



    }

  }

}