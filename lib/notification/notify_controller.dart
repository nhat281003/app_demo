// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:get/get.dart';
//
// class NotifyController extends GetxController {
//   FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
//   bool isClickNotification = false;
//   String? typeNotification;
//   int? transId;
//   int? idNotification;
//
//   // final NotificationRepo _notificationRepo = NotificationRepo();
//
//   @override
//   void onInit() {
//     configNotify();
//     super.onInit();
//   }
//
//   late FirebaseMessaging fm;
//
//   configNotify() async {
//     try {
//       String? fcmTokenFirebase = await FirebaseMessaging.instance.getToken();
//       print('fcmtoken: $fcmTokenFirebase');
//     } catch (e) {
//       print(e);
//     }
//     // kill app
//     FirebaseMessaging.instance
//         .getInitialMessage()
//         .then((RemoteMessage? message) async {
//       if (message != null) {
//         setIsClickNotification(true);
//         setTypeNotification(
//             message.data['type'], message.data['transId'], message.data['id']);
//       }
//     });
//
//     ///forground work
//     FirebaseMessaging.onMessage.listen((RemoteMessage? message) async {
//       if (message != null) {}
//     });
//
//     ///When the app is in background but opened and user taps
//     ///on the notification
//     // khi vẫn đăng nhập app ra ngoài background.
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) async {
//       if (message != null) {}
//     });
//   }
//
//   void setIsClickNotification(bool value) {
//     isClickNotification = value;
//     update();
//   }
//
//   void setTypeNotification(
//       String? value, String? transIdParam, String? idNotificationParam) {
//     typeNotification = value;
//     if (transIdParam != null) {
//       transId = int.parse(transIdParam);
//     }
//     if (idNotificationParam != null) {
//       idNotification = int.parse(idNotificationParam);
//     }
//     update();
//   }
// }
