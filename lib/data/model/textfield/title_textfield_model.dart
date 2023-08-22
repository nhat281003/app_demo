import 'package:flutter/material.dart';

class TitleTextFieldModel {
  TextEditingController editingController = TextEditingController();
  bool isShowPassword = false;
  String? iconAsset;
  bool? isPassword;
  String? hintText;
  String? title;
  bool? isRequired;
  Widget? widget;
  int? maxLine;
  TextInputType? textInputType;
  bool? isEmail;
  bool? isPhone;
  String? textErrorEmail;
  String? textErrorNumber;
  int? maxLength;

  TitleTextFieldModel({
    this.iconAsset,
    this.isPassword,
    this.hintText,
    this.title,
    this.isRequired,
    this.widget,
    this.maxLine,
    this.textInputType,
    this.isEmail,
    this.isPhone,
    this.textErrorNumber,
    this.textErrorEmail,
    this.maxLength,
  });
}
