// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:dependencies/dependencies.dart' as _i1;
import 'package:flutter/material.dart' as _i6;
import 'package:tekction/features/home/screen/home_page.dart' as _i4;
import 'package:tekction/features/login/login.dart' as _i3;
import 'package:tekction/features/splash/splash_screen.dart' as _i2;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    EmptyRouterPageRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i5.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.HomePage(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          EmptyRouterPageRoute.name,
          path: '/',
          children: [
            _i5.RouteConfig(
              '#redirect',
              path: '',
              parent: EmptyRouterPageRoute.name,
              redirectTo: 'Splash',
              fullMatch: true,
            ),
            _i5.RouteConfig(
              SplashRoute.name,
              path: 'Splash',
              parent: EmptyRouterPageRoute.name,
            ),
            _i5.RouteConfig(
              LoginRoute.name,
              path: 'Login',
              parent: EmptyRouterPageRoute.name,
            ),
            _i5.RouteConfig(
              HomeRoute.name,
              path: 'Home',
              parent: EmptyRouterPageRoute.name,
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class EmptyRouterPageRoute extends _i5.PageRouteInfo<void> {
  const EmptyRouterPageRoute({List<_i5.PageRouteInfo>? children})
      : super(
          EmptyRouterPageRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'EmptyRouterPageRoute';
}

/// generated route for
/// [_i2.SplashScreen]
class SplashRoute extends _i5.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: 'Splash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'Login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: 'Home',
        );

  static const String name = 'HomeRoute';
}
