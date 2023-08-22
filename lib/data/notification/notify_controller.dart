// import 'package:app_congress/common/utils/convert_data.dart';
// import 'package:app_congress/data/repository/notification_repo.dart';
// import 'package:app_congress/routes/app_pages.dart';
// import 'package:app_congress/view/home/home_controller.dart';
// import 'package:app_congress/view/notification/notification_controller.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:get/get.dart';
//
// class NotifyController extends GetxController {
//   FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
//   bool isClickNotification = false;
//   String? typeNotification;
//   int? transId;
//   int? idNotification;
//   final NotificationRepo _notificationRepo = NotificationRepo();
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
//       if (message != null) {
//         if (Get.isRegistered<NotificationController>()) {
//           Get.find<NotificationController>().getNotificationNotSeen();
//         } else {
//           Get.find<HomeController>().getNotificationNotSeen();
//         }
//       }
//     });
//
//     ///When the app is in background but opened and user taps
//     ///on the notification
//     // khi vẫn đăng nhập app ra ngoài background.
//     FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage? message) async {
//       if (message != null) {
//         late NotificationController notificationControllerFind;
//         final homeControllerFind = Get.find<HomeController>();
//         bool isNotificationScreen = Get.isRegistered<NotificationController>();
//         if (isNotificationScreen) {
//           notificationControllerFind = Get.find<NotificationController>();
//         }
//         int typeId = 0;
//         homeControllerFind.getNotificationNotSeen();
//         String routes =
//             ConvertData.getRoutesDetailNotification(message.data['type']);
//         if (message.data['id'] != null) {
//           typeId = int.parse(message.data['id']);
//         }
//         await _notificationRepo.seenOneNotification(index: typeId);
//         if (routes == Routes.accountDetail) {
//           Get.toNamed(routes, arguments: {
//             'id': int.parse(message.data['transId']),
//             'isAccountDetailOther': true
//           })?.then((value) async {
//             if (isNotificationScreen) {
//               await notificationControllerFind.getNotification();
//               await notificationControllerFind.getNotificationNotSeen();
//             } else {
//               homeControllerFind.initialData();
//             }
//           });
//         } else {
//           Get.toNamed(routes)?.then((value) async {
//             if (isNotificationScreen) {
//               await notificationControllerFind.getNotification();
//               await notificationControllerFind.getNotificationNotSeen();
//             } else {
//               homeControllerFind.initialData();
//             }
//           });
//         }
//       }
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
