import 'package:flutter/material.dart';
import 'package:tekction/locator.dart';
import 'package:tekction/navigation/router.gr.dart';
import 'package:tekction/utils/theme_data.dart';

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
    final AppRouter appRouter = locator<AppRouter>();

    return MaterialApp.router(
      title: 'Tekction',
      theme: getApplicationTheme(context),
      routerDelegate: appRouter.delegate(),
      routeInformationParser: appRouter.defaultRouteParser(),
      debugShowCheckedModeBanner: false,
    );
  }
}
