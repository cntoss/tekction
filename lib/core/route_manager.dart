import 'package:flutter/material.dart';
import 'package:tekction/home/ui/screen/home_page.dart';
import 'package:tekction/login/ui/login.dart';
import 'package:tekction/splash/splash_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginView = "/login";
  static const String homeView = "/home";
}

class RouteGenerator {
  static Route<dynamic> getRoute(
    RouteSettings routeSettings,
  ) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.loginView:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case Routes.homeView:
        return MaterialPageRoute(builder: (_) => const HomePage());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("404"),
              ),
              body: const Center(child: Text("Page Not found")),
            ));
  }
}
