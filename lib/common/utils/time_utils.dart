import 'package:app_3tv/common/constants/date_format.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'app_utils.dart';
import 'date_time_picker.dart';


class TimeUtils {
  static int timeDelay = 2;

  static DateTime now = DateTime.now();
  static DateTime endTime =
      DateTime(now.year, now.month, now.day + 1, now.hour, now.minute);

  static DateTime firstDate = DateTime(1930, 01, 01);

  static DateTime getFirstDateOfMonth() {
    DateTime now = DateTime.now();
    DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
    return firstDayOfMonth;
  }

  static DateTime getLastDateOfMonth({DateTime? date}) {
    DateTime now = DateTime.now();
    if (date != null) {
      now = date;
    }
    DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
    return lastDayOfMonth;
  }

  static String convertToDMN(String? dateTimeString) {
    if(dateTimeString !=null) {
      if (dateTimeString.isNotEmpty) {
        DateFormat inputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
        DateFormat outputFormat = DateFormat('dd/MM/yyyy');
        DateTime dateTime = inputFormat.parse(dateTimeString);
        String dateString = outputFormat.format(dateTime);
        return dateString;
      } else {
        return '';
      }
    }else{
      return '';
    }
  }

  static String convertToDateHourMinutes(String? dateTimeString) {
    if (dateTimeString != null) {
      if (dateTimeString.isNotEmpty) {
        DateFormat inputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
        DateFormat outputFormat = DateFormat('dd/MM/yyyy HH:mm');
        DateTime dateTime = inputFormat.parse(dateTimeString);
        String dateString = outputFormat.format(dateTime);
        return dateString;
      } else {
        return '';
      }
    } else {
      return '';
    }
  }

  static String convertToHourMinutes(String dateTimeString) {
    if (dateTimeString.isNotEmpty) {
      DateFormat inputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
      DateFormat outputFormat = DateFormat('HH:mm');
      DateTime dateTime = inputFormat.parse(dateTimeString);
      String dateString = outputFormat.format(dateTime);
      return dateString;
    } else {
      return '';
    }
  }


  static String convertStringToDateStringFull(String? dateTimeString) {
    if (dateTimeString == null || dateTimeString.isEmpty) {
      return '';
    } else {
      DateFormat outputFormat = DateFormat('dd/MM/yyyy HH:mm:ss');
      DateFormat inputFormat = DateFormat('dd/MM/yyyy');
      DateTime dateTime = inputFormat.parse(dateTimeString);
      String dateString = outputFormat.format(dateTime);
      return dateString;
    }
  }

  static String convertDateToString(DateTime dateTime, String typeFormat) {
    final DateFormat formatter = DateFormat(typeFormat);
    final String formatted = formatter.format(dateTime);
    return formatted;
  }

  static DateTime convertStringToDate(String data, String formatFrom) {
    return DateFormat(formatFrom).parse(data);
  }

  static String convertTimeToFormat(TimeOfDay time) {
    return "${time.hour}:${time.minute}";
  }

  static String convertTimeToFormated(
      String data, String formatFrom, String formatTo) {
    if (data == "") return "";
    DateTime dateTime = DateFormat(formatFrom).parse(data);
    String formattedDate = DateFormat(formatTo).format(dateTime);
    return formattedDate;
  }

  static String convertDateTimeToFormat(DateTime time, String formatTo) {
    String formattedDate = DateFormat(formatTo).format(time);
    return formattedDate;
  }

  static String showDateTimeRange(
      DateTime timeStart, DateTime timeEnd, String formatTo) {
    String formattedDateStart = DateFormat(formatTo).format(timeStart);
    String formattedDateEnd = DateFormat(formatTo).format(timeEnd);
    return "$formattedDateStart - $formattedDateEnd";
  }

  static String getFirstDayOfMonth(DateTime time, String formatTo) {
    DateTime now = time;
    DateTime firstDayOfMonth = DateTime(now.year, now.month, 1);
    return convertDateTimeToFormat(firstDayOfMonth, formatTo);
  }

