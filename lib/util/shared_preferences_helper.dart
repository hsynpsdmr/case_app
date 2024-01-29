import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferences? _sharedPreferences;

  static Future<SharedPreferences> getInstance() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    return _sharedPreferences!;
  }

  static void setString(String key, String value) {
    _sharedPreferences?.setString(key, value);
  }

  static String? getString(String key) {
    return _sharedPreferences?.getString(key);
  }

  static void setInt(String key, int value) {
    _sharedPreferences?.setInt(key, value);
  }

  static int? getInt(String key) {
    return _sharedPreferences?.getInt(key);
  }

  static void setDouble(String key, double value) {
    _sharedPreferences?.setDouble(key, value);
  }

  static double? getDouble(String key) {
    return _sharedPreferences?.getDouble(key);
  }

  static void setBool(String key, bool value) {
    _sharedPreferences?.setBool(key, value);
  }

  static bool? getBool(String key) {
    return _sharedPreferences?.getBool(key);
  }

  static void setList(String key, List<String> value) {
    _sharedPreferences?.setStringList(key, value);
  }

  static List<String>? getList(String key) {
    return _sharedPreferences?.getStringList(key);
  }

  static void clear() {
    _sharedPreferences?.clear();
  }
}
