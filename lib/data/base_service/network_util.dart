import 'dart:io';
import 'package:app_3tv/common/constants/api_constant.dart';
import 'package:app_3tv/common/constants/error_code_constant.dart';
import 'package:app_3tv/data/base_service/api_intercepter.dart';
import 'package:app_3tv/data/model/base_model.dart';
import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';



class NetworkUtil {
  final Dio _dio = Dio();

  NetworkUtil() {
    ///Create Dio Object using baseOptions set receiveTimeout,connectTimeout
    BaseOptions options = BaseOptions(
        receiveTimeout:
             const Duration(milliseconds: ApiConstants.RECIEVE_TIMEOUT),
        connectTimeout:
            const Duration(milliseconds: ApiConstants.RECIEVE_TIMEOUT));
    _dio.options = options;
    _dio.interceptors
        .add(LogInterceptor(requestBody: true, responseBody: true));
    _dio.interceptors.add(ApiIntercepter());
    _dio.interceptors.add(
        CurlLoggerDioInterceptor(printOnSuccess: true, convertFormData: true));
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }

  ///used for calling Get Request
  Future<Response> get(String url,
      {dynamic mapData,
      Map<String, dynamic>? params,
      Map<String, dynamic>? headers,
      CancelToken? cancelToken}) async {
    try {
      Response response;
      response = await _dio.get(url,
          data: mapData,
          queryParameters: params,
          cancelToken: cancelToken,
          options:
          Options(responseType: ResponseType.json, headers: headers));
      return response;
    } on DioError catch (e) {
      return response(e, url);
    }
  }

  static Future<bool> hasConnection() async {
    try {
      final List<InternetAddress> result =
          await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }

  // Map<String, dynamic> header = {"Authorization": AppCache().token};

  ///used for calling post Request
  Future<Response> post(
    String url, {
    Map<String, dynamic>? headers,
    dynamic mapData,
    FormData? formData,
    Map<String, dynamic>? params,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response;
      if ((formData == null)) {
        response = await _dio.post(url,
            data: mapData,
            cancelToken: cancelToken,
            queryParameters: params,
            options: Options(
              responseType: ResponseType.json,
              headers: headers,
            ));
      } else {
        response = await _dio.post(url,
            data: formData,
            queryParameters: params,
            cancelToken: cancelToken,
            options: Options(
              responseType: ResponseType.json,
              headers: headers,
            ));
      }
      return response;
    } on DioError catch (e) {
      return response(e, url);
    }
  }

  Future<Response> put(
    String url, {
    Map<String, dynamic>? headers,
    Map<String, dynamic>? mapData,
    FormData? formData,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await _dio.put(url,
          data: (mapData == null) ? formData : mapData,
          cancelToken: cancelToken,
          options: Options(responseType: ResponseType.json, headers: headers));
      return response;
    } on DioError catch (e) {
      return response(e, url);
    }
  }

  Future<Response> delete(
    String url, {
    Map<String, dynamic>? data,
    Map<String, dynamic>? headers,
    CancelToken? cancelToken,
  }) async {
    try {
      Response response = await _dio.delete(url,
          cancelToken: cancelToken,
          data: data,
          options: Options(responseType: ResponseType.json, headers: headers));
      return response;
    } on DioError catch (e) {
      return response(e, url);
    }
  }

  Response response(DioError e, url) {
    Response response;
    response = e.response ??
        Response(data: BaseModel( message: ErrorCodeConstant.SERVER_ERROR),
            requestOptions: RequestOptions(path: url));
    return response;
  }
}

final networkUtil = NetworkUtil();
