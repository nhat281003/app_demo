// ignore_for_file: constant_identifier_names
import 'package:app_3tv/common/constants/size_utils.dart';
import 'package:app_3tv/common/utils/color_utils.dart';
import 'package:flutter/material.dart';

class AppConstant {
  static const APP_STORE_URL =
      'https://apps.apple.com/vn/app/apple-store/id1599322138';
  static const CH_PLAY_URL =
      'https://play.google.com/store/apps/details?id=vn.greenstock.app';

  static const int TIME_UPDATE_STATE = 500; //MILISECOND
//loại dao dịch
  static const int TRADE_TYPE_BUY = 2; //mua
  static const int TRADE_TYPE_SELL = 1; //bán
//trạng thái lệnh
  static const int ODER_STATUS_ALL = 0; //TẤT CẢ
  static const int ODER_STATUS_WAIT_INPUT = 1; //CHỜ NHẬP
  static const int ODER_STATUS_NOT_APPROVED_YET = 1; //CHƯA DUYỆT
  static const int ODER_STATUS_WAIT_MATCH = 2; //CHỜ Khớp
  static const int ODER_STATUS_MATCH_A_PART = 3; //KHỚP 1 PHẦN
  static const int ODER_STATUS_MATCH = 4; //KHỚP HẾT
  static const int ODER_STATUS_WAIT_CANCEL = 5; //CHỜ HỦY
  static const int ODER_STATUS_CANCEL = 6; //ĐÃ HỦY
  static const int ODER_STATUS_MATCH_A_PART_CANCLE = 7; //KHỚP 1 PHẦN ĐÃ HỦY

//status subAccount
  static const int ACTIVE = 2; //Hoạt động
  static const int PENDING = 1; //Chờ duyệt
  static const int CANCLED = 9; //Đã xóa
//type SubAccount
  static const String BASIC_1 = "Cơ sở";
  static const String INCURRED = "Phát sinh";
  static const String FOREX = "FOREX";
  static const String BASIC = "BASIC";
  static const int SUB_ACC_TYPE_BASIC_1 = 1;
  static const int SUB_ACC_TYPE_INCURRED = 2;
  static const int SUB_ACC_TYPE_FOREX = 3;
  static const int SUB_ACC_TYPE_BASIC = 7;

  //Card type
  static const int CARD_TYPE_1 = 1; //Chứng minh nhân dân
  static const int CARD_TYPE_2 = 2; //Căn cước công dân
  static const int CARD_TYPE_3 = 3; //Hộ chiếu
  static const int CARD_TYPE_4 = 4; //Giấy phép kinh doanh
  static const int CARD_TYPE_5 = 5; //Khác

  static const String emailRegExp =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

  static TextStyle title_14_w400 = TextStyle(
    fontSize: SizeUtils.size14,
    color: ColorUtils.BG_ACTIVE_BUTTON,
    fontWeight: FontWeight.w400,
  );

  static const String AVATAR_ACCOUNT = 'account_avatar';
  static const String AVATAR_ACCOUNT_UPGRADE = 'account_avatar_upgrade';
  static const String CREATE_FEED_BACK = 'create_feed_back';
  static const String UPLOAD_IMAGE_CONGRESS = 'upload_image_congress';

  static const String IMAGE_FILE = 'image_file';
  static const String IMAGE_NETWORK = 'image_network';
  static const String IMAGE_ASSET = 'image_asset';

  // loai tab trong anh dai hoi
  static const String MY_IMAGE_CONGRESS = 'YOU';
  static const String SHARED_IMAGE_CONGRESS = 'CONFERENCE';

  static TextStyle title_17_w600 = TextStyle(
    fontSize: SizeUtils.size17,
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );


  // role ADMIN,  VIP, CONVENED - Triệu tập   ,GUEST - Khách
  static const String ADMIN = 'ADMIN';
  static const String VIP = 'VIP';
  static const String CONVENED = 'CONVENED';
  static const String GUEST = 'GUEST';

  // type screen show dialog
  static const String FEED_BACK = 'FEED_BACK';
  static const String CALL_HELP = 'CALL_HELP';

  // trạng thái xác nhận tham dự - INIT- chua xac nhan, ,AGREE- dong y,REFUSE - tu choi
  static const String STATUS_INIT = 'INIT';
  static const String STATUS_AGREE = 'AGREE';
  static const String STATUS_REFUSE = 'REFUSE';
}
