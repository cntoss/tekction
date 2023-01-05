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
import 'package:auto_route/auto_route.dart' as _i20;
import 'package:dependencies/dependencies.dart' as _i1;
import 'package:flutter/material.dart' as _i21;
import 'package:tekction/core/enum/see_all_type.dart' as _i23;
import 'package:tekction/data/model/mode.dart' as _i22;
import 'package:tekction/features/cart/cart_screen.dart' as _i16;
import 'package:tekction/features/cart/checkout_screen.dart' as _i17;
import 'package:tekction/features/cart/payment_screen.dart' as _i18;
import 'package:tekction/features/cart/successful_payment_screen.dart' as _i19;
import 'package:tekction/features/components/see_all/see_all_page.dart' as _i15;
import 'package:tekction/features/detail_product/details_product_page.dart'
    as _i14;
import 'package:tekction/features/explore/explore_screen.dart' as _i11;
import 'package:tekction/features/explore/recommended_creators_screen.dart'
    as _i12;
import 'package:tekction/features/explore/user_follow/user_follower_page.dart'
    as _i13;
import 'package:tekction/features/home/screen/home_screen.dart' as _i5;
import 'package:tekction/features/home/screen/live_page.dart' as _i6;
import 'package:tekction/features/home/screen/live_streaming.dart' as _i7;
import 'package:tekction/features/login/login_screen.dart' as _i3;
import 'package:tekction/features/main_page.dart' as _i4;
import 'package:tekction/features/product/page/product_detail.dart' as _i10;
import 'package:tekction/features/profile/page/edit_profile.dart' as _i9;
import 'package:tekction/features/profile/page/profile_page.dart' as _i8;
import 'package:tekction/features/splash/splash_screen.dart' as _i2;

