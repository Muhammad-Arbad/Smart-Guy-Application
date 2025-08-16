
import 'package:shared_preferences/shared_preferences.dart';


class AppSharedPreferences{
  static late SharedPreferences _preferences;
  static Future init()async => _preferences = await SharedPreferences.getInstance();

  static String primaryColorString = "primColor";
  static String textColorString = "textColorString";
  static String scaffoldBgColorString = "scaffoldBgColorString";
  static String secondaryColorString = "secondaryColorString";
  static String darkMode = "darkMode";

  static Future setIsDarkMode(bool isDarkMode) => _preferences.setBool(darkMode, isDarkMode);
  static bool? getIsDarkMode() => _preferences.getBool(darkMode);

  static  Future setPrimaryColor(String value) async => _preferences.setString(primaryColorString, value);
  static String getPrimaryColor() => _preferences.getString(primaryColorString)??"0xFF053B9D";



  static  Future setSecondaryColor(String value) async => _preferences.setString(secondaryColorString, value);
  static String getSecondaryColor() => _preferences.getString(secondaryColorString)??"0x66EA580C";










}