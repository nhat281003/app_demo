
import 'package:app_3tv/common/utils/AlwaysDisabledFocusNode.dart';
import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/convert_h_w.dart';
import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

/// Được tạo bởi Phạm Nhớ từ 09/10/2022
/// mọi hành vi sao chép cần được sự cho phép

Widget InputFieldCustom1(TextEditingController? controller, bool? obscureText,
    String? labelText, String? errorText,
    {Widget? prefixIcon,
    Widget? suffixIcon,
    bool readOnly = false,
    TextStyle? labelStyle,
    TextInputType? textInputType,
    Function(String)? onChange,
    List<TextInputFormatter>? inputFormatters,
    Color? colorBorder,
    bool? shadow,
    EdgeInsets? contentPadding,
    bool? autoFocus,
    bool? isEnabledEdit,
    int? maxLength,
    TextStyle? textStyleInput,
    TextStyle? textStyleHint,
    Color? backgroundColor,
    Color? colorFocus,
    int? maxLine,
    FocusNode? focusNode,
    Function? onTap,
    Function? onSubmitted}) {
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
          controller?.clear();
        },
      );
    }
  } else {
    suffixView = suffixIcon;
  }
  return TextField(
    maxLines: maxLine ?? 1,
    focusNode: focusNode,
    enableSuggestions: false,
    maxLength: maxLength,
    autofocus: autoFocus ?? false,
    enabled: isEnabledEdit ?? true,
    readOnly: readOnly,
    controller: controller,
    cursorColor: ColorUtils.COLOR_PRIMARY,
    keyboardType: textInputType ?? TextInputType.text,
    inputFormatters: inputFormatters,
    onChanged: onChange,
    obscureText: obscureText ?? false,
    obscuringCharacter: "*",
    textAlign: TextAlign.start,
    style: textStyleInput ??
        TextStyleUtils.sizeText13Weight400()?.copyWith(
          color:
              readOnly == true ? ColorUtils.colorBEBEBE : ColorUtils.colorText,
          fontSize: ConvertHW.removeHW('14sp6'),
        ),
    onTap: () => onTap != null ? onTap() : null,
    onSubmitted: (value) => onSubmitted != null ? onSubmitted() : null,
    decoration: InputDecoration(
        counterText: '',
        filled: true,
        fillColor: backgroundColor ?? Colors.white,
        prefixIcon: prefixIcon,
        suffixIcon: suffixView,
        hintText: labelText,
        hintStyle: textStyleHint ??
            TextStyleUtils.sizeText14Weight500()?.copyWith(
                color: ColorUtils.colorBEBEBE,
                fontSize: ConvertHW.removeHW('14sp3')),
        labelStyle: labelStyle ??
            TextStyleUtils.sizeText14Weight500()?.copyWith(
              color: ColorUtils.colorText,
            ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(
              width: 1,
              color: colorFocus ?? ColorUtils.COLOR_PRIMARY.withOpacity(0.5),
            )),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(
              width: 1,
              color: colorBorder ?? ColorUtils.COLOR_PRIMARY.withOpacity(0.18),
            )),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: const BorderSide(
              width: 1,
              color: ColorUtils.colorF51911,
            )),
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide.none),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7.r),
            borderSide: BorderSide(
              width: 1,
              color: ColorUtils.COLOR_PRIMARY.withOpacity(0.5),
            )),
        errorText: errorText == "" ? null : errorText,
        contentPadding: contentPadding ?? const EdgeInsets.all(16),
        errorStyle: TextStyleUtils.sizeText14Weight400()
            ?.copyWith(color: ColorUtils.colorF51911)),
  );
}

Widget getIconPrefix(String path) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(width: 12.w),
      Image.asset(
        path,
        width: 18.w,
        fit: BoxFit.fill,
      ),
      SizedBox(width: 7.w),
      Container(
        width: 2.w,
        height: 28.h,
        color: ColorUtils.COLOR_BG_TOOLBAR,
      ),
      SizedBox(width: 6.w),
    ],
  );
}

