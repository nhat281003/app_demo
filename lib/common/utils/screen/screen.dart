import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

class Screen {
  static MediaQueryData mediaQuery = MediaQuery.of(Get.context!);

  static double get width {
    return mediaQuery.size.width;
  }

  static double get height {
    return mediaQuery.size.height;
  }

  static double get scale {
    return mediaQuery.devicePixelRatio;
  }

  static double get topSafeHeight {
    return mediaQuery.padding.top;
  }

  static double get bottomSafeHeight {
    return mediaQuery.padding.bottom;
  }

  static double get deviceHeight {
    return mediaQuery.padding.bottom +
        mediaQuery.size.height +
        mediaQuery.padding.top;
  }

  static updateStatusBarStyle(SystemUiOverlayStyle style) {
    SystemChrome.setSystemUIOverlayStyle(style);
  }

  static Size get appBarHeight {
    AppBar appBar = AppBar(
      title: Text('Demo'),
    );
    return appBar.preferredSize;
  }
}
