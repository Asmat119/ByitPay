import 'package:byitpay/constants/my_colors.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';
late List<CameraDescription> cameras;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  cameras = await availableCameras();
  runApp(
    ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          statusBar();
          return GetMaterialApp(
            title: "Application",
            debugShowCheckedModeBanner: false,
            initialRoute: AppPages.INITIALPINCODE,
            defaultTransition: Transition.rightToLeft,
            // theme: ThemeData.dark().copyWith(
            //   appBarTheme: AppBarTheme(
            //     centerTitle: false,
            //     backgroundColor: ,
            //     titleTextStyle: TextStyle(
            //       color: black,
            //       fontSize: 22.sp,
            //       fontWeight: FontWeight.bold,
            //     ),
            //     elevation: 0,
            //     shape: const RoundedRectangleBorder(
            //       borderRadius: BorderRadius.vertical(
            //         bottom: Radius.circular(20),
            //       ),
            //     ),
            //   ),
            //   scaffoldBackgroundColor: white,
            //   textTheme:
            //       GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            //           .apply(bodyColor: Colors.white),
            //   canvasColor: white,
            // ),
            getPages: AppPages.routes,
            // builder: EasyLoading.init() ,
          );
        }),
  );
}

void statusBar({Color color = primaryColor}) {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarColor: color, // status bar color
  ));
}

void statusBar2() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: white, // status bar color
  ));
}
