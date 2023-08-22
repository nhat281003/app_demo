
import 'package:app_3tv/common/constants/size_utils.dart';
import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:flutter/material.dart';

class TextFieldCustom extends StatelessWidget {
  TextFieldCustom({
    Key? key,
    required this.hinText,
    required this.controller,
    required this.borderRadius,
    this.maxLines,
    this.hintStyle,
    this.inputStyle,
    this.suffixIcon,
    this.onChange,
  }) : super(key: key);
  bool readOnly = false;
  final String hinText;
  final TextEditingController controller;
  final double borderRadius;
  final int? maxLines;
  final TextStyle? hintStyle;
  final TextStyle? inputStyle;
  Widget? suffixIcon;
  Widget? prefixIcon;
  Function(String)? onChange;

  @override
  Widget build(BuildContext context) {
    Widget? suffixView;
    if (!readOnly) {
      if (suffixIcon != null) {
        suffixView = suffixIcon;
      } else {
        suffixView = InkWell(
          child: const Icon(
            Icons.clear,
            size: 18,
            color: ColorUtils.COLOR_BG_TOOLBAR,
          ),
          onTap: () {
            controller.clear();
          },
        );
      }
    } else {
      suffixView = suffixIcon;
    }
    return Container(
        // alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            color: ColorUtils.COLOR_PRIMARY
                .withOpacity(SizeUtils.OPACITY_COLOR_PRIMARY_CONTAINER),
            borderRadius: BorderRadius.all(Radius.circular(borderRadius))),
        child: TextField(
          maxLines: maxLines,
          controller: controller,
          style: inputStyle ??
              TextStyleUtils.sizeText11Weight400()
                  ?.copyWith(color: Colors.black),
          onChanged: onChange,
          decoration: InputDecoration(
            suffixIcon: suffixView,
            counterText: '',
            hintStyle: hintStyle ??
                TextStyleUtils.sizeText12Weight400()
                    ?.copyWith(color: Colors.grey),
            hintText: hinText,
            filled: true,
            fillColor: ColorUtils.COLOR_PRIMARY.withOpacity(0.01),
            labelStyle: TextStyleUtils.sizeText10Weight400()
                ?.copyWith(color: ColorUtils.colorText),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide.none),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide.none),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide.none),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide.none),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide.none),
            contentPadding: EdgeInsets.only(left: 12, top: 8, bottom: 8),
          ),
        ));
  }
}
