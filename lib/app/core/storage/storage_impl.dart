// import 'dart:html';
import 'package:shared_preferences/shared_preferences.dart';
import 'storage.dart';

// class SessionStorage implements Storage {
//   @override
//   void clean() => window.sessionStorage.clear();

//   @override
//   String getData(String key) => window.sessionStorage[key] ?? '';

//   @override
//   void setData(String key, String value) => window.sessionStorage[key] = value;
// }
class SharedPreferencesStorage implements Storage {
  @override
  Future<void> clean() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  @override
  Future<String?> getData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future<void> setData(String key, Object value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      await prefs.setString(key, value);
    } else {
      await prefs.setBool(key, value as bool);
    }
  }

  @override
  Future<bool?> getBool(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key);
  }
}