Widget getIconSuffix(String path) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(width: 6.w),
      Container(
        width: 2.w,
        height: 28.h,
        color: ColorUtils.COLOR_BG_TOOLBAR,
      ),
      SizedBox(width: 7.w),
      Image.asset(
        path,
        width: 18.w,
        fit: BoxFit.fill,
      ),
      SizedBox(width: 12.w),
    ],
  );
}

Widget InputFieldCustomHero(
  TextEditingController? controller,
  bool? obscureText,
  String? hintText,
  String? errorText, {
  Widget? prefixIcon,
  Widget? suffixIcon,
  styleBorderError,
  TextInputType? textInputType,
  bool enable = true,
  bool autoFocus = false,
  int? maxLength,
  int? maxLines,
  int? minLines,
}) {
  Widget? suffixView;
  if (enable) {
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
          controller?.clear();
        },
      );
    }
  } else {
    suffixView = suffixIcon;
  }
  return Material(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(7.r)),
    elevation: 1,
    child: (enable)
        ? TextField(
            autofocus: autoFocus,
            minLines: minLines,
            maxLength: maxLength,
            maxLines: maxLines,
            enableInteractiveSelection: enable ? true : false,
            // will disable paste operation
            focusNode: enable ? FocusNode() : AlwaysDisabledFocusNode(),
            controller: controller,
            keyboardType: textInputType ?? TextInputType.text,
            obscureText: obscureText ?? false,
            obscuringCharacter: "*",
            textAlign: TextAlign.start,
            style: TextStyleUtils.sizeText14Weight500()
                ?.copyWith(color: ColorUtils.colorText),
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyleUtils.sizeText12Weight500()?.copyWith(
                    color: ColorUtils.colorACAFB2,
                    fontSize: GetPlatform.isMobile ? 17.h : 17),
                prefixIcon: prefixIcon,
                suffixIcon: suffixView,
                focusedBorder: styleBorderError ??
                    OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: ColorUtils.COLOR_BG_TOOLBAR.withOpacity(0.5),
                        )),
                enabledBorder: styleBorderError ??
                    OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: ColorUtils.COLOR_BG_TOOLBAR.withOpacity(0.5),
                        )),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                    borderSide: BorderSide(
                      width: 2.w,
                      color: ColorUtils.colorF51911,
                    )),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                    borderSide: BorderSide(
                      width: 1.w,
                      color: ColorUtils.color1D7AB4.withOpacity(0.5),
                    )),
                errorText: errorText == "" ? null : errorText,
                contentPadding: const EdgeInsets.all(8),
                errorStyle: TextStyleUtils.sizeText14Weight400()?.copyWith(
                    color: ColorUtils.colorF51911,
                    height: 1.5,
                    backgroundColor: Colors.transparent)),
          )
        : IgnorePointer(
            child: TextField(
              maxLength: maxLength,
              maxLines: maxLines,
              enableInteractiveSelection: enable ? true : false,
              controller: controller,
              keyboardType: textInputType ?? TextInputType.text,
              obscureText: obscureText ?? false,
              obscuringCharacter: "*",
              textAlign: TextAlign.start,
              style: TextStyleUtils.sizeText14Weight500()
                  ?.copyWith(color: ColorUtils.colorText),
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyleUtils.sizeText12Weight500()
                      ?.copyWith(color: ColorUtils.colorACAFB2),
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: ColorUtils.COLOR_BG_TOOLBAR.withOpacity(0.5),
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: ColorUtils.COLOR_BG_TOOLBAR.withOpacity(0.5),
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.r),
                      borderSide: BorderSide(
                        width: 2.w,
                        color: ColorUtils.colorF51911,
                      )),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: ColorUtils.color1D7AB4.withOpacity(0.5),
                      )),
                  errorText: errorText == "" ? null : errorText,
                  contentPadding: const EdgeInsets.all(8),
                  errorStyle: TextStyleUtils.sizeText14Weight400()
                      ?.copyWith(color: ColorUtils.colorF51911, height: 1.5)),
            ),
          ),
  );
}

