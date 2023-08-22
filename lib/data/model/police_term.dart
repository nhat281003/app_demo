class PolicyTermsModel {
  int? createBy;
  String? createTime;
  int? updateBy;
  String? updateTime;
  int? id;
  String? title;
  String? content;
  bool? status;
  bool? delete;

  PolicyTermsModel(
      {this.createBy,
        this.createTime,
        this.updateBy,
        this.updateTime,
        this.id,
        this.title,
        this.content,
        this.status,
        this.delete});

  PolicyTermsModel.fromJson(Map<String, dynamic> json) {
    createBy = json['createBy'];
    createTime = json['createTime'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    id = json['id'];
    title = json['title'];
    content = json['content'];
    status = json['status'];
    delete = json['delete'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createBy'] = createBy;
    data['createTime'] = createTime;
    data['updateBy'] = updateBy;
    data['updateTime'] = updateTime;
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['status'] = status;
    data['delete'] = delete;
    return data;
  }
}