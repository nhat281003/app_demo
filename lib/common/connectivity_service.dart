import 'package:app_3tv/common/utils/app_utils.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ConnectivityService extends GetxService {
  bool isShowingDialog = false;
  final Connectivity _connectivity = Connectivity();
  @override
  void onInit() async {
    super.onInit();
    final result = await _connectivity.checkConnectivity();
    if (result != ConnectivityResult.mobile &&
        result != ConnectivityResult.wifi) {
      isShowingDialog = true;
      showDialog();
    }

    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile ||
          result == ConnectivityResult.wifi) {
        if(isShowingDialog)Get.back();
        isShowingDialog = false;
        AppUtils.shared.printLog(isShowingDialog);

      } else {
        if (!isShowingDialog) {
          isShowingDialog = true;
          showDialog();
        }
      }
    });
  }

  void showDialog() {
    Get.dialog(
      WillPopScope(
        onWillPop: ()async=>false,
        child: const CupertinoAlertDialog(
          title: Text(
              'Please turn on network connection to continue using this app'),
        ),
      ),
      barrierDismissible: false,
    );
  }
}
