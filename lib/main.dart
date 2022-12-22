// Flutter imports:

import 'package:data_config/data_config.dart';
import 'package:flutter/material.dart';
import 'package:injection/injection.dart';

// Project imports:

import 'navigation/route_manager.dart';
import 'utils/theme_data.dart';

void main() {
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
      initialRoute: Routes.homeView,
    );
  }
}
