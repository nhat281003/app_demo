import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:app_3tv/common/constants/date_format.dart';
import 'package:app_3tv/common/utils/time_utils.dart';
import 'package:app_3tv/common/widget/dialog_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class SaveImage {
  const SaveImage._privateConstructor();

  static final GlobalKey _globalKey = GlobalKey();
  static const SaveImage _instance = SaveImage._privateConstructor();

  static SaveImage get instance => _instance;

  void saveLocalImage() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData =
        await (image.toByteData(format: ui.ImageByteFormat.png));
    if (byteData != null) {
      final result =
          await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
      if (result['isSuccess']) {
        DialogWidget.showToast('Tải về thành công',
            colorText: Colors.white, colorBackground: Colors.green);
      }
    }
  }

  Future<void> saveNetworkImage(String url, {isOneImage = true}) async {
    String nameFile = TimeUtils.convertDateTimeToFormat(
        DateTime.now(), DateTimeFormat.formatDateVisit);
    if (isOneImage) {
      DialogWidget.openLoadingDialog();
      var response = await Dio()
          .get(url, options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.data),
          quality: 100,
          name: nameFile);
      DialogWidget.dismissLoading();
      if (result['isSuccess']) {
        DialogWidget.showToast(
            'Tải về thành công. Ảnh đã được lưu trong thư mục ảnh',
            colorText: Colors.white,
            colorBackground: Colors.green);
      }
    } else {
      var response = await Dio()
          .get(url, options: Options(responseType: ResponseType.bytes));
      final result = await ImageGallerySaver.saveImage(
          Uint8List.fromList(response.data),
          quality: 100,
          name: nameFile);
    }
  }

  void saveNetworkGifFile() async {
    var appDocDir = await getTemporaryDirectory();
    String savePath = "${appDocDir.path}/temp.gif";
    String fileUrl =
        "https://hyjdoc.oss-cn-beijing.aliyuncs.com/hyj-doc-flutter-demo-run.gif";
    await Dio().download(fileUrl, savePath);
    final result = await ImageGallerySaver.saveFile(savePath);
    print(result);
  }
}
