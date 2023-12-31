import 'package:audioplayers/audioplayers.dart';
import 'package:clean_pattern/common/constant/app_language.dart';
import 'package:clean_pattern/common/constant/app_local_storage.dart';
import 'package:clean_pattern/common/constant/app_theme.dart';
import 'package:clean_pattern/config/config_loading.dart';
import 'package:clean_pattern/features/home/presentation/controller/entry_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController {
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

  int? luckyNumber;

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
        luckyNumber = call.arguments as int;
        update();
      }

      return null;
    });
  }

  void getLuckyNumber() {
    channel.invokeMethod("luckyNumber");
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
}
