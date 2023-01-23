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
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:dependencies/dependencies.dart' as _i1;
import 'package:flutter/material.dart' as _i20;
import 'package:tekction/core/enum/see_all_type.dart' as _i22;
import 'package:tekction/data/model/mode.dart' as _i21;
import 'package:tekction/features/cart/cart_screen.dart' as _i14;
import 'package:tekction/features/cart/checkout_screen.dart' as _i15;
import 'package:tekction/features/cart/payment_screen.dart' as _i16;
import 'package:tekction/features/cart/successful_payment_screen.dart' as _i17;
import 'package:tekction/features/components/see_all/see_all_page.dart' as _i13;
import 'package:tekction/features/detail_product/details_product_page.dart'
    as _i12;
import 'package:tekction/features/explore/explore_screen.dart' as _i9;
import 'package:tekction/features/explore/recommended_creators_screen.dart'
    as _i10;
import 'package:tekction/features/explore/user_follow/user_follower_page.dart'
    as _i11;
import 'package:tekction/features/home/screen/home_screen.dart' as _i5;
import 'package:tekction/features/home/screen/live_page.dart' as _i6;
import 'package:tekction/features/home/screen/live_streaming.dart' as _i7;
import 'package:tekction/features/login/login_screen.dart' as _i3;
import 'package:tekction/features/main_page.dart' as _i4;
import 'package:tekction/features/product/page/product_detail.dart' as _i8;
import 'package:tekction/features/profile/profile.dart' as _i18;
import 'package:tekction/features/splash/splash_screen.dart' as _i2;

