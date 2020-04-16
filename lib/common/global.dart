import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Global {
  static SharedPreferences _prefs;
  static String account;
  static String secret; 
  static String nickname;
}