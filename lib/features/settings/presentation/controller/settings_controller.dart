import 'package:audioplayers/audioplayers.dart';
import 'package:clean_pattern/common/constant/app_language.dart';
import 'package:clean_pattern/common/constant/app_local_storage.dart';
import 'package:clean_pattern/common/constant/app_theme.dart';
import 'package:clean_pattern/common/controller/base_controller.dart';
import 'package:clean_pattern/common/widget/dialog/custom_dialog.dart';
import 'package:clean_pattern/common/widget/dialog/result_dialog.dart';
import 'package:clean_pattern/config/config_loading.dart';
import 'package:clean_pattern/config/routes.dart';
import 'package:clean_pattern/features/auth/domain/usecase/logout_usecase.dart';
import 'package:clean_pattern/features/home/presentation/controller/entry_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:random_number/random_number.dart';

class SettingsController extends BaseController {
  final LogoutUsecase logoutUsecase;

  SettingsController(this.logoutUsecase);

  final MethodChannel channel = MethodChannel("com.example.clean_pattern");
  late AudioPlayer _audioPlayer;
  final List<String> _listBgm = [
    "asset/bgm/bgm1.mp3",
    "asset/bgm/bgm2.mp3",
    "asset/bgm/bgm3.mp3",
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

  void getLuckyNumberInApp() {
    channel.invokeMethod("luckyNumber");
  }

  void getLuckyNumberPlugin() async {
    luckyNumberPlugin = await RandomNumber.instance.luckyNumber();
    update();
  }

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

    await AppLocalStorage.instance.saveTheme(mode);

    // Delay for color change in getx super controller
    await Future.delayed(Duration(milliseconds: 200));
    Get.find<EntryController>().update();
    update();
  }

  void changeLanguage(int? val) {
    if (language == AppLanguage.eng) {
      language = AppLanguage.vie;
      Get.updateLocale(Locale("vi", "VN"));
    } else {
      language = AppLanguage.eng;
      Get.updateLocale(Locale("en", "US"));
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

  Future<void> logout() async {
    handleBaseResponse<bool?>(
      usecase: logoutUsecase(),
      onSuccess: (data) {
        if (data != true) {
          return;
        }

        AppLocalStorage.instance.saveAccessToken("");
        AppLocalStorage.instance.saveRefreshToken("");
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
        padding: EdgeInsets.symmetric(horizontal: 15.w).copyWith(top: 10.h),
        child: Text(
          "Exit to login screen will delete session !".tr,
          style: TextStyle(fontSize: 17.sp),
        ),
      ),
    ));
  }
}
