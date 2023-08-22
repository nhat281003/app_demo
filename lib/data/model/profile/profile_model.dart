import 'package:app_3tv/data/model/profile/address_model.dart';

class ProfileModel {
  int? id;
  String? avatar;
  String? fullName;
  dynamic level;
  dynamic point;
  dynamic phone;
  String? email;
  bool? notification;
  AddressModel? province;
  AddressModel? district;
  AddressModel? ward;
  String? address;

  ProfileModel({
    this.id,
    this.avatar,
    this.fullName,
    this.level,
    this.point,
    this.phone,
    this.email,
    this.notification,
    this.province,
    this.district,
    this.ward,
    this.address,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        id: json["id"],
        avatar: json["avatar"],
        fullName: json["fullName"],
        level: json["level"],
        point: json["point"],
        phone: json["phone"],
        email: json["email"],
        notification: json["notification"],
        province: json["province"] == null
            ? null
            : AddressModel.fromJson(json["province"]),
        district: json["district"] == null
            ? null
            : AddressModel.fromJson(json["district"]),
        ward: json["ward"] == null
            ? null
            : AddressModel.fromJson(json["ward"]),
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "avatar": avatar,
        "fullName": fullName,
        "level": level,
        "point": point,
        "phone": phone,
        "email": email,
        "notification": notification,
        "province": province?.toJson(),
        "district": district?.toJson(),
        "ward": ward?.toJson(),
        "address": address,
      };
}
