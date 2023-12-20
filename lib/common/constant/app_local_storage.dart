import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static final AppLocalStorage instance = AppLocalStorage._();
  AppLocalStorage._();

  late SharedPreferences _prefs;
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static const String _theme = "theme";

  Future<bool> saveTheme(String theme) async =>
      await _prefs.setString(_theme, theme);

  String? getTheme() => _prefs.getString(_theme);
}