class AppRouter extends _i20.RootStackRouter {
  AppRouter([_i21.GlobalKey<_i21.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i20.PageFactory> pagesMap = {
    EmptyRouterPageRoute.name: (routeData) {
      return _i20.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i20.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i20.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    MainTabRoute.name: (routeData) {
      final args = routeData.argsAs<MainTabRouteArgs>(
          orElse: () => const MainTabRouteArgs());
      return _i20.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i4.MainPage(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      return _i20.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
        maintainState: false,
      );
    },
    ExploreRoute.name: (routeData) {
      return _i20.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
        maintainState: false,
      );
    },
    CartRoute.name: (routeData) {
      return _i20.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>(
          orElse: () => const HomeScreenRouteArgs());
      return _i20.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i5.HomeScreen(
          key: args.key,
          isBroadCaster: args.isBroadCaster,
        ),
      );
    },
    LivePageRoute.name: (routeData) {
      return _i20.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.LivePage(),
      );
    },
    LiveStreamingRoute.name: (routeData) {
      final args = routeData.argsAs<LiveStreamingRouteArgs>(
          orElse: () => const LiveStreamingRouteArgs());
      return _i20.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i7.LiveStreaming(
          key: args.key,
          isBroadCaster: args.isBroadCaster,
        ),
      );
    },
    UserProfileScreenRoute.name: (routeData) {
      final args = routeData.argsAs<UserProfileScreenRouteArgs>();
      return _i20.AdaptivePage<dynamic>(
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
      return _i20.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i9.EditProfileScreen(
          key: args.key,
          user: args.user,
        ),
      );
    },
    ProductDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailScreenRouteArgs>();
      return _i20.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i10.ProductDetailScreen(
          key: args.key,
          product: args.product,
        ),
      );
    },
    ExploreScreenRoute.name: (routeData) {
      return _i20.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i11.ExploreScreen(),
      );
    },
    RecommendedScreenRoute.name: (routeData) {
      final args = routeData.argsAs<RecommendedScreenRouteArgs>();
      return _i20.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i12.RecommendedCreatorsScreen(
          key: args.key,
          users: args.users,
        ),
      );
    },
    UserFollowerPageRoute.name: (routeData) {
      final args = routeData.argsAs<UserFollowerPageRouteArgs>();
      return _i20.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i13.UserFollowerPage(
          key: args.key,
          user: args.user,
        ),
      );
    },
    DetailsProductPageRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsProductPageRouteArgs>();
      return _i20.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i14.DetailsProductPage(
          key: args.key,
          product: args.product,
        ),
      );
    },
    SeeAllPageRoute.name: (routeData) {
      final args = routeData.argsAs<SeeAllPageRouteArgs>();
      return _i20.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i15.SeeAllPage(
          key: args.key,
          type: args.type,
        ),
      );
    },
    CartScreenRoute.name: (routeData) {
      return _i20.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i16.CartScreen(),
      );
    },
    CheckoutRoute.name: (routeData) {
      final args = routeData.argsAs<CheckoutRouteArgs>();
      return _i20.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i17.CheckoutScreen(
          key: args.key,
          list: args.list,
        ),
      );
    },
    PaymentRoute.name: (routeData) {
      return _i20.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i18.PaymentScreen(),
      );
    },
    SuccessfulPaymentRoute.name: (routeData) {
      return _i20.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i19.SuccessfulPaymentScreen(),
      );
    },
  };

  @override
  List<_i20.RouteConfig> get routes => [
        _i20.RouteConfig(
          EmptyRouterPageRoute.name,
          path: '/',
          children: [
            _i20.RouteConfig(
              '#redirect',
              path: '',
              parent: EmptyRouterPageRoute.name,
              redirectTo: 'Splash',
              fullMatch: true,
            ),
            _i20.RouteConfig(
              SplashRoute.name,
              path: 'Splash',
              parent: EmptyRouterPageRoute.name,
            ),
            _i20.RouteConfig(
              LoginRoute.name,
              path: 'Login',
              parent: EmptyRouterPageRoute.name,
            ),
            _i20.RouteConfig(
              MainTabRoute.name,
              path: 'mainTab',
              parent: EmptyRouterPageRoute.name,
              children: [
                _i20.RouteConfig(
                  HomeRoute.name,
                  path: 'Home',
                  parent: MainTabRoute.name,
                  children: [
                    _i20.RouteConfig(
                      HomeScreenRoute.name,
                      path: '',
                      parent: HomeRoute.name,
                    ),
                    _i20.RouteConfig(
                      LivePageRoute.name,
                      path: 'live',
                      parent: HomeRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i20.RouteConfig(
                      LiveStreamingRoute.name,
                      path: 'liveChat',
                      parent: HomeRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i20.RouteConfig(
                      UserProfileScreenRoute.name,
                      path: 'profile',
                      parent: HomeRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i20.RouteConfig(
                      EditProfileScreenRoute.name,
                      path: 'profileEdit',
                      parent: HomeRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i20.RouteConfig(
                      ProductDetailScreenRoute.name,
                      path: 'productDetail',
                      parent: HomeRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i20.RouteConfig(
                      '*#redirect',
                      path: '*',
                      parent: HomeRoute.name,
                      redirectTo: '',
                      fullMatch: true,
                    ),
                  ],
                ),
                _i20.RouteConfig(
                  ExploreRoute.name,
                  path: 'Explore',
                  parent: MainTabRoute.name,
                  children: [
                    _i20.RouteConfig(
                      ExploreScreenRoute.name,
                      path: '',
                      parent: ExploreRoute.name,
                    ),
                    _i20.RouteConfig(
                      RecommendedScreenRoute.name,
                      path: 'RecommendedScreen',
                      parent: ExploreRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i20.RouteConfig(
                      UserFollowerPageRoute.name,
                      path: 'UserFollowerPage',
                      parent: ExploreRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i20.RouteConfig(
                      DetailsProductPageRoute.name,
                      path: 'DetailsProductPage',
                      parent: ExploreRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i20.RouteConfig(
                      SeeAllPageRoute.name,
                      path: 'SeeAllPage',
                      parent: ExploreRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                  ],
                ),
                _i20.RouteConfig(
                  CartRoute.name,
                  path: 'Cart',
                  parent: MainTabRoute.name,
                  children: [
                    _i20.RouteConfig(
                      CartScreenRoute.name,
                      path: '',
                      parent: CartRoute.name,
                    ),
                    _i20.RouteConfig(
                      CheckoutRoute.name,
                      path: 'Checkout',
                      parent: CartRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i20.RouteConfig(
                      PaymentRoute.name,
                      path: 'Payment',
                      parent: CartRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i20.RouteConfig(
                      SuccessfulPaymentRoute.name,
                      path: 'SuccessfulPayment',
                      parent: CartRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
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
class EmptyRouterPageRoute extends _i20.PageRouteInfo<void> {
  const EmptyRouterPageRoute({List<_i20.PageRouteInfo>? children})
      : super(
          EmptyRouterPageRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'EmptyRouterPageRoute';
}

/// generated route for
/// [_i2.SplashScreen]
class SplashRoute extends _i20.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: 'Splash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i20.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'Login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.MainPage]
class MainTabRoute extends _i20.PageRouteInfo<MainTabRouteArgs> {
  MainTabRoute({
    _i21.Key? key,
    List<_i20.PageRouteInfo>? children,
  }) : super(
          MainTabRoute.name,
          path: 'mainTab',
          args: MainTabRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MainTabRoute';
}

class MainTabRouteArgs {
  const MainTabRouteArgs({this.key});

  final _i21.Key? key;

  @override
  String toString() {
    return 'MainTabRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i1.EmptyRouterPage]
class HomeRoute extends _i20.PageRouteInfo<void> {
  const HomeRoute({List<_i20.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: 'Home',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class ExploreRoute extends _i20.PageRouteInfo<void> {
  const ExploreRoute({List<_i20.PageRouteInfo>? children})
      : super(
          ExploreRoute.name,
          path: 'Explore',
          initialChildren: children,
        );

  static const String name = 'ExploreRoute';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class CartRoute extends _i20.PageRouteInfo<void> {
  const CartRoute({List<_i20.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          path: 'Cart',
          initialChildren: children,
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i5.HomeScreen]
class HomeScreenRoute extends _i20.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    _i21.Key? key,
    bool isBroadCaster = false,
  }) : super(
          HomeScreenRoute.name,
          path: '',
          args: HomeScreenRouteArgs(
            key: key,
            isBroadCaster: isBroadCaster,
          ),
        );

  static const String name = 'HomeScreenRoute';
}

class HomeScreenRouteArgs {
  const HomeScreenRouteArgs({
    this.key,
    this.isBroadCaster = false,
  });

  final _i21.Key? key;

  final bool isBroadCaster;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key, isBroadCaster: $isBroadCaster}';
  }
}

/// generated route for
/// [_i6.LivePage]
class LivePageRoute extends _i20.PageRouteInfo<void> {
  const LivePageRoute()
      : super(
          LivePageRoute.name,
          path: 'live',
        );

  static const String name = 'LivePageRoute';
}

/// generated route for
/// [_i7.LiveStreaming]
class LiveStreamingRoute extends _i20.PageRouteInfo<LiveStreamingRouteArgs> {
  LiveStreamingRoute({
    _i21.Key? key,
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

  final _i21.Key? key;

  final bool? isBroadCaster;

  @override
  String toString() {
    return 'LiveStreamingRouteArgs{key: $key, isBroadCaster: $isBroadCaster}';
  }
}

/// generated route for
/// [_i8.UserProfileScreen]
class UserProfileScreenRoute
    extends _i20.PageRouteInfo<UserProfileScreenRouteArgs> {
  UserProfileScreenRoute({
    _i21.Key? key,
    required _i22.UserModel user,
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

  final _i21.Key? key;

  final _i22.UserModel user;

  @override
  String toString() {
    return 'UserProfileScreenRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i9.EditProfileScreen]
class EditProfileScreenRoute
    extends _i20.PageRouteInfo<EditProfileScreenRouteArgs> {
  EditProfileScreenRoute({
    _i21.Key? key,
    _i22.UserModel? user,
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

  final _i21.Key? key;

  final _i22.UserModel? user;

  @override
  String toString() {
    return 'EditProfileScreenRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i10.ProductDetailScreen]
class ProductDetailScreenRoute
    extends _i20.PageRouteInfo<ProductDetailScreenRouteArgs> {
  ProductDetailScreenRoute({
    _i21.Key? key,
    required _i22.ProductModel product,
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

  final _i21.Key? key;

  final _i22.ProductModel product;

  @override
  String toString() {
    return 'ProductDetailScreenRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i11.ExploreScreen]
class ExploreScreenRoute extends _i20.PageRouteInfo<void> {
  const ExploreScreenRoute()
      : super(
          ExploreScreenRoute.name,
          path: '',
        );

  static const String name = 'ExploreScreenRoute';
}

/// generated route for
/// [_i12.RecommendedCreatorsScreen]
class RecommendedScreenRoute
    extends _i20.PageRouteInfo<RecommendedScreenRouteArgs> {
  RecommendedScreenRoute({
    _i21.Key? key,
    required List<_i22.MainUser>? users,
  }) : super(
          RecommendedScreenRoute.name,
          path: 'RecommendedScreen',
          args: RecommendedScreenRouteArgs(
            key: key,
            users: users,
          ),
        );

  static const String name = 'RecommendedScreenRoute';
}

class RecommendedScreenRouteArgs {
  const RecommendedScreenRouteArgs({
    this.key,
    required this.users,
  });

  final _i21.Key? key;

  final List<_i22.MainUser>? users;

  @override
  String toString() {
    return 'RecommendedScreenRouteArgs{key: $key, users: $users}';
  }
}

/// generated route for
/// [_i13.UserFollowerPage]
class UserFollowerPageRoute
    extends _i20.PageRouteInfo<UserFollowerPageRouteArgs> {
  UserFollowerPageRoute({
    _i21.Key? key,
    required _i22.MainUser user,
  }) : super(
          UserFollowerPageRoute.name,
          path: 'UserFollowerPage',
          args: UserFollowerPageRouteArgs(
            key: key,
            user: user,
          ),
        );

  static const String name = 'UserFollowerPageRoute';
}

class UserFollowerPageRouteArgs {
  const UserFollowerPageRouteArgs({
    this.key,
    required this.user,
  });

  final _i21.Key? key;

  final _i22.MainUser user;

  @override
  String toString() {
    return 'UserFollowerPageRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i14.DetailsProductPage]
class DetailsProductPageRoute
    extends _i20.PageRouteInfo<DetailsProductPageRouteArgs> {
  DetailsProductPageRoute({
    _i21.Key? key,
    required _i22.ItemProduct product,
  }) : super(
          DetailsProductPageRoute.name,
          path: 'DetailsProductPage',
          args: DetailsProductPageRouteArgs(
            key: key,
            product: product,
          ),
        );

  static const String name = 'DetailsProductPageRoute';
}

class DetailsProductPageRouteArgs {
  const DetailsProductPageRouteArgs({
    this.key,
    required this.product,
  });

  final _i21.Key? key;

  final _i22.ItemProduct product;

  @override
  String toString() {
    return 'DetailsProductPageRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i15.SeeAllPage]
class SeeAllPageRoute extends _i20.PageRouteInfo<SeeAllPageRouteArgs> {
  SeeAllPageRoute({
    _i21.Key? key,
    required _i23.SeeAllType type,
  }) : super(
          SeeAllPageRoute.name,
          path: 'SeeAllPage',
          args: SeeAllPageRouteArgs(
            key: key,
            type: type,
          ),
        );

  static const String name = 'SeeAllPageRoute';
}

class SeeAllPageRouteArgs {
  const SeeAllPageRouteArgs({
    this.key,
    required this.type,
  });

  final _i21.Key? key;

  final _i23.SeeAllType type;

  @override
  String toString() {
    return 'SeeAllPageRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i16.CartScreen]
class CartScreenRoute extends _i20.PageRouteInfo<void> {
  const CartScreenRoute()
      : super(
          CartScreenRoute.name,
          path: '',
        );

  static const String name = 'CartScreenRoute';
}

/// generated route for
/// [_i17.CheckoutScreen]
class CheckoutRoute extends _i20.PageRouteInfo<CheckoutRouteArgs> {
  CheckoutRoute({
    _i21.Key? key,
    required List<_i22.CartDetailsItem> list,
  }) : super(
          CheckoutRoute.name,
          path: 'Checkout',
          args: CheckoutRouteArgs(
            key: key,
            list: list,
          ),
        );

  static const String name = 'CheckoutRoute';
}

class CheckoutRouteArgs {
  const CheckoutRouteArgs({
    this.key,
    required this.list,
  });

  final _i21.Key? key;

  final List<_i22.CartDetailsItem> list;

  @override
  String toString() {
    return 'CheckoutRouteArgs{key: $key, list: $list}';
  }
}

/// generated route for
/// [_i18.PaymentScreen]
class PaymentRoute extends _i20.PageRouteInfo<void> {
  const PaymentRoute()
      : super(
          PaymentRoute.name,
          path: 'Payment',
        );

  static const String name = 'PaymentRoute';
}

/// generated route for
/// [_i19.SuccessfulPaymentScreen]
class SuccessfulPaymentRoute extends _i20.PageRouteInfo<void> {
  const SuccessfulPaymentRoute()
      : super(
          SuccessfulPaymentRoute.name,
          path: 'SuccessfulPayment',
        );

  static const String name = 'SuccessfulPaymentRoute';
}
