import 'dart:io';
import 'package:app_3tv/common/widget/dialog_widget.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  const PermissionHelper._privateConstructor();

  static const PermissionHelper _instance =
      PermissionHelper._privateConstructor();

  static PermissionHelper get instance => _instance;

  Future<PermissionStatus> _requestWhenDeny(
      Permission permission, BuildContext context) async {
    PermissionStatus status = await permission.request();
    if (status == PermissionStatus.permanentlyDenied) {
      await _showDialogWhenDenied(context: context);
    } else if (status == PermissionStatus.denied) {
      await _showDialogWhenDenied(context: context);
    }
    return status;
  }

  Future<void> requestPermission(
      {required Function? onGranted,
      Permission permission = Permission.photos,
      required BuildContext context}) async {
    bool isAndroid = Platform.isAndroid;
    bool isAndroidLess13 = false;
    if (isAndroid) {
      AndroidDeviceInfo androidInfo = await DeviceInfoPlugin().androidInfo;
      int sdkInt = androidInfo.version.sdkInt;
      if (sdkInt < 33) {
        isAndroidLess13 = true;
      }
    }
    if (isAndroidLess13) {
      if (await Permission.manageExternalStorage.request().isGranted) {
        await onGranted!();
      } else {
        await Permission.manageExternalStorage.request();
      }
    } else {
      PermissionStatus status;
      status = await permission.status;

      switch (status) {
        case PermissionStatus.granted:
          break;
        case PermissionStatus.denied:
          status = await _requestWhenDeny(permission, context);
          break;
        case PermissionStatus.permanentlyDenied:
          await _showDialogWhenDenied(context: context);
          break;
        default:
          break;
      }
      if ((status.isGranted || status.isLimited) && onGranted != null) {
        await onGranted();
      }
    }
  }

  Future<void> _showDialogWhenDenied({required BuildContext context}) async {
    return DialogWidget.showDialogConfirmBase(
        titleHeader: 'Lỗi truy cập ảnh',
        textCancel: 'ĐÓNG',
        textSuccess: 'MỞ CÀI ĐẶT',
        contentPrimary: 'Ứng dụng không có quyền truy cập ảnh',
        contentSub:
            'Vui lòng cài đặt lại quyền truy cập ảnh trong cài đặt thiết bị',
        functionSuccess: () {
          Get.back();
          openAppSettings();
        });
  }
}
