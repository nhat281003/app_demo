class RegisterModel {
  String? transId;

  RegisterModel({this.transId});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        transId: json["transId"],
      );
}
