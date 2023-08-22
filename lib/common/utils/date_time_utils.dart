import 'package:app_3tv/common/constants/date_format.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'color_utils.dart';


class DateTimeUtils {
  static String formatTime(String dateTime,
      {String format = DateTimeFormat.formatDateTime,
      bool isConvert = true,
      String inputFormatStr = "dd/MM/yyyy"}) {
    if (dateTime == " " || dateTime == "") return " ";
    var inputFormat = DateFormat(inputFormatStr);
    var inputDate = inputFormat.parse(dateTime);
    var outputFormat = DateFormat(format);
    if (format == "yyyy-MM-ddTHH:mm:ssZZ") {
      return formatISOTime(inputDate);
    }
    return outputFormat.format(inputDate);
  }

  static DateTime stringToDatetime(String dateTime,
      {String format = 'yyyy-MM-ddTHH:mm:ssZ'}) {
    var dateTime1 = DateFormat(format).parse(dateTime);
    return dateTime1;
  }

  static formatISOTime(DateTime date) {
    var duration = date.timeZoneOffset;
    if (duration.isNegative) {
      return ("${DateFormat("yyyy-MM-ddTHH:mm:ss.mmm").format(date)}-${duration.inHours.toString().padLeft(2, '0')}${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
    } else {
      return ("${DateFormat("yyyy-MM-ddTHH:mm:ss.mmm").format(date)}+${duration.inHours.toString().padLeft(2, '0')}${(duration.inMinutes - (duration.inHours * 60)).toString().padLeft(2, '0')}");
    }
  }

  static String formatTimeString(String dateTime,
      {String dateConvert = "dd/MM/yyyy",
      String format = "yyyy-MM-ddTHH:mm:ssZZ"}) {
    if (dateTime == "" || dateTime == " ") return "";
    var inputFormat = DateFormat(dateConvert);
    var inputDate = inputFormat.parse(dateTime);
    var outputFormat = DateFormat(format);
    if (format == "yyyy-MM-ddTHH:mm:ssZZ") {
      return formatISOTime(inputDate);
    }
    return outputFormat.format(inputDate);
  }

  static String subTrackDateTimeStr30(String dateTime,
      {int timeSubTrack = 30}) {
    var date = stringToDatetime(dateTime);
    var dateTimeSubTrack = date.subtract(Duration(days: timeSubTrack));
    String dateTimeStr = formatISOTime(dateTimeSubTrack);
    return dateTimeStr;
  }

  static String subTrackDateTime30(DateTime dateTime) {
    var dateTimeSubTrack =
        DateTime(dateTime.year, dateTime.month - 1, dateTime.day);
    String dateTimeStr = formatISOTime(dateTimeSubTrack);
    return dateTimeStr;
  }

  static String subTrackDateTime14(DateTime dateTime) {
    var dateTimeSubTrack =
        DateTime(dateTime.year, dateTime.month, dateTime.day - 14);
    String dateTimeStr = formatISOTime(dateTimeSubTrack);
    return dateTimeStr;
  }

  static Future<String> selectedDateTime({DateTime? initialDate}) async {
    String dateTimeStr = "";
    final DateTime? picked = await showDatePicker(
      context: Get.context!,
      locale: Localizations.localeOf(Get.context!),
      initialDate: initialDate ?? DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorUtils.BG_COLOR,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      dateTimeStr = formatISOTime(picked);
    } else {
      // ignore: unnecessary_statements
      dateTimeStr != formatISOTime(picked ?? DateTime.now());
    }
    return dateTimeStr;
  }

  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inDays);
  }

  static int checkDifferenceToDateFromDate(
      {required DateTime from, required DateTime to}) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (from.difference(to).inHours / 24).round();
  }

  static String convertToAgo(String dateTime) {
    DateTime input = DateFormat('dd/MM/yyyy HH:mm:ss').parse(dateTime, true);
    DateTime now = DateFormat('dd/MM/yyyy HH:mm:ss').parse(
        "${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year} ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}",
        true);
    Duration diff = now.difference(input);

    if (diff.inDays >= 1) {
      return '${diff.inDays} ngày trước';
    } else if (diff.inHours >= 1) {
      return '${diff.inHours} giờ trước';
    } else if (diff.inMinutes >= 1) {
      return '${diff.inMinutes} phút trước';
    } else if (diff.inSeconds >= 1) {
      return '${diff.inSeconds} giây trước';
    } else {
      return 'Vừa xong';
    }
  }

  static String convertStringAddTitle(String dateString) {
    DateTime now = DateTime.now();
    DateTime dateTime = DateFormat("dd/MM/yyyy HH:mm:ss").parse(dateString);
    String result;
    if (dateTime.day == now.day &&
        dateTime.month == now.month &&
        dateTime.year == now.year) {
      result = "Hôm nay, ${DateFormat("dd/MM/yyyy").format(dateTime)}";
    } else if (dateTime.day == now.day - 1 &&
        dateTime.month == now.month &&
        dateTime.year == now.year) {
      result = "Hôm qua, ${DateFormat("dd/MM/yyyy").format(dateTime)}";
    } else if (dateTime.day == now.day + 1 &&
        dateTime.month == now.month &&
        dateTime.year == now.year) {
      result = "Ngày mai, ${DateFormat("dd/MM/yyyy").format(dateTime)}";
    } else {
      result =
          "${convertDayOfWeek(DateFormat.EEEE().format(dateTime))}, ${DateFormat("dd/MM/yyyy").format(dateTime)}";
    }
    return result;
  }

  static String convertDayOfWeek(String dayOfWeek) {
    switch (dayOfWeek) {
      case 'Monday':
        return 'Thứ Hai';
      case 'Tuesday':
        return 'Thứ Ba';
      case 'Wednesday':
        return 'Thứ Tư';
      case 'Thursday':
        return 'Thứ Năm';
      case 'Friday':
        return 'Thứ Sáu';
      case 'Saturday':
        return 'Thứ Bảy';
      case 'Sunday':
        return 'Chủ Nhật';
      default:
        return '';
    }
  }
}
