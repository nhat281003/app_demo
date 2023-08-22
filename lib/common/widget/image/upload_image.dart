import 'dart:io';
import 'package:app_3tv/common/constants/app_constants.dart';
import 'package:app_3tv/common/permission/permission_helper.dart';
import 'package:app_3tv/common/utils/file_device.dart';
import 'package:app_3tv/common/widget/dialog_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UploadImage {
  const UploadImage._privateConstructor();

  static const UploadImage _instance = UploadImage._privateConstructor();

  static UploadImage get instance => _instance;

  void getFromGalleryToApiShowScreen({required String screen, CropAspectRatio? cropAspectRatio}) async {
    // PermissionHelper.instance.requestPermission(
    //   onGranted: () async {
    //     try {
    //       final XFile? pickedFile =
    //           await ImagePicker().pickImage(source: ImageSource.gallery);
    //       if (pickedFile != null) {
    //         ImageCropper().cropImage(
    //           sourcePath: pickedFile.path,
    //           compressFormat: ImageCompressFormat.jpg,
    //           aspectRatio: cropAspectRatio ??
    //               const CropAspectRatio(ratioX: 1.6, ratioY: 0.9),
    //           maxHeight: (Get.height * 0.9).round(),
    //           maxWidth: (Get.width * 0.9).round(),
    //           cropStyle: CropStyle.rectangle,
    //           uiSettings: [
    //             AndroidUiSettings(
    //                 toolbarTitle: "Cắt ảnh",
    //                 toolbarColor: Colors.blue,
    //                 toolbarWidgetColor: Colors.white,
    //                 initAspectRatio: CropAspectRatioPreset.square,
    //                 lockAspectRatio: false),
    //             IOSUiSettings(
    //                 title: "Cắt ảnh",
    //                 hidesNavigationBar: true,
    //                 aspectRatioLockEnabled: true,
    //                 aspectRatioPickerButtonHidden: true,
    //                 rotateClockwiseButtonHidden: true,
    //                 rotateButtonsHidden: true),
    //           ],
    //         ).then(
    //           (response) {
    //             if (response != null) {
    //               File file = File(response.path);
    //               // if (screen == AppConstant.AVATAR_ACCOUNT) {
    //               //   Get.find<AccountDetailController>().setFileAvatar(file);
    //               // }
    //             } else {
    //               print('cancel');
    //             }
    //           },
    //         );
    //       }
    //     } catch (e) {
    //       print("UploadImage: $e");
    //     }
    //   },
    //   context: context,
    // );

    await FileDevice.pickerDocument(true, mutilple: false).then((pickedFile) {
       File? file;
      if(pickedFile.isNotEmpty){
         file = pickedFile[0].file;
      }
      if (file != null) {
        ImageCropper().cropImage(
          sourcePath: file.path,
          compressFormat: ImageCompressFormat.jpg,
          aspectRatio: cropAspectRatio ??
              const CropAspectRatio(ratioX: 1.6, ratioY: 0.9),
          maxHeight: (Get.height * 0.9).round(),
          maxWidth: (Get.width * 0.9).round(),
          cropStyle: CropStyle.rectangle,
          uiSettings: [
            AndroidUiSettings(
                toolbarTitle: "Cắt ảnh",
                toolbarColor: Colors.blue,
                toolbarWidgetColor: Colors.white,
                initAspectRatio: CropAspectRatioPreset.square,
                lockAspectRatio: false),
            IOSUiSettings(
                title: "Cắt ảnh",
                hidesNavigationBar: true,
                aspectRatioLockEnabled: true,
                aspectRatioPickerButtonHidden: true,
                rotateClockwiseButtonHidden: true,
                rotateButtonsHidden: true),
          ],
        ).then(
              (response) {
            if (response != null) {
              File file = File(response.path);
              if (screen == AppConstant.AVATAR_ACCOUNT_UPGRADE) {
              }
            } else {
              print('cancel');
            }
          },
        );
      }
    });
  }

  Future<void> selectMultiImage(BuildContext context,
      {required String screen}) async {
    List<File> selectedImages = [];
    PermissionHelper.instance.requestPermission(
        onGranted: () async {
          DialogWidget.openLoadingDialog();
          final ImagePicker imagePicker = ImagePicker();
          List<XFile> selectedImagesX = await imagePicker.pickMultiImage();
          DialogWidget.dismissLoading();
          for (var item in selectedImagesX) {
            selectedImages.add(File(item.path));
          }
          if (screen == AppConstant.AVATAR_ACCOUNT) {
          } else if (screen == AppConstant.UPLOAD_IMAGE_CONGRESS) {
            if (selectedImages.isNotEmpty) {
             // Get.find<ImageController>().setFileCongressUpload(selectedImages);
              // await getUrlAfterUploadImage();
            }
          }
        },
        context: context);
  }
}
