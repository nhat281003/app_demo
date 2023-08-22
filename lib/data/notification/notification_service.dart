// import 'package:app_congress/common/utils/app_utils.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class LocalNotificationService {
//   static final FlutterLocalNotificationsPlugin _notificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//
//   static void initialize(BuildContext context) async {
//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//             android: AndroidInitializationSettings("@mipmap/ic_launcher"),
//             iOS: DarwinInitializationSettings(requestCriticalPermission: true));
//     _notificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: (details) async {},
//     );
//     await FirebaseMessaging.instance
//         .setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }
//
//   static void display(RemoteMessage message) async {
//     try {
//       final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
//       // if (Platform.isAndroid) {
//       //
//       // }
//       NotificationDetails notificationDetails = NotificationDetails(
//           android: AndroidNotificationDetails(
//             "CG ${DateTime.now().millisecond}", "Congress",
//             importance: Importance.max,
//             priority: Priority.high,
//             // enableVibration: AppCache().checkIsVibration()
//           ),
//           iOS: const DarwinNotificationDetails());
//       await _notificationsPlugin.show(
//         id,
//         message.notification?.title,
//         message.notification?.body,
//         notificationDetails,
//       );
//     } on Exception catch (e) {
//       AppUtils.shared.printLog(e);
//     }
//   }
// }
