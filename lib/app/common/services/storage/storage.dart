
import 'package:get_storage/get_storage.dart';

abstract class AppStorage {
  static final GetStorage _storage = GetStorage();

  static GetStorage get storage => _storage;

  static Future<void> saveValue(String key, dynamic value) =>
      _storage.writeIfNull(key, value);

  static Future<void> updateValue(String key, dynamic value) =>
      _storage.write(key, value);

  static Future<void> updateNewValue(String key, dynamic value) async {
    if(getValue(key) != value) _storage.write(key, value);
  }


  static T? getValue<T>(String key) => _storage.read<T>(key);

  static bool hasData(String key) => _storage.hasData(key);

  static Future<void> removeValue(String key) => _storage.remove(key);

  static Future<void> clearStorage() => _storage.erase();
}
