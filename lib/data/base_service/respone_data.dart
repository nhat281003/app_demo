import 'package:app_3tv/data/base_service/api_response.dart';

class ResponseData<T> {
  Status state;
  List<T>? listData = [];
  T? object;
  String? message;
  int? count;
  dynamic errorCode;

  ResponseData(
      {required this.state,
      this.listData,
      this.object,
      this.message,
      this.count,
      this.errorCode});
}
