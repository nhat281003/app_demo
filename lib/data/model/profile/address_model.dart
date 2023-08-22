class AddressModel {
  int? id;
  String? name;

  AddressModel({this.id, this.name});

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {"id": id, "name": name};
}