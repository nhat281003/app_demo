// ignore_for_file: constant_identifier_names
import 'package:flutter/cupertino.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeUtils {
  static double width = 5;
  static double height = 6;

  static double sizeLogoLogin = height * 7;

  static double sizeIcon = SizeUtils.height * 3;
  static double sizeTextSelect = SizeUtils.size17;
  static double sizeTextUnSelect = SizeUtils.size13;

  static double sizeIconFilter = 24;
  static double sizeIconEvent = SizeUtils.height * 4;

  static double sizeIconItem = SizeUtils.height * 2;
  static double sizeIconQr = SizeUtils.height * 10;

  static double sizeText =
      18; //SizeUtils.width * 4;//SizeUtils.height * 2+3; //18
  static double size30 = sizeText + 12;
  static double size26 = sizeText + 8;
  static double size24 = sizeText + 6;
  static double size22 = sizeText + 4;
  static double size20 = sizeText + 2;
  static double size19 = sizeText + 1;
  static double size18 = sizeText + 0;
  static double size17 = sizeText - 1;
  static double size16 = sizeText - 2;
  static double size15 = sizeText - 3;
  static double size14 = sizeText - 4;
  static double size13 = sizeText - 5;
  static double size12 = sizeText - 6;
  static double size11 = sizeText - 7;
  static double size10 = sizeText - 8;
  static double size8 = sizeText - 10;

  static double heightDropdownButton = 400;

  // index select icon tab bar
  static const int INDEX_SELECT_HOME = 0;
  static const int INDEX_SELECT_CALENDAR = 1;
  static const int INDEX_SELECT_WORK = 2;
  static const int INDEX_SELECT_ACCOUNT = 3;

  // height header
  static const double HEADER_HEIGHT = 0.136;
  static const double HEIGHT_LOGO_HEADER = 20;
  static const double WIDTH_ICON_HOME = 0.15;
  static double BORDER_RADIUS_BACKGROUND_HOME = 10.r;

  //radius container meeting screen
  static double RADIUS_ROOM_CONTAINER = 10.r;
  static const double SIZE_ARROW_BACK = 23;

  // value add select room
  static const int IS_SELECT_ROOM = -9999;

  // size icon dialog option
  static double SIZE_ICON_DIALOG_OPTION = 50.w;
  static double SIZE_ICON_NOTIFICATION = 26.w;

  // show all notification
  static const int IS_ALL_NOTIFICATION = 1;
  static const int IS_NOT_SEEN_NOTIFICATION = 0;

  // type tat ca va type chua xem
  static const int IS_TYPE_ALL = -2;
  static const int IS_TYPE_NOT_SEEN = -1;

  // value non exits
  static const int VALUE_NON_EXITS = -9999;

  static const int DELETE_ALL_SEEN_AND_NOT_SEEN = -1;
  static const int DELETE_ALL_NOT_SEEN = -2;
  static const int SEEN_ALL = -3;

  // height app bar custom
  static const String HEIGHT_APP_BAR_CUSTOM = '150h60';
  static const String MARGIN_TOP_ICON_BACK = '35h10';
  static const String MARGIN_TOP_ICON_BACK_LOGIN = '45h10';
  static const String PADDING_LEFT_BUTTON_BACK = '20sp8';
  static const String SIZE_AVATAR_ACCOUNT = '60h30';
  static const String HEIGHT_BUTTON_BOTTOM = '90w10';

  // size icon account

  // opacity color primary header
  static const double OPACITY_PRIMARY_HEADER = 0.1;

  // size icon footer
  static const double SIZE_ICON_FOOTER = 25;
  static const double SIZE_TEXT_FOOTER = 13;
  static const EdgeInsets PADDING_ICON_FOOTER =
      EdgeInsets.only(bottom: 8.0, top: 2);

  static const double PADDING_HORIZONTAL_SUB = 8;

  static const double BORDER_RADIUS_PRIMARY = 15;
  static const double BORDER_RADIUS_SUB = 5;
  static const double BORDER_RADIUS_NORMAL = 10;
  static const double BORDER_RADIUS_12 = 12;

  static const double OPACITY_COLOR_PRIMARY_CONTAINER = 0.06;
  static const double OPACITY_COLOR_PRIMARY_LINE = 0.15;
  static const double OPACITY_COLOR_BACKGROUND_HOME = 0.12;
  static const double OPACITY_COLOR_DIALOG = 0.2;

  static const int MAX_LENGTH_PHONE = 11;
  static const int MIN_LENGTH_PHONE = 10;

  static const double PADDING_PRIMARY = 20;
  static const double BORDER_RADIUS_HOME = 15;

  static const double PADDING_DIALOG = 15;
  static const double PADDING_8 = 8;
  static const double PADDING_4 = 4;
  static const double PADDING_16 = 16;

  // time await download file
  static const int AWAIT_DOWNLOAD_FILE = 1000;

  // value page
  static const int DASH_BOARD_PAGE = 0;
  static const int VOTE_PAGE = 1;
  static const int GIFT_PAGE = 2;
  static const int ACCOUNT_PAGE = 3;
  static bool isMobile = Device.get().isPhone;
}
