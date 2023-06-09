import 'storage_impl.dart';

abstract class Storage {
  Future<void> setData(String key, Object value);
  Future<String?> getData(String key);
  Future<bool?> getBool(String key);
  void clean();

  factory Storage() {
    return SharedPreferencesStorage();
  }
}
