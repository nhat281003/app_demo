import 'dart:async';

import 'package:app_3tv/common/utils/preference_utils.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'constants/string_constant.dart';

class AppCache {
  static AppCache? _singleton;
  final storage = const FlutterSecureStorage();
  late String userId;
  RxInt notificationCount = 0.obs;

  String? fcmToken;

  AppCache._();

  // User? get userInfo => commonInfo?.user;
  //
  //
  // String? get avatarUrl => commonInfo?.user?.img;

  String? _token;
  String? avatar;

  // getAvatar() {
  //   avatar = userInfo?.avatar?.url ?? "";
  //   return avatar;
  // }
  //
  // int getAccountId(){
  //   return userInfo?.id ?? 0;
  // }

  get token => _token;

  factory AppCache() {
    _singleton ??= AppCache._();
    return _singleton!;
  }

  void setToken(String token) {
    _token = token;
  }

  Future<void> saveToken({required String tokenSave}) async {
    await storage.write(key: 'token', value: tokenSave);
  }

  Future<String> get getToken async {
    return await storage.read(key: 'token') ?? '';
  }

  Future<void> saveUsername({required String username}) async {
    await storage.write(key: 'username', value: username);
  }

  Future<String> get getUsername async {
    return await storage.read(key: 'username') ?? '';
  }

  Future<void> savePassword({required String password}) async {
    await storage.write(key: 'password', value: password);
  }

  Future<String> get getPassword async {
    return await storage.read(key: 'password') ?? '';
  }

  Future<void> savePhoneNumber({required String phoneNumber}) async {
    await storage.write(key: 'phone_number', value: phoneNumber);
  }

  Future<String> get getPhoneNumber async {
    return await storage.read(key: 'phone_number') ?? '';
  }

  Future<void> saveFcmToken({required String fcmToken}) async {
    await storage.write(key: 'fcm_token', value: fcmToken);
  }

  Future<String> get getFcmToken async {
    return await storage.read(key: 'fcm_token') ?? '';
  }

  // void saveLogin(String username, String password, String? user) async {
  //   await storage.write(
  //       key: "${AppConstant.isBD ? "bd" : "vy"}username", value: username);
  //   await storage.write(
  //       key: "${AppConstant.isBD ? "bd" : "vy"}password", value: password);
  // }
  //
  // void deleteInfoLogin() async {
  //   await storage.delete(key: "${AppConstant.isBD ? "bd" : "vy"}username");
  //   await storage.delete(key: "${AppConstant.isBD ? "bd" : "vy"}password");
  // }
  //
  // Future<String?> get username async {
  //   return await storage.read(key: "${AppConstant.isBD ? "bd" : "vy"}username");
  // }
  //
  // Future<String?> get password async {
  //   return await storage.read(key: "${AppConstant.isBD ? "bd" : "vy"}password");
  // }

  void saveLoginAuthen(bool isSave) {
    if (isSave) {
      PreferenceUtils.setBool(StringConstant.SAVELOGINID, isSave);
    } else {
      PreferenceUtils.delete(StringConstant.SAVELOGINID);
    }
  }

  void saveInfoLogin(bool isSave) {
    PreferenceUtils.setBool(StringConstant.SAVE_INFO_LOGIN, isSave);
  }

  bool get isSaveInfoLogin {
    bool isSave = PreferenceUtils.getBool(StringConstant.SAVE_INFO_LOGIN);
    return isSave;
  }

  bool get isSaveLoginAuthen {
    bool isSave = PreferenceUtils.getBool(StringConstant.SAVELOGINID);
    return isSave;
  }

}
