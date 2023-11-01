import 'package:clean_pattern/common/constant/app_theme.dart';
import 'package:clean_pattern/config/i18n.dart';
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
        translations: I18n(),
        locale: Locale('en', 'US'),
        fallbackLocale: Locale('en', 'US'),
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        builder: EasyLoading.init(),
        getPages: Pages.instance.getPages,
        initialRoute: Routes.entry,
      ),
    );
  }
}
