class FaqModel {
  int? pageIndex;
  int? pageSize;
  int? totalPages;
  int? totalRecords;
  int? beginIndex;
  int? endIndex;
  List<DataFaqModel>? data;

  FaqModel(
      {this.pageIndex,
        this.pageSize,
        this.totalPages,
        this.totalRecords,
        this.beginIndex,
        this.endIndex,
        this.data});

  FaqModel.fromJson(Map<String, dynamic> json) {
    pageIndex = json['pageIndex'];
    pageSize = json['pageSize'];
    totalPages = json['totalPages'];
    totalRecords = json['totalRecords'];
    beginIndex = json['beginIndex'];
    endIndex = json['endIndex'];
    if (json['data'] != null) {
      data = <DataFaqModel>[];
      json['data'].forEach((v) {
        data!.add(DataFaqModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageIndex'] = pageIndex;
    data['pageSize'] = pageSize;
    data['totalPages'] = totalPages;
    data['totalRecords'] = totalRecords;
    data['beginIndex'] = beginIndex;
    data['endIndex'] = endIndex;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DataFaqModel {
  int? createBy;
  String? createTime;
  int? updateBy;
  String? updateTime;
  int? id;
  String? question;
  String? answer;
  bool? status;
  bool? delete;

  DataFaqModel(
      {this.createBy,
        this.createTime,
        this.updateBy,
        this.updateTime,
        this.id,
        this.question,
        this.answer,
        this.status,
        this.delete});

  DataFaqModel.fromJson(Map<String, dynamic> json) {
    createBy = json['createBy'];
    createTime = json['createTime'];
    updateBy = json['updateBy'];
    updateTime = json['updateTime'];
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
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
    data['question'] = question;
    data['answer'] = answer;
    data['status'] = status;
    data['delete'] = delete;
    return data;
  }
}