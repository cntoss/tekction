import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart' hide ProfileScreen;
import 'package:tekction/features/cart/cart_screen.dart';
import 'package:tekction/features/home/screen/live_page.dart';
import 'package:tekction/features/main_page.dart';
import 'package:tekction/features/home/screen/home_screen.dart';
import 'package:tekction/features/home/screen/live_streaming.dart';
import 'package:tekction/features/login/login_screen.dart';
import 'package:tekction/features/product/page/product_detail.dart';
import 'package:tekction/features/profile/page/edit_profile.dart';
import 'package:tekction/features/profile/page/product_page.dart';
import 'package:tekction/features/profile/page/profile_screen.dart';
import 'package:tekction/features/splash/splash_screen.dart';
import 'package:tekction/navigation/arguments_route.dart';

import '../features/cart/checkout_screen.dart';
import '../features/cart/payment_screen.dart';
import '../features/cart/successful_payment_screen.dart';
import '../features/components/see_all/see_all_page.dart';
import '../features/detail_product/details_product_page.dart';
import '../features/explore/explore_screen.dart';
import '../features/explore/recommended_creators_screen.dart';
import '../features/explore/user_follow/user_follower_page.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page|Screen,Route,Dialog',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: EmptyRouterPage,
      children: [
        AutoRoute(
          initial: true,
          path: AppRoutes.splashPath,
          page: SplashScreen,
          name: AppRoutes.splashRouteName,
        ),
        AutoRoute(
          path: AppRoutes.loginPath,
          page: LoginScreen,
          name: AppRoutes.loginRouteName,
        ),
        AutoRoute(
          path: AppRoutes.mainTabPath,
          page: MainPage,
          name: AppRoutes.mainTabRouteName,
          children: [
            AutoRoute(
              path: AppRoutes.homePath,
              page: EmptyRouterPage,
              name: AppRoutes.homeRouteName,
              maintainState: false,
              children: [
                AutoRoute(path: '', page: HomeScreen),
                AutoRoute(
                  path: AppRoutes.livePath,
                  page: LivePage,
                  meta: {ArgumentsRoute.hideToolbar: true},
                ),
                AutoRoute(
                  path: AppRoutes.liveChatPath,
                  page: LiveStreaming,
                  meta: {ArgumentsRoute.hideToolbar: true},
                ),
                AutoRoute(
                  path: AppRoutes.productDetailPath,
                  page: ProductDetailScreen,
                  meta: {ArgumentsRoute.hideToolbar: true},
                ),
                RedirectRoute(path: '*', redirectTo: ''),
              ],
            ),
            AutoRoute(
              path: AppRoutes.explorePath,
              page: EmptyRouterPage,
              name: AppRoutes.exploreRouteName,
              maintainState: false,
              children: [
                AutoRoute(
                  path: '',
                  page: ExploreScreen,
                ),
                AutoRoute(
                    path: AppRoutes.recommendedScreenPath,
                    page: RecommendedCreatorsScreen,
                    name: AppRoutes.recommendedScreenRouteName,
                    meta: {ArgumentsRoute.hideToolbar: true}),
                AutoRoute(
                    path: AppRoutes.userFollowerPagePath,
                    page: UserFollowerPage,
                    name: AppRoutes.userFollowerPageRouteName,
                    meta: {ArgumentsRoute.hideToolbar: true}),
                AutoRoute(
                    path: AppRoutes.detailsProductPagePath,
                    page: DetailsProductPage,
                    name: AppRoutes.detailsProductPageRouteName,
                    meta: {ArgumentsRoute.hideToolbar: true}),
                AutoRoute(
                    path: AppRoutes.seeAllPagePath,
                    page: SeeAllPage,
                    name: AppRoutes.seeAllPageRouteName,
                    meta: {ArgumentsRoute.hideToolbar: true}),
              ],
            ),
            AutoRoute(
              path: AppRoutes.cartPath,
              page: EmptyRouterPage,
              name: AppRoutes.cartRouteName,
              children: [
                AutoRoute(path: '', page: CartScreen),
                AutoRoute(
                    path: AppRoutes.checkoutPath,
                    page: CheckoutScreen,
                    name: AppRoutes.checkoutRouteName,
                    meta: {ArgumentsRoute.hideToolbar: true}),
                AutoRoute(
                    path: AppRoutes.paymentPath,
                    page: PaymentScreen,
                    name: AppRoutes.paymentRouteName,
                    meta: {ArgumentsRoute.hideToolbar: true}),
                AutoRoute(
                    path: AppRoutes.successfulPaymentPath,
                    page: SuccessfulPaymentScreen,
                    name: AppRoutes.successfulPaymentRouteName,
                    meta: {ArgumentsRoute.hideToolbar: true}),
              ],
            ),
            AutoRoute(
              path: AppRoutes.profilePath,
              page: EmptyRouterPage,
              name: AppRoutes.profileRouteName,
              children: [
                AutoRoute(path: '', page: ProfileScreen),
                AutoRoute(
                  path: AppRoutes.productPath,
                  page: ProductPage,
                  meta: {ArgumentsRoute.hideToolbar: true},
                ),
                AutoRoute(
                  path: AppRoutes.profileEditPath,
                  page: EditProfileScreen,
                  meta: {ArgumentsRoute.hideToolbar: true},
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}
