// Package imports:
import 'package:get_it/get_it.dart';

// Project imports:
import '../helper/size_config.dart';
import '../helper/ui_helper.dart';
export '../helper/size_config.dart';
export '../helper/ui_helper.dart';

GetIt locator = GetIt.instance;

void setLocator() {
  //?App Helpers
  locator.registerLazySingleton(() => SizeConfig());
  locator.registerLazySingleton(() => UiHelper());


}
