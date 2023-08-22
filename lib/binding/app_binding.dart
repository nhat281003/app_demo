import 'package:app_3tv/notification/notify_controller.dart';
import 'package:app_3tv/view/home/home_controller.dart';
import 'package:app_3tv/view/login/login_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Get.put(NotifyController());
    Get.put(HomeController());
    Get.put(LoginController());
  }
}
