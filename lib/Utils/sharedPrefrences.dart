import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserCredentialPreferences {
  static late SharedPreferences _preferences;
  static const key = 'User_id';
  static Future init() async =>
      _preferences = await SharedPreferences.getInstance();
  static Future setUserUID(String UserId) async =>
      await _preferences.setString(key, UserId);
  static String? getUserUID() => _preferences.getString(key);
  static Future clear() => _preferences.clear();
}