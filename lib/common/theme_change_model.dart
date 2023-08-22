import 'package:flutter/cupertino.dart';
import 'package:webpoc/common/my_theme_preferences.dart';

class ThemeChangeModel extends ChangeNotifier{
  late bool _isDark;
  late MyThemePreferences pref;
  bool get isDark => _isDark;

  ThemeChangeModel(){
    _isDark = false;
    pref = MyThemePreferences();
    getPreferences();
    notifyListeners();
  }

  getPreferences() async{
    _isDark = await pref.getTheme();
    notifyListeners();
  }

  ///switching between themes
  set isDark(bool value){
    _isDark = value;
    pref.setTheme(value);
    notifyListeners();
  }
}