  static String getLastDayOfMonth(DateTime time, String formatTo) {
    DateTime now = time;
    DateTime lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
    return convertDateTimeToFormat(lastDayOfMonth, formatTo);
  }

  static String getFirstDayOfYear(DateTime time, String formatTo) {
    DateTime now = time;
    DateTime lastDayOfYear = DateTime(now.year, 1, 1);
    return convertDateTimeToFormat(lastDayOfYear, formatTo);
  }

  static String getLastDayOfYear(DateTime time, String formatTo) {
    DateTime now = time;
    DateTime lastDayOfYear =
        getLastDateOfMonth(date: DateTime(now.year, 12, 1));
    return convertDateTimeToFormat(lastDayOfYear, formatTo);
  }

  static String getFirstTimeOfDay(String formatTo, {DateTime? date}) {
    DateTime now = DateTime.now();
    if (date != null) {
      now = date;
    }
    DateTime finaldate = DateTime(now.year, now.month, now.day, 0, 0, 1);
    return convertDateTimeToFormat(finaldate, formatTo);
  }

  static DateTime getFirstDayOfWeek() {
    DateTime now = DateTime.now();
    int currentDay = now.weekday;
    DateTime firstDayOfWeek = now.subtract(Duration(days: currentDay - 1));
    return firstDayOfWeek;
  }

  static String getYesterday(DateTime time, String formatTo) {
    DateTime now = time;
    DateTime yesterday = DateTime(
        now.year, now.month, now.day - 1, now.hour, now.minute, now.second);
    return convertDateTimeToFormat(yesterday, formatTo);
  }

  static String getDateTime(DateTime date, TimeOfDay time) {
    String dateStr = convertDateTimeToFormat(date, "dd/MM/yyyy");
    String timeStr = "${time.hour}:${time.minute}:00";
    return "$dateStr $timeStr";
  }

  static String getYear(DateTime date) {
    String dateStr = convertDateTimeToFormat(date, "yyyy");
    return dateStr;
  }

  static String getTimes(String time, String input, String output) {
    DateTime date = DateFormat(input).parse(time);
    String timeStr = convertDateTimeToFormat(date, output);
    return timeStr;
  }

  static int getMinutes(String timeStart, String timeEnd) {
    DateTime dateStart = DateFormat("HH:mm").parse(timeStart);
    DateTime dateEnd = DateFormat("HH:mm").parse(timeEnd);
    int minutes = dateEnd.difference(dateStart).inMinutes;
    return minutes;
  }

  static String getStringDate(String date) {
    String dateString = "";
    DateTime dateTime = TimeUtils.convertStringToDate(date, "dd/MM/yyyy");
    DateTime now = DateTime.now();
    if (dateTime.day == now.day &&
        dateTime.month == now.month &&
        dateTime.year == now.year) {
      dateString = "Hôm nay";
    } else {
      String dayOfWeek = DateTimePicker.getDayOfWeek(dateTime.weekday);
      dateString = "$dayOfWeek - $date";
    }
    return dateString;
  }

  static int weekOfYear(DateTime date) {
    DateTime monday = weekStart(date);
    DateTime first = weekYearStartDate(monday.year);

    int week = 1 + (monday.difference(first).inDays / 7).floor();

    if (week == 53 && DateTime(monday.year, 12, 31).weekday < 4) week = 1;

    return week;
  }

  static DateTime weekStart(DateTime date) {
    // This is ugly, but to avoid problems with daylight saving
    DateTime monday = DateTime.utc(date.year, date.month, date.day);
    monday = monday.subtract(Duration(days: monday.weekday - 1));

    return monday;
  }

  static DateTime weekYearStartDate(int year) {
    final firstDayOfYear = DateTime.utc(year, 1, 1);
    final dayOfWeek = firstDayOfYear.weekday;

    return firstDayOfYear.add(
        Duration(days: (dayOfWeek <= DateTime.thursday ? 1 : 8) - dayOfWeek));
  }

  static String showTime(
      int startHour, int startMinute, int endHour, int endMinute) {
    return "${itemTime(startHour)}h${itemTime(startMinute)} - ${itemTime(endHour)}h${itemTime(endMinute)}";
  }

