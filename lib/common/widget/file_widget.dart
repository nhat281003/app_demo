import 'dart:io';

import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/global.dart';
import 'package:app_3tv/common/utils/open_url.dart';
import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:app_3tv/data/model/req_file.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

class FileWidget {
  static itemFile(context,
      {required ReqFile file,
      required Function function,
      required bool remove}) {
    File? fileData;
    var fileName;
    var url = file.url;
    Widget widget = Container();

    if (url == null) {
      fileData = file.file!;
      fileName = fileData.path;
    } else {
      fileName = file.name;
    }

    print("Image Url: $url");
    var action = 0;
    var extension = p.extension(fileName).replaceAll(".", "");
    if (extension == "png" ||
        extension == "jpg" ||
        extension == "jpeg" ||
        extension == "gif" ||
        extension == "bmp") {
      action = 1;
    } else if (extension == "pdf") {
      action = 2;
    } else {
      action = 0;
    }

    switch (action) {
      case 1:
        if(url != null){
          widget = Image.network(
            url,
            errorBuilder: (
                BuildContext context,
                Object error,
                StackTrace? stackTrace,
                ) {
              return Image.asset(
                getFileIcon(file.name),
                height: 35,
                width: 30,
              );
            },
            height: 35,
            width: 30,
          );
        } else {
          widget = Image.file(
            fileData!,
            errorBuilder: (
                BuildContext context,
                Object error,
                StackTrace? stackTrace,
                ) {
              return Image.asset(
                getFileIcon(file.name),
                height: 35,
                width: 30,
              );
            },
            height: 35,
            width: 30,
          );
        }
        break;
      default:
        widget = Image.asset(
          getFileIcon(file.name),
          height: 35,
          width: 30,
        );
        break;
    }


    return GestureDetector(
      onTap: () {
        switch (action) {
          case 1:
            OpenUrl.openImageViewer(context, file.url!, file: fileData);
            break;
          case 2:
          //  Get.to(ViewPdfPage(url: file.url!));
            break;
          default:
            OpenUrl.openFile(file.url!);
            break;
        }
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: ColorUtils.COLOR_WHITE,
          ),
          child: Row(
            children: [
              const SizedBox(width: 4),
              widget,
              Expanded(
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 4,
                        ),
                        Text(file.name ?? "Tệp đính kèm",
                            style: TextStyleUtils.sizeText15Weight500()
                                ?.copyWith(color: ColorUtils.COLOR_BG_TOOLBAR)),
                      ],
                    ),
                  )),
              const SizedBox(
                width: 12,
              ),
              Visibility(
                visible: remove,
                child: GestureDetector(
                    child: const Icon(
                      Icons.remove_circle,
                      color: ColorUtils.COLOR_WORK_TYPE_4,
                      size: 24,
                    ),
                    onTap: () {
                      function.call();
                    }),
              ),
              const SizedBox(width: 8),
            ],
          )),
    );
  }
}
