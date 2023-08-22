import 'package:app_3tv/common/utils/textstyle.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
enum DateTimeType {
  year("Năm  "),
  month("Tháng  "),
  day("Ngày  "),
;
  const DateTimeType(this.value);
  final String value;
}
class SelectDateTimeWidget extends StatefulWidget {
  const SelectDateTimeWidget({
    Key? key,
    required this.selectTime,
    this.colorBorder = Colors.amber,
    this.colorIcon = Colors.amber,
    this.value,
  }) : super(key: key);
  final Function(String timeDisplay) selectTime;
  final Color colorBorder;
  final Color colorIcon;
  final String? value;

  @override
  State<SelectDateTimeWidget> createState() => _SelectDateTimeWidgetState();
}

class _SelectDateTimeWidgetState extends State<SelectDateTimeWidget>  {
  String value = "";

  @override
  void initState() {
    value = widget.value??DateFormat('dd/MM/yyyy').format(DateTime.now());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        // value = await DateTimeUtils.selectedDateTime();
        //   widget.selectTime(value);
      },
      child: Container(
        // padding: const EdgeInsets.all(2),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            border: Border.all(color: widget.colorBorder)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(value,
              style: TextStyleUtils.sizeText11Weight400()
                  ?.copyWith(color: Colors.black),
            ),
            Icon(
              Icons.date_range,
              color: widget.colorIcon,
              size: 12,
            )
          ],
        ),
      ),
    );
  }

}
