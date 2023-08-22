import 'package:app_3tv/common/constants/date_format.dart';
import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/time_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';


class MutilYear extends StatefulWidget {
  final Function(DateTime, DateTime)? onChangedTime;
  final DateTime startYear;
  final DateTime endYear;

  const MutilYear(
      {Key? key,
        required this.startYear,
        required this.onChangedTime,
        required this.endYear,
      })
      : super(key: key);

  @override
  MutilYearState createState() => MutilYearState();
}

class MutilYearState extends State<MutilYear> {

  DateTime? startYear;
  DateTime? endYear;

  @override
  void initState() {
    startYear =widget.startYear;
    endYear =widget.endYear;
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: dialogContentPickDate(context),
      ),
    );
  }

  TextStyle styleText = const TextStyle(
      fontSize: 18,
      color: ColorUtils.COLOR_BG_TOOLBAR,
      fontWeight: FontWeight.w700);

//show dialog pick date time
  dialogContentPickDate(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          title(),
          const SizedBox(height: 8,),
          // showDiaLogTimePickDate(),
          body(),
          const SizedBox(height: 8,),
          Align(
            alignment: Alignment.centerRight,
            child: InkWell(
              onTap: () {
                if (TimeUtils.validateTime(DateTime(startYear!.year), DateTime(endYear?.year??0))) {
                  widget.onChangedTime!(startYear!,endYear!);
                }
              },
              child: Container(
                // width: 80,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ColorUtils.COLOR_BG_TOOLBAR,
                ),
                child: const Text(
                  "Xác nhận",
                  style: TextStyle(
                      color: ColorUtils.COLOR_WHITE, fontSize: 18),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget title() {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Align(
          alignment: Alignment.center,
          child: Text(
            "Tìm kiếm",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 12,
                color: ColorUtils.COLOR_BG_TOOLBAR,
                fontWeight: FontWeight.w700),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: IconButton(
            icon: const Icon(Icons.close),
            iconSize: 18,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  Widget body(){
    return Column(
      crossAxisAlignment:CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        containerLabel(
          labelText: 'Bắt đầu',
          child: InkWell(
              onTap: (){
                showYearPickerDialog(startYear!);
              },
              child: Container(
                padding: const EdgeInsets.only(bottom: 0),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide.none)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, right: 2),
                  child: Row(
                    children: [
                      const Icon(
                        CupertinoIcons.calendar,
                        size: 20,
                        color: ColorUtils.COLOR_BG_TOOLBAR,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      (startYear != null)
                          ? Text(
                          TimeUtils.convertDateTimeToFormat(startYear!, DateTimeFormat.formatYear),
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: ColorUtils.COLOR_BG_TOOLBAR,
                            fontWeight: FontWeight.w600,
                          ))
                          : Text(
                        "Chọn tháng bắt đầu",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: ColorUtils.COLOR_BG_TOOLBAR,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              )),
        ),
        containerLabel(
          labelText: 'Kết thúc',
          child: InkWell(
              onTap: (){
                showYearPickerDialog(endYear!,isToYear: true);
              },
              child:  Container(
                padding: const EdgeInsets.only(bottom: 0),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide.none)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, right: 2),
                  child: Row(
                    children: [
                      const Icon(
                        CupertinoIcons.calendar,
                        size: 20,
                        color: ColorUtils.COLOR_BG_TOOLBAR,
                      ),
                      const SizedBox(
                        width: 2,
                      ),
                      (endYear != null)
                          ? Text(
                          TimeUtils.convertDateTimeToFormat(endYear!, DateTimeFormat.formatYear),
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: ColorUtils.COLOR_BG_TOOLBAR,
                            fontWeight: FontWeight.w600,
                          ))
                          : Text(
                        "Chọn tháng kết thúc",
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: ColorUtils.COLOR_BG_TOOLBAR,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              )),
        ),
      ],
    );
  }

  Widget containerLabel({required String labelText, required Widget child}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: InputDecorator(
        decoration: InputDecoration(
            labelText: labelText,
            labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: ColorUtils.COLOR_BG_TOOLBAR),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
        child: child,
      ),
    );
  }
  showYearPickerDialog(DateTime dateTime,{bool isToYear =false}) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Chọn năm"),
          content: SizedBox(
            // Need to use container to add size constraint.
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(2010, 1),
              lastDate: DateTime(DateTime.now().year + 5, 1),
              initialDate: DateTime.now(),
              selectedDate: dateTime,
              onChanged: (DateTime dt) {
                Navigator.pop(context);
                setState(() {
                  if(isToYear){
                    endYear = dt;
                  }else{
                    startYear =dt;
                  }
                });


              },
            ),
          ),
        );
      },
    );
  }
}
