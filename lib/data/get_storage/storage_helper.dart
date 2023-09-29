import 'package:get_storage/get_storage.dart';

class StorageHelper {
  static GetStorage storageBox = GetStorage();

  static T? read<T>(String key) {
    return storageBox.read<T>(key);
  }

  static ThemeMode? readThemeMode<ThemeMode>(String key) {
    return storageBox.read<ThemeMode>(key);
  }

  static bool? readBool(String key) {
    return storageBox.read<bool>(key);
  }

  static write(String key, dynamic value) async {
    return await storageBox.write(key, value);
  }

  static writeIfNull(String key, dynamic value) async {
    return await storageBox.writeIfNull(key, value);
  }
}
