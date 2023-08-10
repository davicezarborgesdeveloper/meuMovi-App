import 'preferences_storage.dart';

abstract class Storage {
  Future<void> setData(String key, String value);
  Future<String?> getData(String key);
  void clean();

  factory Storage() {
    return PreferencesStorage();
    // if (kIsWeb) {
    //   return SessionStorage();
    // } else {
    //   return PreferencesStorage();
    // }
  }
}
