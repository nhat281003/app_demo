
import 'package:app_3tv/common/constants/size_utils.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ConvertHW {

  static double removeHW(String value) {
    double i = 0;
    double doubleValue = 0;
    if (value.contains('sp')) {
      i = convertValue(value, 'sp')[1];
      doubleValue = convertValue(value, 'sp')[0].sp;
    } else if (value.contains('w')) {
      i = convertValue(value, 'w')[1];
      doubleValue = convertValue(value, 'w')[0].w;
    } else if (value.contains('h')) {
      i = convertValue(value, 'h')[1];
      doubleValue = convertValue(value, 'h')[0].h;
    } else if (value.contains('null')) {
      i = convertValue(value, 'null')[1];
      doubleValue = convertValue(value, 'null')[0];
    }
    if (!SizeUtils.isMobile) {
      return i;
    } else {
      return doubleValue;
    }
  }

  // gía trị thứ 1 là: có w h sp. giá trị thứ 2 là tổng của số đầu và cuối
  static List<double> convertValue(String value, String valueContain) {
    List<double> list = [0, 0];
    List<dynamic> listValue;
    double? valueLast;
    if (value.contains(valueContain)) {
      listValue = value.split(valueContain).toList();
      list[0] = double.parse(listValue[0]);
      valueLast = double.tryParse(listValue[1]);
      if (valueLast != null) {
        list[1] = valueLast;
      }
    }
    list[1] += list[0];
    return list;
  }
}