Widget InputFieldCustom2(
  TextEditingController? controller,
  bool? obscureText,
  String? hintText,
  String? errorText, {
  Widget? prefixIcon,
  Widget? suffixIcon,
  styleBorderError,
  TextInputType? textInputType,
  bool enable = true,
  bool autoFocus = false,
  int? maxLength,
  int? maxLines,
  int? minLines,
}) {
  Widget? suffixView;
  if (enable) {
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
          controller?.clear();
        },
      );
    }
  } else {
    suffixView = suffixIcon;
  }
  return Material(
    borderRadius: BorderRadius.all(Radius.circular(7.r)),
    elevation: 1,
    shadowColor: ColorUtils.color1D7AB4.withOpacity(0.18),
    child: (enable)
        ? TextField(
            autofocus: autoFocus,
            minLines: minLines,
            maxLength: maxLength,
            maxLines: maxLines,
            enableInteractiveSelection: enable ? true : false,
            // will disable paste operation
            focusNode: enable ? FocusNode() : AlwaysDisabledFocusNode(),
            controller: controller,
            keyboardType: textInputType ?? TextInputType.text,
            obscureText: obscureText ?? false,
            obscuringCharacter: "*",
            textAlign: TextAlign.start,
            style: TextStyleUtils.sizeText14Weight500()
                ?.copyWith(color: ColorUtils.colorText),
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyleUtils.sizeText12Weight500()
                    ?.copyWith(color: ColorUtils.colorACAFB2),
                prefixIcon: prefixIcon,
                suffixIcon: suffixView,
                focusedBorder: styleBorderError ??
                    OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: ColorUtils.color1D7AB4.withOpacity(0.18),
                        )),
                enabledBorder: styleBorderError ??
                    OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: ColorUtils.color1D7AB4.withOpacity(0.18),
                        )),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                    borderSide: BorderSide(
                      width: 2.w,
                      color: ColorUtils.colorF51911,
                    )),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                    borderSide: BorderSide(
                      width: 1.w,
                      color: ColorUtils.color1D7AB4.withOpacity(0.5),
                    )),
                errorText: errorText == "" ? null : errorText,
                contentPadding: const EdgeInsets.all(8),
                errorStyle: TextStyleUtils.sizeText14Weight400()?.copyWith(
                    color: ColorUtils.colorF51911,
                    height: 1.5,
                    backgroundColor: Colors.transparent)),
          )
        : IgnorePointer(
            child: TextField(
              maxLength: maxLength,
              maxLines: maxLines,
              enableInteractiveSelection: enable ? true : false,
              controller: controller,
              keyboardType: textInputType ?? TextInputType.text,
              obscureText: obscureText ?? false,
              obscuringCharacter: "*",
              textAlign: TextAlign.start,
              style: TextStyleUtils.sizeText14Weight500()
                  ?.copyWith(color: ColorUtils.colorText),
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyleUtils.sizeText12Weight500()
                      ?.copyWith(color: ColorUtils.colorACAFB2),
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: ColorUtils.color1D7AB4.withOpacity(0.18),
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: ColorUtils.color1D7AB4.withOpacity(0.18),
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.r),
                      borderSide: BorderSide(
                        width: 2.w,
                        color: ColorUtils.colorF51911,
                      )),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: ColorUtils.color1D7AB4.withOpacity(0.18),
                      )),
                  errorText: errorText == "" ? null : errorText,
                  contentPadding: const EdgeInsets.all(8),
                  errorStyle: TextStyleUtils.sizeText14Weight400()
                      ?.copyWith(color: ColorUtils.colorF51911, height: 1.5)),
            ),
          ),
  );
}

