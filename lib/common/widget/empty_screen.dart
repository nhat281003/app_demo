
import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class EmptyScreen extends StatelessWidget {
  final Function()? onTap;
  final String? emptyText;
  const EmptyScreen({Key? key, this.onTap, this.emptyText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {},
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          width: Get.width,
          height: Get.height * 0.5,
          child: Center(
            child: GestureDetector(
              onTap: onTap,
              child: Scaffold(
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(getAssetsImage("no_item.png"),
                          fit: BoxFit.cover),
                      SizedBox(height: 30.h),
                       Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: emptyText??"Dữ liệu trống!",
                                style: const TextStyle(
                                  color: ColorUtils.COLOR_TEXT_BLACK51,
                                  fontWeight: FontWeight.w700,
                                )),
                          ],
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                      const SizedBox(height: 8,),
                      const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Nhấn để thử lại',
                              style: TextStyle(
                                color: Color(0xfff51911),
                                fontSize: 11,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        textHeightBehavior:
                        TextHeightBehavior(applyHeightToFirstAscent: false),
                        softWrap: false,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
