import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'controllers/controllers.dart';
import 'screens/home_screen.dart';
import 'utils/colors.dart';
import 'utils/theme.dart';
import 'widgets/loader.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final apiService = Get.find<ApiService>();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'StoryBoost',
            theme: mainTheme(),
            home: apiService.allDone
                ? const HomeScreen()
                : const Scaffold(
                    body: Center(
                      child: Loader(),
                    ),
                  ),
          );
        },
      ),
    );
  }
}
