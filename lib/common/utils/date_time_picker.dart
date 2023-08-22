import 'package:app_3tv/common/constants/date_format.dart';
import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/time_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:platform_date_picker/platform_date_picker.dart';

class DateTimePicker {
  static Widget selectDate(DateTime dateTime, bool detail,
      {required String hint, IconData? icon, int? type, TextStyle? textStyle}) {
    TextStyle style = textStyle ??
        TextStyle(
          fontSize: 15.sp,
          color: ColorUtils.COLOR_PRIMARY,
          fontWeight: FontWeight.w600,
        );
    TextStyle hintStyle =
        style.copyWith(color: ColorUtils.COLOR_PRIMARY.withOpacity(0.5));
    return Container(
      padding: EdgeInsets.only(bottom: (type == null) ? 3 : 0),
      decoration: BoxDecoration(
          border: Border(
              bottom: (type == null)
                  ? const BorderSide(color: ColorUtils.COLOR_PRIMARY, width: 1)
                  : BorderSide.none)),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 2),
        child: Row(
          children: [
            Expanded(
                child: Text(
                    "${(detail) ? getDayOfWeek(dateTime.weekday) + " - " : ""}${TimeUtils.convertDateTimeToFormat(dateTime, DateTimeFormat.formatDate)}",
                    maxLines: 1,
                    style: style)),
            Icon(
              icon ?? CupertinoIcons.calendar,
              size: 20,
              color: ColorUtils.COLOR_PRIMARY,
            )
          ],
        ),
      ),
    );
  }

  static Future<DateTime> showDatePickerBetween(BuildContext context,
      DateTime dateTime, DateTime startDate, DateTime endDate) async {
    DateTime? date = await PlatformDatePicker.showDate(
      showCupertino: true,
      backgroundColor: ColorUtils.COLOR_PRIMARY,
      context: context,
      firstDate: startDate,
      lastDate: endDate,
      initialDate: startDate,
    );
    if (date != null) {
      return date;
    }
    return dateTime;
  }

  static Future<DateTime> showTimePicker(BuildContext context, DateTime date,
      {int? m}) async {
    TimeOfDay? time = await PlatformDatePicker.showTime(
        showMaterial: true,
        backgroundColor: ColorUtils.COLOR_PRIMARY,
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: ColorUtils.COLOR_PRIMARY, // header background color
                onPrimary: Colors.white, // header text color
                onSurface: Colors.black, // body text color
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: Colors.red, // button text color
                ),
              ),
            ),
            child: child!,
          );
        },
        context: context,
        use24hFormat: true,
        minuteInterval: (m != null && m > 0) ? m : 1,
        initialTime: TimeOfDay.fromDateTime(date));
    if (time != null) {
      return DateTime(
          date.year, date.month, date.day, time.hour, time.minute, 0);
    }
    return date;
  }

  static Future<DateTime> showDatePicker(BuildContext context,
      {required DateTime initialDate,
      DateTime? firstDate,
      disableFirstDate}) async {
    DateTime? date = await showPlatformDatePicker(
      fieldLabelText: 'Nhập ngày',
      helpText: 'Chọn ngày',
      cancelText: 'Hủy',
      confirmText: 'Chọn',
      showMaterial: true,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorUtils.COLOR_PRIMARY, // header background color
              onPrimary: Colors.white, // header text color
              onSurface: Colors.black, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                primary: ColorUtils.COLOR_PRIMARY, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      backgroundColor: ColorUtils.COLOR_PRIMARY,
      context: context,
      firstDate: (firstDate == null) ? DateTime.now() : firstDate,
      lastDate: DateTime(DateTime.now().year + 10),
      initialDate: initialDate,
    );
    if (date != null) {
      return DateTime(date.year, date.month, date.day, initialDate.hour,
          initialDate.minute);
    } else {}
    return initialDate;
  }

  static Future<DateTime> showDatePickerSetFirst(
      BuildContext context, DateTime dateTime,
      {initialDate, firstDate}) async {
    DateTime? date = await showPlatformDatePicker(
      showMaterial: true,
      backgroundColor: ColorUtils.COLOR_PRIMARY,
      context: context,
      firstDate: (firstDate == null) ? DateTime.now() : firstDate,
      lastDate: DateTime(DateTime.now().year + 10),
      initialDate: (initialDate == null)
          ? DateTime(DateTime.now().year - 10)
          : initialDate,
    );
    if (date != null) {
      return DateTime(
          date.year, date.month, date.day, dateTime.hour, dateTime.minute);
    }
    return dateTime;
  }

  static Future<DateTime?> showDatePickerSetFirstAndLast(
      BuildContext context, DateTime dateTime,
      {lastDate, firstDate}) async {
    DateTime? date = await showPlatformDatePicker(
      showMaterial: true,
      backgroundColor: ColorUtils.COLOR_PRIMARY,
      context: context,
      firstDate: (firstDate != null) ? firstDate : DateTime.now(),
      lastDate:
          (lastDate != null) ? lastDate : DateTime(DateTime.now().year + 10),
      initialDate: dateTime,
    );
    if (date != null) {
      return date;
    }
    return null;
  }

  static getDayOfWeek(int index, {int? type}) {
    String day = '';
    switch (index) {
      case 1:
        day = type == 1 ? 'T2' : 'Thứ 2';
        break;
      case 2:
        day = type == 1 ? 'T3' : 'Thứ 3';
        break;
      case 3:
        day = type == 1 ? 'T4' : 'Thứ 4';
        break;
      case 4:
        day = type == 1 ? 'T5' : 'Thứ 5';
        break;
      case 5:
        day = type == 1 ? 'T6' : 'Thứ 6';
        break;
      case 6:
        day = type == 1 ? 'T7' : 'Thứ 7';
        break;
      case 7:
        day = type == 1 ? 'CN' : 'Chủ Nhật';
        break;
      default:
        day = '';
        break;
    }
    return day;
  }

  static getDayOfWeek2(DateTime dateTime) {
    String day = '';
    if (dateTime.day == DateTime.now().day &&
        dateTime.month == DateTime.now().month &&
        dateTime.year == DateTime.now().year) {
      return "Hôm nay";
    } else {
      switch (dateTime.weekday) {
        case 1:
          day = 'Thứ Hai';
          break;
        case 2:
          day = 'Thứ Ba';
          break;
        case 3:
          day = 'Thứ Tư';
          break;
        case 4:
          day = 'Thứ Năm';
          break;
        case 5:
          day = 'Thứ Sáu';
          break;
        case 6:
          day = 'Thứ Bảy';
          break;
        case 7:
          day = 'Chủ Nhật';
          break;
        default:
          day = '';
          break;
      }
    }
    return day;
  }
}
