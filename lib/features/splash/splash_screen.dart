import 'dart:io';

import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:flutter/material.dart';
import 'package:preferences/preferences.dart';

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

  /* checkLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var token = sharedPreferences.getBool(broadcasterKey);
    if (token != null) {
      Future.delayed(const Duration(milliseconds: 500),
          () => context.router.replaceNamed(AppRoutes.mainTabPath));
    } else {
      Future.delayed(const Duration(seconds: 1),
          () => context.router.replaceNamed(AppRoutes.loginPath));
    }
  } */

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        initialData: FirebaseAuth.instance.currentUser,
        builder: (_, snapshot) {
          // User is not signed in
          if (!snapshot.hasData) {
            return SignInScreen(providerConfigs: [
              const EmailProviderConfiguration(),
              GoogleProviderConfiguration(
                  clientId: Platform.isAndroid
                      ? '765102064979-lr9m80ktol3t0sd80s5dfcj9jh0nen3h.apps.googleusercontent.com'
                      : '765102064979-pqhnrh2u0jqhi0r0vu86hmi3q66u05jf.apps.googleusercontent.com'),
            ]);
          } else {
            Future.delayed(const Duration(milliseconds: 500),
                () => context.router.replaceNamed(AppRoutes.mainTabPath));
          }

          return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    AssetsPath.iconLogo,
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
        });
  }
}
