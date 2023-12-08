import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  static final AppLocalStorage instance = AppLocalStorage._();
  AppLocalStorage._();

  late SharedPreferences prefs;
  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static const String _theme = "theme";

  Future<bool> saveTheme(String theme) async =>
      await prefs.setString(_theme, theme);

  String? getTheme() => prefs.getString(_theme);
}
