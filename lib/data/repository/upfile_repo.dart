import 'dart:io';
import 'package:app_3tv/common/constants/api_constant.dart';
import 'package:app_3tv/data/base_service/api_response.dart';
import 'package:app_3tv/data/base_service/api_service.dart';
import 'package:app_3tv/data/base_service/respone_data.dart';
import 'package:app_3tv/data/model/base_model.dart';
import 'package:app_3tv/data/model/file/FileUpLoadModel.dart';
import 'package:dio/dio.dart';

class UpFileRepo {
  Future<ResponseData<FileUploadModel>> uploadOneFile(File file) async {
    ResponseData<FileUploadModel> streamEvent =
        ResponseData(state: Status.LOADING);
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });
    ApiResponse? apiResponse =
        await ApiService(ApiConstants.apiUploadImage, fromData: formData)
            .request(Request.POST);
    if (apiResponse?.status == Status.SUCCESS) {
      final FileUploadModel data =
          FileUploadModel.fromJson(apiResponse?.data?.data);
      streamEvent = ResponseData(state: Status.SUCCESS, object: data);
    }
    if (apiResponse?.status == Status.ERROR) {
      streamEvent = ResponseData(
          state: Status.ERROR,
          errorCode: apiResponse?.error,
          message: apiResponse?.error?.message);
    }
    return streamEvent;
  }

// Future<ResponseData<List<FileUploadModel>>> uploadMultiFile(
//     List<File> files) async {
//   ResponseData<List<FileUploadModel>> streamEvent =
//   ResponseData(state: Status.LOADING);
//   var multipartFiles = <MultipartFile>[];
//
//   for (int i = 0; i < files.length; i++) {
//     var fileMultiPath = MultipartFile.fromFileSync(files[i].path,
//         filename: basename(files[i].path));
//     multipartFiles.add(fileMultiPath);
//   }
//
//   var formData = FormData.fromMap({'file': multipartFiles});
//   ApiResponse<BaseModel> apiResponse = await ApiService(
//       ApiConstants.apiPostUploadMultiImage,
//       fromData: formData)
//       .request(Request.POST);
//   if (apiResponse.status == Status.SUCCESS) {
//     final List<FileUploadModel> data = apiResponse.data?.data
//         .map<FileUploadModel>((json) => FileUploadModel.fromJson(json))
//         .toList();
//     streamEvent = ResponseData(state: Status.SUCCESS, object: data);
//   }
//   if (apiResponse.status == Status.ERROR) {
//     streamEvent = ResponseData(
//         state: Status.ERROR,
//         errorCode: apiResponse.error,
//         message: apiResponse.error?.message);
//   }
//   return streamEvent;
// }
}
