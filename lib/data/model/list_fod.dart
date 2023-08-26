class listFood {
  String? name;
  String? avatar;
  String? desscriptions;
  int? time;
  String? id;

  listFood({this.name, this.avatar, this.desscriptions, this.time, this.id});

  listFood.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    avatar = json['avatar'];
    desscriptions = json['desscriptions'];
    time = json['time'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['avatar'] = avatar;
    data['desscriptions'] = desscriptions;
    data['time'] = time;
    data['id'] = id;
    return data;
  }
}