class AppRouter extends _i19.RootStackRouter {
  AppRouter([_i20.GlobalKey<_i20.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    EmptyRouterPageRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i2.SplashScreen(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    MainTabRoute.name: (routeData) {
      final args = routeData.argsAs<MainTabRouteArgs>(
          orElse: () => const MainTabRouteArgs());
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i4.MainPage(key: args.key),
      );
    },
    HomeRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
        maintainState: false,
      );
    },
    ExploreRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
        maintainState: false,
      );
    },
    CartRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    HomeScreenRoute.name: (routeData) {
      final args = routeData.argsAs<HomeScreenRouteArgs>(
          orElse: () => const HomeScreenRouteArgs());
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i5.HomeScreen(
          key: args.key,
          isBroadCaster: args.isBroadCaster,
        ),
      );
    },
    LivePageRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i6.LivePage(),
      );
    },
    LiveStreamingRoute.name: (routeData) {
      final args = routeData.argsAs<LiveStreamingRouteArgs>(
          orElse: () => const LiveStreamingRouteArgs());
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i7.LiveStreaming(
          key: args.key,
          isBroadCaster: args.isBroadCaster,
        ),
      );
    },
    ProductDetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<ProductDetailScreenRouteArgs>();
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i8.ProductDetailScreen(
          key: args.key,
          product: args.product,
        ),
      );
    },
    ExploreScreenRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i9.ExploreScreen(),
      );
    },
    RecommendedScreenRoute.name: (routeData) {
      final args = routeData.argsAs<RecommendedScreenRouteArgs>();
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i10.RecommendedCreatorsScreen(
          key: args.key,
          users: args.users,
        ),
      );
    },
    UserFollowerPageRoute.name: (routeData) {
      final args = routeData.argsAs<UserFollowerPageRouteArgs>();
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i11.UserFollowerPage(
          key: args.key,
          user: args.user,
        ),
      );
    },
    DetailsProductPageRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsProductPageRouteArgs>();
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i12.DetailsProductPage(
          key: args.key,
          product: args.product,
        ),
      );
    },
    SeeAllPageRoute.name: (routeData) {
      final args = routeData.argsAs<SeeAllPageRouteArgs>();
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i13.SeeAllPage(
          key: args.key,
          type: args.type,
        ),
      );
    },
    CartScreenRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i14.CartScreen(),
      );
    },
    CheckoutRoute.name: (routeData) {
      final args = routeData.argsAs<CheckoutRouteArgs>();
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i15.CheckoutScreen(
          key: args.key,
          list: args.list,
        ),
      );
    },
    PaymentRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i16.PaymentScreen(),
      );
    },
    SuccessfulPaymentRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i17.SuccessfulPaymentScreen(),
      );
    },
    ProfileScreenRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i18.ProfileScreen(),
      );
    },
    SettingsRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i18.SettingsScreen(),
      );
    },
    ProductPageRoute.name: (routeData) {
      final args = routeData.argsAs<ProductPageRouteArgs>();
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i18.ProductPage(
          key: args.key,
          user: args.user,
        ),
      );
    },
    OrderHistoryRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i18.OrderHistoryScreen(),
      );
    },
    IssueComplaintRoute.name: (routeData) {
      final args = routeData.argsAs<IssueComplaintRouteArgs>();
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i18.IssueComplaintPage(
          key: args.key,
          orderHistory: args.orderHistory,
        ),
      );
    },
    OrderDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<OrderDetailsRouteArgs>();
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i18.OrderDetailsPage(
          key: args.key,
          orderHistory: args.orderHistory,
        ),
      );
    },
    EditProfileScreenRoute.name: (routeData) {
      final args = routeData.argsAs<EditProfileScreenRouteArgs>(
          orElse: () => const EditProfileScreenRouteArgs());
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: _i18.EditProfileScreen(
          key: args.key,
          user: args.user,
        ),
      );
    },
    ChangePasswordScreenRoute.name: (routeData) {
      return _i19.AdaptivePage<dynamic>(
        routeData: routeData,
        child: const _i18.ChangePasswordScreen(),
      );
    },
  };

  @override
  List<_i19.RouteConfig> get routes => [
        _i19.RouteConfig(
          EmptyRouterPageRoute.name,
          path: '/',
          children: [
            _i19.RouteConfig(
              '#redirect',
              path: '',
              parent: EmptyRouterPageRoute.name,
              redirectTo: 'Splash',
              fullMatch: true,
            ),
            _i19.RouteConfig(
              SplashRoute.name,
              path: 'Splash',
              parent: EmptyRouterPageRoute.name,
            ),
            _i19.RouteConfig(
              LoginRoute.name,
              path: 'Login',
              parent: EmptyRouterPageRoute.name,
            ),
            _i19.RouteConfig(
              MainTabRoute.name,
              path: 'mainTab',
              parent: EmptyRouterPageRoute.name,
              children: [
                _i19.RouteConfig(
                  HomeRoute.name,
                  path: 'Home',
                  parent: MainTabRoute.name,
                  children: [
                    _i19.RouteConfig(
                      HomeScreenRoute.name,
                      path: '',
                      parent: HomeRoute.name,
                    ),
                    _i19.RouteConfig(
                      LivePageRoute.name,
                      path: 'live',
                      parent: HomeRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i19.RouteConfig(
                      LiveStreamingRoute.name,
                      path: 'liveChat',
                      parent: HomeRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i19.RouteConfig(
                      ProductDetailScreenRoute.name,
                      path: 'ProductDetail',
                      parent: HomeRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i19.RouteConfig(
                      '*#redirect',
                      path: '*',
                      parent: HomeRoute.name,
                      redirectTo: '',
                      fullMatch: true,
                    ),
                  ],
                ),
                _i19.RouteConfig(
                  ExploreRoute.name,
                  path: 'Explore',
                  parent: MainTabRoute.name,
                  children: [
                    _i19.RouteConfig(
                      ExploreScreenRoute.name,
                      path: '',
                      parent: ExploreRoute.name,
                    ),
                    _i19.RouteConfig(
                      RecommendedScreenRoute.name,
                      path: 'RecommendedScreen',
                      parent: ExploreRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i19.RouteConfig(
                      UserFollowerPageRoute.name,
                      path: 'UserFollowerPage',
                      parent: ExploreRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i19.RouteConfig(
                      DetailsProductPageRoute.name,
                      path: 'DetailsProductPage',
                      parent: ExploreRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i19.RouteConfig(
                      SeeAllPageRoute.name,
                      path: 'SeeAllPage',
                      parent: ExploreRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                  ],
                ),
                _i19.RouteConfig(
                  CartRoute.name,
                  path: 'Cart',
                  parent: MainTabRoute.name,
                  children: [
                    _i19.RouteConfig(
                      CartScreenRoute.name,
                      path: '',
                      parent: CartRoute.name,
                    ),
                    _i19.RouteConfig(
                      CheckoutRoute.name,
                      path: 'Checkout',
                      parent: CartRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i19.RouteConfig(
                      PaymentRoute.name,
                      path: 'Payment',
                      parent: CartRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i19.RouteConfig(
                      SuccessfulPaymentRoute.name,
                      path: 'SuccessfulPayment',
                      parent: CartRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                  ],
                ),
                _i19.RouteConfig(
                  ProfileRoute.name,
                  path: 'Profile',
                  parent: MainTabRoute.name,
                  children: [
                    _i19.RouteConfig(
                      ProfileScreenRoute.name,
                      path: '',
                      parent: ProfileRoute.name,
                    ),
                    _i19.RouteConfig(
                      SettingsRoute.name,
                      path: 'Settings',
                      parent: ProfileRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i19.RouteConfig(
                      ProductPageRoute.name,
                      path: 'Product',
                      parent: ProfileRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i19.RouteConfig(
                      OrderHistoryRoute.name,
                      path: 'OrderHistory',
                      parent: ProfileRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i19.RouteConfig(
                      IssueComplaintRoute.name,
                      path: 'issueComplaint',
                      parent: ProfileRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i19.RouteConfig(
                      OrderDetailsRoute.name,
                      path: 'orderDetails',
                      parent: ProfileRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i19.RouteConfig(
                      EditProfileScreenRoute.name,
                      path: 'ProfileEdit',
                      parent: ProfileRoute.name,
                      meta: <String, dynamic>{'hideToolbar': true},
                    ),
                    _i19.RouteConfig(
                      ChangePasswordScreenRoute.name,
                      path: 'ChangePassword',
                      parent: ProfileRoute.name,
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
class EmptyRouterPageRoute extends _i19.PageRouteInfo<void> {
  const EmptyRouterPageRoute({List<_i19.PageRouteInfo>? children})
      : super(
          EmptyRouterPageRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'EmptyRouterPageRoute';
}

/// generated route for
/// [_i2.SplashScreen]
class SplashRoute extends _i19.PageRouteInfo<void> {
  const SplashRoute()
      : super(
          SplashRoute.name,
          path: 'Splash',
        );

  static const String name = 'SplashRoute';
}

/// generated route for
/// [_i3.LoginScreen]
class LoginRoute extends _i19.PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: 'Login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [_i4.MainPage]
class MainTabRoute extends _i19.PageRouteInfo<MainTabRouteArgs> {
  MainTabRoute({
    _i20.Key? key,
    List<_i19.PageRouteInfo>? children,
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

  final _i20.Key? key;

  @override
  String toString() {
    return 'MainTabRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i1.EmptyRouterPage]
class HomeRoute extends _i19.PageRouteInfo<void> {
  const HomeRoute({List<_i19.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          path: 'Home',
          initialChildren: children,
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class ExploreRoute extends _i19.PageRouteInfo<void> {
  const ExploreRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ExploreRoute.name,
          path: 'Explore',
          initialChildren: children,
        );

  static const String name = 'ExploreRoute';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class CartRoute extends _i19.PageRouteInfo<void> {
  const CartRoute({List<_i19.PageRouteInfo>? children})
      : super(
          CartRoute.name,
          path: 'Cart',
          initialChildren: children,
        );

  static const String name = 'CartRoute';
}

/// generated route for
/// [_i1.EmptyRouterPage]
class ProfileRoute extends _i19.PageRouteInfo<void> {
  const ProfileRoute({List<_i19.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          path: 'Profile',
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [_i5.HomeScreen]
class HomeScreenRoute extends _i19.PageRouteInfo<HomeScreenRouteArgs> {
  HomeScreenRoute({
    _i20.Key? key,
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

  final _i20.Key? key;

  final bool isBroadCaster;

  @override
  String toString() {
    return 'HomeScreenRouteArgs{key: $key, isBroadCaster: $isBroadCaster}';
  }
}

/// generated route for
/// [_i6.LivePage]
class LivePageRoute extends _i19.PageRouteInfo<void> {
  const LivePageRoute()
      : super(
          LivePageRoute.name,
          path: 'live',
        );

  static const String name = 'LivePageRoute';
}

/// generated route for
/// [_i7.LiveStreaming]
class LiveStreamingRoute extends _i19.PageRouteInfo<LiveStreamingRouteArgs> {
  LiveStreamingRoute({
    _i20.Key? key,
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

  final _i20.Key? key;

  final bool? isBroadCaster;

  @override
  String toString() {
    return 'LiveStreamingRouteArgs{key: $key, isBroadCaster: $isBroadCaster}';
  }
}

/// generated route for
/// [_i8.ProductDetailScreen]
class ProductDetailScreenRoute
    extends _i19.PageRouteInfo<ProductDetailScreenRouteArgs> {
  ProductDetailScreenRoute({
    _i20.Key? key,
    required _i21.ProductModel product,
  }) : super(
          ProductDetailScreenRoute.name,
          path: 'ProductDetail',
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

  final _i20.Key? key;

  final _i21.ProductModel product;

  @override
  String toString() {
    return 'ProductDetailScreenRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i9.ExploreScreen]
class ExploreScreenRoute extends _i19.PageRouteInfo<void> {
  const ExploreScreenRoute()
      : super(
          ExploreScreenRoute.name,
          path: '',
        );

  static const String name = 'ExploreScreenRoute';
}

/// generated route for
/// [_i10.RecommendedCreatorsScreen]
class RecommendedScreenRoute
    extends _i19.PageRouteInfo<RecommendedScreenRouteArgs> {
  RecommendedScreenRoute({
    _i20.Key? key,
    required List<_i21.MainUser>? users,
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

  final _i20.Key? key;

  final List<_i21.MainUser>? users;

  @override
  String toString() {
    return 'RecommendedScreenRouteArgs{key: $key, users: $users}';
  }
}

/// generated route for
/// [_i11.UserFollowerPage]
class UserFollowerPageRoute
    extends _i19.PageRouteInfo<UserFollowerPageRouteArgs> {
  UserFollowerPageRoute({
    _i20.Key? key,
    required _i21.MainUser user,
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

  final _i20.Key? key;

  final _i21.MainUser user;

  @override
  String toString() {
    return 'UserFollowerPageRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i12.DetailsProductPage]
class DetailsProductPageRoute
    extends _i19.PageRouteInfo<DetailsProductPageRouteArgs> {
  DetailsProductPageRoute({
    _i20.Key? key,
    required _i21.ItemProduct product,
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

  final _i20.Key? key;

  final _i21.ItemProduct product;

  @override
  String toString() {
    return 'DetailsProductPageRouteArgs{key: $key, product: $product}';
  }
}

/// generated route for
/// [_i13.SeeAllPage]
class SeeAllPageRoute extends _i19.PageRouteInfo<SeeAllPageRouteArgs> {
  SeeAllPageRoute({
    _i20.Key? key,
    required _i22.SeeAllType type,
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

  final _i20.Key? key;

  final _i22.SeeAllType type;

  @override
  String toString() {
    return 'SeeAllPageRouteArgs{key: $key, type: $type}';
  }
}

/// generated route for
/// [_i14.CartScreen]
class CartScreenRoute extends _i19.PageRouteInfo<void> {
  const CartScreenRoute()
      : super(
          CartScreenRoute.name,
          path: '',
        );

  static const String name = 'CartScreenRoute';
}

/// generated route for
/// [_i15.CheckoutScreen]
class CheckoutRoute extends _i19.PageRouteInfo<CheckoutRouteArgs> {
  CheckoutRoute({
    _i20.Key? key,
    required List<_i21.CartDetailsItem> list,
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

  final _i20.Key? key;

  final List<_i21.CartDetailsItem> list;

  @override
  String toString() {
    return 'CheckoutRouteArgs{key: $key, list: $list}';
  }
}

/// generated route for
/// [_i16.PaymentScreen]
class PaymentRoute extends _i19.PageRouteInfo<void> {
  const PaymentRoute()
      : super(
          PaymentRoute.name,
          path: 'Payment',
        );

  static const String name = 'PaymentRoute';
}

/// generated route for
/// [_i17.SuccessfulPaymentScreen]
class SuccessfulPaymentRoute extends _i19.PageRouteInfo<void> {
  const SuccessfulPaymentRoute()
      : super(
          SuccessfulPaymentRoute.name,
          path: 'SuccessfulPayment',
        );

  static const String name = 'SuccessfulPaymentRoute';
}

/// generated route for
/// [_i18.ProfileScreen]
class ProfileScreenRoute extends _i19.PageRouteInfo<void> {
  const ProfileScreenRoute()
      : super(
          ProfileScreenRoute.name,
          path: '',
        );

  static const String name = 'ProfileScreenRoute';
}

/// generated route for
/// [_i18.SettingsScreen]
class SettingsRoute extends _i19.PageRouteInfo<void> {
  const SettingsRoute()
      : super(
          SettingsRoute.name,
          path: 'Settings',
        );

  static const String name = 'SettingsRoute';
}

/// generated route for
/// [_i18.ProductPage]
class ProductPageRoute extends _i19.PageRouteInfo<ProductPageRouteArgs> {
  ProductPageRoute({
    _i20.Key? key,
    required _i21.UserModel user,
  }) : super(
          ProductPageRoute.name,
          path: 'Product',
          args: ProductPageRouteArgs(
            key: key,
            user: user,
          ),
        );

  static const String name = 'ProductPageRoute';
}

class ProductPageRouteArgs {
  const ProductPageRouteArgs({
    this.key,
    required this.user,
  });

  final _i20.Key? key;

  final _i21.UserModel user;

  @override
  String toString() {
    return 'ProductPageRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i18.OrderHistoryScreen]
class OrderHistoryRoute extends _i19.PageRouteInfo<void> {
  const OrderHistoryRoute()
      : super(
          OrderHistoryRoute.name,
          path: 'OrderHistory',
        );

  static const String name = 'OrderHistoryRoute';
}

/// generated route for
/// [_i18.IssueComplaintPage]
class IssueComplaintRoute extends _i19.PageRouteInfo<IssueComplaintRouteArgs> {
  IssueComplaintRoute({
    _i20.Key? key,
    required _i21.OrderDetails orderHistory,
  }) : super(
          IssueComplaintRoute.name,
          path: 'issueComplaint',
          args: IssueComplaintRouteArgs(
            key: key,
            orderHistory: orderHistory,
          ),
        );

  static const String name = 'IssueComplaintRoute';
}

class IssueComplaintRouteArgs {
  const IssueComplaintRouteArgs({
    this.key,
    required this.orderHistory,
  });

  final _i20.Key? key;

  final _i21.OrderDetails orderHistory;

  @override
  String toString() {
    return 'IssueComplaintRouteArgs{key: $key, orderHistory: $orderHistory}';
  }
}

/// generated route for
/// [_i18.OrderDetailsPage]
class OrderDetailsRoute extends _i19.PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({
    _i20.Key? key,
    required _i21.OrderDetails orderHistory,
  }) : super(
          OrderDetailsRoute.name,
          path: 'orderDetails',
          args: OrderDetailsRouteArgs(
            key: key,
            orderHistory: orderHistory,
          ),
        );

  static const String name = 'OrderDetailsRoute';
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({
    this.key,
    required this.orderHistory,
  });

  final _i20.Key? key;

  final _i21.OrderDetails orderHistory;

  @override
  String toString() {
    return 'OrderDetailsRouteArgs{key: $key, orderHistory: $orderHistory}';
  }
}

/// generated route for
/// [_i18.EditProfileScreen]
class EditProfileScreenRoute
    extends _i19.PageRouteInfo<EditProfileScreenRouteArgs> {
  EditProfileScreenRoute({
    _i20.Key? key,
    _i21.UserModel? user,
  }) : super(
          EditProfileScreenRoute.name,
          path: 'ProfileEdit',
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

  final _i20.Key? key;

  final _i21.UserModel? user;

  @override
  String toString() {
    return 'EditProfileScreenRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i18.ChangePasswordScreen]
class ChangePasswordScreenRoute extends _i19.PageRouteInfo<void> {
  const ChangePasswordScreenRoute()
      : super(
          ChangePasswordScreenRoute.name,
          path: 'ChangePassword',
        );

  static const String name = 'ChangePasswordScreenRoute';
}
