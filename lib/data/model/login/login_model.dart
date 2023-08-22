class LoginModel {
  String? accessToken;

  LoginModel({this.accessToken});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accessToken: json["accessToken"],
      );
}
