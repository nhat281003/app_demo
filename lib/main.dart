import 'package:app_3tv/binding/app_binding.dart';
import 'package:app_3tv/routes/app_pages.dart';
import 'package:app_3tv/routes/app_routes.dart';
import 'package:app_3tv/view/login/login_controller.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'common/utils/global.dart';

String initialRoute = '';

Future<void> main() async {
  AppBinding().dependencies();
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final loginControllerFinal = Get.find<LoginController>();

  @override
  void initState() {

    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (Device.get().isTablet && GetPlatform.isAndroid) {
      SystemChrome.setPreferredOrientations([
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp
      ]);
    }
    return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          if (mounted) {
            // if (Device.get().isTablet) {
            //   loginControllerFinal.setIsPhone(false);
            //   if (orientation == Orientation.portrait) {
            //     loginControllerFinal.setIsIpadLandScape(false);
            //     loginControllerFinal.setSize(const Size(648, 1242));
            //   } else {
            //     loginControllerFinal.setIsIpadLandScape(true);
            //     loginControllerFinal.setSize(const Size(648, 1242));
            //   }
            // } else {
            //   loginControllerFinal.setIsPhone(true);
            //   loginControllerFinal.setIsIpadLandScape(false);
            //   loginControllerFinal.setSize(const Size(360, 690));
            // }
          }
          return GetBuilder<LoginController>(builder: (loginController) {
            return ScreenUtilInit(
                useInheritedMediaQuery: true,
                designSize: loginController.size,
                builder: (context, widget) {
                  return GetMaterialApp(
                    debugShowCheckedModeBanner: false,
                    title: 'Flutter Demo',
                    theme: ThemeData(
                      primarySwatch: Colors.blue,
                    ),
                    builder: EasyLoading.init(builder: ((context, widget) {
                      return MediaQuery(
                        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                        child: GestureDetector(
                            onTap: () => dismissKeyboard(),
                            behavior: HitTestBehavior.translucent,
                            child: widget!),
                      );
                    })),
                    getPages: AppPages.pages,
                    initialRoute: Routes.splash,
                    localizationsDelegates: const [
                      GlobalMaterialLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate
                    ],
                    supportedLocales: const [
                      Locale('vi', 'VN'),
                      Locale('en', 'US'),
                    ],
                    locale: const Locale('vi'),
                  );
                });
          });
        });
  }
}



