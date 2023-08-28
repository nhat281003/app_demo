import 'package:app_3tv/data/base_service/api_response.dart';
import 'package:app_3tv/data/base_service/api_service.dart';
import 'package:app_3tv/data/base_service/respone_data.dart';
import 'package:app_3tv/data/model/base_model.dart';
import 'package:app_3tv/data/model/list_fod.dart';
import 'package:app_3tv/data/model/profilees/profiless.dart';
import 'package:dio/dio.dart';

class ProfileRepo{
  Future<ResponseData<Profile>> getlistProfile() async {
    ResponseData<Profile> streamEvent = ResponseData(state: Status.LOADING);
    var param = <String, dynamic>{};
    var urlApi = "https://api.themoviedb.org/3/discover/movie?api_key=26763d7bf2e94098192e629eb975dab0&page=1";
    ApiResponse<BaseModel> apiResponse =
    await ApiService(urlApi, request: param)
        .request(Request.GET);

    if (apiResponse.status == Status.SUCCESS) {
      // List<listFood> data = <listFood>[];
      // apiResponse.data?.data.map((e) {
      //   data.add(listFood.fromJson(e));
      // }).toList();
      final Profile data =
      Profile.fromJson(apiResponse.data?.data);
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


  Future<Profile> getProfileDio() async {
    try {
      Dio dio = Dio();
      Response response = await dio.get('https://api.themoviedb.org/3/discover/movie?api_key=26763d7bf2e94098192e629eb975dab0&page=1'); // Thay thế URL bằng URL của API thực tế
      if (response.statusCode == 200) {
        Map<String, dynamic> json = response.data as Map<String, dynamic>;
        Profile dataModel = Profile.fromJson(json);
        return dataModel;
      } else {
        throw Exception('Failed to fetch list from API');
      }
    } catch (e) {
      throw Exception('Failed to fetch list from API: $e');
    }
  }



}