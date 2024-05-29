import 'dart:convert';

import 'package:clean_pattern/features/auth/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageUtil {
  static final LocalStorageUtil instance = LocalStorageUtil._();
  LocalStorageUtil._();

  late SharedPreferences _prefs;
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  final String _theme = "theme";
  final String _rememberMe = "rememberMe";
  final String _userInfo = "userInfo";

  Future<bool> saveTheme(String theme) async =>
      await _prefs.setString(_theme, theme);
  String? getTheme() => _prefs.getString(_theme);

  Future<bool> saveRememberMe(bool rememberMe) async =>
      await _prefs.setBool(_rememberMe, rememberMe);
  bool? getRememberMe() => _prefs.getBool(_rememberMe);

  Future<bool> saveUserInfo(UserModel profile) async {
    String data = json.encode(profile);
    return await _prefs.setString(_userInfo, data);
  }

  UserModel? getUserInfo() {
    final data = _prefs.getString(_userInfo);

    if (data == null) {
      return null;
    }

    return UserModel.fromJson(json.decode(data));
  }
}
