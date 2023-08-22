
import 'package:app_3tv/data/base_service/api_response.dart';
import 'package:app_3tv/data/base_service/api_service.dart';
import 'package:app_3tv/data/model/base_model.dart';
import 'package:dio/dio.dart';


abstract class DataFetchCall<T> {

  Future<Response> createApiAsync(Request request,{CancelToken cancelToken});

  T parseJson(Response response);

  Future<ApiResponse<BaseModel>> request(Request request,{CancelToken cancelToken});
}
