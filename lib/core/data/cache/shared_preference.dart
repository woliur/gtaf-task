
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedPreference {
  static Future<String?> getValue(String key) async {
    const storage = FlutterSecureStorage();
    String? value = '';
    try {
      value = await storage.read(key: key);
    } catch (e) {
      // Todo: Implement logger
      // Logger.log(e.toString());
    }
    return value;
  }

  static Future<bool> setValue(String key, String value) async {
    const storage = FlutterSecureStorage();
    bool saved = false;

    try {
      storage.write(key: key, value: value);
      saved = true;
    } catch (e) {
      // Todo: Implement logger
      // Logger.log(e.toString());
    }

    return saved;
  }

  static Future<void> remove(String key) async {
    const storage = FlutterSecureStorage();
    await storage.delete(key: key);
  }

  static Future<bool> setBool(String key, bool value) async {
    const storage = FlutterSecureStorage();
    bool saved = false;
    try {
      storage.write(key: key, value: value.toString());
      saved = true;
    } catch (e) {
      // Todo: Implement logger
      // Logger.log(e.toString());
    }
    return Future<bool>.value(saved);
  }

  static Future<bool> getBool(String key) async {
    bool hasValue = false;
    try {
      final String? value = await SharedPreference.getValue(key);
      hasValue = value.toString().toLowerCase() == "true" ? true : false;
    } catch (e) {
      // Todo: Implement logger
      // Logger.log(e.toString());
    }
    return Future<bool>.value(hasValue);
  }

  static Future<void> removeAll() async {
    const storage = FlutterSecureStorage();
    await storage.deleteAll();
  }
}
