import 'package:flutter/material.dart';
import 'package:tekction/home/ui/screen/home_page.dart';
import 'package:tekction/home/ui/screen/home_page_two.dart';
import 'package:tekction/home/ui/screen/live_page.dart';
import 'package:tekction/home/ui/screen/live_streaming.dart';
import 'package:tekction/login/ui/login.dart';
import 'package:tekction/splash/splash_screen.dart';

class Routes {
  static const String splashRoute = "/";
  static const String loginView = "/login";
  static const String homeView = "/home";
  static const String liveView = "/live";
  static const String liveWithChat = "/live-with-chat";
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

      case Routes.liveView:
        return MaterialPageRoute(builder: (_) => const LivePage());

      case Routes.liveWithChat:
        return MaterialPageRoute(builder: (_) => const LiveStreaming());

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
