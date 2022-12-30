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
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:dependencies/dependencies.dart' as _i1;
import 'package:flutter/material.dart' as _i13;
import 'package:tekction/features/home/screen/home_screen.dart' as _i5;
import 'package:tekction/features/home/screen/live_page.dart' as _i6;
import 'package:tekction/features/home/screen/live_streaming.dart' as _i7;
import 'package:tekction/features/login/login_screen.dart' as _i3;
import 'package:tekction/features/main_page.dart' as _i4;
import 'package:tekction/features/product/page/product_detail.dart' as _i10;
import 'package:tekction/features/product/page/product_list_screen.dart'
    as _i11;
import 'package:tekction/features/profile/page/edit_profile.dart' as _i9;
import 'package:tekction/features/profile/page/profile_page.dart' as _i8;
import 'package:tekction/features/splash/splash_screen.dart' as _i2;
import 'package:tekction/model/mode.dart' as _i14;

class AppRouter extends _i12.RootStackRouter {
  AppRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    EmptyRouterPageRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    MainTabRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i4.MainPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
        maintainState: false,
      );
    },
    ExploreRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
        maintainState: false,
      );
    },
    HomeScreenRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i5.HomeScreen(),
      );
    },
    LivePageRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.LivePage(),
      );
    },
    LiveStreamingRoute.name: (routeData) {
      final args = routeData.argsAs<LiveStreamingRouteArgs>(
          orElse: () => const LiveStreamingRouteArgs());
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i7.LiveStreaming(
          key: args.key,
          isBroadCaster: args.isBroadCaster,
        ),
      );
    },
    UserProfileScreenRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfileScreenRouteArgs>();
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i8.UserProfileScreen(
          key: args.key,
          user: args.user,
        ),
      );
    },
    EditProfileScreenRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileScreenRouteArgs>(
          orElse: () => const EditProfileScreenRouteArgs());
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i9.EditProfileScreen(
          key: args.key,
          user: args.user,
        ),
      );
    },
    ProductDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailScreenRouteArgs>();
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i10.ProductDetailScreen(
          key: args.key,
          product: args.product,
        ),
      );
    },
    ExplorePageRoute.name: (routeData) {
      return _i12.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i11.ExplorePage(),
      );
    },
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(
          EmptyRouterPageRoute.name,
          path: '/',
          children: [
            _i12.RouteConfig(
              '#redirect',
              path: '',
              parent: EmptyRouterPageRoute.name,
              redirectTo: 'Splash',
              fullMatch: true,
            ),
            _i12.RouteConfig(
              SplashRoute.name,
              path: 'Splash',
              parent: EmptyRouterPageRoute.name,
            ),
            _i12.RouteConfig(
              LoginRoute.name,
              path: 'Login',
              parent: EmptyRouterPageRoute.name,
            ),
            _i12.RouteConfig(
              MainTabRoute.name,
              path: 'mainTab',
              parent: EmptyRouterPageRoute.name,
              children: [
                _i12.RouteConfig(
                  HomeRoute.name,
                  path: 'Home',
                  parent: MainTabRoute.name,
                  children: [
                    _i12.RouteConfig(
                      HomeScreenRoute.name,
                      path: '',
                      parent: HomeRoute.name,
                    ),
                    _i12.RouteConfig(
                      LivePageRoute.name,
                      path: 'live',
                      parent: HomeRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i12.RouteConfig(
                      LiveStreamingRoute.name,
                      path: 'liveChat',
                      parent: HomeRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i12.RouteConfig(
                      UserProfileScreenRoute.name,
                      path: 'profile',
                      parent: HomeRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i12.RouteConfig(
                      EditProfileScreenRoute.name,
                      path: 'profileEdit',
                      parent: HomeRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i12.RouteConfig(
                      ProductDetailScreenRoute.name,
                      path: 'productDetail',
                      parent: HomeRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i12.RouteConfig(
                      '*#redirect',
                      path: '*',
                      parent: HomeRoute.name,
                      redirectTo: '',
                      fullMatch: true,
                    ),
                  ],
                ),
                _i12.RouteConfig(
                  ExploreRoute.name,
                  path: 'Explore',
                  parent: MainTabRoute.name,
                  children: [
                    _i12.RouteConfig(
                      ExplorePageRoute.name,
                      path: '',
                      parent: ExploreRoute.name,
                    ),
                    _i12.RouteConfig(
                      '*#redirect',
                      path: '*',
                      parent: ExploreRoute.name,
                      redirectTo: '',
                      fullMatch: true,
                    ),
                  ],
                ),
              ],
            ),
          ],
        )
      ];
}

/// generated route for
/// [_i1.EmptyRouterPage]
class EmptyRouterPageRoute extends _i12.PageRouteInfo<void> {
  const EmptyRouterPageRoute({List<_i12.PageRouteInfo>? children})
      : super(
          EmptyRouterPageRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'EmptyRouterPageRoute';
}

/// generated route for
/// [_i2.SplashScreen]
class SplashRoute extends _i12.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: 'Splash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i12.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'Login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.MainPage]
class MainTabRoute extends _i12.PageRouteInfo<void> {
  const MainTabRoute({List<_i12.PageRouteInfo>? children})
      : super(
          MainTabRoute.name,
          path: 'mainTab',
          initialChildren: children,
        );

  static const String name = 'MainTabRoute';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: 'Home',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class ExploreRoute extends _i12.PageRouteInfo<void> {
  const ExploreRoute({List<_i12.PageRouteInfo>? children})
      : super(
          ExploreRoute.name,
          path: 'Explore',
          initialChildren: children,
        );

  static const String name = 'ExploreRoute';
}

/// generated route for
/// [_i5.HomeScreen]
class HomeScreenRoute extends _i12.PageRouteInfo<void> {
  const HomeScreenRoute()
      : super(
          HomeScreenRoute.name,
          path: '',
        );

  static const String name = 'HomeScreenRoute';
}

/// generated route for
/// [_i6.LivePage]
class LivePageRoute extends _i12.PageRouteInfo<void> {
  const LivePageRoute()
      : super(
          LivePageRoute.name,
          path: 'live',
        );

  static const String name = 'LivePageRoute';
}

/// generated route for
/// [_i7.LiveStreaming]
class LiveStreamingRoute extends _i12.PageRouteInfo<LiveStreamingRouteArgs> {
  LiveStreamingRoute({
    _i13.Key? key,
    bool? isBroadCaster,
  }) : super(
          LiveStreamingRoute.name,
          path: 'liveChat',
          args: LiveStreamingRouteArgs(
            key: key,
            isBroadCaster: isBroadCaster,
          ),
        );

  static const String name = 'LiveStreamingRoute';
}

class LiveStreamingRouteArgs {
  const LiveStreamingRouteArgs({
    this.key,
    this.isBroadCaster,
  });

  final _i13.Key? key;

  final bool? isBroadCaster;

  @override
  String toString() {
    return 'LiveStreamingRouteArgs{key: $key, isBroadCaster: $isBroadCaster}';
  }
}

/// generated route for
/// [_i8.UserProfileScreen]
class UserProfileScreenRoute
    extends _i12.PageRouteInfo<UserProfileScreenRouteArgs> {
  UserProfileScreenRoute({
    _i13.Key? key,
    required _i14.UserModel user,
  }) : super(
          UserProfileScreenRoute.name,
          path: 'profile',
          args: UserProfileScreenRouteArgs(
            key: key,
            user: user,
          ),
        );

  static const String name = 'UserProfileScreenRoute';
}

class UserProfileScreenRouteArgs {
  const UserProfileScreenRouteArgs({
    this.key,
    required this.user,
  });

  final _i13.Key? key;

  final _i14.UserModel user;

  @override
  String toString() {
    return 'UserProfileScreenRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i9.EditProfileScreen]
class EditProfileScreenRoute
    extends _i12.PageRouteInfo<EditProfileScreenRouteArgs> {
  EditProfileScreenRoute({
    _i13.Key? key,
    _i14.UserModel? user,
  }) : super(
          EditProfileScreenRoute.name,
          path: 'profileEdit',
          args: EditProfileScreenRouteArgs(
            key: key,
            user: user,
          ),
        );

  static const String name = 'EditProfileScreenRoute';
}

class EditProfileScreenRouteArgs {
  const EditProfileScreenRouteArgs({
    this.key,
    this.user,
  });

  final _i13.Key? key;

  final _i14.UserModel? user;

  @override
  String toString() {
    return 'EditProfileScreenRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i10.ProductDetailScreen]
class ProductDetailScreenRoute
    extends _i12.PageRouteInfo<ProductDetailScreenRouteArgs> {
  ProductDetailScreenRoute({
    _i13.Key? key,
    required _i14.ProductModel product,
  }) : super(
          ProductDetailScreenRoute.name,
          path: 'productDetail',
          args: ProductDetailScreenRouteArgs(
            key: key,
            product: product,
          ),
        );

  static const String name = 'ProductDetailScreenRoute';
}

class ProductDetailScreenRouteArgs {
  const ProductDetailScreenRouteArgs({
    this.key,
    required this.product,
  });

  final _i13.Key? key;

  final _i14.ProductModel product;

  @override
  String toString() {
    return 'ProductDetailScreenRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i11.ExplorePage]
class ExplorePageRoute extends _i12.PageRouteInfo<void> {
  const ExplorePageRoute()
      : super(
          ExplorePageRoute.name,
          path: '',
        );

  static const String name = 'ExplorePageRoute';
}
