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
  static const String _token = "token";

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

  Future<bool> saveToken(String token) async =>
      await _prefs.setString(_token, token);
  String? getToken() => _prefs.getString(_token);
}
