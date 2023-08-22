
import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ErrorScreen extends StatelessWidget {
  final Function()? onTap;
  final String? errorMessage;
  final String? subErrorMessage;

  const ErrorScreen({
    Key? key,
    this.onTap,
    this.errorMessage,
    this.subErrorMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Scaffold(
        backgroundColor: ColorUtils.BG_COLOR,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              SizedBox(
                height: 200.h,
                width: 200.w,
                child: Image.asset(
                  "assets/images/error.png",
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                errorMessage ?? "error".tr,
                style: TextStyleUtils.sizeText16Weight700()?.copyWith(
                  color: ColorUtils.COLOR_WHITE,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                  subErrorMessage ?? "",
                style: TextStyleUtils.sizeText13Weight400()?.copyWith(
                  color: ColorUtils.COLOR_WHITE,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
