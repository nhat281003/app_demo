
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  Size size = const Size(360, 690);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isShowPassWord = false;
  bool isLoading = false;
  bool isFocusPassword = false;

  @override
  onInit() {
    super.onInit();
  }

}
