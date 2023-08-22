// import 'package:app_vote/common/constants/api_constant.dart';
// import 'package:app_vote/data/base_service/api_response.dart';
// import 'package:app_vote/data/base_service/api_service.dart';
// import 'package:app_vote/data/base_service/respone_data.dart';
// import 'package:app_vote/data/model/base_model.dart';
// import 'package:app_vote/data/model/police_term.dart';
//
// class PolicyTermsRepo{
//   Future<ResponseData<PolicyTermsModel>> getContentPoliceTerm() async {
//     ResponseData<PolicyTermsModel> streamEvent = ResponseData(state: Status.LOADING);
//     var param = <String, dynamic>{};
//     var urlApi = ApiConstants.apiPolicyTerms;
//     ApiResponse<BaseModel> apiResponse =
//     await ApiService(urlApi, request: param)
//         .request(Request.GET);
//
//     if (apiResponse.status == Status.SUCCESS) {
//       PolicyTermsModel dataRes = PolicyTermsModel.fromJson(apiResponse.data?.data);
//       streamEvent = ResponseData(state: Status.SUCCESS, object: dataRes);
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