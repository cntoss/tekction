import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:tekction/features/explore/explore_page.dart';
import 'package:tekction/features/home/screen/live_page.dart';
import 'package:tekction/features/main_page.dart';
import 'package:tekction/features/home/screen/home_screen.dart';
import 'package:tekction/features/home/screen/live_streaming.dart';
import 'package:tekction/features/login/login_screen.dart';
import 'package:tekction/features/product/page/product_detail.dart';
import 'package:tekction/features/product/page/product_list_screen.dart';
import 'package:tekction/features/profile/page/edit_profile.dart';
import 'package:tekction/features/profile/page/profile_page.dart';
import 'package:tekction/features/splash/splash_screen.dart';
import 'package:tekction/navigation/arguments_route.dart';

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
                  path: AppRoutes.profilePath,
                  page: UserProfileScreen,
                  meta: {ArgumentsRoute.hideToolbar: true},
                ),
                AutoRoute(
                  path: AppRoutes.profileEditPath,
                  page: EditProfileScreen,
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
                AutoRoute(path: '', page: ExplorePage),
                RedirectRoute(path: '*', redirectTo: ''),
              ],
            ),
            
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}
