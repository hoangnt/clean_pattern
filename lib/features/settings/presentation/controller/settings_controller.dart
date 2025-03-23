import 'package:audioplayers/audioplayers.dart';
import 'package:clean_pattern/common/constant/app_language.dart';
import 'package:clean_pattern/common/utilities/local_secure_storage_util.dart';
import 'package:clean_pattern/common/utilities/local_storage_util.dart';
import 'package:clean_pattern/common/core_ui/app_theme.dart';
import 'package:clean_pattern/common/controller/base_controller.dart';
import 'package:clean_pattern/common/widget/dialog/custom_dialog.dart';
import 'package:clean_pattern/common/widget/dialog/result_dialog.dart';
import 'package:clean_pattern/config/config_loading.dart';
import 'package:clean_pattern/config/routes.dart';
import 'package:clean_pattern/features/auth/domain/usecase/logout_usecase.dart';
import 'package:clean_pattern/features/home/presentation/controller/entry_controller.dart';
import 'package:clean_pattern/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsController extends BaseController {
  final LogoutUsecase logoutUsecase;

  SettingsController(this.logoutUsecase);

  final MethodChannel channel = const MethodChannel("com.example.clean_pattern");
  late AudioPlayer _audioPlayer;
  final List<String> _listBgm = [
    Assets.bgm.bgm1,
    Assets.bgm.bgm2,
    Assets.bgm.bgm3,
  ];
  int _indexBgm = 0;

  String mode = AppThemeMode.light;
  int language = AppLanguage.eng;

  bool displayLanguages = false;

  int? luckyNumberInApp;
  int? luckyNumberPlugin;

  @override
  void onInit() {
    super.onInit();

    AudioCache.instance = AudioCache(prefix: '');
    _audioPlayer = AudioPlayer();
    _audioPlayer.eventStream.listen((event) {
      if (event.eventType == AudioEventType.complete) {
        _audioPlayer.play(
          AssetSource(_listBgm[_indexBgm]),
        );
      }
    });

    channel.setMethodCallHandler((call) async {
      if (call.method == "luckyNumber") {
        luckyNumberInApp = call.arguments as int;
        update();
      }

      return null;
    });
  }

  // void getLuckyNumberInApp() {
  //   channel.invokeMethod("luckyNumber");
  // }

  // void getLuckyNumberPlugin() async {
  //   luckyNumberPlugin = await RandomNumber.instance.luckyNumber();
  //   update();
  // }

  void toggleTheme() async {
    if (mode == AppThemeMode.light) {
      mode = AppThemeMode.dark;
      Get.changeTheme(AppTheme.darkTheme);
      ConfigLoading.dark();
    } else {
      mode = AppThemeMode.light;
      Get.changeTheme(AppTheme.lightTheme);
      ConfigLoading.light();
    }

    await LocalStorageUtil.instance.saveTheme(mode);

    // Delay for color change in getx super controller
    await Future.delayed(const Duration(milliseconds: 200));
    Get.find<EntryController>().update();
    update();
  }

  void changeLanguage(int? val) {
    if (language == AppLanguage.eng) {
      language = AppLanguage.vie;
      Get.updateLocale(const Locale("vi", "VN"));
    } else {
      language = AppLanguage.eng;
      Get.updateLocale(const Locale("en", "US"));
    }
    update();
  }

  void toggleDisplayLanguage() {
    displayLanguages = !displayLanguages;
    update();
  }

  void togglePlayBgm() {
    if (_audioPlayer.state == PlayerState.playing) {
      _audioPlayer.pause();
      return;
    }

    if (_audioPlayer.state == PlayerState.paused) {
      _audioPlayer.resume();
      return;
    }

    _audioPlayer.play(
      AssetSource(_listBgm[_indexBgm]),
    );
  }

  Future<void> changeBgm() async {
    _indexBgm++;
    if (_indexBgm > _listBgm.length - 1) {
      _indexBgm = 0;
    }
    await _audioPlayer.stop();
    _audioPlayer.play(
      AssetSource(_listBgm[_indexBgm]),
    );
  }

  void logout() {
    handleBaseResponse<bool?>(
      usecase: logoutUsecase(),
      onSuccess: (data) async {
        if (data != true) {
          return;
        }

        await LocalSecureStorageUtil.instance.saveAccessToken("");
        await LocalSecureStorageUtil.instance.saveRefreshToken("");
        Get.offAllNamed(Routes.login);
      },
      onError: (message) {
        Get.dialog(ResultDialog(
          title: "Notice".tr,
          content: message,
        ));
      },
    );
  }

  void exitToLogin() {
    Get.dialog(CustomDialog(
      title: "Are you sure ?".tr,
      onAction: logout,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w).copyWith(top: 10.h),
        child: Text(
          "Exit to login screen will delete session !".tr,
          style: TextStyle(fontSize: 16.sp),
        ),
      ),
    ));
  }
}
