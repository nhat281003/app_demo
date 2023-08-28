import 'package:app_3tv/data/model/profilees/profiless.dart';
import 'package:app_3tv/data/repository/profile_repo.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController{
  ProfileRepo profileRepo = ProfileRepo();
  var list = Profile();
  var listItem = <Results>[].obs;

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }

  getProfile(){
    profileRepo.getProfileDio().then((value) {
      list = value;

    },);
  }

}