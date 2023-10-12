import 'package:clean_pattern/common/constant/app_color.dart';
import 'package:clean_pattern/config/pages.dart';
import 'package:clean_pattern/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        theme: ThemeData(
          primaryColor: AppColor.primary,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: AppBarTheme(
            centerTitle: true,
            titleSpacing: 0,
            backgroundColor: Colors.transparent,
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
            iconTheme: IconThemeData(color: Colors.black, size: 20.sp),
          ),
        ),
        builder: EasyLoading.init(),
        getPages: Pages.instance.getPages,
        initialRoute: Routes.entry,
      ),
    );
  }
}
