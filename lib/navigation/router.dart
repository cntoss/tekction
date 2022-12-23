import 'package:data_config/data_config.dart';
import 'package:dependencies/dependencies.dart';
import 'package:tekction/features/explore/explore_page.dart';
import 'package:tekction/features/home/screen/live_page.dart';
import 'package:tekction/features/main_page.dart';
import 'package:tekction/features/home/screen/home_screen.dart';
import 'package:tekction/features/home/screen/live_streaming.dart';
import 'package:tekction/features/login/login_screen.dart';
import 'package:tekction/features/splash/splash_screen.dart';

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
                  meta: {'hideToolbar': true},
                ),
                AutoRoute(
                  path: AppRoutes.liveChatPath,
                  page: LiveStreaming,
                  meta: {'hideToolbar': true},
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
