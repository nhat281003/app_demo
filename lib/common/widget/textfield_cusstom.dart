
import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldFilter extends StatelessWidget {
  const TextFieldFilter({Key? key, this.controller, this.hintText}) : super(key: key);
  final TextEditingController? controller;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 23.h,
      child: TextField(
          controller: controller,
          style: TextStyleUtils.sizeText12Weight500(),
          decoration: InputDecoration(
              prefixIcon: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Image.asset("assets/icons/ic_dropdown.png", fit: BoxFit.contain, width: 8.w, height: 6.h),
              ),
              prefixIconConstraints: BoxConstraints(
                minHeight: 6.h,
                minWidth: 9.h,
              ),
              border:  const OutlineInputBorder(
                borderSide: BorderSide(color: ColorUtils.BG_COLOR),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorUtils.BG_COLOR),
              ),
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorUtils.BG_COLOR),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: ColorUtils.BG_COLOR),
              ),
              contentPadding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
              hintText: hintText,
              hintStyle: TextStyleUtils.sizeText11Weight400()?.copyWith(color: ColorUtils.COLOR_TEXT_BLACK51.withOpacity(0.6)))),
    );
  }
}

class TextFieldLabelCustom extends StatelessWidget {
  const TextFieldLabelCustom({
    Key? key,
    this.controller,
    this.hintText,
    this.initialValue,
    this.height = 40,
    this.borderColor = ColorUtils.colorOrange,
    this.prefixIcon,
    this.suffixIcon,
    this.labelText,
    this.radius = 8,
    this.hintStyle,
    this.style,
    this.enabled = true,
    this.filled = false,
    this.onChanged,
    this.labelStyle,
    this.keyboardType,
    this.inputFormatters,
  }) : super(key: key);
  final TextEditingController? controller;
  final String? hintText;
  final String? initialValue;
  final double height;
  final double radius;
  final Color borderColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final TextStyle? hintStyle;
  final TextStyle? style;
  final TextStyle? labelStyle;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final bool enabled;
  final bool filled;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      child: TextFormField(
          enabled: enabled,
          initialValue: initialValue,
          inputFormatters: inputFormatters,
          style: style ?? TextStyleUtils.sizeText12Weight500(),
          controller: controller,
          onChanged: onChanged,
          keyboardType: keyboardType,
          decoration: InputDecoration(
              fillColor: Colors.grey.shade100,
              filled: filled,
              prefixIcon: prefixIcon,
              labelText: labelText,
              labelStyle: labelStyle ??
                  TextStyleUtils.sizeText15Weight500()?.copyWith(
                    color: ColorUtils.textColor,
                  ),
              suffixIcon: suffixIcon,
              border: OutlineInputBorder(borderSide: BorderSide(color: borderColor), borderRadius: BorderRadius.circular(radius)),
              focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: borderColor), borderRadius: BorderRadius.circular(radius)),
              disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: borderColor), borderRadius: BorderRadius.circular(radius)),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: borderColor), borderRadius: BorderRadius.circular(radius)),
              contentPadding: const EdgeInsets.only(bottom: 8, left: 16, right: 8),
              hintText: hintText,
              hintStyle: hintStyle ?? TextStyleUtils.sizeText12Weight500()?.copyWith(color: ColorUtils.textColor))),
    );
  }
}

