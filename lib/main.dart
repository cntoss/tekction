// Flutter imports:

import 'package:flutter/material.dart';

// Project imports:

import 'common/app_config.dart';
import 'common/resource/theme_data.dart';
import 'core/route_manager.dart';
import 'service/locator.dart';

void main() async {
  setLocator();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({
    Key? key,
  }) : super(key: key);

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: Colors.black,
      builder: (context, child) => const Tekction(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Tekction extends StatefulWidget {
  const Tekction({Key? key}) : super(key: key);

  @override
  State<Tekction> createState() => _TekctionState();
}

class _TekctionState extends State<Tekction> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppConfig.navigatorKey,
      theme: getApplicationTheme(context),
      onGenerateRoute: RouteGenerator.getRoute,
      initialRoute: Routes.splashRoute,
    );
  }
}
