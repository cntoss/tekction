import 'package:hive/hive.dart';

import 'hive_initializer.dart';

class HiveManager {
  Future<void> clearAll() {
    return Hive.box(HIVE_DB_KEY).deleteFromDisk();
  }

  Future<void> delete(String key) {
    return Hive.box(HIVE_DB_KEY).delete(key);
  }

  read(String key) {
    return Hive.box(HIVE_DB_KEY).get(key);
  }

  Future<void> write(String key, value) {
    return Hive.box(HIVE_DB_KEY).put(key, value);
  }
}
