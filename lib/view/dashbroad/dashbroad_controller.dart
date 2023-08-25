import 'package:app_3tv/common/widget/app_bar_widget.dart';
import 'package:app_3tv/data/base_service/api_response.dart';
import 'package:app_3tv/data/model/list_fod.dart';
import 'package:app_3tv/data/repository/tam_ang_repo.dart';
import 'package:get/get.dart';

class DashBroadController extends GetxController{
  ListRepo listRepo = ListRepo();
  RxList<listFood> list = <listFood>[].obs;

  @override
  void onInit() {
    getList();
    super.onInit();
  }

  getList() async {
    await listRepo.getlistfood().then((value) {
      if(value.state == Status.SUCCESS){
        list.value = value.object!;
      }
    },
    );


  }

}