Widget InputFieldCustomNoBorder(
  TextEditingController? controller,
  bool? obscureText,
  String? hintText,
  String? errorText, {
  Widget? prefixIcon,
  Widget? suffixIcon,
  styleBorderError,
  TextInputType? textInputType,
  bool enable = true,
  bool autoFocus = false,
  int? maxLength,
  int? maxLines,
  int? minLines,
}) {
  Widget? suffixView;
  if (enable) {
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
          controller?.clear();
        },
      );
    }
  } else {
    suffixView = suffixIcon;
  }
  return Material(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(0.r)),
    elevation: 0,
    child: (enable)
        ? TextField(
            autofocus: autoFocus,
            minLines: minLines,
            maxLength: maxLength,
            maxLines: maxLines,
            enableInteractiveSelection: enable ? true : false,
            // will disable paste operation
            focusNode: enable ? FocusNode() : AlwaysDisabledFocusNode(),
            controller: controller,
            keyboardType: textInputType ?? TextInputType.text,
            obscureText: obscureText ?? false,
            obscuringCharacter: "*",
            textAlign: TextAlign.start,
            style: TextStyleUtils.sizeText14Weight500()
                ?.copyWith(color: ColorUtils.colorText),
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyleUtils.sizeText12Weight500()
                    ?.copyWith(color: ColorUtils.colorACAFB2),
                prefixIcon: prefixIcon,
                suffixIcon: suffixView,
                focusedBorder: styleBorderError ??
                    OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: ColorUtils.COLOR_BG_TOOLBAR.withOpacity(0),
                        )),
                enabledBorder: styleBorderError ??
                    OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.r),
                        borderSide: BorderSide(
                          width: 1.w,
                          color: ColorUtils.COLOR_BG_TOOLBAR.withOpacity(0),
                        )),
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                    borderSide: BorderSide(
                      width: 2.w,
                      color: ColorUtils.colorF51911.withOpacity(0),
                    )),
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(7.r),
                    borderSide: BorderSide(
                      width: 1.w,
                      color: ColorUtils.color1D7AB4.withOpacity(0),
                    )),
                errorText: errorText == "" ? null : errorText,
                contentPadding: const EdgeInsets.all(8),
                errorStyle: TextStyleUtils.sizeText14Weight400()?.copyWith(
                    color: ColorUtils.colorF51911,
                    height: 1.5,
                    backgroundColor: Colors.transparent)),
          )
        : IgnorePointer(
            child: TextField(
              maxLength: maxLength,
              maxLines: maxLines,
              enableInteractiveSelection: enable ? true : false,
              controller: controller,
              keyboardType: textInputType ?? TextInputType.text,
              obscureText: obscureText ?? false,
              obscuringCharacter: "*",
              textAlign: TextAlign.start,
              style: TextStyleUtils.sizeText14Weight500()
                  ?.copyWith(color: ColorUtils.colorText),
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyleUtils.sizeText12Weight500()
                      ?.copyWith(color: ColorUtils.colorACAFB2),
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: ColorUtils.COLOR_BG_TOOLBAR.withOpacity(0),
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: ColorUtils.COLOR_BG_TOOLBAR.withOpacity(0),
                      )),
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.r),
                      borderSide: BorderSide(
                        width: 2.w,
                        color: ColorUtils.colorF51911.withOpacity(0),
                      )),
                  focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color: ColorUtils.color1D7AB4.withOpacity(0),
                      )),
                  errorText: errorText == "" ? null : errorText,
                  contentPadding: const EdgeInsets.all(8),
                  errorStyle: TextStyleUtils.sizeText14Weight400()
                      ?.copyWith(color: ColorUtils.colorF51911, height: 1.5)),
            ),
          ),
  );
}

Widget getContainerCustom({required String iconAsset, required Widget widget}) {
  return Container(
    decoration: BoxDecoration(
      color: ColorUtils.COLOR_SUB_BLUE.withOpacity(0.06),
      borderRadius: BorderRadius.circular(7.0),
    ),
    child: Row(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: ConvertHW.removeHW('12w2')),
            Image.asset(
              iconAsset,
              width: ConvertHW.removeHW('17w5'),
              height: ConvertHW.removeHW('17w5'),
              fit: BoxFit.contain,
            ),
            SizedBox(width: ConvertHW.removeHW('7w2')),
            Container(
              margin: EdgeInsets.only(right: ConvertHW.removeHW('8w3')),
              width: 1,
              height: ConvertHW.removeHW('18sp'),
              color: ColorUtils.COLOR_SUB_GREEN,
            )
          ],
        ),
        Expanded(child: widget)
      ],
    ),
  );
}
