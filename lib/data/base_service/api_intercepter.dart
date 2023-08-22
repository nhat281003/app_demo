import 'package:app_3tv/common/utils/app_utils.dart';
import 'package:dio/dio.dart';

class ApiIntercepter extends Interceptor{
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    AppUtils.shared.hideLoading();
    super.onError(err, handler);
  }
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if(!(options.queryParameters.containsKey("search") || options.queryParameters.containsKey("keyWord") || options.queryParameters.containsKey("year") )){
    //  AppUtils.shared.showLoading();
    }
    super.onRequest(options, handler);
  }
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppUtils.shared.hideLoading();

    super.onResponse(response, handler);
  }
}