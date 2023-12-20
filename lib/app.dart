import 'package:clean_pattern/common/constant/app_local_storage.dart';
import 'package:clean_pattern/common/constant/app_theme.dart';
import 'package:clean_pattern/config/config_loading.dart';
import 'package:clean_pattern/config/i18n.dart';
import 'package:clean_pattern/config/pages.dart';
import 'package:clean_pattern/config/routes.dart';
import 'package:clean_pattern/features/settings/presentation/controller/settings_controller.dart';
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
        getPages: Pages.instance.getPages,
        initialRoute: Routes.entry,
        builder: EasyLoading.init(),
        onReady: () {
          var settingController = Get.find<SettingsController>();
          var theme = AppLocalStorage.instance.getTheme();

          if (theme == AppThemeMode.dark) {
            settingController.mode = AppThemeMode.dark;
            Get.changeTheme(AppTheme.darkTheme);
            ConfigLoading.dark();
          } else {
            settingController.mode = AppThemeMode.light;
            Get.changeTheme(AppTheme.lightTheme);
            ConfigLoading.light();
          }
        },
      ),
    );
  }
}
