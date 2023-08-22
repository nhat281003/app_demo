
import 'package:app_3tv/common/utils/convert_h_w.dart';
import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class CustomCard extends StatelessWidget {
  const CustomCard({Key? key,required this.function, required this.iconAsset, required this.title, this.size}) : super(key: key);
  final Function function;
  final String iconAsset;
  final String title;
  final String? size;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => function(),
      child: Container(
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(8.0.r),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 0.01,
              blurRadius: 0.5,
              offset: const Offset(0, 0.3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: ConvertHW.removeHW('10w'), horizontal: 5.0.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 3.w,
              ),
              Image.asset(
                iconAsset,
                width: size != null  ? ConvertHW.removeHW(size!): ConvertHW.removeHW('25w10'),
                height: size != null  ? ConvertHW.removeHW(size!): ConvertHW.removeHW('25w10'),
              ),
              Text('   $title',
                  style: TextStyleUtils.sizeText14Weight600()?.copyWith(color: Colors.black,fontSize: ConvertHW.removeHW('14sp5'))),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    color: Colors.grey.withOpacity(0.1)),
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: ConvertHW.removeHW('14sp5'),
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                width: 4.w,
              )
            ],
          ),
        ),
      ),
    );
  }
}
