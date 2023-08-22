// import 'package:app_congress/common/constants/api_constant.dart';
// import 'package:app_congress/data/base_service/api_response.dart';
// import 'package:app_congress/data/base_service/api_service.dart';
// import 'package:app_congress/data/base_service/respone_data.dart';
// import 'package:app_congress/data/model/account/profile_detail_model.dart';
// import 'package:app_congress/data/model/base_model.dart';
//
// class AccountRepo {
//   Future<ResponseData<ProfileDetailModel>> getDetailProfile(int id) async {
//     ResponseData<ProfileDetailModel> streamEvent =
//         ResponseData(state: Status.LOADING);
//     String path = "${ApiConstants.apiGetDetailProfile}/$id";
//     ApiResponse<BaseModel> apiResponse =
//         await ApiService(path, params: {}).request(Request.GET);
//     if (apiResponse.status == Status.SUCCESS) {
//       final ProfileDetailModel data =
//           ProfileDetailModel.fromJson(apiResponse.data?.data);
//       streamEvent = ResponseData(state: Status.SUCCESS, object: data);
//     } else if (apiResponse.status == Status.ERROR) {
//       streamEvent = ResponseData(
//           state: Status.ERROR,
//           errorCode: apiResponse.error,
//           message: apiResponse.error?.message);
//     }
//     return streamEvent;
//   }
//
//   Future<ResponseData<ProfileDetailModel>> updateDetailProfile(dynamic body) async {
//     ResponseData<ProfileDetailModel> streamEvent =
//         ResponseData(state: Status.LOADING);
//     String path = ApiConstants.apiUpdateDetailProfile;
//     ApiResponse<BaseModel> apiResponse =
//         await ApiService(path, request: body).request(Request.PUT);
//     if (apiResponse.status == Status.SUCCESS) {
//       final ProfileDetailModel data =
//           ProfileDetailModel.fromJson(apiResponse.data?.data);
//       streamEvent = ResponseData(state: Status.SUCCESS, object: data);
//     } else if (apiResponse.status == Status.ERROR) {
//       streamEvent = ResponseData(
//           state: Status.ERROR,
//           errorCode: apiResponse.error,
//           message: apiResponse.error?.message);
//     }
//     return streamEvent;
//   }
// }
