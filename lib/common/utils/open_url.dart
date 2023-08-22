import 'dart:io';
import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_utils.dart';
import 'color_utils.dart';

class OpenUrl {
  static call(String phone) {
    openLaunch('tel://$phone');
  }

  static openImageViewer(context, url, {file}) {
    ImageProvider imageProvider;
    if (url != null) {
      imageProvider = Image.network(url).image;
    } else {
      imageProvider = Image.file(file).image;
    }
    showImageViewer(
      context,
      imageProvider,
      closeButtonColor: ColorUtils.COLOR_WORK_TYPE_3,
      immersive: true,
      onViewerDismissed: () {
        print("dismissed");
      },
    );
  }

  static openFile(String url) {
    openLaunch(url);
  }


  static openViber(String? phoneNumber) {
    phoneNumber = phoneNumber?.replaceRange(0, 1, "84");
    openLaunch('viber://contact?number=%2B$phoneNumber');
  }

  static openZalo(String? phoneNumber) {
    openLaunch('https://zalo.me/$phoneNumber');
  }

  static Future<void> openLaunch(String url) async {
    final Uri _url = Uri.parse(url);
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url, mode: LaunchMode.externalApplication);
    } else {
      AppUtils.shared.showDialog(
          title: "Thông báo",
          content: Text(
            "Không thể mở tệp do không truy cập được URL!",
            style: TextStyleUtils.sizeText15Weight500()?.copyWith(color: ColorUtils.COLOR_TEXT_BLACK87),
          ),
          textLeft: null,
          textRight: "Đóng",
          confirmOnTap: () {
            Get.back();
          });
      throw 'Could not launch $url';
    }
  }

  static void launchURL(String email) async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: email,
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  static void killApp(){
    Future.delayed(const Duration(milliseconds: 1000), () {
      if (Platform.isAndroid) {
        SystemNavigator.pop();
      } else if (Platform.isIOS) {
        exit(0);
      }
    });
  }
}
