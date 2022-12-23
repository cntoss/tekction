import 'package:data_config/data_config.dart';
import 'package:get_it/get_it.dart';
import 'package:tekction/navigation/router.gr.dart';
import 'package:tekction/utils/ui_helper.dart';

GetIt locator = GetIt.instance;

void setLocator() {
  locator.registerSingleton(AppRouter());

  /// App Helpers.
  locator.registerLazySingleton(() => SizeConfig());
  locator.registerLazySingleton(() => UiHelper());
}
