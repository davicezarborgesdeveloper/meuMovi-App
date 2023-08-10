import 'package:shared_preferences/shared_preferences.dart';

import '../global/constants.dart';
import 'storage.dart';

class PreferencesStorage implements Storage {
  @override
  void clean() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    // prefs.remove(SessionStorageKeys.accessToken.key);
    // prefs.remove(SessionStorageKeys.keepLogged.key);
  }

  @override
  Future<String?> getData(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(key);
  }

  @override
  Future<void> setData(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(key, value);
  }
}
