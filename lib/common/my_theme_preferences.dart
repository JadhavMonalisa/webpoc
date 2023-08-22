import 'package:shared_preferences/shared_preferences.dart';

class MyThemePreferences{
  static const THEME_KEY = "theme_key";

  setTheme(bool value) async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(THEME_KEY, value);
  }

  getTheme() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(THEME_KEY) ?? false;
  }
}