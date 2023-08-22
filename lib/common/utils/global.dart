import 'package:app_3tv/common/widget/empty_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart' as p;

// Widget svgIcon(String assetName) {
//   return SvgPicture.asset("assets/icons/" + assetName);
// }
// var themeColor = Theme.of(Get.context!);

String getFileIcon(file) {
 var extension = p.extension(file).replaceAll(".", "");
  if(extension == "png" || extension== "jpg" || extension == "bmp" || extension == "jpeg"){
    return "assets/icons/file/icon_image.png";
  }
  if(extension == "doc" || extension== "docx"){
    return "assets/icons/file/icon_word.png";
  }
  if(extension == "xlsx" || extension== "xls"){
    return "assets/icons/file/icon_excel.png";
  }
  if(extension == "pptx" || extension== "ppt"){
    return "assets/icons/file/icon_ppt.png";
  }
  if(extension == "pdf"){
    return "assets/icons/file/icon_pdf.png";
  }
  return "assets/icons/file/icon_unknow.png";
}

String getAssetsIconNew(icon) {
  return "assets/icons/new/$icon";
}
String getAssetsIcon(String icon) {
  return "assets/icons/$icon";
}

String getAssetsImage(String image) {
  return "assets/images/$image";
}

getEmptyWidget(Function callback){
  return SizedBox(
    width: Get.width,
    height: Get.height,
    child: Center(child: EmptyScreen(
      onTap: () => callback.call(),
    ),),);
}


void dismissKeyboard() {
  FocusScope.of(Get.context!).requestFocus(FocusNode());
}
