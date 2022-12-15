import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = "en";

  ThemeMode apptheme = ThemeMode.light;

  Future<void> changeLanguage(String newLanguage) async {
    if (appLanguage == newLanguage) {
      return;
    } else {
      appLanguage = newLanguage;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("language", appLanguage);
      notifyListeners();
    }
  }

  void changeTheme(ThemeMode newtheme) {
    if (apptheme == newtheme) {
      return;
    } else {
      apptheme = newtheme;
      notifyListeners();
    }
  }
}
