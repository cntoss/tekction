import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

/// Key Cache manager box
// ignore: constant_identifier_names
const String HIVE_DB_KEY = 'LOCAL_DB';

class HiveInitializer {
  static Future<void> initializeHive({required encryptKey}) async {
    final appDirectory = await getApplicationDocumentsDirectory();
    Hive.init(appDirectory.path);

    //to register auto generated hive adapter
    // _registerAdapters();

    // open the CacheManager box
    await openBoxManager(encryptKey, appDirectory.path);
  }

  // static void _registerAdapters() {}
}

Future<Box<dynamic>> openBoxManager(encryptKey, path) async {
  var encryptionKey = encryptKey.codeUnits;

  Box box = await Hive.openBox(
    HIVE_DB_KEY,
    path: path,
    encryptionCipher: HiveAesCipher(encryptionKey),
  );
  return box;
}
