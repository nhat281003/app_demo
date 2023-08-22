import 'package:app_3tv/common/app_cache.dart';
import 'package:app_3tv/data/base_service/api_response.dart';
import 'package:app_3tv/data/base_service/data_fetch_call.dart';
import 'package:app_3tv/data/base_service/network_util.dart';
import 'package:app_3tv/data/model/base_model.dart';
import 'package:app_3tv/view/login/login_controller.dart';
import 'package:dio/dio.dart';


enum Request { POST, GET, PUT, DELETE }

class ApiService extends DataFetchCall<BaseModel> {
  String _path = "";
  dynamic _request;
  Map<String, dynamic>? _params;
  Map<String, dynamic>? _header;
  FormData? _fromData;
  String? sessionId;

  ApiService(String path,
      {Map<String, dynamic>? params,
      this.sessionId,
      FormData? fromData,
      dynamic request,
      Map<String, dynamic>? header}) {
    _request = request ?? {};
    _path = path;
    _fromData = fromData;
    _header = header;
    _params = params;
  }

  Map<String, dynamic> getHeader() {
    var token = AppCache().token;
    if (token == null || token.length == 0) {
      return {
        "channel": "APP_MOBILE",
      };
    } else {
      return {
        "Authorization": "Bearer ${AppCache().token}",
        "channel": "APP_MOBILE",
      };
    }
  }

  @override
  Future<Response> createApiAsync(Request request, {CancelToken? cancelToken}) {
    switch (request) {
      case Request.POST:
        return networkUtil.post(
          _path,
          formData: _fromData,
          mapData: _request,
          params: _params,
          headers: _header ?? getHeader(),
          cancelToken: cancelToken,
        );
      case Request.GET:
        return networkUtil.get(
          _path,
          mapData: _request,
          params: _params,
          headers: _header ?? getHeader(),
          cancelToken: cancelToken,
        );
      case Request.PUT:
        if (_request.isNotEmpty) {
          return networkUtil.put(
            _path,
            formData: _fromData,
            mapData: _request,
            headers: _header ?? getHeader(),
            cancelToken: cancelToken,
          );
        } else {
          return networkUtil.put(
            _path,
            formData: _fromData,
            headers: _header ?? getHeader(),
            cancelToken: cancelToken,
          );
        }
      default:
        if (_request.isNotEmpty) {
          return networkUtil.delete(
            _path,
            data: _request ?? {},
            headers: _header ?? getHeader(),
            cancelToken: cancelToken,
          );
        } else {
          return networkUtil.delete(
            _path,
            headers: _header ?? getHeader(),
            cancelToken: cancelToken,
          );
        }
    }
  }

  @override
  BaseModel parseJson(Response response) {
    return BaseModel.fromJson(response.data);
  }

  @override
  Future<ApiResponse<BaseModel>> request(Request request,
      {CancelToken? cancelToken}) async {
    {
      try {
        AppCache appCache = AppCache();
        bool checkInternet = await NetworkUtil.hasConnection();
        if (checkInternet) {
          var response =
              await createApiAsync(request, cancelToken: cancelToken);
          BaseModel responseModel = parseJson(response);
          if (response.statusCode == 200) {
            return ApiResponse.success<BaseModel>(responseModel);
          } else if (response.statusCode == 400) {
            return ApiResponse.failed<BaseModel>(BaseModel(
                status: -1, message: response.data['error']['message']));
          } else if (response.statusCode == 401) {

            return ApiResponse.failed<BaseModel>(BaseModel(
                status: -1, message: response.data['error']['message']));
          } else if (response.statusCode == 403) {
            return ApiResponse.failed<BaseModel>(BaseModel(
                status: -1, message: response.data['error']['message']));
          } else if (response.statusCode == 500) {
            return ApiResponse.failed<BaseModel>(BaseModel(
                status: -1, message: response.data['error']['message']));
          } else {
            return ApiResponse.failed<BaseModel>(BaseModel(
                status: -1, message: "Lỗi kết nối: ${response.statusCode}"));
          }
        } else {
          return ApiResponse.failed<BaseModel>(BaseModel(
              status: -1,
              message: "Không có kết nối. Vui lòng kiểm tra kết nối mạng!"));
        }
      } catch (error, stacktrace) {
        return ApiResponse.failed<BaseModel>(
            BaseModel(status: -1, message: stacktrace.toString()));
      }
    }
  }
}
