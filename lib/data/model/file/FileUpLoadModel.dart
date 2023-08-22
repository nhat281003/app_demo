import 'package:flutter/material.dart';

class FileUploadModel {
  String? name;
  String? url;
  String? ext;
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  FileUploadModel({this.name, this.url, this.ext});

  factory FileUploadModel.fromJson(Map<String, dynamic> json) =>
      FileUploadModel(
        name: json['name'],
        url: json['url'],
        ext: json['ext'],
      );
}
