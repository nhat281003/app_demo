import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/time_utils.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import 'date_time_picker.dart';


typedef OnChangeCallback = void Function(dynamic value);

class MultiDate extends StatefulWidget {
  final bool willPop;
  final OnChangeCallback onChangedTime;
  final DateTime date1;
  final DateTime date2;
  final DateTime? minDate;
  const MultiDate(
      {Key? key,
      required this.willPop,
      required this.onChangedTime,
      required this.date1,
      required this.date2,
      this.minDate})
      : super(key: key);

  @override
  MultiDateState createState() => MultiDateState();
}

class MultiDateState extends State<MultiDate> {
  final DateRangePickerController _controller = DateRangePickerController();
  DateTime? minDate;

  DateTime? startDate;
  DateTime? endDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.selectedRange = PickerDateRange(widget.date1, widget.date2);

    startDate = widget.date1;
    endDate = widget.date2;
    if (widget.minDate != null) {
      minDate = widget.minDate;
    } else {
      minDate = DateTime(2000, 01, 01);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => widget.willPop,
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
                if (TimeUtils.validateTime(startDate!, DateTime(endDate?.year??0,endDate!.month,endDate!.day))) {
                  widget.onChangedTime(PickerDateRange(startDate, endDate));
                  Navigator.pop(
                      context, {'startDate': startDate, 'endDate': endDate});
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
              DateTimePicker.showDatePickerSetFirstAndLast(context, startDate!,firstDate: DateTime(2000),).then((value){
                if(value!=null){
                  setState(() {
                    startDate=value;
                  });
                }
              });
            },
            child: DateTimePicker.selectDate(startDate!, false,type: 1, hint: 'Chọn ngày bắt đầu'),),
        ),
        containerLabel(
          labelText: 'Kết thúc',
          child: InkWell(
            onTap: (){
              DateTimePicker.showDatePickerSetFirstAndLast(context, DateTime.now(),firstDate: DateTime(2010),).then((value){
                if(value!=null){
                  setState(() {
                    endDate=value;
                  });
                }
              });
            },
            child: DateTimePicker.selectDate(endDate!, false,type: 1, hint: 'Chọn ngày kết thúc'),),
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
}
