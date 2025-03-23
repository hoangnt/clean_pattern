import 'package:clean_pattern/common/utilities/local_storage_util.dart';
import 'package:clean_pattern/common/core_ui/app_theme.dart';
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
  const MyApp(this.accessToken);

  final String? accessToken;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
        MediaQuery.of(context).size.width,
        MediaQuery.of(context).size.height,
      ),
      builder: (_, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: I18n(),
        locale: const Locale('en', 'US'),
        fallbackLocale: const Locale('en', 'US'),
        themeMode: ThemeMode.light,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        getPages: Pages.instance.getPages,
        builder: EasyLoading.init(),
        initialRoute: accessToken != null && accessToken!.isNotEmpty
            ? Routes.entry
            : Routes.login,
        onReady: () {
          var settingController = Get.find<SettingsController>();
          var theme = LocalStorageUtil.instance.getTheme();

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
