// import 'dart:io';
// import 'package:app_congress/common/constants/api_constant.dart';
// import 'package:socket_io_client/socket_io_client.dart' as IO;
// import 'package:socket_io_client/socket_io_client.dart';
//
// class SocketIo {
//   IO.Socket? socket;
//
//   initSocket() {
//     // socket = IO.io(ApiConstants.apiSocketQrScanner, <String, dynamic>{
//     //   'transports': ['websocket'],
//     //   'autoConnect': false,
//     //   'force new connection': true,
//     //   // 'extraHeaders':{'Authorization': "Bearer ${AppCache().token}"}
//     // });
//
//      socket = IO.io(ApiConstants.apiSocketQrScanner,
//         OptionBuilder()
//             .setTransports(['websocket']).build());
//
//     socket?.connect();
//     socket?.onConnect((_) {
//       print('Đã kết nối với Socket');
//     });
//     socket?.onDisconnect((_) => print('Đã ngắt kết nối với Socket'));
//     socket?.onConnectError((err) => print(err));
//     socket?.onError((err) => print(err));
//   }
//
//   sendQRScanner(int delegateId, int createBy) {
//     socket?.emit("chat", {
//       'delegateId': delegateId,
//       'createBy': createBy,
//     });
//     print('12');
//   }
//
//   void disposeSocket(){
//     socket?.disconnect();
//   }
// }
//
// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
