import 'package:app_3tv/routes/app_routes.dart';
import 'package:app_3tv/view/home/home_screen.dart';
import 'package:app_3tv/view/login/login_screen.dart';
import 'package:app_3tv/view/login/splash_screen.dart';
import 'package:app_3tv/view/login/splass_swipper/splash_swiper_page.dart';
import 'package:get/get.dart';

class AppPages{
  static final pages = [
    GetPage(name:Routes.splash, page: ()=> SplashScreen()),
    GetPage(name:Routes.home, page: ()=> HomeScreen()),
    GetPage(name:Routes.login, page: ()=> LoginScreen()),
    GetPage(name:Routes.splash2, page: ()=> SplassSwipperPage()),
  ];
}