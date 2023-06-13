import 'package:flutter/cupertino.dart';
import 'package:platform_converted_app/models/app_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider extends ChangeNotifier {
  AppModel appModel;

  AppProvider({required this.appModel});

  switchUi() async {
    appModel.switchValue = !appModel.switchValue;

    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool('appSwitch', appModel.switchValue);
    notifyListeners();
  }
}
