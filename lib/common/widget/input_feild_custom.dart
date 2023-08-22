
import 'package:app_3tv/common/utils/AlwaysDisabledFocusNode.dart';
import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Được tạo bởi Phạm Nhớ từ 09/10/2022
/// mọi hành vi sao chép cần được sự cho phép

Widget InputFieldCuttom1(TextEditingController? controller, bool? obscureText, String? labelText, String? errorText,
    {Widget? prefixIcon,
    Widget? suffixIcon,
    bool readOnly = false,
    TextStyle? lableStyle,
    TextInputType? textInputType,
    Function(String)? onChange,
    List<TextInputFormatter>? inputFormatters}) {
  Widget? suffixView;
  if(!readOnly){
    if(suffixIcon != null){
      suffixView = suffixIcon;
    } else {
      suffixView =  InkWell(child: const Icon(
        Icons.clear,
        size: 18,
        color: ColorUtils.COLOR_BG_TOOLBAR,
      ), onTap: (){
        controller?.clear();
      },);
    }
  } else {
    suffixView = suffixIcon;
  }
  return Material(
    borderRadius: BorderRadius.all(Radius.circular(7.r)),
    elevation: 1,
    shadowColor: ColorUtils.color1D7AB4.withOpacity(0.18),
    child: TextField(
      readOnly: readOnly ?? false,
      controller: controller,
      cursorColor: ColorUtils.color0560A6,
      keyboardType: textInputType ?? TextInputType.text,
      inputFormatters: inputFormatters,
      onChanged: onChange,
      obscureText: obscureText ?? false,
      obscuringCharacter: "*",
      textAlign: TextAlign.start,
      style: TextStyleUtils.sizeText16Weight500()?.copyWith(color: readOnly == true ? ColorUtils.colorBEBEBE : ColorUtils.colorText),
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixView,
          hintText: labelText,
          hintStyle: TextStyleUtils.sizeText16Weight500()?.copyWith(color: ColorUtils.colorBEBEBE),
          labelStyle: TextStyleUtils.sizeText16Weight500()?.copyWith(color: ColorUtils.colorText),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7.r),
              borderSide: BorderSide(
                width: 1.w,
                color: ColorUtils.color1D7AB4.withOpacity(0.5),
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
                color: ColorUtils.color1D7AB4.withOpacity(0.5),
              )),
          errorText: errorText == "" ? null : errorText,
          contentPadding: const EdgeInsets.all(8),
          errorStyle: TextStyleUtils.sizeText14Weight400()?.copyWith(color: ColorUtils.colorF51911)),
    ),
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


Widget InputFieldCuttomVi(
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
  if(enable){
    if(suffixIcon != null){
      suffixView = suffixIcon;
    } else {
      suffixView =  InkWell(child: const Icon(
        Icons.clear,
        size: 18,
        color: ColorUtils.COLOR_BG_TOOLBAR,
      ), onTap: (){
        controller?.clear();
      },);
    }
  }else {
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
      style: TextStyleUtils.sizeText14Weight500()?.copyWith(color: ColorUtils.colorText),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyleUtils.sizeText12Weight500()?.copyWith(color: ColorUtils.colorACAFB2),
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
          errorStyle: TextStyleUtils.sizeText14Weight400()?.copyWith(color: ColorUtils.colorF51911, height: 1.5, backgroundColor: Colors.transparent)),
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
        style: TextStyleUtils.sizeText14Weight500()?.copyWith(color: ColorUtils.colorText),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyleUtils.sizeText12Weight500()?.copyWith(color: ColorUtils.colorACAFB2),
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
            errorStyle: TextStyleUtils.sizeText14Weight400()?.copyWith(color: ColorUtils.colorF51911, height: 1.5)),
      ),
    ),
  );
}

