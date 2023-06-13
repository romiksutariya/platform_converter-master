import 'package:flutter/cupertino.dart';
import 'package:platform_converted_app/models/theme_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeModel themeModel;

  ThemeProvider({required this.themeModel});

  changeTheme() async {
    themeModel.isDark = !themeModel.isDark;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('AppTheme', themeModel.isDark);

    notifyListeners();
  }
}
