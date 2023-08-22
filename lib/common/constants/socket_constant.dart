// ignore_for_file: constant_identifier_names
class SocketConstant{
  static const int MESSAGE_TYPE_CHANGE_CODE_STOCK = 1;//message thay đổi mã chứng khoán
  static const int MESSAGE_TYPE_CHANGE_INDEX_STOCK = 2;//message thay đổi index
  static const int MESSAGE_TYPE_MATCH = 3;//message khớp thị trường
  static const String SOCKET_TYPE_REFRESH = "order.back"; // ENVENT REFESH DATA
  static const String SOCKET_TYPE_DATA_REALTIME = "data"; // ENVENT UPDATE DATA REALTIME
  static const String SOCKET_TYPE_ORDER = "order.client"; // ENVENT send data cancel command
  static const String SOCKET_TYPE_DEPOSIT = "deposit.client"; // ENVENT send data deposit
  static const String SOCKET_TYPE_RIGHT = "right.client"; // ENVENT send data right
  static const String SOCKET_TYPE_REFRESH_API = "REFRESH"; // ENVENT send data right

}