import 'package:app_3tv/common/constants/app_constants.dart';
import 'package:app_3tv/common/constants/date_format.dart';
import 'package:app_3tv/common/constants/size_utils.dart';
import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:app_3tv/common/utils/time_utils.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_date_picker/platform_date_picker.dart';


class DateTimePicker {
  static Future<DateTime> showDatePickerBetween(BuildContext context,
      DateTime dateTime, DateTime startDate, DateTime endDate) async {
    DateTime? date = await PlatformDatePicker.showDate(
      showMaterial: true,
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

  static Future<DateTime> showTimePicker(BuildContext context, DateTime? date,
      {int? m}) async {
    date ??= DateTime.now();

    TimeOfDay? time = await PlatformDatePicker.showTime(
        showMaterial: true,
        showCupertino: true,
        //backgroundColor: ColorConst.colorPrimary,
        backgroundColor: Colors.white,
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

  static Future<DateTime> showDatePicker(
      BuildContext context, DateTime? dateTime,
      {initialDate, disableFirstDate}) async {
    DateTime? date = await PlatformDatePicker.showDate(
      showMaterial: true,
     backgroundColor: Colors.blue,
      context: context,
      firstDate: (initialDate == null) ? DateTime.now() : initialDate,
      lastDate: DateTime(DateTime.now().year + 10),
      initialDate: (dateTime == null) ? DateTime.now() : dateTime,
        builder: (BuildContext context, Widget ?child) {
          return Theme(
            data: ThemeData(
              primarySwatch: Colors.grey,
              splashColor: Colors.black,
              textTheme: const TextTheme(
                subtitle1: TextStyle(color: Colors.black),
                button: TextStyle(color: Colors.black),
              ),
              hintColor: Colors.black,
              colorScheme: const ColorScheme.light(
                  primary: ColorUtils.COLOR_PRIMARY,
                  primaryVariant: Colors.black,
                  secondaryVariant: Colors.black,
                  onSecondary: Colors.black,
                  onPrimary: Colors.white,
                  surface: Colors.black,
                  onSurface: Colors.black,
                  secondary: Colors.black),
              dialogBackgroundColor: Colors.white,
            ),
            child: child ??const Text(""),
          );
        }
    );
    if (date != null) {
      return DateTime(
          date.year, date.month, date.day, dateTime!.hour, dateTime.minute);
    }
    return dateTime!;
  }

  static Future<DateTime?> showDatePickerSetRange(
      BuildContext context, DateTime? dateTime,
      {initialDate, firstDate, endDate}) async {
    DateTime? date = await PlatformDatePicker.showDate(
      showMaterial: true,
      backgroundColor: ColorUtils.COLOR_PRIMARY,
      context: context,
      firstDate: (firstDate == null) ? DateTime.now() : firstDate,
      lastDate: endDate ?? DateTime(DateTime.now().year + 10),
      initialDate: (initialDate == null)
          ? dateTime
          : initialDate,
        builder: (BuildContext context, Widget ?child) {
          return Theme(
            data: ThemeData(
              primarySwatch: Colors.grey,
              splashColor: Colors.black,
              textTheme: const TextTheme(
                subtitle1: TextStyle(color: Colors.black),
                button: TextStyle(color: Colors.black),
              ),
              hintColor: Colors.black,
              colorScheme: const ColorScheme.light(
                  primary: ColorUtils.COLOR_PRIMARY,
                  primaryVariant: Colors.black,
                  secondaryVariant: Colors.black,
                  onSecondary: Colors.black,
                  onPrimary: Colors.white,
                  surface: Colors.black,
                  onSurface: Colors.black,
                  secondary: Colors.black),
              dialogBackgroundColor: Colors.white,
            ),
            child: child ??const Text(""),
          );
        }
    );
    if (date != null) {
      return (dateTime != null)
          ? DateTime(
              date.year, date.month, date.day, dateTime.hour, dateTime.minute)
          : date;
    }
    return dateTime;
  }

  static Future<DateTime?> showDatePickerSetFirstAndLast(
      BuildContext context, DateTime? dateTime,
      {lastDate, firstDate}) async {
    DateTime? date = await PlatformDatePicker.showDate(
      showMaterial: true,
      backgroundColor: ColorUtils.COLOR_PRIMARY,
      context: context,
      firstDate: firstDate ?? DateTime.now(),
      lastDate: lastDate ?? DateTime(DateTime.now().year + 10),
      initialDate: dateTime ?? DateTime.now(),
      builder: (BuildContext context, Widget ?child) {
        return Theme(
          data: ThemeData(
            primarySwatch: Colors.grey,
            splashColor: Colors.black,
            textTheme: const TextTheme(
              subtitle1: TextStyle(color: Colors.black),
              button: TextStyle(color: Colors.black),
            ),
            hintColor: Colors.black,
            colorScheme: const ColorScheme.light(
                primary: ColorUtils.COLOR_PRIMARY,
                primaryVariant: Colors.black,
                secondaryVariant: Colors.black,
                onSecondary: Colors.black,
                onPrimary: Colors.white,
                surface: Colors.black,
                onSurface: Colors.black,
                secondary: Colors.black),
            dialogBackgroundColor: Colors.white,
          ),
          child: child ??const Text(""),
        );
      }
    );
    if (date != null) {
      return date;
    }
    return null;
  }

  static Widget selectDate(DateTime? dateTime, bool detail,
      {String? hint,
      IconData? icon,
      int? type,
      TextStyle? textStyle,
      Decoration? decoration,
      EdgeInsetsGeometry? padding}) {
    TextStyle style = AppConstant.title_17_w600.copyWith(fontSize: SizeUtils.sizeText);
    TextStyle hintStyle = style.copyWith(color: ColorUtils.COLOR_PRIMARY,);
    return Container(
      padding: EdgeInsets.only(bottom: (type == null) ? 3 : 0),
      decoration: decoration ??
          BoxDecoration(
              border: Border(
                  bottom: (type == null)
                      ? const BorderSide(
                          color: ColorUtils.COLOR_PRIMARY, width: 1)
                      : BorderSide.none)),
      child: Padding(
        padding: padding ?? const EdgeInsets.only(left: 8, right: 2),
        child: Row(
          children: [
            Expanded(
                child: (dateTime != null)
                    ? AutoSizeText(
                        "${(detail) ? getDayOfWeek(dateTime.weekday) + " - " : ""}${TimeUtils.convertDateTimeToFormat(dateTime, DateTimeFormat.formatDate)}",
                        maxLines: 1,
                        minFontSize: 8,
                        style: style)
                    : AutoSizeText(
                        "$hint",
                        maxLines: 1,
                        minFontSize: 8,
                        style: hintStyle,
                      )),
            Icon(
              icon ?? CupertinoIcons.calendar,
              size: SizeUtils.size20,
              color: ColorUtils.COLOR_PRIMARY,
            )
          ],
        ),
      ),
    );
  }

  static Widget selectDateDashBoard(DateTime dateTime, bool detail,
      {String? hint, IconData? icon, int? type, TextStyle? textStyle}) {
    TextStyle style = textStyle ??
        AppConstant.title_17_w600.copyWith(fontSize: SizeUtils.sizeText);
    TextStyle hintStyle = style.copyWith(color: ColorUtils.COLOR_PRIMARY);
    return Container(
      padding: EdgeInsets.only(bottom: (type == null) ? 3 : 0),
      decoration: BoxDecoration(
          border: Border(
              bottom: (type == null)
                  ? const BorderSide(color: ColorUtils.COLOR_PRIMARY, width: 1)
                  : BorderSide.none)),
      child: Row(
        children: [
          InkWell(
              child:AutoSizeText(
                      "${(detail) ? getDayOfWeek(dateTime.weekday) + " - " : ""}${TimeUtils.convertDateTimeToFormat(dateTime, DateTimeFormat.formatDate)}",
                      maxLines: 1,
                      minFontSize: 8,
                      style: style)),
          Icon(
            icon ?? Icons.event_note,
            size: SizeUtils.size24,
            color: ColorUtils.COLOR_PRIMARY,
          )
        ],
      ),
    );
  }

  static Widget selectTime(DateTime? dateTime,
      {format, int? type, TextStyle? textStyle}) {
    dateTime ??= DateTime.now();
    TextStyle style = textStyle ??
        AppConstant.title_17_w600.copyWith(fontSize: SizeUtils.sizeText);
    return Container(
      padding: EdgeInsets.only(bottom: (type == null) ? 3 : 0),
      decoration: BoxDecoration(
          border: Border(
              bottom: (type == null)
                  ? const BorderSide(color: ColorUtils.COLOR_PRIMARY, width: 1)
                  : BorderSide.none)),
      child: Row(
        children: [
          Expanded(
              child: Text(
            TimeUtils.convertDateTimeToFormat(dateTime, (format != null) ? format : "HH:mm aa"),
            style: style,
          )),
          Icon(
            CupertinoIcons.clock_fill,
            size: SizeUtils.size20,
            color: ColorUtils.COLOR_PRIMARY,
          )
        ],
      ),
    );
  }

  static getDayOfWeek(int? index, {int? type}) {
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

  static getDayOfWeek2(DateTime? dateTime) {
    if (dateTime == null) return '';

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

  static bool isInDateNow(int startHour, int startMinute, int endHour,
      int endMinute, String date, String formatFrom) {
    DateTime dateTime = TimeUtils.convertStringToDate(date, formatFrom);
    DateTime start = DateTime(
        dateTime.year, dateTime.month, dateTime.day, startHour, startMinute);
    DateTime end = DateTime(
        dateTime.year, dateTime.month, dateTime.day, endHour, endMinute);
    DateTime now = DateTime.now();
    if (now.isAfter(start) && now.isBefore(end)) {
      return true;
    }
    return false;
  }
}
