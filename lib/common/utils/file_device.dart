import 'dart:convert';
import 'dart:io';
import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:app_3tv/data/model/req_file.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/widgets.dart' as statefulBuilder;

class FileDevice {

 static Future<List<ReqFile>> pickerDocument(bool isImage, {mutilple}) async {
    List<ReqFile> list = [];
    FilePickerResult? result;
    if (isImage) {
      result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: mutilple,
      );
    } else {
      result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: mutilple,
        allowedExtensions: ['pdf', 'doc', 'docx', 'xlsx', 'xls', 'jpg', 'png'],
      );
    }

    if (result != null) {
      List<File> file = result.paths.map((path) => File(path!)).toList();
      if (file.isNotEmpty) {
        for (int i = 0; i < file.length; i++) {
          ReqFile f = ReqFile();
          f.file = file[i];
          List<String> listTemp = file[i].toString().split('/');
          String name = listTemp[listTemp.length - 1]
              .substring(0, listTemp[listTemp.length - 1].length - 1);
          f.name = name;
          print('pickerFile: ${name}, ${f.data}');
          list.add(f);
        }
      }
    } else {
      // User canceled the picker
    }
    return list;
  }

static  Future<void> openFile(String fileName) async {
    print(fileName);
    // final _result = await .open(fileName);
    // print(_result.message);
  }

 static String convertBase64(String path, String mediatype) {
    File file = File(path);
    List<int> fileInByte = file.readAsBytesSync();
    String fileInBase64 = base64Encode(fileInByte);
    print(fileInBase64);
    return "data:$mediatype;base64,$fileInBase64";
  }

 static Future<List<ReqFile>?> openCamera() async {
    final ImagePicker _picker = ImagePicker();
    // Capture a photo
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      ReqFile result = ReqFile();
      result.file = File(photo.path);

      List<String> listTemp = photo.toString().split('/');
      String name = listTemp[listTemp.length - 1]
          .substring(0, listTemp[listTemp.length - 1].length - 1);
      result.name = 'image';
      return [result];
    }
    return null;
  }

  static Future<List<ReqFile>> showSelectFileV2(BuildContext context, {image = false}) async {
    List<ReqFile> list = [];
    await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return statefulBuilder.StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  color: Colors.transparent,
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)),
                        color: Colors.white,
                      ),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(
                          top: 16,
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              (image) ? "Chọn ảnh" :"Chọn tài liệu",
                              textAlign: TextAlign.center,
                              style: TextStyleUtils.titleBold14Weigh500,
                            ),
                          ),
                          Column(
                            children: [
                              SizedBox(width: 0, height:(!image)  ? 8:  16),
                              (!image) ? Material(
                                child: InkWell(
                                  splashColor: ColorUtils.COLOR_PRIMARY,
                                  child: Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 12),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.file_present_rounded,
                                            color: ColorUtils.COLOR_PRIMARY,
                                            size: 26,
                                          ),
                                          const SizedBox(width: 16, height: 16),
                                          Expanded(
                                            child: Text("Tài liệu",
                                                style:
                                                TextStyleUtils.titleBold14Weigh500),
                                          ),
                                        ],
                                      )),
                                  onTap: () async {
                                    await pickerDocument(image, mutilple: !image)
                                        .then((value) {
                                      if (value.isNotEmpty) {
                                        setState((){
                                          list.addAll(value);
                                        });
                                      }
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ) : Container(),
                              Material(
                                child: InkWell(
                                  splashColor: Colors.grey.withOpacity(0.5),
                                  child: Container(
                                      width: double.infinity,
                                      decoration: const BoxDecoration(
                                          border: Border.symmetric(
                                              horizontal: BorderSide(
                                                  color: Colors.grey, width: 0.5))),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 16, horizontal: 16),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.photo_library_sharp,
                                            color: ColorUtils.COLOR_PRIMARY,
                                            size: 22,
                                          ),
                                          const SizedBox(width: 16, height: 16),
                                          Expanded(
                                            child: Text("Thư viện",
                                                style:
                                                TextStyleUtils.titleBold14Weigh500,),
                                          ),
                                        ],
                                      )),
                                  onTap: () async {
                                    await pickerDocument(true, mutilple: !image)
                                        .then((value) {
                                      if (value.isNotEmpty) {
                                        setState((){
                                          list.addAll(value);
                                        });
                                      }
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Material(
                                child: InkWell(
                                  splashColor:
                                  ColorUtils.COLOR_PRIMARY.withOpacity(0.6),
                                  child: Container(
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 16),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.camera_alt,
                                          color: ColorUtils.COLOR_PRIMARY,
                                          size: 22,
                                        ),
                                        const SizedBox(width: 16, height: 16),
                                        Expanded(
                                          child: Text(
                                            "Máy ảnh",
                                            style: TextStyleUtils.titleBold14Weigh500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () async {
                                    await openCamera()
                                        .then((value) {
                                      if (value != null && value.isNotEmpty) {
                                        setState((){
                                          list.addAll(value);
                                        });
                                      }
                                    });
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16,)
                        ],
                      ),
                    ),
                  ),
                );
              });
        });
    return list;
  }
}
