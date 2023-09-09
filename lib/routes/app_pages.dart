import 'package:app_3tv/routes/app_routes.dart';
import 'package:app_3tv/view/find_restaurants/find_restaurents_page.dart';
import 'package:app_3tv/view/home/home_screen.dart';
import 'package:app_3tv/view/login/login_screen.dart';
import 'package:app_3tv/view/login/splash_screen.dart';
import 'package:app_3tv/view/login/splass_swipper/splash_swiper_page.dart';
import 'package:app_3tv/view/order/confirm_order/confirm_order.dart';
import 'package:app_3tv/view/order/order.dart';
import 'package:app_3tv/view/test.dart';
import 'package:get/get.dart';

class AppPages{
  static final pages = [
    GetPage(name:Routes.test, page: ()=> Test()),
    GetPage(name:Routes.splash, page: ()=> SplashScreen()),
    GetPage(name:Routes.home, page: ()=> HomeScreen()),
    GetPage(name:Routes.login, page: ()=> LoginScreen()),
    GetPage(name:Routes.splash2, page: ()=> SplassSwipperPage()),
    GetPage(name:Routes.order, page: ()=> OrderScreen()),
    GetPage(name:Routes.confirmOrder, page: ()=> ConfirmOrderScreen()),
    GetPage(name:Routes.findRestaurents, page: ()=> FindRestaurentsPage()),
  ];
}