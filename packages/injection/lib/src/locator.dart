import 'package:data_config/data_config.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setLocator() {
  //?App Helpers
  locator.registerLazySingleton(() => SizeConfig());
  locator.registerLazySingleton(() => UiHelper());
}
