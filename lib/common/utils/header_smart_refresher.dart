import 'package:pull_to_refresh/pull_to_refresh.dart';

class HeaderSmartRefresher {
  static ClassicHeader classicHeader = const ClassicHeader(
    refreshingText: 'Đang làm mới...',
    releaseText: 'Thả ra để làm mới',
    completeText: 'Làm mới hoàn thành',
    idleText: 'Kéo xuống để làm mới',
  );

  static ClassicFooter classicFooter = const ClassicFooter(
      canLoadingText: 'Thả ra để tải thêm',
      loadingText: 'Đang tải thêm dữ liệu...',
      idleText: 'Không còn dữ liệu',
      noDataText: 'Không còn dữ liệu .');
}
