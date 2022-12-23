import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  static const String id = 'splash_page';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isOffline = false;
  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var token = sharedPreferences.getBool(broadcasterKey);
    if (token != null) {
      Future.delayed(const Duration(milliseconds: 500),
          () => context.router.replaceNamed(AppRoutes.mainTabPath));
    } else {
      Future.delayed(const Duration(seconds: 1),
          () => context.router.replaceNamed(AppRoutes.loginPath));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const FlutterLogo(
              size: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                'Welcome to Tekction',
                style: TextStyle(
                  color: Colors.pink[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
