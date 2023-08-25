import 'package:app_3tv/data/base_service/api_response.dart';
import 'package:app_3tv/data/base_service/api_service.dart';
import 'package:app_3tv/data/base_service/respone_data.dart';
import 'package:app_3tv/data/model/base_model.dart';
import 'package:app_3tv/data/model/list_fod.dart';

class ListRepo{
  Future<ResponseData<List<listFood>>> getlistfood() async {
    ResponseData<List<listFood>> streamEvent = ResponseData(state: Status.LOADING);
    var param = <String, dynamic>{};
    var urlApi = "https://64d59338613ee4426d977185.mockapi.io/tamang";
    ApiResponse<BaseModel> apiResponse =
    await ApiService(urlApi, request: param)
        .request(Request.GET);

    if (apiResponse.status == Status.SUCCESS) {
      List<listFood> data = <listFood>[];
      apiResponse.data?.data.map((e) {
        data.add(listFood.fromJson(e));
      }).toList();
      streamEvent = ResponseData(state: Status.SUCCESS, object: data);

    }
    if (apiResponse.status == Status.ERROR) {
      streamEvent = ResponseData(
          state: Status.ERROR,
          errorCode: apiResponse.error,
          message: apiResponse.error?.message);
    }
    return streamEvent;
  }

}