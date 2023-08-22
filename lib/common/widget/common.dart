
import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/convert_h_w.dart';
import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget dropdownField2(
  value,
  items,
  hint, {
  TextStyle? textStyle,
  Widget? icon,
  double? menuMaxHeight,
  Function? onChanged,
  String? suffixIcon,
  String? title,
  bool? isRequired,
}) {
  TextStyle style = textStyle ?? TextStyleUtils.titleBold14Weigh500;
  TextStyle hintStyle = style.copyWith(color: ColorUtils.grey3,fontSize: ConvertHW.removeHW('14sp3'));
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(
        height: 16.h,
      ),
      RichText(
          text: TextSpan(
              text: title,
              style: TextStyleUtils.sizeText14Weight500()?.copyWith(fontSize: ConvertHW.removeHW('14sp3')),
              children: [
            if (isRequired ?? false)
              TextSpan(
                text: '(*)',
                style: TextStyleUtils.sizeText14Weight500()
                    ?.copyWith(color: Colors.red, fontSize: ConvertHW.removeHW('14sp3')),
              )
          ])),
      if (title != null)
        const SizedBox(
          height: 7,
        ),
      Container(
        height: ConvertHW.removeHW('38h10'),
        margin: const EdgeInsets.only(bottom: 8, top: 5),
        decoration: BoxDecoration(
            color: ColorUtils.COLOR_SUB_BLUE.withOpacity(0.08),
            borderRadius: BorderRadius.all(Radius.circular(7.r))),
        child: Row(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 12.w),
                Image.asset(
                  suffixIcon!,
                  width: ConvertHW.removeHW('17w5'),
                  height: ConvertHW.removeHW('17w5'),
                  fit: BoxFit.contain,
                ),
                SizedBox(width: 7.w),
                Container(
                  margin: EdgeInsets.only(right: 8.w),
                  width: 1,
                  height: ConvertHW.removeHW('18sp'),
                  color: ColorUtils.COLOR_PRIMARY,
                )
              ],
            ),
            Expanded(
                child: DropdownButtonFormField(
              menuMaxHeight: menuMaxHeight,
              isExpanded: true,
              value: value,
              onTap: () {},
              icon: (icon != null)
                  ? icon
                  : const RotatedBox(
                      quarterTurns: 45,
                      child: Icon(
                        Icons.chevron_right_sharp,
                        color: ColorUtils.COLOR_TEXT_BLACK87,
                        size: 24,
                      ),
                    ),
              hint: Text(
                hint,
                style: TextStyleUtils.titleBold14Weigh500.copyWith(fontSize: ConvertHW.removeHW('14sp3')),
                overflow: TextOverflow.visible,
              ),
              iconSize: 20,
              style: TextStyleUtils.titleBold14Weigh500
                  .copyWith(overflow: TextOverflow.ellipsis,fontSize: ConvertHW.removeHW('14sp3')),
              decoration: InputDecoration.collapsed(
                hintText: hint,
                hintStyle: hintStyle,
              ),
              onChanged: (onChanged != null)
                  ? (value) {
                      onChanged(value);
                    }
                  : null,
              items: items,
            ))
          ],
        ),
      )
    ],
  );
}

Widget dropdownField(
  value,
  items,
  hint, {
  TextStyle? textStyle,
  Widget? icon,
  double? menuMaxHeight,
  Function? onChanged,
  String? suffixIcon,
  String? title,
  bool? isRequired,
}) {
  TextStyle style = textStyle ?? TextStyleUtils.titleBold14Weigh500;
  TextStyle hintStyle = style.copyWith(color: ColorUtils.grey3,fontSize: ConvertHW.removeHW('14sp3'));
  return DropdownButtonFormField(
    menuMaxHeight: menuMaxHeight,
    isExpanded: true,
    value: value,
    onTap: () {},
    icon: (icon != null)
        ? icon
        : const RotatedBox(
            quarterTurns: 45,
            child: Icon(
              Icons.chevron_right_sharp,
              color: ColorUtils.COLOR_TEXT_BLACK87,
              size: 24,
            ),
          ),
    hint: Text(
      hint,
      style: TextStyleUtils.titleBold14Weigh500.copyWith(fontSize: ConvertHW.removeHW('14sp3')),
      overflow: TextOverflow.visible,
    ),
    iconSize: 20,
    style: TextStyleUtils.titleBold14Weigh500
        .copyWith(overflow: TextOverflow.ellipsis,fontSize: ConvertHW.removeHW('14sp3')),
    decoration: InputDecoration.collapsed(
      hintText: hint,
      hintStyle: hintStyle,
    ),
    onChanged: (onChanged != null)
        ? (value) {
            onChanged(value);
          }
        : null,
    items: items,
  );
}