  static String itemTime(int time) {
    if (time > 9) {
      return "$time";
    } else {
      return "0$time";
    }
  }

  static titleTime(String data, String formatFrom, {int? type}) {
    String value = "";
    int temp = 0;
    DateTime dateTime = TimeUtils.convertStringToDate(data, formatFrom);
    DateTime now = DateTime.now();
    if (dateTime.day == now.day &&
        dateTime.month == now.month &&
        dateTime.year == now.year) {
      value = "Hôm nay";
      temp = 1;
    } else {
      value = TimeUtils.convertDateTimeToFormat(
          dateTime, DateTimeFormat.formatDate);
    }
    if (type == 1) {
      String val =
          "${DateTimePicker.getDayOfWeek(dateTime.weekday)}, ${TimeUtils.convertDateTimeToFormat(dateTime, DateTimeFormat.formatDate)}";
      value = "${(temp == 1) ? "$value, " : ""}$val";
    }

    if (type == 2) {
      value =
          "Tháng ${TimeUtils.convertTimeToFormated(data, formatFrom, DateTimeFormat.formatMonthYear)}";
    }
    return value;
  }

  static convertTimestamp(int millis) {
    return DateTime.fromMillisecondsSinceEpoch(millis * 1000);
  }

  static int convertDateTimeToTimeStamp(DateTime dateTime) {
    var timeStamp = (dateTime.toUtc().millisecondsSinceEpoch) ~/ 1000;
    return timeStamp;
  }

  // static validateInputDateTime(String value) {
  //   print("length: ${value.length}");
  //   if (value.length == 1 && int.parse(value) > 3) {
  //     value = "0$value";
  //     return value;
  //   }
  //   if (value.length == 2) {
  //     try {
  //       int time = int.parse(value);
  //       if (time > 31) {
  //         value = "0${value.substring(0, 1)}/${value.substring(1, 2)}";
  //         return value;
  //       } else {
  //         value = "$value";
  //         return "$value";
  //       }
  //     } catch (error) {}
  //   }
  //   if (value.length > 2) {
  //     if (value.length == 4 || value.length == 5) {
  //       int time;
  //       try {
  //         if (value.length == 4) if (value.contains('/')) {
  //           time = int.parse(
  //               value.substring(value.indexOf('/') + 1, value.length));
  //           print("check option 1");
  //         } else {
  //           time = int.parse(value.substring(2, value.length));
  //           print("check option 2 ");
  //         }
  //       } catch (error) {
  //         if (value.length == 5) time = int.parse(value.split("/")[1]);
  //       }
  //       if (time != null && time > 0) {
  //         if (time > 1 && time < 10) {
  //           value = "${value.substring(0, 2)}/0$time";
  //           return "$value";
  //         } else if (time <= 12) {
  //           value = "${value.substring(0, 2)}/$time";
  //           return "$value";
  //         } else {
  //           value = "${value.substring(0, 2)}/0${time ~/ 10}/${time % 10}";
  //           print("check option 5 $time");
  //           return "$value";
  //         }
  //       }
  //     } else if (value.length > 5 && value.length <= 10) {
  //       if (value.split('/').length == 3) {
  //         value =
  //             "${value.substring(0, 5)}/${value.split('/')[value.split('/').length - 1]}";
  //       } else {
  //         value =
  //             "${value.substring(0, 5)}/${value.substring(5, value.length)}";
  //       }
  //       return "$value";
  //     } else if (value.length > 10) {
  //       value = value.substring(0, 10);
  //       return "$value";
  //     }
  //   }
  // }

  static inputDateTime(String value) {
    if (value.length == 2) return '$value/';
    if (value.length == 5) return '$value/';
    if (value.length > 10) {
      return value.substring(0, 10);
    } else {
      return value;
    }
  }

  static bool validateTime(DateTime startTime, DateTime endTime) {
    final duration = startTime.difference(endTime);
    if (duration.inDays > 0) {
      AppUtils.shared.showToast(
          "Thời gian kết thúc phải chọn muộn hơn thời gian bắt đầu!");
      return false;
    }
    return true;
  }
}