Widget InputFieldCuttom2(
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
  if(enable){
    if(suffixIcon != null){
      suffixView = suffixIcon;
    } else {
      suffixView =  InkWell(child: const Icon(
        Icons.clear,
        size: 18,
        color: ColorUtils.COLOR_BG_TOOLBAR,
      ), onTap: (){
        controller?.clear();
      },);
    }
  }else {
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
            style: TextStyleUtils.sizeText14Weight500()?.copyWith(color: ColorUtils.colorText),
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyleUtils.sizeText12Weight500()?.copyWith(color: ColorUtils.colorACAFB2),
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
                errorStyle: TextStyleUtils.sizeText14Weight400()?.copyWith(color: ColorUtils.colorF51911, height: 1.5, backgroundColor: Colors.transparent)),
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
              style: TextStyleUtils.sizeText14Weight500()?.copyWith(color: ColorUtils.colorText),
              decoration: InputDecoration(
                  hintText: hintText,
                  hintStyle: TextStyleUtils.sizeText12Weight500()?.copyWith(color: ColorUtils.colorACAFB2),
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color:  ColorUtils.color1D7AB4.withOpacity(0.18),
                      )),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.r),
                      borderSide: BorderSide(
                        width: 1.w,
                        color:  ColorUtils.color1D7AB4.withOpacity(0.18),
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
                  errorStyle: TextStyleUtils.sizeText14Weight400()?.copyWith(color: ColorUtils.colorF51911, height: 1.5)),
            ),
          ),
  );
}
//
// Widget AutoComplete(
//     context,
//     {Widget? prefixIcon,
//     Widget? suffixIcon, Function? startQuery}) {
//   return Material(
//     borderRadius: BorderRadius.all(Radius.circular(7.r)),
//     elevation: 1,
//     child: TypeAheadField(
//       textFieldConfiguration: TextFieldConfiguration(
//           autofocus: true,
//           style: DefaultTextStyle.of(context).style.copyWith(
//               fontStyle: FontStyle.italic
//           ),
//           decoration: InputDecoration(
//               border: OutlineInputBorder()
//           )
//       ),
//       suggestionsCallback: (pattern) async {
//         return await BackendService.getSuggestions(pattern);
//       },
//       itemBuilder: (context, suggestion) {
//         return ListTile(
//           leading: Icon(Icons.shopping_cart),
//           title: Text(suggestion['name']),
//           subtitle: Text('\$${suggestion['price']}'),
//         );
//       },
//       onSuggestionSelected: (suggestion) {
//         Navigator.of(context).push(MaterialPageRoute(
//             builder: (context) => ProductPage(product: suggestion)
//         ));
//       },
//     ),
//   );
// }




Widget InputFieldCuttomNoBorder(
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
  if(enable){
    if(suffixIcon != null){
      suffixView = suffixIcon;
    } else {
      suffixView =  InkWell(child: const Icon(
        Icons.clear,
        size: 18,
        color: ColorUtils.COLOR_BG_TOOLBAR,
      ), onTap: (){
        controller?.clear();
      },);
    }
  }else {
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
      style: TextStyleUtils.sizeText14Weight500()?.copyWith(color: ColorUtils.colorText),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyleUtils.sizeText12Weight500()?.copyWith(color: ColorUtils.colorACAFB2),
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
          errorStyle: TextStyleUtils.sizeText14Weight400()?.copyWith(color: ColorUtils.colorF51911, height: 1.5, backgroundColor: Colors.transparent)),
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
        style: TextStyleUtils.sizeText14Weight500()?.copyWith(color: ColorUtils.colorText),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyleUtils.sizeText12Weight500()?.copyWith(color: ColorUtils.colorACAFB2),
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
            errorStyle: TextStyleUtils.sizeText14Weight400()?.copyWith(color: ColorUtils.colorF51911, height: 1.5)),
      ),
    ),
  );
}

Widget getContainerCustom({prefix, suffix, body}) {
  return Container(
    decoration: BoxDecoration(
      color: const Color(0xffffffff),
      borderRadius: BorderRadius.circular(7.0),
      border: Border.all(width: 1.0, color: ColorUtils.COLOR_BG_TOOLBAR.withOpacity(0.5)),
      boxShadow: const [
        BoxShadow(
          color: Color(0x2e1d7ab4),
          offset: Offset(0, 3),
          blurRadius: 12,
        ),
      ],
    ),
    child: Row(
      children: [
        (prefix != null) ? prefix : Container(),
        Expanded(child: body),
        (suffix != null) ? suffix : Container(),
      ],
    ),
  );
}
