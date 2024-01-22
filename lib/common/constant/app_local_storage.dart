import 'dart:convert';

import 'package:clean_pattern/features/auth/data/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static final AppLocalStorage instance = AppLocalStorage._();
  AppLocalStorage._();

  late SharedPreferences _prefs;
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static const String _theme = "theme";
  static const String _email = "email";
  static const String _password = "password";
  static const String _rememberMe = "rememberMe";
  static const String _accessToken = "accessToken";
  static const String _refreshToken = "refreshToken";
  static const String _userInfor = "userInfor";

  Future<bool> saveTheme(String theme) async =>
      await _prefs.setString(_theme, theme);
  String? getTheme() => _prefs.getString(_theme);

  Future<bool> saveEmail(String email) async =>
      await _prefs.setString(_email, email);
  String? getEmail() => _prefs.getString(_email);

  Future<bool> savePassword(String password) async =>
      await _prefs.setString(_password, password);
  String? getPassword() => _prefs.getString(_password);

  Future<bool> saveRememberMe(bool rememberMe) async =>
      await _prefs.setBool(_rememberMe, rememberMe);
  bool? getRememberMe() => _prefs.getBool(_rememberMe);

  Future<bool> saveAccessToken(String token) async =>
      await _prefs.setString(_accessToken, token);
  String? getAccessToken() => _prefs.getString(_accessToken);

  Future<bool> saveRefreshToken(String token) async =>
      await _prefs.setString(_refreshToken, token);
  String? getRefreshToken() => _prefs.getString(_refreshToken);

  Future<bool> saveUserInfor(UserModel profile) async {
    String data = json.encode(profile);
    return await _prefs.setString(_userInfor, data);
  }

  UserModel? getUserInfor() {
    final data = _prefs.getString(_userInfor);

    if (data == null) {
      return null;
    }

    return UserModel.fromJson(json.decode(data));
  }
}
