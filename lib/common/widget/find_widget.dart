
import 'package:app_3tv/common/constants/size_utils.dart';
import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/convert_h_w.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FindWidget extends StatelessWidget {
  const FindWidget({Key? key,
              required this.hintText,
              required this.icon,
  }) : super(key: key);
  final String? hintText;
  final IconData ? icon;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 32.h,
      padding: EdgeInsets.only(bottom: 8.h),
      margin:   EdgeInsets.symmetric(horizontal: SizeUtils.PADDING_PRIMARY),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
              Radius.circular(SizeUtils.BORDER_RADIUS_SUB))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            width: SizeUtils.PADDING_8,
          ),
          Expanded(
              child: Text(hintText!,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,fontSize: ConvertHW.removeHW('14sp2')),)),
          const SizedBox(
            width: SizeUtils.PADDING_4,
          ),
          Container(
            width: 1,
            height: 16.h,
            color: ColorUtils.COLOR_BG_BUTTON_3,
          ),
          const SizedBox(
            width: SizeUtils.PADDING_4,
          ),
          Icon(icon,
              color:ColorUtils.COLOR_ICON_1,
              size: ConvertHW.removeHW('20w8')),
          const SizedBox(
            width: SizeUtils.PADDING_8,
          ),
        ],
      ),
    );
  }
}
