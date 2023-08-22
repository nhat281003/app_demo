
import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/convert_h_w.dart';
import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CusstomDropdown extends StatelessWidget {
  CusstomDropdown(
      {Key? key,
      this.onSaved,
      this.onChanged,
      this.value,
      this.iconEnabledColor,
      this.suffixIcon,
      this.radius = 8,
      this.isDense = false,
      this.buttonHeight,
      this.style,
      this.iconDisabledColor,
      this.borderColor = ColorUtils.BG_COLOR,
      this.buttonPadding,
      this.hint,
      required this.map,
      this.labelStyle,
      this.labelText,
      this.hintStyle,
      this.filled = false, this.isRequired, this.title, this.iconAsset})
      : super(key: key);
  String? selectedValue;
  final _formKey = GlobalKey<FormState>();
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final String? value;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final Widget? suffixIcon;
  final bool isDense;
  final Color borderColor;
  final double radius;
  final double? buttonHeight;
  final TextStyle? style;
  final EdgeInsetsGeometry? buttonPadding;
  final TextStyle? labelStyle;
  final String? labelText;
  final Widget? hint;
  final TextStyle? hintStyle;
  final List<String> map;
  final bool filled;
  final bool? isRequired;
  final String? title;
  final String? iconAsset;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 7,
          ),
          RichText(
              text: TextSpan(
                  text: title,
                  style: TextStyleUtils.sizeText14Weight500(),
                  children: [
                    if (isRequired ?? false)
                      TextSpan(
                        text: '(*)',
                        style: TextStyleUtils.sizeText14Weight500()
                            ?.copyWith(color: Colors.red),
                      )
                  ])),
          if (title != null)
            const SizedBox(
              height: 7,
            ),
          DropdownButtonFormField2(
            hint: hint,
            buttonPadding: buttonPadding,
            buttonHeight: buttonHeight,
            value: value,
            style: style,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 8.w),
              labelText: labelText,
              labelStyle: labelStyle ??
                  TextStyleUtils.sizeText15Weight500()?.copyWith(
                    color: ColorUtils.textColor,
                  ),
              hintStyle: hintStyle,
              fillColor: ColorUtils.COLOR_SUB_BLUE.withOpacity(0.08),
              filled: true,
              suffixIcon: suffixIcon,
              suffixIconConstraints: BoxConstraints(
                minHeight: 6.h,
                minWidth: 8.w,
              ),
              prefixIcon: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: ConvertHW.removeHW('12w3')),
                  Image.asset(
                    iconAsset!,
                    width: ConvertHW.removeHW('18w5'),
                    height: ConvertHW.removeHW('18w5'),
                    fit: BoxFit.contain,
                  ),
                  SizedBox(width: ConvertHW.removeHW('7w2')),
                  Container(
                    width: 1,
                    height: ConvertHW.removeHW('18sp'),
                    color: ColorUtils.COLOR_SUB_GREEN,
                  )
                ],
              ),
              prefixIconConstraints: BoxConstraints(
                minHeight: 6.h,
                minWidth: 8.w,
              ),
              isDense: isDense,
              border: OutlineInputBorder(
                borderSide: BorderSide(color: borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: borderColor),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: borderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: borderColor),
              ),
            ),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            items: map
                .map((item) => DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: style,
              ),
            ))
                .toList(),
            isExpanded: true,
            onChanged: onChanged,
            iconEnabledColor: iconEnabledColor,
            iconDisabledColor: iconDisabledColor,
            onSaved: onSaved,
          ),

        ],
      ),
    );
  }
}
