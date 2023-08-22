//
// import 'package:flutter_app_badger/flutter_app_badger.dart';
//
// class LoginRepo {
//   AppCache appCache = AppCache();
//
//   // dang ky khach hang
//   Future<ResponseData<RegisterModel>> registerCustomer(
//       Map<String, dynamic> body) async {
//     ResponseData<RegisterModel> streamEvent =
//         ResponseData(state: Status.LOADING);
//     ApiResponse<BaseModel> apiResponse =
//         await ApiService(ApiConstants.apiCustomerRegister, request: body)
//             .request(Request.POST);
//     if (apiResponse.status == Status.SUCCESS) {
//       RegisterModel registerModel =
//           RegisterModel.fromJson(apiResponse.data?.data);
//       streamEvent = ResponseData(state: Status.SUCCESS, object: registerModel);
//     }
//     if (apiResponse.status == Status.ERROR) {
//       streamEvent = ResponseData(
//           state: Status.ERROR,
//           errorCode: apiResponse.error,
//           message: apiResponse.error?.message);
//     }
//     return streamEvent;
//   }
//
//   // xac thuc email khach hang
//   Future<ResponseData<Object>> verifyEmailCustomer(
//       Map<String, dynamic> body) async {
//     ResponseData<Object> streamEvent = ResponseData(state: Status.LOADING);
//     ApiResponse<BaseModel> apiResponse = await ApiService(
//             ApiConstants.apiCustomerRegisterVerifyCode,
//             request: body)
//         .request(Request.POST);
//     if (apiResponse.status == Status.SUCCESS) {
//       streamEvent = ResponseData(state: Status.SUCCESS, object: null);
//     }
//     if (apiResponse.status == Status.ERROR) {
//       streamEvent = ResponseData(
//           state: Status.ERROR,
//           errorCode: apiResponse.error,
//           message: apiResponse.error?.message);
//     }
//     return streamEvent;
//   }
//
//   // gui lai ma code vao email
//   Future<ResponseData<Object>> resendCodeEmail(
//       Map<String, dynamic> body) async {
//     ResponseData<Object> streamEvent = ResponseData(state: Status.LOADING);
//     ApiResponse<BaseModel> apiResponse =
//         await ApiService(ApiConstants.apiResendCodeToEmail, request: body)
//             .request(Request.POST);
//     if (apiResponse.status == Status.SUCCESS) {
//       streamEvent = ResponseData(state: Status.SUCCESS, object: null);
//     }
//     if (apiResponse.status == Status.ERROR) {
//       streamEvent = ResponseData(
//           state: Status.ERROR,
//           errorCode: apiResponse.error,
//           message: apiResponse.error?.message);
//     }
//     return streamEvent;
//   }
//
//   // dang nhap email
//   Future<ResponseData<LoginModel>> loginEmail(Map<String, dynamic> body) async {
//     ResponseData<LoginModel> streamEvent = ResponseData(state: Status.LOADING);
//     ApiResponse<BaseModel> apiResponse =
//         await ApiService(ApiConstants.apiCustomerLogin, request: body)
//             .request(Request.POST);
//     if (apiResponse.status == Status.SUCCESS) {
//       LoginModel data = LoginModel.fromJson(apiResponse.data?.data);
//       appCache.setToken(data.accessToken ?? "");
//       await appCache.saveToken(tokenSave: data.accessToken ?? '');
//       await appCache.savePassword(password: body['password']);
//       await appCache.saveUsername(username: body['email']);
//       streamEvent = ResponseData(state: Status.SUCCESS, object: data);
//       var isSupportBadge = await FlutterAppBadger.isAppBadgeSupported();
//       if (isSupportBadge) {
//         await FlutterAppBadger.updateBadgeCount(100);
//       }
//     }
//     if (apiResponse.status == Status.ERROR) {
//       streamEvent = ResponseData(
//           state: Status.ERROR,
//           errorCode: apiResponse.error,
//           message: apiResponse.error?.message);
//     }
//     return streamEvent;
//   }
//
//   // dang xuat
//   Future<ResponseData<Object>> logOut() async {
//     ResponseData<LoginModel> streamEvent = ResponseData(state: Status.LOADING);
//     ApiResponse<BaseModel> apiResponse =
//         await ApiService(ApiConstants.apiCustomerLogout).request(Request.POST);
//     if (apiResponse.status == Status.SUCCESS) {
//       FlutterAppBadger.removeBadge();
//       appCache.setToken('');
//       appCache.fcmToken = null;
//       await appCache.saveToken(tokenSave: '');
//       await appCache.saveFcmToken(fcmToken: '');
//       // await appCache.savePassword(password: '');
//       // await appCache.saveUsername(username: '');
//       streamEvent = ResponseData(state: Status.SUCCESS, object: null);
//     }
//     if (apiResponse.status == Status.ERROR) {
//       streamEvent = ResponseData(
//           state: Status.ERROR,
//           errorCode: apiResponse.error,
//           message: apiResponse.error?.message);
//     }
//     return streamEvent;
//   }
//
//   // change password
//   Future<ResponseData<Object>> changePassword(Map<String, dynamic> body) async {
//     ResponseData<Object> streamEvent = ResponseData(state: Status.LOADING);
//     ApiResponse<BaseModel> apiResponse =
//         await ApiService(ApiConstants.apiChangePassword, request: body)
//             .request(Request.PUT);
//     if (apiResponse.status == Status.SUCCESS) {
//       await appCache.savePassword(password: body['newPassword']);
//       streamEvent = ResponseData(state: Status.SUCCESS, object: null);
//     }
//     if (apiResponse.status == Status.ERROR) {
//       streamEvent = ResponseData(
//           state: Status.ERROR,
//           errorCode: apiResponse.error,
//           message: apiResponse.error?.message);
//     }
//     return streamEvent;
//   }
//
//   /// FORGET PASSWORD
//   // change password when forget password
//   Future<ResponseData<Object>> changePassWhenForgetPass(
//       Map<String, dynamic> body) async {
//     ResponseData<Object> streamEvent = ResponseData(state: Status.LOADING);
//     ApiResponse<BaseModel> apiResponse = await ApiService(
//             ApiConstants.apiChangePassWhenForgetPass,
//             request: body)
//         .request(Request.PUT);
//     if (apiResponse.status == Status.SUCCESS) {
//       await appCache.savePassword(password: body['password']);
//       streamEvent = ResponseData(state: Status.SUCCESS, object: null);
//     }
//     if (apiResponse.status == Status.ERROR) {
//       streamEvent = ResponseData(
//           state: Status.ERROR,
//           errorCode: apiResponse.error,
//           message: apiResponse.error?.message);
//     }
//     return streamEvent;
//   }
//
//   // send code to email when forget password
//   Future<ResponseData<RegisterModel>> sendEmailForgetPass(
//       Map<String, dynamic> body) async {
//     ResponseData<RegisterModel> streamEvent =
//         ResponseData(state: Status.LOADING);
//     ApiResponse<BaseModel> apiResponse =
//         await ApiService(ApiConstants.apiSendEmailForgetPass, request: body)
//             .request(Request.POST);
//     if (apiResponse.status == Status.SUCCESS) {
//       RegisterModel registerModel =
//           RegisterModel.fromJson(apiResponse.data?.data);
//       streamEvent = ResponseData(state: Status.SUCCESS, object: registerModel);
//     }
//     if (apiResponse.status == Status.ERROR) {
//       streamEvent = ResponseData(
//           state: Status.ERROR,
//           errorCode: apiResponse.error,
//           message: apiResponse.error?.message);
//     }
//     return streamEvent;
//   }
//
//   //verify code email when forget pass
//   Future<ResponseData<Object>> verifyCodeWhenForgetPass(
//       Map<String, dynamic> body) async {
//     ResponseData<Object> streamEvent = ResponseData(state: Status.LOADING);
//     ApiResponse<BaseModel> apiResponse =
//         await ApiService(ApiConstants.apiVerifyWhenForgetPass, request: body)
//             .request(Request.POST);
//     if (apiResponse.status == Status.SUCCESS) {
//       streamEvent = ResponseData(state: Status.SUCCESS, object: null);
//     }
//     if (apiResponse.status == Status.ERROR) {
//       streamEvent = ResponseData(
//           state: Status.ERROR,
//           errorCode: apiResponse.error,
//           message: apiResponse.error?.message);
//     }
//     return streamEvent;
//   }
//
//   // confirm code when forget pass
//   Future<ResponseData<RegisterModel>> confirmCodeWhenForgetPass(
//       Map<String, dynamic> body) async {
//     ResponseData<RegisterModel> streamEvent =
//         ResponseData(state: Status.LOADING);
//     ApiResponse<BaseModel> apiResponse =
//         await ApiService(ApiConstants.apiVerifyWhenForgetPass, request: body)
//             .request(Request.POST);
//     if (apiResponse.status == Status.SUCCESS) {
//       RegisterModel registerModel =
//           RegisterModel.fromJson(apiResponse.data?.data);
//       streamEvent = ResponseData(state: Status.SUCCESS, object: registerModel);
//     }
//     if (apiResponse.status == Status.ERROR) {
//       streamEvent = ResponseData(
//           state: Status.ERROR,
//           errorCode: apiResponse.error,
//           message: apiResponse.error?.message);
//     }
//     return streamEvent;
//   }
// }
