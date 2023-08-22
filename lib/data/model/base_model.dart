class BaseModel {
  String? requestId;
  String? at;
  int status = 0;
  String? message;
  dynamic data;

  BaseModel({this.requestId, this.at, this.status = 0, this.data,  this.message});

  BaseModel.fromJson(Map<String, dynamic> json) {
    requestId = json['requestId'];
    at = json['at'];
    status = json['error'] != null ? ErrorModel.fromJson(json['error']).code : -1;
    message = json['error'] != null ? ErrorModel.fromJson(json['error']).message : "";
    data = json['data'];
  }
}

class ErrorModel {
  int code =0;
  String? message;

  ErrorModel({this.code = 0, this.message});

  ErrorModel.fromJson(Map<String, dynamic> json) {
    code = json['code']??0;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['message'] = message;
    return data;
  }
}