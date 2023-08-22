
import 'package:flutter/widgets.dart';

class ApiResponse<T> {
  Status status;
  T? data;
  T? error;

  ApiResponse(this.status, this.data, this.error);

  static ApiResponse loading<ResultType>() {
    return ApiResponse<ResultType>(Status.LOADING, null, null);
  }

  static ApiResponse<ResultType> success<ResultType>(ResultType data) {
    return ApiResponse<ResultType>(Status.SUCCESS, data, null);
  }

  static ApiResponse<ResultType> failed<ResultType>(ResultType error) {
    return ApiResponse<ResultType>(Status.ERROR, null, error);
  }
}

class Error {
  int statusCode;
  String errorMessage;
  String errorBody;

  Error(this.statusCode, this.errorMessage, this.errorBody);
}

enum Status { LOADING, SUCCESS, ERROR }
